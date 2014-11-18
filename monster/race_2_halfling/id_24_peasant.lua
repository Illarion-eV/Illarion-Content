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
--Halfling Peasant, Level: 3, Armourtype: cloth, Weapontype: slashing
local LEVEL = 3

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local halflings = require("monster.race_2_halfling.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 811} --red doublet
armorDropGroup.add{itemId = 457} --green shirt
armorDropGroup.add{itemId = 460} --yellow trousers
armorDropGroup.add{itemId = 458} --yellow shirt
armorDropGroup.add{itemId = 461} --blue trousers

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 249} --bundle of grain
specialDropGroup.add{itemId = 259} --grain
specialDropGroup.add{itemId = 2} --flour
specialDropGroup.add{itemId = 5} --dough
specialDropGroup.add{itemId = 49} --bread

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 126} --sickle
weaponDropGroup.add{itemId = 271} --skythe
weaponDropGroup.add{itemId = 445} --wooden sword
weaponDropGroup.add{itemId = 78} --short sword
weaponDropGroup.add{itemId = 2752} --carving tools

--Category 4: Perma Loot
drop.addMoneyDrop()

return halflings.generateCallbacks(drop)