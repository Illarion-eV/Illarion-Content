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

local oralCasting = require("magic.arcane.oralCasting")
local wands = require("item.wands")
local magicSphere = require("item.magicSphere")

local M = {}

local function puzzleTriggers(player, text)

    if string.find(text, "feather") or string.find(text, "Feather") or string.find(text, "Feder") or string.find(text, "feder") then
        if magicSphere.checkPenPosition(player) then
            magicSphere.penActivate = true
        end
    end

    if string.find(text, "beholder") or string.find(text, "Beholder") then
        if magicSphere.checkIraPosition(player) then
            magicSphere.iraActivate = true
        end
    end

    local raven = {"Raven", "raven", "Rabe", "rabe"}

    for _, variation in pairs(raven) do
        if string.find(text, variation) then
            if magicSphere.checkLhorPosition(player) then
                magicSphere.lhorActivate = true
            end
        end
    end

    local right = {"Right", "right", "Richtig", "richtig"}

    for _, variation in pairs(right) do
        if string.find(text, variation) then
            if magicSphere.checkTahPosition(player) then
                magicSphere.tahActivate = true
            end
        end
    end

    local man = {"man", "Man", "mensch", "Mensch"}
    for _, variation in pairs(man) do
        if string.find(text, variation) then
            if magicSphere.checkTaurPosition(player) then
                magicSphere.taurActivate = true
            end
        end
    end

end


local function checkIfInteracting(player)
    local nearbyPlayers = world:getPlayersInRangeOf(player.pos, 15)

    for _, nearbyPlayer in pairs(nearbyPlayers) do
        if nearbyPlayer.id ~= player.id and not nearbyPlayer:isAdmin() then --Player is interacting with a player who is not themselves and not a GM

            local activityTrackerEffect = 84

            local foundEffect, myEffect = player.effects:find(activityTrackerEffect)

            if foundEffect then
                myEffect:addValue("lastInteractionTime", world:getTime("unix"))
            end

            break   -- No need to check the other players nearby if there are any, so the loop ends here as we already found a candidate
        end
    end
end

function M.talk(player, talkType, text, actionState)

    puzzleTriggers(player, text)

    checkIfInteracting(player)

    if talkType == Character.say then
        oralCasting.checkForMagicIncantations(player, actionState, text)
    end

    return text
end

function M.actionDisturbed(player, attacker)

    return wands.actionDisturbed(player, attacker)

end

return M
