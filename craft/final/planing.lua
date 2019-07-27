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

local planing = crafts.Craft:new{
              craftEN = "Planing",
              craftDE = "Hobeln",
              handTool = 2715,
              leadSkill = Character.carpentry,
              sfx = 11,
              sfxDuration = 17,
            }

planing:addTool(724) -- workbench
planing:addTool(725) -- workbench

local product
local catId

catId = planing:addCategory("Bows", "Bögen")

-- short bow
product = planing:addProduct(catId, 65, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(2535, 1) -- iron ingot

-- rider's bow
product = planing:addProduct(catId, 1531, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(2550, 1) -- copper ingot

-- serinjah-rider's bow
product = planing:addProduct(catId, 2646, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(236, 1) -- gold ingot

-- hunting bow
product = planing:addProduct(catId, 2714, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 1) -- heartwood

-- long bow
product = planing:addProduct(catId, 2708, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 1) -- heartwood

-- crossbow
product = planing:addProduct(catId, 70, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 2) -- heartwood

-- elven shortbow
product = planing:addProduct(catId, 2685, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 3) -- heartwood

-- ebony wood bow
product = planing:addProduct(catId, 2780, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 4) -- heartwood

-- elven composite longbow
product = planing:addProduct(catId, 2718, 1)
product:addIngredient(546, 5) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 5) -- heartwood

-- fire hunter's bow
product = planing:addProduct(catId, 2727, 1)
product:addIngredient(546, 5) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2553, 1) -- pure fire

catId = planing:addCategory("Music instruments", "Instrumente")

-- flute
product = planing:addProduct(catId, 90, 1)
product:addIngredient(546, 2) -- naldor wood boards
product:addIngredient(46, 1) -- ruby

-- panpipe
product = planing:addProduct(catId, 532, 1)
product:addIngredient(546, 2) -- naldor wood boards
product:addIngredient(3786, 1) -- heartwood

-- drum
product = planing:addProduct(catId, 533, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(2547, 1) -- leather
product:addIngredient(3786, 1) -- heartwood

-- lute
product = planing:addProduct(catId, 335, 1)
product:addIngredient(546, 3) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 2) -- heartwood

-- harp
product = planing:addProduct(catId, 332, 1)
product:addIngredient(546, 4) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 4) -- heartwood

catId = planing:addCategory("Shields", "Schilde")

-- small wooden shield
product = planing:addProduct(catId, 2445, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- wooden shield
product = planing:addProduct(catId, 17, 1)
product:addIngredient(2543, 2) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- light shield
product = planing:addProduct(catId, 18, 1)
product:addIngredient(2543, 3) -- conifer wood boards
product:addIngredient(2537, 1) -- iron plate

-- red warden's shield
product = planing:addProduct(catId, 917, 1)
product:addIngredient(2543, 3) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate

-- metal shield
product = planing:addProduct(catId, 19, 1)
product:addIngredient(2543, 4) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 1) -- heartwood

-- knight shield
product = planing:addProduct(catId, 20, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 1) -- heartwood

-- round metal shield
product = planing:addProduct(catId, 186, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- red steel shield
product = planing:addProduct(catId, 2388, 1)
product:addIngredient(2543, 5) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- legionnaire's tower shield
product = planing:addProduct(catId, 2448, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood

-- heraldic shield
product = planing:addProduct(catId, 95, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood

-- steel tower shield
product = planing:addProduct(catId, 96, 1)
product:addIngredient(2543, 6) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood

-- ornate tower shield
product = planing:addProduct(catId, 916, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 4) -- heartwood

-- shield of the sky
product = planing:addProduct(catId, 2284, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(2551, 1) -- pure air

-- mosaic shield
product = planing:addProduct(catId, 2447, 1)
product:addIngredient(2543, 7) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 2) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

-- cloud shield
product = planing:addProduct(catId, 2439, 1)
product:addIngredient(2543, 8) -- conifer wood boards
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(2551, 1) -- pure air

catId = planing:addCategory("Tableware", "Geschirr")

-- wooden cup
product = planing:addProduct(catId, 2185, 1)
product:addIngredient(2543, 1) -- conifer wood boards

-- soup bowl
product = planing:addProduct(catId, 2935, 2)
product:addIngredient(2543, 1) -- conifer wood boards

-- wooden plate
product = planing:addProduct(catId, 2952, 2)
product:addIngredient(2543, 1) -- conifer wood boards

catId = planing:addCategory("Training weapons", "Übungswaffen")

-- wooden sword
product = planing:addProduct(catId, 445, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2584, 1) -- sword handle

-- wooden dagger
product = planing:addProduct(catId, 1045, 1)
product:addIngredient(545, 2) -- cherry wood boards
product:addIngredient(2530, 1) -- dagger handle

-- Dummy group for items that cannot be crafted but repaired
catId = planing:addCategory("repair only", "nur reparieren")

-- drow bow
product = planing:addProduct(catId, 2739, 1)
product:addIngredient(546, 5) -- naldor wood boards
product:addIngredient(63, 2) -- entrails
product:addIngredient(3786, 3) -- heartwood
product:addIngredient(3607, 1) -- pure spirit

M.planing = planing
return M
