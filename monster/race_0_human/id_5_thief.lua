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
--Human Thief, Level: 4, Armourtype: light, Weapontype: puncture
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local humans = require("monster.race_0_human.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 527} --serinjah leather gloves
armorDropGroup.add{itemId = 697} --fur boots
armorDropGroup.add{itemId = 363} --leather scale armor
armorDropGroup.add{itemId = 365} --half leather armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 197} --amethyst
specialDropGroup.add{itemId =  79} --amethyst amulet
specialDropGroup.add{itemId = 277} --amethyst ring
specialDropGroup.add{itemId = 251} --raw amethyst
specialDropGroup.add{itemId = 224} --golden goblet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId =   27} --broad sword
weaponDropGroup.add{itemId =  189} --scimitar
weaponDropGroup.add{itemId = 2675} --longsword
weaponDropGroup.add{itemId =  190} --coppered longsword
weaponDropGroup.add{itemId =  398} --serinjah sword

--Category 4: Perma Loot
drop.addMoneyDrop()

return humans.generateCallbacks(drop)