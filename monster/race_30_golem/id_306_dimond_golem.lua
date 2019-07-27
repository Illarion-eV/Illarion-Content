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
local golems = require("monster.race_30_golem.base")
local M = golems.generateCallbacks()

local orgEnemyOnSight = M.enemyOnSight
function M.enemyOnSight(monster, enemy)
    if orgEnemyOnSight ~= nil then
        orgEnemyOnSight(monster, enemy)
    end
    if not monster.effects:find(19) then
        monster.effects:addEffect(LongTimeEffect(19,5))
    end
    
    return false
end

local orgEnemyNear = M.enemyNear
function M.enemyNear(monster, enemy)
    if orgEnemyNear ~= nil then
        orgEnemyNear(monster, enemy)
    end
    if not monster.effects:find(19) then
        monster.effects:addEffect(LongTimeEffect(19,5))
    end
    
    return false
end

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end
    
    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 100, green = 255, blue = 255, alpha = 190}
end

return M