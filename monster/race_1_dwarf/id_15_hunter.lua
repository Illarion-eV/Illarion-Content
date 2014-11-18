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
--Dwarven Hunter, Level: 5, Armourtype: light, Weapontype: distance
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local dwarfs = require("monster.race_1_dwarf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 367} --short leather legs
armorDropGroup.add{itemId = 48} --leather gloves
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --full leatherarmor
armorDropGroup.add{itemId = 2407} --light blue breastplate

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 306} --ham
specialDropGroup.add{itemId = 307} --pork
specialDropGroup.add{itemId = 2940} --steak
specialDropGroup.add{itemId = 557} --steak dish
specialDropGroup.add{itemId = 2277} --meat dish

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 1266} --stones
weaponDropGroup.add{itemId = 89} --sling
weaponDropGroup.add{itemId = 2708} --longbow
weaponDropGroup.add{itemId = 237} --crossbow bolts
weaponDropGroup.add{itemId = 2645} --throwing axe

--Category 4: Perma Loot
drop.addMoneyDrop()

return dwarfs.generateCallbacks(drop)