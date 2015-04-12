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
--ID 13, Dwarven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

local dwarfs = require("monster.race_1_dwarf.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addHealing{probability = 0.07, damage = {from = 1000, to = 1500}}
magic.addHealing{probability = 0.001, damage = {from =  750, to = 1000}, targetCount = 5}

magic.addHealing{probability = 0.005, damage = {from = 1200, to = 2000}}
magic.addHealing{probability = 0.001, damage = {from =  500, to = 1100}, targetCount = 3}

local M = dwarfs.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)