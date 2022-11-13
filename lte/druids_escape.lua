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

--Database SQL: INSERT INTO longtimeeffects VALUES (32, 'druids_escape', 'lte.druids_escape')

--[[
Effect for custom potion Druid's Escape ID 563

Makes user attack proof for x seconds

lte ID = 32

author: Brightrim
]]

local M = {}

function M.addEffect( effect, target )
    target:setQuestProgress(254, 1)
    effect.nextCalled = 1
end

function M.callEffect( effect, target )

    local findDuration, duration = effect:findValue("duration")

    if findDuration and duration >= 1 then
        effect:addValue("duration", duration - 1)
        effect.nextCalled = 10
        return true
    elseif findDuration and duration == 0 and target:getQuestProgress(254) == 1 then
        target:setQuestProgress(254, 0)
        target:inform("GERMAN TRANSLATION", "The protective effect granted to you by the previously drunk potion has worn off.")
        effect.nextCalled = 6000 --10 min cooldown
        return true
    end

    return false
end

function M.loadEffect( effect, target )

    local findDuration, duration = effect:findValue("duration")

    if findDuration and duration == 0 then
        M.removeEffect( effect, target )
    end
end

function M.removeEffect( effect, target )
end

return M
