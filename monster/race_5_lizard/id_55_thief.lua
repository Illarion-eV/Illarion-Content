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
--Lizard Thief, Level: 4, Armourtype: light, Weapontype: puncture
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local lizards = require("monster.race_5_lizard.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 53} --leather boots
armorDropGroup.add{itemId = 366} --leather legs
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --full leatherarmor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 284} --sapphire
specialDropGroup.add{itemId = 71} --sapphire amulet
specialDropGroup.add{itemId = 279} --sapphire ring
specialDropGroup.add{itemId = 253} --raw sapphire
specialDropGroup.add{itemId = 1858} --goblet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 27} --simple dagger
weaponDropGroup.add{itemId = 189} --dagger
weaponDropGroup.add{itemId = 2740} --red dagger
weaponDropGroup.add{itemId = 190} --ornate dagger
weaponDropGroup.add{itemId = 444} --merinium plated dagger

--Category 4: Perma Loot
drop.addMoneyDrop()

return lizards.generateCallbacks(drop)