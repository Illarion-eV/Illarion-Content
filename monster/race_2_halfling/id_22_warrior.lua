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
--Halfling Warrior, Level: 4, Armourtype: light, Weapontype: slashing
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local halflings = require("monster.race_2_halfling.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 18} --light metal shield
armorDropGroup.add{itemId = 366} --leather legs
armorDropGroup.add{itemId = 369} --leather shoes
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2744} --pipe
specialDropGroup.add{itemId = 155} --sibanac
specialDropGroup.add{itemId = 2719} --comb
specialDropGroup.add{itemId = 227} --cooking spoon
specialDropGroup.add{itemId = 2760} --rope

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 78} --short sword
weaponDropGroup.add{itemId = 445} --wooden sword
weaponDropGroup.add{itemId = 1} --serinjah sword
weaponDropGroup.add{itemId = 2711} --barbarian axe
weaponDropGroup.add{itemId = 2946} --battleaxe

--Category 4: Perma Loot
drop.addMoneyDrop()

return halflings.generateCallbacks(drop)