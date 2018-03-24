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

local baking = crafts.Craft:new{
                     craftEN = "Baking",
                     craftDE = "Backen",
                     handTool = 121,
                     leadSkill = Character.cookingAndBaking,
                     sfx = 7,
                     sfxDuration = 80,
                   }

baking:addTool( 119 ) -- baking oven
baking:addTool( 120 ) -- baking oven

local product
local catId

catId = baking:addCategory("Baked goods", "Backwaren")

-- bread roll
product = baking:addProduct(catId, 191, 1)
product:addIngredient(2, 1) -- flour
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- cookies
product = baking:addProduct(catId, 453, 2)
product:addIngredient(2, 3) -- flour
product:addIngredient(2529, 1) -- honeycomb
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- baked potato
product = baking:addProduct(catId, 3568, 1)
product:addIngredient(3567, 3) -- potato
product:addIngredient(3573, 1) -- cheese

-- potato bread
product = baking:addProduct(catId, 49, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(3567, 3) -- potato
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- sausage on bread
product = baking:addProduct(catId, 3631, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(3051, 2) -- sausage
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- banana bread
product = baking:addProduct(catId, 3609, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(785, 1) -- bottle of banana juice
product:addRemnant(790,1) -- empty juice bottle

-- blackberry muffin
product = baking:addProduct(catId, 454, 1)
product:addIngredient(2, 3) -- flour
product:addIngredient(2529, 2) -- honeycomb
product:addIngredient(147, 15) -- blackberry
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- apple pie
product = baking:addProduct(catId, 353, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(2529, 2) -- honeycomb
product:addIngredient(15, 20) -- apple
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- cherry cake
product = baking:addProduct(catId, 303, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(2529, 2) -- honeycomb
product:addIngredient(302, 20) -- cherries
product:addIngredient(759, 5) -- nuts
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- egg salad sandwich
product = baking:addProduct(catId, 3571, 1)
product:addIngredient(2, 1) -- flour
product:addIngredient(3570, 1) -- egg salad
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(2935,1) -- soup bowl

-- strawberry cake
product = baking:addProduct(catId, 354, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(2529, 3) -- honeycomb
product:addIngredient(151, 20) -- strawberry
product:addIngredient(1150, 2) -- white egg
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- nut bread
product = baking:addProduct(catId, 3723, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(2529, 3) -- honeycomb
product:addIngredient(759, 20) -- nuts
product:addIngredient(1150, 3) -- white egg
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- custard pie
product = baking:addProduct(catId, 1153, 1)
product:addIngredient(2, 2) -- flour
product:addIngredient(1150, 10) -- white egg
product:addIngredient(778, 4) -- sugarcane
product:addIngredient(2502, 1) -- bottle of milk
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(2498,1) -- large empty bottle

-- elderberry pie
product = baking:addProduct(catId, 3610, 1)
product:addIngredient(2, 6) -- flour
product:addIngredient(143, 20) -- red elder
product:addIngredient(81, 5) -- berries
product:addIngredient(1207, 5) -- orange
product:addIngredient(778, 4) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

M.baking = baking
return M
