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

local monstermagic = require("monster.base.monstermagic")
local blackBeholders = require("monster.race_13_black_beholder.base")

local magic = monstermagic()
magic.addWarping{probability = 0.08, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{   probability = 0.06,  damage = {from = 2000, to = 4000}}
magic.addIceball{    probability = 0.015, damage = {from = 2500, to = 4500}}
magic.addVioletFlame{probability = 0.002, damage = {from = 3500, to = 5000}}

magic.addFlamestrike{probability = 0.01, damage = {from = 1000, to = 2000}, targetCount = 5}
magic.addExplosion{probability = 0.005, damage = {from = 1500, to = 3000}, targetCount = 5}

magic.addHealing{probability = 0.05, damage = {from = 1500, to = 2500}}
magic.addHealing{probability = 0.05, damage = {from = 1000, to = 1500}, targetCount = 2}

local M = blackBeholders.generateCallbacks()
return magic.addCallbacks(M)