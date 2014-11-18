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
--Orc Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing
local LEVEL = 6

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local orcs = require("monster.race_4_orc.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 19} --metal shield
armorDropGroup.add{itemId = 2172} --steel greaves
armorDropGroup.add{itemId = 2364} --steel plate
armorDropGroup.add{itemId = 2363} --nightplate
armorDropGroup.add{itemId = 2357} --shadowplate

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 333} --horn
specialDropGroup.add{itemId = 2940} --steak
specialDropGroup.add{itemId = 2697} --rasp
specialDropGroup.add{itemId = 2681} --red dye
specialDropGroup.add{itemId = 391} --torch

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 25} --sabre
weaponDropGroup.add{itemId = 2658} --broad sword
weaponDropGroup.add{itemId = 2701} --longsword
weaponDropGroup.add{itemId = 2757} --scimitar
weaponDropGroup.add{itemId = 2642} --orc axe

--Category 4: Perma Loot
drop.addMoneyDrop()

return orcs.generateCallbacks(drop)