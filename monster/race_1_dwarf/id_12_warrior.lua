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
--Dwarven Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing
local LEVEL = 6

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local dwarfs = require("monster.race_1_dwarf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 529} --dwarfen metal gloves
armorDropGroup.add{itemId = 2117} --short red steel greaves
armorDropGroup.add{itemId = 2395} --dwarven plate
armorDropGroup.add{itemId = 2364} --steel plate
armorDropGroup.add{itemId = 4} --plate armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 224} --golden goblet
specialDropGroup.add{itemId = 222} --amulet
specialDropGroup.add{itemId = 1908} --beer mug
specialDropGroup.add{itemId = 285} --diamond
specialDropGroup.add{itemId = 333} --horn

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 2946} --battleaxe
weaponDropGroup.add{itemId = 2629} --heavy battleaxe
weaponDropGroup.add{itemId = 2660} --dwarven axe
weaponDropGroup.add{itemId = 2711} --barbarian axe
weaponDropGroup.add{itemId = 124} --golden battleaxe

--Category 4: Perma Loot
drop.addMoneyDrop()

return dwarfs.generateCallbacks(drop)