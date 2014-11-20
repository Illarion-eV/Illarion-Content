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
--Lizard Temple Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing
local LEVEL = 6

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local lizards = require("monster.race_5_lizard.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 2117} --short red steel greaves
armorDropGroup.add{itemId = 94} --pot helmet
armorDropGroup.add{itemId = 2364} --albarian steel plate
armorDropGroup.add{itemId = 2364} --steel plate
armorDropGroup.add{itemId = 2393} --heavy plate armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 51} --bucket
specialDropGroup.add{itemId = 92} --oil lamp
specialDropGroup.add{itemId = 390} --lamp oil
specialDropGroup.add{itemId = 355} --salmon
specialDropGroup.add{itemId = 73} --trout

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 88} --long axe
weaponDropGroup.add{itemId = 77} --halberd
weaponDropGroup.add{itemId = 204} --bastard sword
weaponDropGroup.add{itemId = 2731} --two handed sword
weaponDropGroup.add{itemId = 383} --waraxe

--Category 4: Perma Loot
drop.addMoneyDrop()

return lizards.generateCallbacks(drop)