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
--Human Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing
local LEVEL = 6

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local humans = require("monster.race_0_human.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId =  530} --albarian steel gloves
armorDropGroup.add{itemId =  186} --round metal shield
armorDropGroup.add{itemId =  699} --salkamaerian steel boots
armorDropGroup.add{itemId = 2364} --steel plate
armorDropGroup.add{itemId =    4} --plate armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 2183} --clay mug
specialDropGroup.add{itemId =   97} --bag
specialDropGroup.add{itemId = 2760} --rope
specialDropGroup.add{itemId =  306} --ham
specialDropGroup.add{itemId =   62} --amulet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 2658} --broad sword
weaponDropGroup.add{itemId = 2757} --scimitar
weaponDropGroup.add{itemId = 2701} --longsword
weaponDropGroup.add{itemId =   84} --coppered longsword
weaponDropGroup.add{itemId =    1} --serinjah sword

--Category 4: Perma Loot
drop.addMoneyDrop()

return humans.generateCallbacks(drop)