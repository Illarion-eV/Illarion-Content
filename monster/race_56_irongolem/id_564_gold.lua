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
--ID 564, Gold Golem, Level: 8, Armourtype: medium, Weapontype: concussion

local base = require("monster.base.base")
local irongolems = require("monster.race_56_irongolem.base")

local M = irongolems.generateCallbacks()
local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR,
        hue = {min = 65, max = 69}, -- 67° +- 2° --> Yellow
        saturation = {min = 0.50, max = 0.56},
        value = {min = 0.95, max = 1.0}}
end

return M