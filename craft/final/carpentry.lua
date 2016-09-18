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
local crafts = require("craft.crafts")

module("craft.final.carpentry", package.seeall)

carpentry = crafts.Craft:new{
              craftEN = "Carpentry",
              craftDE = "Schreinern",
              handTool = 2715,
              leadSkill = Character.carpentry,
              sfx = 14,
              sfxDuration = 17,
            }

carpentry:addTool(724) -- workbench
carpentry:addTool(725) -- workbench

--------------------------------------------------------------------------------------------

local catId = carpentry:addCategory("Arrows and bolts", "Pfeile und Bolzen")

-- arrow
product = carpentry:addProduct(catId, 64, 10)
product:addIngredient(56, 2) -- bough

-- crossbow bolt
product = carpentry:addProduct(catId, 237, 10)
product:addIngredient(56, 2) -- bough
product:addIngredient(2535, 1) -- iron ingot

-- wind arrows
product = carpentry:addProduct(catId, 322, 10)
product:addIngredient(56, 2) -- bough
product:addIngredient(236, 1) -- gold ingot

local catId = carpentry:addCategory("Training weapons", "Übungswaffen")

-- wooden sword
product = carpentry:addProduct(catId, 445, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2584, 1) -- sword handle

-- wooden dagger
product = carpentry:addProduct(catId, 1045, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2530, 1) -- dagger handle

local catId = carpentry:addCategory("Blunt weapons", "Stumpfe Waffen")

-- club
product = carpentry:addProduct(catId, 2664, 1)
product:addIngredient(545, 1) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 1) -- iron ingot

-- mace
product = carpentry:addProduct(catId, 230, 1)
product:addIngredient(545, 1) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 2) -- iron ingot

-- nail club
product = carpentry:addProduct(catId, 1521, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 2) -- iron ingot

-- battle flail
product = carpentry:addProduct(catId, 231, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(2535, 3) -- iron ingot

-- maul
product = carpentry:addProduct(catId, 1522, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- war flail
product = carpentry:addProduct(catId, 2737, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- battle hammer
product = carpentry:addProduct(catId, 1044, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- warhammer
product = carpentry:addProduct(catId, 226, 1)
product:addIngredient(545, 7) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- heavy hammer
product = carpentry:addProduct(catId, 1523, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2535, 2) -- iron ingot

-- spiked mace
product = carpentry:addProduct(catId, 1041, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2548, 1) -- mace handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2535, 2) -- iron ingot

-- dwarven hammer
product = carpentry:addProduct(catId, 1043, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot

-- dwarven stormhammer
product = carpentry:addProduct(catId, 1052, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2541, 1) -- hammer handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(2551, 1) -- pure air

local catId = carpentry:addCategory("Bows", "Bögen")

-- short bow
product = carpentry:addProduct(catId, 65, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(2535, 1) -- iron ingot

-- rider's bow
product = carpentry:addProduct(catId, 1531, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(2550, 1) -- copper ingot

-- serinjah-rider's bow
product = carpentry:addProduct(catId, 2646, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(236, 1) -- gold ingot

-- hunting bow
product = carpentry:addProduct(catId, 2714, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 1) -- heartwood

-- long bow
product = carpentry:addProduct(catId, 2708, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 1) -- heartwood

-- crossbow
product = carpentry:addProduct(catId, 70, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 2) -- heartwood

-- elven shortbow
product = carpentry:addProduct(catId, 2685, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 3) -- heartwood

-- ebony wood bow
product = carpentry:addProduct(catId, 2780, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 4) -- heartwood

-- elven composite longbow
product = carpentry:addProduct(catId, 2718, 1)
product:addIngredient(546, 5) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 5) -- heartwood

-- fire hunter's bow
product = carpentry:addProduct(catId, 2727, 1)
product:addIngredient(546, 5) -- naldor wood boards
product:addIngredient(50, 2) -- thread
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2553, 1) -- pure fire

local catId = carpentry:addCategory("Handles", "Griffe")

-- axe handle
product = carpentry:addProduct(catId, 2525, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- dagger handle
product = carpentry:addProduct(catId, 2530, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- mace handle
product = carpentry:addProduct(catId, 2548, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- staff handle
product = carpentry:addProduct(catId, 2572, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- sword handle
product = carpentry:addProduct(catId, 2584, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- small handle
product = carpentry:addProduct(catId, 2528, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- hammer handle
product = carpentry:addProduct(catId, 2541, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- saw handle
product = carpentry:addProduct(catId, 2561, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- scythe handle
product = carpentry:addProduct(catId, 2566, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- shovel handle
product = carpentry:addProduct(catId, 2567, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- sickle handle
product = carpentry:addProduct(catId, 2570, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- big sword handle
product = carpentry:addProduct(catId, 2585, 1)
product:addIngredient(2716, 2) -- apple wood boards

-- large ornamented handle
product = carpentry:addProduct(catId, 2527, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- large handle
product = carpentry:addProduct(catId, 2544, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- morning star handle
product = carpentry:addProduct(catId, 2549, 1)
product:addIngredient(2716, 3) -- apple wood boards

-- long staff handle
product = carpentry:addProduct(catId, 2573, 1)
product:addIngredient(2716, 3) -- apple wood boards

local catId = carpentry:addCategory("Music instruments", "Instrumente")

-- flute
product = carpentry:addProduct(catId, 90, 1)
product:addIngredient(546, 2) -- naldor wood boards
product:addIngredient(46, 1) -- ruby

-- panpipe
product = carpentry:addProduct(catId, 532, 1)
product:addIngredient(546, 2) -- naldor wood boards
product:addIngredient(3786, 1) -- heartwood

-- drum
product = carpentry:addProduct(catId, 533, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(3786, 1) -- heartwood

-- lute
product = carpentry:addProduct(catId, 335, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(3786, 2) -- heartwood

-- harp
product = carpentry:addProduct(catId, 332, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(3786, 4) -- heartwood

local catId = carpentry:addCategory("Other", "Sonstiges")

-- wooden cup
product = carpentry:addProduct(catId, 2185, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- torch
product = carpentry:addProduct(catId, 391, 1)
product:addIngredient(2716, 1) -- apple wood boards

-- pins and cotters
product = carpentry:addProduct(catId, 2717, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(2738, 1) -- pins

-- comb
product = carpentry:addProduct(catId, 2719, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- pipe
product = carpentry:addProduct(catId, 2744, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- dice cup
product = carpentry:addProduct(catId, 1059, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(3786, 1) -- heartwood

-- trap set
product = carpentry:addProduct(catId, 374, 1)
product:addIngredient(2716, 3) -- apple wood boards
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(3786, 1) -- heartwood

local catId = carpentry:addCategory("Shields", "Schilde")

-- small wooden shield
product = carpentry:addProduct(catId, 2445, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- wooden shield
product = carpentry:addProduct(catId, 17, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- light shield
product = carpentry:addProduct(catId, 18, 1)
product:addIngredient(2543, 3) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- red warden's shield
product = carpentry:addProduct(catId, 917, 1)
product:addIngredient(2543, 3) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate

-- metal shield
product = carpentry:addProduct(catId, 19, 1)
product:addIngredient(2543, 4) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 1) -- heartwood

-- knight shield
product = carpentry:addProduct(catId, 20, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 1) -- heartwood

-- round metal shield
product = carpentry:addProduct(catId, 186, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- red steel shield
product = carpentry:addProduct(catId, 2388, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- legionnaire's tower shield
product = carpentry:addProduct(catId, 2448, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- heraldic shield
product = carpentry:addProduct(catId, 95, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood

-- steel tower shield
product = carpentry:addProduct(catId, 96, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood

-- ornate tower shield
product = carpentry:addProduct(catId, 916, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 4) -- heartwood

-- shield of the sky
product = carpentry:addProduct(catId, 2284, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2551, 1) -- pure air

-- mosaic shield
product = carpentry:addProduct(catId, 2447, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

-- cloud shield
product = carpentry:addProduct(catId, 2439, 1)
product:addIngredient(2543, 8) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2551, 1) -- pure air

local catId = carpentry:addCategory("Spears", "Speere")

-- simple spear
product = carpentry:addProduct(catId, 1046, 1)
product:addIngredient(2716, 2) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle

-- snake spear
product = carpentry:addProduct(catId, 1038, 1)
product:addIngredient(2716, 3) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- glaive
product = carpentry:addProduct(catId, 1047, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- viper spear
product = carpentry:addProduct(catId, 1049, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- ranseur
product = carpentry:addProduct(catId, 1040, 1)
product:addIngredient(2716, 4) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(2535, 1) -- iron ingot

-- voulge
product = carpentry:addProduct(catId, 1048, 1)
product:addIngredient(2716, 5) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- halberd
product = carpentry:addProduct(catId, 77, 1)
product:addIngredient(2716, 6) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2535, 1) -- iron ingot

-- partisan
product = carpentry:addProduct(catId, 1042, 1)
product:addIngredient(2716, 7) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot

-- divine voulge
product = carpentry:addProduct(catId, 1053, 1)
product:addIngredient(2716, 8) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot

-- twinblade ranseur
product = carpentry:addProduct(catId, 1039, 1)
product:addIngredient(2716, 8) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot

-- shadow ranseur
product = carpentry:addProduct(catId, 1050, 1)
product:addIngredient(2716, 9) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 1) -- heartwood
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(2552, 1) -- pure earth

-- partisan of light
product = carpentry:addProduct(catId, 1051, 1)
product:addIngredient(2716, 10) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit

local catId = carpentry:addCategory("Staffs", "Stäbe")

-- walking stick
product = carpentry:addProduct(catId, 1090, 1)
product:addIngredient(545, 3) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- skull staff
product = carpentry:addProduct(catId, 39, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- cleric's staff
product = carpentry:addProduct(catId, 40, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- novice's staff
product = carpentry:addProduct(catId, 1528, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle

-- simple mage's staff
product = carpentry:addProduct(catId, 57, 1)
product:addIngredient(545, 4) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- adepts's staff
product = carpentry:addProduct(catId, 1529, 1)
product:addIngredient(545, 5) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- mage's staff
product = carpentry:addProduct(catId, 76, 1)
product:addIngredient(545, 6) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 1) -- heartwood

-- elven mage's staff
product = carpentry:addProduct(catId, 209, 1)
product:addIngredient(545, 8) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 3) -- heartwood

-- battle staff
product = carpentry:addProduct(catId, 207, 1)
product:addIngredient(545, 8) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2552, 1) -- pure earth

-- ornate mage's staff
product = carpentry:addProduct(catId, 208, 1)
product:addIngredient(545, 9) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 4) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

-- master's staff
product = carpentry:addProduct(catId, 1530, 1)
product:addIngredient(545, 10) -- cherry wood boards
product:addIngredient(2572, 1) -- staff handle
product:addIngredient(3786, 4) -- heartwood
product:addIngredient(2552, 1) -- pure earth

local catId = carpentry:addCategory("Tableware", "Geschirr")

-- soup bowl
product = carpentry:addProduct(catId, 2935, 1)
product:addIngredient(2543, 2) -- conifer wood boards

-- wooden plate
product = carpentry:addProduct(catId, 2952, 1)
product:addIngredient(2543, 2) -- conifer wood boards

local catId = carpentry:addCategory("Throwing weapons", "Wurfwaffen")

-- javelin
product = carpentry:addProduct(catId, 293, 1)
product:addIngredient(2716, 1) -- apple wood boards
product:addIngredient(2573, 1) -- long staff handle

local catId = carpentry:addCategory("Tools", "Werkzeuge")

-- fishing rod
product = carpentry:addProduct(catId, 72, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2573, 1) -- long staff handle
product:addIngredient(50, 1) -- thread

-- rolling pin
product = carpentry:addProduct(catId, 118, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- peel
product = carpentry:addProduct(catId, 121, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- cooking spoon
product = carpentry:addProduct(catId, 227, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

-- flail
product = carpentry:addProduct(catId, 258, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2573, 1) -- long staff handle

-- candle mould
product = carpentry:addProduct(catId, 429, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- brick mould
product = carpentry:addProduct(catId, 734, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- collection pan
product = carpentry:addProduct(catId, 2031, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- dyeing rod
product = carpentry:addProduct(catId, 2781, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2572, 1) -- staff handle

-- bucket
product = carpentry:addProduct(catId, 51, 1)
product:addIngredient(2543, 4) -- conifer wood boards

-- wooden shovel
product = carpentry:addProduct(catId, 312, 1)
product:addIngredient(2543, 1) -- conifer wood boards
product:addIngredient(2528, 1) -- small handle

local catId = carpentry:addCategory("Wands", "Zauberstäbe")

-- wand
product = carpentry:addProduct(catId, 323, 1)
product:addIngredient(546, 7) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood

-- wand of earth
product = carpentry:addProduct(catId, 2782, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2552, 1) -- pure earth

-- wand of fire
product = carpentry:addProduct(catId, 2783, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2553, 1) -- pure fire

-- wand of water
product = carpentry:addProduct(catId, 2784, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2554, 1) -- pure water

-- wand of air
product = carpentry:addProduct(catId, 2785, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2551, 1) -- pure air

-- wand of spirit
product = carpentry:addProduct(catId, 3608, 1)
product:addIngredient(546, 9) -- naldor wood boards
product:addIngredient(2527, 1) -- large ornamented handle
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(3607, 1) -- pure spirit