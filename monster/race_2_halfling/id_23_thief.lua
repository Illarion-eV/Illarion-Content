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
--Halfling Thief, Level: 4, Armourtype: light, Weapontype: puncture
local LEVEL = 4

local drop = require("monster.base.drop"){monsterLevel = LEVEL}
local halflings = require("monster.race_2_halfling.base")

--Category 1: Armor
local armorDropGroup = drop.dropGroup()
armorDropGroup.add{itemId = 53} --leather boots
armorDropGroup.add{itemId = 2114} --short fur trousers
armorDropGroup.add{itemId = 363} --leather scale armor
armorDropGroup.add{itemId = 365} --half leather armor
armorDropGroup.add{itemId = 365} --half leather armor

--Category 2: Special loot
local specialDropGroup = drop.dropGroup()
specialDropGroup.add{itemId = 46} --ruby
specialDropGroup.add{itemId = 67} --ruby amulet
specialDropGroup.add{itemId = 68} --ruby ring
specialDropGroup.add{itemId = 255} --raw ruby
specialDropGroup.add{itemId = 1840} --copper goblet

--Category 3: Weapon
local weaponDropGroup = drop.dropGroup()
weaponDropGroup.add{itemId = 27} --simple dagger
weaponDropGroup.add{itemId = 189} --dagger
weaponDropGroup.add{itemId = 2675} --rapier
weaponDropGroup.add{itemId = 190} --ornate dagger
weaponDropGroup.add{itemId = 389} --silvered dagger

--Category 4: Perma Loot
drop.addMoneyDrop()

return halflings.generateCallbacks(drop)