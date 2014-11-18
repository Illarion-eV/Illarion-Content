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
--Halfling, Level: 3, Armourtype: cloth, Weapontype: slashing
local LEVEL = 3

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local halflings = require("monster.race_2_halfling.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 34} --black trousers
armorDropGroup.add{itemId = 808} --yellow doublet
armorDropGroup.add{itemId = 180} --red shirt
armorDropGroup.add{itemId = 181} --blue shirt
armorDropGroup.add{itemId = 459} --red trousers

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 49} --bread
specialDropGroup.add{itemId = 191} --bread roll
specialDropGroup.add{itemId = 303} --cherry cake
specialDropGroup.add{itemId = 354} --strawberry cake
specialDropGroup.add{itemId = 353} --apple pie

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 445} --wooden sword
weaponDropGroup.add{itemId = 78} --short sword
weaponDropGroup.add{itemId = 1} --serinjah sword
weaponDropGroup.add{itemId = 2711} --barbarian axe
weaponDropGroup.add{itemId = 2946} --battleaxe

--Category 4: Perma Loot
drop.addMoneyDrop()

return halflings.generateCallbacks(drop)