--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local spatial = require("magic.arcane.spatial")
local castSpell = require("magic.arcane.castSpell")
local runes = require("magic.arcane.runes")
local texts = require("magic.arcane.base.texts")

local M = {}

local function checkForPrimaryRunes(user, spokenWords)

    for i = 1, 6 do

        local found = string.find(spokenWords, runes.Runes[i][2])

        if found then
            local knowsRune = runes.checkIfLearnedRune(user, false, i, "isQuest", false, false)

            if knowsRune then
                return runes.Runes[i][2]
            else
                return false
            end
        end
    end

    return false

end

local function checkForPortalIncantation(spokenWords)

    local incantations = texts.spatialTexts.incantation

    local foundPortal = string.find(spokenWords, incantations.portal)

    if foundPortal then
        return incantations.portal
    end

    local foundTeleport = string.find(spokenWords, incantations.teleport)

    if foundTeleport then
        return incantations.teleport
    end

    return false

end

local function addRunesToSpell(user, spokenWords, primaryRune)
    local primaryRuneNumber = runes.runeNameToNumber(primaryRune)
    local spell = 0
    local incantation = primaryRune
    spell = runes.learnRune(user, false, primaryRuneNumber, "neither", spell)

    local knownRunes = {}

    for _, rune in pairs(runes.Runes) do
        local knowsRune = runes.checkIfLearnedRune(user, false, rune[1], "isQuest", false, false)
        if knowsRune then
            knownRunes[#knownRunes+1] = { number = rune[1], name = rune[2] }
        end
    end

    for i = 1, #knownRunes do

        local foundAny

        for _, rune in ipairs(knownRunes) do

            local found = string.find(spokenWords, incantation.." "..rune.name)

            if found then
                foundAny = true
                spell = runes.learnRune(user, false, rune.number, "neither", spell)
                incantation = incantation.." "..rune.name
            end

        end

        if not foundAny or i == #knownRunes then
            return spell
        end
    end

end

local function castMagic(user, actionState, spell, portal)

    local oralCast = { spell = spell, portal = portal}
    if spell or portal then
        if user:getQuestProgress(37) == 0 then --checking a quest status every time a character speaks will likely cause more lag than the other checks, hence why its the final check
            return -- user is not a mage
        end
    end

    if spell then
        castSpell.castSpell(user, spell, actionState, oralCast)
    elseif portal then
        spatial.castSpatialMagic(user, actionState, oralCast)
    end

end

function M.checkForMagicIncantations(user, actionState, spokenWords)
    local portal = M[user.name.."portal"]
    local spell = M[user.name.."spell"]

    if actionState == Action.none then

        local primaryRune = checkForPrimaryRunes(user, spokenWords)
        portal = checkForPortalIncantation(spokenWords)
        spell = false

        if primaryRune then
            spell = addRunesToSpell(user, spokenWords, primaryRune)
        end

        M[user.name.."portal"] = portal
        M[user.name.."spell"] = spell
        castMagic(user, actionState, spell, portal)
    elseif actionState ==  Action.abort or actionState == Action.success then

        castMagic(user, actionState, spell, portal)

    end
end


return M
