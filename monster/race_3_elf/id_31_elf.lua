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
--Elf, Level: 5, Armourtype: light, Weapontype: distance
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local elves = require("monster.race_3_elf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 366} --leather legs
armorDropGroup.add{itemId = 369} --leather shoes
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 2407} --light blue breastplate

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2457} --wine glass
specialDropGroup.add{itemId = 388} --grapes
specialDropGroup.add{itemId = 1318} --elven wine
specialDropGroup.add{itemId = 2679} --green dye
specialDropGroup.add{itemId = 2678} --black dye

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 64} --arrows
weaponDropGroup.add{itemId = 65} --short bow
weaponDropGroup.add{itemId = 2714} --hunting bow
weaponDropGroup.add{itemId = 89} --sling
weaponDropGroup.add{itemId = 2708} --long bow

--Category 4: Perma Loot
drop.addMoneyDrop()

return elves.generateCallbacks(drop)