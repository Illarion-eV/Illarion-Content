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
--ID 278, Fire Wasp

local base = require("monster.base.base")
local explosion = require("base.explosion")
local wasps = require("monster.race_27_wasp.base")

local M = wasps.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 255, green = 120, blue = 120}
end

local orgOnDeath = M.onDeath
function M.onDeath(monster)
    explosion.CreateExplosion(monster.pos) -- explode

    if orgOnDeath ~= nil then
        orgOnDeath(monster) -- dropping and everything
    end
end

return M