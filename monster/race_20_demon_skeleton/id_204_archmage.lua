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
--ID 204, Unholy Archmage, Level: 7, Armourtype: heavy, Weapontype: slashing
local monsterId = 204

local demonSkeletons = require("monster.race_20_demon_skeleton.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local icefield = require("item.id_360_icefield")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.01,  damage = {from = 1500, to = 1800}}
magic.addFireball{probability = 0.01,  damage = {from = 750, to = 1200}, targetCount = 5}
magic.addIceball{probability = 0.009, damage = {from = 1700, to = 2000}}
magic.addFlamestrike{probability = 0.001, damage = {from = 1900, to = 2300}}
magic.addIcestrike{probability = 0.001,  damage = {from = 1200, to = 1850}, targetCount = 3}
magic.addExplosion{probability = 0.005, damage = {from = 2300, to = 2600}}
magic.addIcering{probability = 0.009, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}}
    
icefield.setIceImmunity(monsterId)

local M = demonSkeletons.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)