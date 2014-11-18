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
--Human, Level: 5, Armourtype: medium, Weapontype: slashing
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local humans = require("monster.race_0_human.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2441} --salkamaerian paladin's helmet
armorDropGroup.add{itemId = 2194} --short hardwood greaves
armorDropGroup.add{itemId = 2365} --salkamaerian officer's armor
armorDropGroup.add{itemId = 2360} --Lor-Angur guardian's armor
armorDropGroup.add{itemId =   19} --metal shield

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId =  81} --berries
specialDropGroup.add{itemId = 302} --cherries
specialDropGroup.add{itemId =  80} --banana
specialDropGroup.add{itemId = 151} --strawberries
specialDropGroup.add{itemId =  15} --apple

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId =    1} --serinjah sword
weaponDropGroup.add{itemId =   25} --sabre
weaponDropGroup.add{itemId = 2757} --scimitar
weaponDropGroup.add{itemId = 2658} --broad sword
weaponDropGroup.add{itemId =   78} --short sword

--Category 4: Perma Loot
drop.addMoneyDrop()

return humans.generateCallbacks(drop)