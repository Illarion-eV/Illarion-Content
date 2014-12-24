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
--ID 232, Shadowmuncher: 7, Armourtype: medium, Weapontype: slashing

local monstermagic = require("monster.base.monstermagic")
local blueSpiders = require("monster.race_23_blue_spider.base")

local magic = monstermagic()
magic.addPoisonball{probability = 0.02,  damage = {from = 2000, to = 4000}}
magic.addPoisonball{probability = 0.005, damage = {from = 1000, to = 2000}, targetCount = 3}

magic.addIcestrike{probability = 0.02,  damage = {from = 2000, to = 4000}}
magic.addIcestrike{probability = 0.005, damage = {from = 1000, to = 2000}, targetCount = 3}

local M = blueSpiders.generateCallbacks()
return magic.addCallbacks(M)