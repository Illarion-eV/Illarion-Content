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
local skeletons = require("monster.race_11_skeleton.base")

-- The transparent skeletons are just skeletons with a special skin color

local M = {}

function M.generateCallbacks()
    local t = skeletons.generateCallbacks()
    local orgOnSpawn = t.onSpawn

    function t.onSpawn(monster)
        if orgOnSpawn ~= nil then
            orgOnSpawn(monster)
        end

        base.setColor{monster = monster, target = base.SKIN_COLOR, red = 120, green = 255, blue = 255, alpha = 180}
    end
    return t
end

return M