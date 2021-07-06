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
-- Skeleton Forest
-- Skeleton Spawn Script

local common = require("base.common")

local M = {}

function M.spawnRat()
    local Monsters = world:getMonstersInRangeOf(position(720,290,0),5);

    if (#Monsters > 0) then
        for _, Monster in pairs(Monsters) do
            if Monster:getMonsterType() == 1111 then -- There is already a rat
                return
            end
        end
    end

    local Characters = world:getPlayersInRangeOf(position(720,290,0),5)
    if (#Characters > 0) then
        for _, Char in pairs(Characters) do
            if Char:getQuestProgress(325) == 1 and Char:getQuestProgress(349) == 0 then -- There is a newbie who has not triggered a rat before
                world:createMonster(1111,common.getFreePos(position(720,290,0),5),-20)
                Char:setQuestProgress(349, 1) --remember that a rat was triggered
                return
            end
        end
    end
end

return M
