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
--ID 33, Elven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

local monstermagic = require("monster.base.monstermagic")
local elves = require("monster.race_3_elf.base")

local magic = monstermagic()
magic.addSummon{probability = 0.0249, monsters = {242, 582, 622}} -- some animals
magic.addSummon{probability = 0.0050, monsters = {244, 583}} -- stronger animals
magic.addSummon{probability = 0.0001, monsters = {584}} -- even strong animal

local M = elves.generateCallbacks()
return magic.addCallbacks(M)
