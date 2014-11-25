--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
--ID 195, Spider Queen, Level: 7, Armourtype: heavy, Weapontype: slashing

local monstermagic = require("monster.base.monstermagic")
local spiders = require("monster.race_19_spider.base")

local magic = monstermagic()
magic.addPoisonball{probability = 0.04, damage = {from = 2000, to = 4000}}
magic.addPoisonball{probability = 0.01, damage = {from = 1000, to = 2000}, targetCount = 3}

local M = spiders.generateCallbacks()
return magic.addCallbacks(M)