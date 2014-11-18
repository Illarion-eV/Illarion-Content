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
--Elven Warrior, Level: 6, Armourtype: light, Weapontype: slashing
local LEVEL = 6

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local elves = require("monster.race_3_elf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2114} --short fur trousers
armorDropGroup.add{itemId = 53} --leather boots
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 2407} --light blue breastplate

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2934} --lamb meat
specialDropGroup.add{itemId = 553} --rabbit meat
specialDropGroup.add{itemId = 552} --deer meat
specialDropGroup.add{itemId = 307} --pork
specialDropGroup.add{itemId = 2940} --steak

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 64} --arrows
weaponDropGroup.add{itemId = 2714} --hunting bow
weaponDropGroup.add{itemId = 2780} --ebony wood bow
weaponDropGroup.add{itemId = 2685} --magical elven bow
weaponDropGroup.add{itemId = 2718} --elven composite bow

--Category 4: Perma Loot
drop.addMoneyDrop()

return elves.generateCallbacks(drop)