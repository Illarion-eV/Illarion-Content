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

local M = {}

local function checkIfInteracting(player)
    local nearbyPlayers = world:getPlayersInRangeOf(player.pos, 10)

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

function M.talk(player, talkType, text)

    checkIfInteracting(player)

    return text
end

return M
