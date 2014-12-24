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
--ID 783, Golden Magus, Level: 5, Armourtype: light, Weapontype: concussion

local monstermagic = require("monster.base.monstermagic")
local goldenSkeletons = require("monster.race_78_golden_skeleton.base")

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addIceball{probability = 0.05, damage = {from = 1000, to = 2000} }

magic.addVioletFlame{probability = 0.03, damage = {from =  500, to = 1000}, targetCount = 3}

magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addHealing{probability = 0.05, damage = {from =  500, to = 1000}, targetCount = 3}

local M = goldenSkeletons.generateCallbacks()
return magic.addCallbacks(M)