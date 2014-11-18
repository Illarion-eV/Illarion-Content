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
--Human Necromancer, Level: 5, Armourtype: cloth, Weapontype: concussion
local LEVEL = 5

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local monstermagic = require("monster.base.monstermagic")
local humans = require("monster.race_0_human.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId =  461} --blue trousers
armorDropGroup.add{itemId =  181} --blue shirt
armorDropGroup.add{itemId = 2419} --red priest robe
armorDropGroup.add{itemId = 2420} --black priest robe
armorDropGroup.add{itemId = 2416} --brown priest robe

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId =   63} --insides
specialDropGroup.add{itemId =  314} --potash
specialDropGroup.add{itemId =  278} --obsidian ring
specialDropGroup.add{itemId = 2746} --razor blade
specialDropGroup.add{itemId =  223} --goblet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId =   39} --skull staff
weaponDropGroup.add{itemId =   40} --cleric's staff
weaponDropGroup.add{itemId = 2664} --club
weaponDropGroup.add{itemId =   57} --simple mage's staff
weaponDropGroup.add{itemId =   76} --mage's staff

--Category 4: Perma Loot
drop.addMoneyDrop()

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.0249, monsters = {101, 111}} -- summon simple mummies and skeltons
magic.addSummon{probability = 0.0050, monsters = {104, 107, 113}} -- surprise spawn. Stronger mummies and skeletons
magic.addSummon{probability = 0.0001, monsters = {115, 201}} -- rare summon. Magic skeleton or a demon skeleton

magic.addVioletFlame{probability = 0.02, damage = {from = 800, to = 1600}}

local M = humans.generateCallbacks(drop)
return magic.addCallbacks(M)