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
local texts = require("magic.base.texts")
local magic = require("base.magic")

local M = {}

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

    local foundAttune = string.find(spokenWords, incantations.attune)

    if foundAttune then
        return incantations.attune
    end

    return false

end

local function castMagic(user, actionState, spell, portal)

    local oralCast = {spatial = portal}

    if spell or portal then
        if not magic.hasMageAttributes(user) or user:getQuestProgress(37) == 0 then --checking a quest status every time a character speaks will likely cause more lag than the other checks, hence why its the final check
            user:inform("Du sprichst den Zauberspruch, aber nichts passiert, da dir die erforderliche magische Fähigkeit fehlt, um Zauber zu wirken.","You speak the incantation, but nothing happens as you do not have the required magical prowess to cast spells.") --chatgpt german
            return -- user is not a mage
        end
    end

    if portal then
        spatialMagic.castSpatialMagic(user, actionState, oralCast)
    end

end

function M.checkForMagicIncantations(user, actionState, spokenWords)

    if actionState == Action.none then

        if checkForPortalIncantation(spokenWords) then
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
