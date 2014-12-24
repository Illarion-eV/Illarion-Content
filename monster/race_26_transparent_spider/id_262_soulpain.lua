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

local monstermagic = require("monster.base.monstermagic")
local transparentSpiders = require("monster.race_26_transparent_spider.base")

local magic = monstermagic()
magic.addVioletFlame{probability = 0.02,  damage = {from = 2500, to = 4000}}
magic.addVioletFlame{probability = 0.005, damage = {from = 1500, to = 2000}, targetCount = 3}

magic.addIcestrike{probability = 0.02,  damage = {from = 2500, to = 4000}}
magic.addIcestrike{probability = 0.005, damage = {from = 1500, to = 2000}, targetCount = 3}

local M = transparentSpiders.generateCallbacks()
return magic.addCallbacks(M)