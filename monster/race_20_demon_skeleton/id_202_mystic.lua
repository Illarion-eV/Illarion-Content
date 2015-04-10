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
--ID 202, Mystic Demon Skeleton, Level: 6, Armourtype: light, Weapontype: concussion (wrestling)

local demonSkeletons = require("monster.race_20_demon_skeleton.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.09,  damage = {from = 1250, to = 1500}}
magic.addFireball{   probability = 0.03,  damage = {from = 625, to = 1000}, targetCount = 5}
magic.addIceball{probability = 0.009, damage = {from = 1700, to = 2000}}
magic.addVioletFlame{probability = 0.001, damage = {from = 1000, to = 1500}, targetCount = 3}
magic.addIcestrike{probability = 0.001, damage = {from = 2000, to = 2500}}

local M = demonSkeletons.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)