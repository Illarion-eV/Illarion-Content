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
--ID 143, Horrible Ghost Eye, Level: 6, Armourtype: heavy, Weapontype: slashing

local monstermagic = require("monster.base.monstermagic")
local transparentBeholders = require("monster.race_14_transparent_beholder.base")

local magic = monstermagic()
magic.addWarping{probability = 0.04, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{   probability = 0.04,  damage = {from = 1500, to = 2500}}
magic.addIceball{    probability = 0.009, damage = {from = 1700, to = 3000}}
magic.addVioletFlame{probability = 0.001, damage = {from = 2000, to = 3500}}

magic.addFlamestrike{probability = 0.01, damage = {from = 700, to = 1400}, targetCount = 5}

magic.addHealing{probability = 0.05, damage = {from = 1500, to = 2500}}
magic.addHealing{probability = 0.05, damage = {from = 1000, to = 1500}, targetCount = 2}

local M = transparentBeholders.generateCallbacks()
return magic.addCallbacks(M)