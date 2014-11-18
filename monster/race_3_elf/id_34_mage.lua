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
--Elven Mage, Level: 5, Armourtype: cloth, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local monstermagic = require("monster.base.monstermagic")
local elves = require("monster.race_3_elf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 459} --red trousers
armorDropGroup.add{itemId = 180} --red shirt
armorDropGroup.add{itemId = 2419} --red priest robe
armorDropGroup.add{itemId = 2420} --black priest robe
armorDropGroup.add{itemId = 2416} --brown priest robe

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 63} --entrails
specialDropGroup.add{itemId = 2746} --razor blade
specialDropGroup.add{itemId = 224} --golden goblet
specialDropGroup.add{itemId = 1840} --copper goblet
specialDropGroup.add{itemId = 2683} --grey dye

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 39} --skull staff
weaponDropGroup.add{itemId = 40} --cleric's staff
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 57} --simple mage's staff
weaponDropGroup.add{itemId = 76} --mage's staff

--Category 4: Perma Loot
drop.addMoneyDrop()

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addFireball{probability = 0.03, damage = {from =  500, to = 1000}, targetCount = 3}

magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addHealing{probability = 0.05, damage = {from =  500, to = 1000}, targetCount = 3}

local M = elves.generateCallbacks(drop)
return magic.addCallbacks(M)