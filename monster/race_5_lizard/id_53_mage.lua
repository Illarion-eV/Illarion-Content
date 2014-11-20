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
--Lizard Mage, Level: 5, Armourtype: cloth, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local monstermagic = require("monster.base.monstermagic")
local lizards = require("monster.race_5_lizard.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 831} --green hat with feather
armorDropGroup.add{itemId = 181} --blue shirt
armorDropGroup.add{itemId = 195} --yellow robe
armorDropGroup.add{itemId = 2377} --red mage robe
armorDropGroup.add{itemId = 821} --blue trousers

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2745} --parchment
specialDropGroup.add{itemId = 463} --quill
specialDropGroup.add{itemId = 72} --fishing rod
specialDropGroup.add{itemId = 355} --salmon
specialDropGroup.add{itemId = 73} --trout

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 57} --simple mage's staff
weaponDropGroup.add{itemId = 76} --mage's staff
weaponDropGroup.add{itemId = 1044} --ornate mage's staff
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId = 39} --skull staff

--Category 4: Perma Loot
drop.addMoneyDrop()

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addIceball{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addIceball{probability = 0.03, damage = {from =  500, to = 1000}, targetCount = 3}

magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addHealing{probability = 0.05, damage = {from =  500, to = 1000}, targetCount = 3}

local M = lizards.generateCallbacks(drop)
return magic.addCallbacks(M)