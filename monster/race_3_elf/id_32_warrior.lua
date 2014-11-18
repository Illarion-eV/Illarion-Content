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
armorDropGroup.add{itemId = 367} --short leather legs
armorDropGroup.add{itemId = 2388} --red steel shield
armorDropGroup.add{itemId = 697} --fur boots
armorDropGroup.add{itemId = 2399} --light elven armor
armorDropGroup.add{itemId = 2400} --magical elven armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 335} --lute
specialDropGroup.add{itemId = 90} --flute
specialDropGroup.add{itemId = 332} --harp
specialDropGroup.add{itemId = 2680} --blue dye
specialDropGroup.add{itemId = 2681} --red dye

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 78} --short sword
weaponDropGroup.add{itemId = 25} --sabre
weaponDropGroup.add{itemId = 2775} --elven rainbow sword
weaponDropGroup.add{itemId = 2778} --elven sword
weaponDropGroup.add{itemId = 2701} --longsword

--Category 4: Perma Loot
drop.addMoneyDrop()

return elves.generateCallbacks(drop)