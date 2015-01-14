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

local demonSkeletons = require("monster.race_20_demon_skeleton.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")

local magic = monstermagic()
magic.addWarping{probability = 0.18, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{   probability = 0.01,  damage = {from = 1500, to = 3000}}
magic.addFireball{   probability = 0.01,  damage = {from = 1000, to = 1500}, targetCount = 3}
magic.addIceball{    probability = 0.009, damage = {from = 2000, to = 3000}}
magic.addFlamestrike{probability = 0.001, damage = {from = 3000, to = 4900}}

magic.addHealing{probability = 0.05, damage = {from = 2000, to = 3500}}
magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}, targetCount = 3}

local M = demonSkeletons.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)