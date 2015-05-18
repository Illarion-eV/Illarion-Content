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
--ID 173, Mummiefied Highpriest, Level: 4, Armourtype: light, Weapontype: concussion

local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local bluemummy = require("monster.race_17_blue_mummy.base")
local M = bluemummy.generateCallbacks()


local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addHealing{probability = 0.06, damage = {from = 750, to = 1500}}
magic.addHealing{probability = 0.025, damage = {from = 750, to = 1500}}
magic.addHealing{probability = 0.05, damage = {from = 375, to = 875}, targetCount = 4}

M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)
