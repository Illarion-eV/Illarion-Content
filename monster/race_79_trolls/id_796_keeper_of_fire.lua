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
--ID 796, Keeper of fire, Level: 7, Armourtype: heavy, Weapontype: slashing
local monsterId = 796

local base = require("monster.base.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local trolls = require("monster.race_79_trolls.base")
local firefield = require("item.id_359_firefield")

local M = trolls.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 120, green = 120, blue = 255}
end

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.03,  damage = {from = 1500, to = 1800}}
magic.addFireball{probability = 0.015, damage = {from =  750, to = 1200}, targetCount = 5}
magic.addFlamestrike{probability = 0.009,  damage = {from = 1700, to = 2000}}
magic.addFlamestrike{probability = 0.001, damage = {from =  1200, to = 1850}, targetCount = 3}
magic.addFireball{probability = 0.001,  damage = {from = 1900, to = 2300}}
magic.addFirering{probability = 0.009, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}}

firefield.setFlameImmunity(monsterId)

M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)