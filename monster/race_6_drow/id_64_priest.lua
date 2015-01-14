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
--ID 64, Drow Priest, Level: 6, Armourtype: cloth, Weapontype: concussion

local drows = require("monster.race_6_drow.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.0249, monsters = {551, 822}} -- imp, black zombie
magic.addSummon{probability = 0.0050, monsters = {551, 552}} -- surprise spawn. Some black hellhounds
magic.addSummon{probability = 0.0001, monsters = {893}} -- rare summon. Magic fire imp

magic.addVioletFlame{probability = 0.02, damage = {from = 1000, to = 2000}}

local M = drows.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)