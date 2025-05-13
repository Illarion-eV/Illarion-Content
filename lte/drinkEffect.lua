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

function M.addEffect(effect, user)
    user:inform("[Trinkt] Das erfrischende Getränk beruhigt deine Kehle und spült jede Trockenheit fort. Ein neues Gefühl der Leichtigkeit stellt sich ein, wodurch das Sozialisieren mühelos erscheint.", "[Drinks] The refreshing drink soothes your throat, washing away any dryness. A newfound ease settles in, making socializing feel effortless.")
    M.callEffect(effect, user)
end

function M.callEffect(effect, user)

    local foundCurrentDuration, currentDuration = effect:findValue("remainingDuration")

    if not foundCurrentDuration then
        return false
    end

    if currentDuration > 300 or currentDuration < 0 then
        log("An abnormal drink effect duration of "..currentDuration.." was found for "..user.name.."("..user.id..").")
        effect:addValue("remainingDuration", 1)
        currentDuration = 1
    end

    effect:addValue("remainingDuration", currentDuration-1) --Reduces by 1 min every min

    if currentDuration-1 > 0 then --We call it again as long as there are minutes left on the duration
        effect.nextCalled = 600 --Called every minute
        return true
    end

    return false

end

function M.removeEffect(effect, user)

    user:inform("[Trinkt] Die wohltuende Frische ist verflogen, und eine trockene Kehle macht sich bemerkbar.", "[Drinks] The soothing freshness has left you, and dryness creeps back into your throat.")

end

function M.loadEffect(effect, user)

end

return M
