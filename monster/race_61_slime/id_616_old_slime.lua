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
--ID 616, Old Splime, Level: 0, Quest Monster - Slime feeding quest in Runewick

local base = require("monster.base.base")
local slimes = require("monster.race_61_slime.base")
local oldSlimeFeeding = require("content.oldSlimeFeeding")

local M = slimes.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster,  target = base.SKIN_COLOR, hue = 0, saturation = 0, value = 0.2, alpha = 180}
end

function M.abortRoute(monster)
    oldSlimeFeeding.oldSlimeAbortRoute(monster)
end

return M
