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
--ID 132, Eye of Darkness, Level: 8, Armourtype: medium, Weapontype: slashing

local blackBeholders = require("monster.race_13_black_beholder.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addIceball{probability = 0.015, damage = {from = 1800, to = 2300}}
magic.addIcestrike{probability = 0.009, damage = {from = 2300, to = 2800}}
magic.addIceball{probability = 0.01, damage = {from = 875, to = 1200}, targetCount = 6}
magic.addIceball{probability = 0.0001, damage = {from = 2500, to = 3000}}
magic.addIcestrike{probability = 0.075,  damage = {from = 1750, to = 2000}}
magic.addIcestrike{probability = 0.001, damage = {from = 1000, to = 2000}, targetCount = 4}

local M = blackBeholders.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)