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
--Lizard, Level: 5, Armourtype: medium, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local lizards = require("monster.race_5_lizard.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2193} --hardwood greaves
armorDropGroup.add{itemId = 2448} --legionaire's tower shield
armorDropGroup.add{itemId = 696} --lizard armor
armorDropGroup.add{itemId = 2360} --Lor-Angur guardian's armor
armorDropGroup.add{itemId = 101} --chain shirt

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 355} --salmon
specialDropGroup.add{itemId = 73} --trout
specialDropGroup.add{itemId = 556} --salmon dish
specialDropGroup.add{itemId = 2459} --fish filet dish
specialDropGroup.add{itemId = 72} --fishing rod

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 231} --mace
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 231} --morning star
weaponDropGroup.add{itemId = 2737} --morning star
weaponDropGroup.add{itemId = 226} --warhammer

--Category 4: Perma Loot
drop.addMoneyDrop()

return lizards.generateCallbacks(drop)