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
--Dwarf, Level: 5, Armourtype: medium, Weapontype: slashing
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local dwarfs = require("monster.race_1_dwarf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2441} --salkamaerian paladin's helmet
armorDropGroup.add{itemId = 2193} --hardwood greaves
armorDropGroup.add{itemId = 2390} --dwarven state armor
armorDropGroup.add{itemId =   20} --large metal shield
armorDropGroup.add{itemId =  101} --chain shirt

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 1908} --beer mug
specialDropGroup.add{itemId =  728, probability = 0.1 } --hop seeds
specialDropGroup.add{itemId =  259, probability = 0.01} --grain
specialDropGroup.add{itemId =  227, probability = 0.01} --cooking spoon
specialDropGroup.add{itemId = 1317, probability = 0.01} --empty bottle

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 2711} --barbarian axe
weaponDropGroup.add{itemId = 2946} --battleaxe
weaponDropGroup.add{itemId = 2642} --orc axe
weaponDropGroup.add{itemId = 2629} --heavy battleaxe
weaponDropGroup.add{itemId =  192} --coppered battleaxe

--Category 4: Perma Loot
drop.addMoneyDrop()

return dwarfs.generateCallbacks(drop)