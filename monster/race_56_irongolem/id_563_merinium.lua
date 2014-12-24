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
--ID 563, Merinium Golem, Level: 9, Armourtype: medium, Weapontype: slashing

local base = require("monster.base.base")
local irongolems = require("monster.race_56_irongolem.base")

local M = irongolems.generateCallbacks()
local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR,
        hue = {min = 198, max = 202}, -- 200° +- 2° --> Blueish
        saturation = {min = 0.55, max = 0.65},
        value = {min = 0.95, max = 1.0}}
end

return M