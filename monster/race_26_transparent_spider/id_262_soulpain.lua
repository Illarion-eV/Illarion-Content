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
--ID 262, Soulpain, Level: 8, Armourtype: medium, Weapontype: wrestling
local monsterId = 262

local monstermagic = require("monster.base.monstermagic")
local transparentSpiders = require("monster.race_26_transparent_spider.base")
local firefield = require("item.id_359_firefield")
local magic = monstermagic()

magic.addFlamestrike{probability = 0.009, damage = {from = 1800, to = 2300}}
magic.addFireball{probability = 0.001, damage = {from = 2300, to = 2800}}
magic.addFireball{probability = 0.01, damage = {from = 875, to = 1200}, targetCount = 6}
magic.addFlamestrike{probability = 0.0001, damage = {from = 2500, to = 3000}}
magic.addFireball{probability = 0.06,  damage = {from = 1750, to = 2000}}
magic.addFlamestrike{probability = 0.001, damage = {from = 1000, to = 2000}, targetCount = 4}

magic.addFirering{probability = 0.009, damage = {from = 2500, to = 3000}, range  = 7,
    itemProbability = 0.10, quality = {from = 4, to = 5}}

firefield.setFlameImmunity(monsterId)

local M = transparentSpiders.generateCallbacks()
return magic.addCallbacks(M)