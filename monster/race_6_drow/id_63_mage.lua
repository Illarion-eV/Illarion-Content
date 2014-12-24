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
--ID 63, Drow Mage, Level: 6, Armourtype: cloth, Weapontype: concussion

local monstermagic = require("monster.base.monstermagic")
local drows = require("monster.race_6_drow.base")

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.05, damage = {from = 2000, to = 3000}}
magic.addFireball{probability = 0.03, damage = {from =  700, to = 1500}, targetCount = 3}

magic.addFirefield{probability = 0.05, quality = {from = 3, to = 5}, durability = {from = 0, to = 99}}

local M = drows.generateCallbacks()
return magic.addCallbacks(M)