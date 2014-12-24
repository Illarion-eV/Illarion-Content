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
--ID 575, Contaminated Ratchild, Level: 3, Armourtype: cloth, Weapontype: distance
--ID 576, Contaminated Ratman,   Level: 4, Armourtype: cloth, Weapontype: dagger

local base = require("monster.base.base")
local ratmen = require("monster.race_57_ratman.base")
local M = ratmen.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR,
        hue = {min = 115, max = 125}, -- 120° +- 5° --> green
        saturation = {min = 0.50, max = 0.56},
        value = {min = 0.98, max = 1.00}}
end

return M