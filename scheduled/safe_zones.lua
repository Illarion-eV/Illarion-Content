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

function M.sweepMonsters()
    local Monsters = world:getMonstersInRangeOf(position(695,310,0),40);

    if (#Monsters > 0) then
        for _, Monster in pairs(Monsters) do
            if  Monster:getMonsterType() ~= 1111 then -- Orchard rats are not sweeped.
                world:gfx(41, Monster.pos)
                Monster:warp(position(1,1,0)) -- Warp it out of sight
                Monster:increaseAttrib("hitpoints", -10000) -- Kill it
            end
        end
    end

end

return M
