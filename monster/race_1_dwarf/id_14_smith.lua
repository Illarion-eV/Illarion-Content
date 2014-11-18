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
--Dwarven Smith, Level: 4, Armourtype: heavy, Weapontype: concussion
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local dwarfs = require("monster.race_1_dwarf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 202} --steel cap
armorDropGroup.add{itemId = 2112} --short blue steel greaves
armorDropGroup.add{itemId = 2395} --dwarven plate
armorDropGroup.add{itemId = 2364} --steel plate
armorDropGroup.add{itemId = 4} --plate armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2535} --iron ingot
specialDropGroup.add{itemId = 21} --coal
specialDropGroup.add{itemId = 22} --iron ore
specialDropGroup.add{itemId = 234} --nugget
specialDropGroup.add{itemId = 236} --gold ingot

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 23} --hammer
weaponDropGroup.add{itemId = 122} --finesmithing hammer
weaponDropGroup.add{itemId = 2709} --carpenter's hammer
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 2737} --morning star

--Category 4: Perma Loot
drop.addMoneyDrop()

return dwarfs.generateCallbacks(drop)