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
--Orc, Level: 5, Armourtype: medium, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local orcs = require("monster.race_4_orc.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2194} --short hardwood greaves
armorDropGroup.add{itemId = 2287} --albarian soldier's helmet
armorDropGroup.add{itemId = 2367} --albarian noble's armor
armorDropGroup.add{itemId = 2388} --red steel shield
armorDropGroup.add{itemId = 101} --chain shirt

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 3051} --sausage
specialDropGroup.add{itemId = 97} --bag
specialDropGroup.add{itemId = 63} --entrails
specialDropGroup.add{itemId = 2738} --nails
specialDropGroup.add{itemId = 2760} --rope

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 231} --mace
weaponDropGroup.add{itemId = 231} --morning star
weaponDropGroup.add{itemId = 2737} --morning star
weaponDropGroup.add{itemId = 226} --warhammer

--Category 4: Perma Loot
drop.addMoneyDrop()

return orcs.generateCallbacks(drop)