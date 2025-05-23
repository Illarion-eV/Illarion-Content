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

local spatialMagic = require("magic.arcane.spatial")
local magic = require("base.magic")
local castSpell = require("magic.arcane.castSpell")
local runes = require("magic.arcane.runes")

local M = {}

local function checkForPrimaryRunes(user, spokenWords)

    local BHONA = 6

    local found = string.find(spokenWords, runes.runeNumberToName(BHONA))

        if found then
            local knowsRune = runes.checkIfLearnedRune(user, false, BHONA, "isQuest", false, false)

            if knowsRune then
                return runes.runeNumberToName(BHONA)
            end
        end

    for i = 1, 5 do

        found = string.find(spokenWords, "%f[%a]"..runes.runeNumberToName(i).."%f[%A]")

        if found then
            local knowsRune = runes.checkIfLearnedRune(user, false, i, "isQuest", false, false)

            if knowsRune then
                return runes.runeNumberToName(i)
            end
        end
    end

    return false

end

local function checkForPortalIncantation(spokenWords)

    local incantations = spatialMagic.spatialTexts.incantation

    local foundPortal = string.find(spokenWords, incantations.portal)

    if foundPortal then
        return incantations.portal
    end

    local foundTeleport = string.find(spokenWords, incantations.teleport)

    if foundTeleport then
        return incantations.teleport
    end

    local foundAttune = string.find(spokenWords, incantations.attune)

    if foundAttune then
        return incantations.attune
    end

    return false

end

local function addRunesToSpell(user, spokenWords, primaryRune)

    local primaryRuneNumber = runes.runeNameToNumber(primaryRune)
    local BHONA = primaryRune == "BHONA"
    local spell = 0
    local incantation = "%f[%a]"..primaryRune.."%f[%A]"
    spell = runes.learnRune(user, false, primaryRuneNumber, "neither", spell)
    local knownRunes = {}

    for _, rune in pairs(runes.runes) do
        if rune.id > 6 then -- we already covered the primary rune

            local knowsRune = runes.checkIfLearnedRune(user, false, rune.id, "isQuest", false, false)

            if knowsRune then
                table.insert(knownRunes, { number = rune.id, name = rune.name })
            end
        end
    end

    for i = 1, #knownRunes do

        local foundAny --if none are found in this round, it will end the loop early

        for _, rune in ipairs(knownRunes) do

            local found = string.find(spokenWords, incantation.." "..rune.name)

            if found then
                --a rune being repeated ends the incantation and returns the spell said up to that point
                if  runes.checkSpellForRuneByName(rune.name, spell)then
                    return spell
                end

                foundAny = true
                spell = runes.learnRune(user, false, rune.number, "neither", spell)
                incantation = incantation.." "..rune.name

                --Teaching spells only teach one rune at a time
                if BHONA then
                    return spell
                end

            end

        end

        if not foundAny or i == #knownRunes then
            return spell
        end
    end

    return spell
end

local function castMagic(user, actionState, spell, portal)

    local oralCast = {spatial = portal, spell = spell}

    if spell or portal then
        if not magic.hasMageAttributes(user) or user:getQuestProgress(37) == 0 then --checking a quest status every time a character speaks will likely cause more lag than the other checks, hence why its the final check
            user:inform("Du sprichst den Zauberspruch, aber nichts passiert, da dir die erforderliche magische F�higkeit fehlt, um Zauber zu wirken.","You speak the incantation, but nothing happens as you do not have the required magical prowess to cast spells.") --chatgpt german
            return -- user is not a mage
        end
    end

    if spell then
        castSpell.castSpell(user, spell, actionState, oralCast)
    elseif portal then
        spatialMagic.castSpatialMagic(user, actionState, oralCast)
    end

end

function M.checkForMagicIncantations(user, actionState, spokenWords)

    if actionState == Action.none then

        local primaryRune = checkForPrimaryRunes(user, spokenWords)

        if primaryRune then
            user:changeSource(spokenWords, 0)
            local spell = addRunesToSpell(user, spokenWords, primaryRune)
            M[user.name.."spell"] = spell
            M[user.name.."portal"] = false
            castMagic(user, actionState, spell, false)
        elseif checkForPortalIncantation(spokenWords) then
            user:changeSource(spokenWords, 0)
            M[user.name.."portal"] = checkForPortalIncantation(spokenWords)
            M[user.name.."spell"] = false
            castMagic(user, actionState, false, checkForPortalIncantation(spokenWords))
        end

    elseif actionState ==  Action.abort or actionState == Action.success then
        local portal = M[user.name.."portal"]
        local spell = M[user.name.."spell"]
        castMagic(user, actionState, spell, portal)
    end
end


return M
