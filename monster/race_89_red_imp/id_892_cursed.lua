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
--ID 892, Cursed Fire Imp, Level: 3, Armourtype: light, Weapontype: slashing

local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local redImps = require("monster.race_89_red_imp.base")

local magic = monstermagic()
magic.addWarping{probability = 0.15, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.045, damage = {from = 250, to = 750}}
magic.addFlamestrike{probability = 0.005, damage = {from = 250, to = 750}, targetCount = 3}

local M = redImps.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)