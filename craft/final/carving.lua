--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local crafts = require("craft.base.crafts")

local M = {}

local carving = crafts.Craft:new{
              craftEN = "Carving",
              craftDE = "Schnitzen",
              handTool = 2752,
              leadSkill = Character.carpentry,
              sfx = 14,
              sfxDuration = 17,
            }

carving:addTool(724) -- workbench
carving:addTool(725) -- workbench

local product
local catId

catId = carving:addCategory("Arrows and bolts", "Pfeile und Bolzen")

-- arrow
product = carving:addProduct(catId, 64, 10)
product:addIngredient(56, 1) -- bough

-- crossbow bolt
product = carving:addProduct(catId, 237, 10)
product:addIngredient(56, 1) -- bough
product:addIngredient(2535, 1) -- iron ingot

-- wind arrows
product = carving:addProduct(catId, 322, 10)
product:addIngredient(56, 1) -- bough
product:addIngredient(236, 1) -- gold ingot

catId = carving:addCategory("Blunt weapons", "Stumpfe Waffen")

-- club
product = carving:addProduct(catId, 2664, 1)
product:addIngredient(545, 1) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 1) -- iron ingot

-- mace
product = carving:addProduct(catId, 230, 1)
product:addIngredient(545, 1) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 2) -- iron ingot

-- nail club
product = carving:addProduct(catId, 1521, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 2) -- iron ingot

-- battle flail
product = carving:addProduct(catId, 231, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 3) -- iron ingot

-- maul
product = carving:addProduct(catId, 1522, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- war flail
product = carving:addProduct(catId, 2737, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- battle hammer
product = carving:addProduct(catId, 1044, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- warhammer
product = carving:addProduct(catId, 226, 1)
product:addIngredient(545, 7) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- heavy hammer
product = carving:addProduct(catId, 1523, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 2) -- iron ingot

-- spiked mace
product = carving:addProduct(catId, 1041, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2535, 2) -- iron ingot

-- dwarven hammer
product = carving:addProduct(catId, 1043, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot

-- dwarven stormhammer
product = carving:addProduct(catId, 1052, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(2551, 1) -- pure air

catId = carving:addCategory("Handles", "Griffe")

-- axe handle
product = carving:addProduct(catId, 2525, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- dagger handle
product = carving:addProduct(catId, 2530, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- mace handle
product = carving:addProduct(catId, 2548, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- staff handle
product = carving:addProduct(catId, 2572, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- sword handle
product = carving:addProduct(catId, 2584, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- small handle
product = carving:addProduct(catId, 2528, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- hammer handle
product = carving:addProduct(catId, 2541, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- saw handle
product = carving:addProduct(catId, 2561, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- scythe handle
product = carving:addProduct(catId, 2566, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- shovel handle
product = carving:addProduct(catId, 2567, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- sickle handle
product = carving:addProduct(catId, 2570, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- big sword handle
product = carving:addProduct(catId, 2585, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- large ornamented handle
product = carving:addProduct(catId, 2527, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- large handle
product = carving:addProduct(catId, 2544, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- morning star handle
product = carving:addProduct(catId, 2549, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- long staff handle
product = carving:addProduct(catId, 2573, 1)
product:addIngredient(2716, 3) -- apple wood boards

catId = carving:addCategory("Other", "Sonstiges")

-- torch
product = carving:addProduct(catId, 391, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- pins and cotters
product = carving:addProduct(catId, 2717, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(2738, 1) -- pins

-- comb
product = carving:addProduct(catId, 2719, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- pipe
product = carving:addProduct(catId, 2744, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- dice cup
product = carving:addProduct(catId, 1059, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- trap set
product = carving:addProduct(catId, 374, 1)
product:addIngredient(2716, 3) -- apple wood boards
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(3786, 1) -- heartwood

catId = carving:addCategory("Spears", "Speere")

-- simple spear
product = carving:addProduct(catId, 1046, 1)
product:addIngredient(2716, 2) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle

-- snake spear
product = carving:addProduct(catId, 1038, 1)
product:addIngredient(2716, 3) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- glaive
product = carving:addProduct(catId, 1047, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- viper spear
product = carving:addProduct(catId, 1049, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- ranseur
product = carving:addProduct(catId, 1040, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- voulge
product = carving:addProduct(catId, 1048, 1)
product:addIngredient(2716, 5) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- halberd
product = carving:addProduct(catId, 77, 1)
product:addIngredient(2716, 6) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- partisan
product = carving:addProduct(catId, 1042, 1)
product:addIngredient(2716, 7) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot

-- divine voulge
product = carving:addProduct(catId, 1053, 1)
product:addIngredient(2716, 8) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot

-- twinblade ranseur
product = carving:addProduct(catId, 1039, 1)
product:addIngredient(2716, 8) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot

-- shadow ranseur
product = carving:addProduct(catId, 1050, 1)
product:addIngredient(2716, 9) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(2552, 1) -- pure earth

-- partisan of light
product = carving:addProduct(catId, 1051, 1)
product:addIngredient(2716, 10) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit

catId = carving:addCategory("Staffs", "Stäbe")

-- walking stick
product = carving:addProduct(catId, 1090, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- skull staff
product = carving:addProduct(catId, 39, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- cleric's staff
product = carving:addProduct(catId, 40, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- novice's staff
product = carving:addProduct(catId, 1528, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- simple mage's staff
product = carving:addProduct(catId, 57, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- adepts's staff
product = carving:addProduct(catId, 1529, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- mage's staff
product = carving:addProduct(catId, 76, 1)
product:addIngredient(545, 6) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- elven mage's staff
product = carving:addProduct(catId, 209, 1)
product:addIngredient(545, 8) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 3) -- heartwood

-- battle staff
product = carving:addProduct(catId, 207, 1)
product:addIngredient(545, 8) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2552, 1) -- pure earth

-- ornate mage's staff
product = carving:addProduct(catId, 208, 1)
product:addIngredient(545, 9) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 4) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

-- master's staff
product = carving:addProduct(catId, 1530, 1)
product:addIngredient(545, 10) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 4) -- heartwood
product:addIngredient(2552, 1) -- pure earth

catId = carving:addCategory("Throwing weapons", "Wurfwaffen")

-- javelin
product = carving:addProduct(catId, 293, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle

catId = carving:addCategory("Tools", "Werkzeuge")

-- fishing rod
product = carving:addProduct(catId, 72, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(50, 1) -- thread

-- rolling pin
product = carving:addProduct(catId, 118, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- peel
product = carving:addProduct(catId, 121, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- cooking spoon
product = carving:addProduct(catId, 227, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- flail
product = carving:addProduct(catId, 258, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2573, 1) -- long staff handle

-- candle mould
product = carving:addProduct(catId, 429, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- brick mould
product = carving:addProduct(catId, 734, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- collection pan
product = carving:addProduct(catId, 2031, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- dyeing rod
product = carving:addProduct(catId, 2781, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2572, 1) -- staff handle

-- bucket
product = carving:addProduct(catId, 51, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- wooden shovel
product = carving:addProduct(catId, 312, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

catId = carving:addCategory("Wands", "Zauberstäbe")

-- wand
product = carving:addProduct(catId, 323, 1)
product:addIngredient(546, 7) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood

-- wand of earth
product = carving:addProduct(catId, 2782, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2552, 1) -- pure earth

-- wand of fire
product = carving:addProduct(catId, 2783, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2553, 1) -- pure fire

-- wand of water
product = carving:addProduct(catId, 2784, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2554, 1) -- pure water

-- wand of air
product = carving:addProduct(catId, 2785, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2551, 1) -- pure air

-- wand of spirit
product = carving:addProduct(catId, 3608, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

M.carving = carving
return M
