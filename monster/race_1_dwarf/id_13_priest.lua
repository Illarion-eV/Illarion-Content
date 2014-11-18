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
--Dwarven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local monstermagic = require("monster.base.monstermagic")
local dwarfs = require("monster.race_1_dwarf.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 807} --blue doublet
armorDropGroup.add{itemId = 182} --black shirt
armorDropGroup.add{itemId = 823} --grey trousers
armorDropGroup.add{itemId = 2421} --white priest robe
armorDropGroup.add{itemId = 2418} --grey priest robe

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 391} --torch
specialDropGroup.add{itemId = 223} --iron goblet
specialDropGroup.add{itemId = 2935} --soup bowl
specialDropGroup.add{itemId = 1001} --plate
specialDropGroup.add{itemId = 2031} --plate

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 40} --cleric's staff
weaponDropGroup.add{itemId = 230} --mace
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 209} --battle staff
weaponDropGroup.add{itemId = 231} --morning star

--Category 4: Perma Loot
drop.addMoneyDrop()

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addLighting{probability = 0.03, damage = {from =  500, to = 1000}, targetCount = 5}

magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addHealing{probability = 0.05, damage = {from =  500, to = 1000}, targetCount = 3}

local M = dwarfs.generateCallbacks(drop)
return magic.addCallbacks(M)