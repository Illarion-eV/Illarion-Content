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
--Orc Thief, Level: 4, Armourtype: light, Weapontype: puncture
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local orcs = require("monster.race_4_orc.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 369} --leather shoes
armorDropGroup.add{itemId = 367} --short leather legs
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 283} --obsidian
specialDropGroup.add{itemId = 82} --obsidian amulet
specialDropGroup.add{itemId = 278} --obsidian ring
specialDropGroup.add{itemId = 252} --raw obsidian
specialDropGroup.add{itemId = 1858} --goblet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 27} --simple dagger
weaponDropGroup.add{itemId = 189} --dagger
weaponDropGroup.add{itemId = 2740} --red dagger
weaponDropGroup.add{itemId = 190} --ornate dagger
weaponDropGroup.add{itemId = 297} --golden dagger

--Category 4: Perma Loot
drop.addMoneyDrop()

return orcs.generateCallbacks(drop)