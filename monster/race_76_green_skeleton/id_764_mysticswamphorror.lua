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
--ID 764, Mystic Swamphorror,   Level: 4, Armourtype: medium, Weapontype: concussion

local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local greenskeleton = require("monster.race_76_green_skeleton.base")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addPoisonball{probability = 0.06,  damage = {from = 750, to = 1500}}
magic.addPoisonball{ probability = 0.025,  damage = {from = 750, to = 1500}}
magic.addPoisonball{probability = 0.005, damage = {from = 375, to = 875}, targetCount = 4}

local M = greenskeleton.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)