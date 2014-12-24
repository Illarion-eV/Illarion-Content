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
local beholders = require("monster.race_12_beholder.base")

-- The transparent beholder is a normal beholder with altered skin color. We can use the default script of the beholders
-- and only overwrite the spawn function to apply the correct color.

local M = {}

function M.generateCallbacks()
    local t = beholders.generateCallbacks()
    local orgOnSpawn = t.onSpawn

    function t.onSpawn(monster)
        if orgOnSpawn ~= nil then
            orgOnSpawn(monster)
        end

        base.setColor{monster = monster, target = base.SKIN_COLOR, red = 190, green = 150, blue = 255, alpha = 150}
    end
    return t
end

return M