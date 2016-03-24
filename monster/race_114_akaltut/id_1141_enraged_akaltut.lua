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
--ID 1141, Enraged Akaltut, Level: 9, Armourtype: light, Weapontype: concussion
local monsterId = 1141

local akaltut = require("monster.race_114_akaltut.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local poisonfield = require("item.id_372_poisonfield")

local magic = monstermagic()
magic.addPoisonball{probability = 0.06, damage = {from = 1500, to = 1800}}
magic.addPoisonball{probability = 0.009, damage = {from = 1700, to = 2000}}
magic.addPoisonball{probability = 0.001, damage = {from = 1900, to = 2300}}
magic.addPoisonball{probability = 0.001, damage = {from = 1200, to = 1850}, targetCount = 3}
magic.addPoisonball{probability = 0.01, damage = {from = 750, to = 1200}, targetCount = 5}
magic.addPoisonring{probability = 0.009, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}}

    poisonfield.setPoisonImmunity(monsterId)

local M = akaltut.generateCallbacks()
M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)