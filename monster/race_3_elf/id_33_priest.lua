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
--Elven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local monstermagic = require("monster.base.monstermagic")
local elves = require("monster.race_3_elf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 183} --green trousers
armorDropGroup.add{itemId = 812} --black doublet
armorDropGroup.add{itemId = 368} --yellow priest robe
armorDropGroup.add{itemId = 2421} --white priest robe
armorDropGroup.add{itemId = 825} --red trousers

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2745} --parchment
specialDropGroup.add{itemId = 463} --quill
specialDropGroup.add{itemId = 2744} --pipe
specialDropGroup.add{itemId = 164} --big empty bottle
specialDropGroup.add{itemId = 2682} --yellow dye

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 209} --elven mage's staff
weaponDropGroup.add{itemId = 76} --mage's staff
weaponDropGroup.add{itemId = 1044} --ornate mage's staff
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 57} --simple mage's staff

--Category 4: Perma Loot
drop.addMoneyDrop()

local magic = monstermagic()
magic.addSummon{probability = 0.0249, monsters = {252, 582, 622}} -- some animals
magic.addSummon{probability = 0.0050, monsters = {253, 583}} -- stronger animals
magic.addSummon{probability = 0.0001, monsters = {584}} -- even strong animal

local M = elves.generateCallbacks(drop)
return magic.addCallbacks(M)