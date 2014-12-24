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
local base = require("monster.base.base")
local slimes = require("monster.race_61_slime.base")

local M = {}

function M.generateCallbacks()
    local t = slimes.generateCallbacks()
    local orgOnSpawn = t.onSpawn

    function t.onSpawn(monster)
        if orgOnSpawn ~= nil then
            orgOnSpawn(monster)
        end

        base.setColor{monster = monster, target = base.SKIN_COLOR,
            hue = {min = 226, max = 234}, -- 230° +- 4° --> blue
            saturation = {min = 0.95, max = 1.00},
            value = {min = 0.95, max = 1.00},
            alpha = {min = 175, max = 185}}
    end
    return t
end

return M