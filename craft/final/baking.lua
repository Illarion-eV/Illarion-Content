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

-- cookies
product = baking:addProduct(catId, 453, 2)
product:addIngredient(2, 3) -- flour
product:addIngredient(Item.beeHoney, 1)
product:addIngredient(52, 1) -- bucket of water

-- baked potato
product = baking:addProduct(catId, 3568, 1)
product:addIngredient(3567, 1) -- potato
product:addIngredient(3573, 1) -- cheese

-- potato bread
product = baking:addProduct(catId, 49, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(3567, 1) -- potato
product:addIngredient(52, 1) -- bucket of water

-- sausage on bread
product = baking:addProduct(catId, 3631, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(3051, 2) -- sausage
product:addIngredient(52, 1) -- bucket of water

-- banana bread
product = baking:addProduct(catId, 3609, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(785, 1) -- bottle of banana juice

-- blackberry muffin
product = baking:addProduct(catId, 454, 1)
product:addIngredient(2, 3) -- flour
product:addIngredient(Item.beeHoney, 2)
product:addIngredient(147, 15) -- blackberry
product:addIngredient(52, 1) -- bucket of water

-- apple pie
product = baking:addProduct(catId, 353, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(Item.beeHoney, 2)
product:addIngredient(15, 8) -- apple
product:addIngredient(52, 1) -- bucket of water

-- cherry cake
product = baking:addProduct(catId, 303, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(Item.beeHoney, 2)
product:addIngredient(302, 8) -- cherries
product:addIngredient(759, 1) -- nuts
product:addIngredient(52, 1) -- bucket of water

-- egg salad sandwich
product = baking:addProduct(catId, 3571, 1)
product:addIngredient(2, 1) -- flour
product:addIngredient(3570, 1) -- egg salad
product:addIngredient(52, 1) -- bucket of water

-- strawberry cake
product = baking:addProduct(catId, 354, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(Item.beeHoney, 3)
product:addIngredient(151, 20) -- strawberry
product:addIngredient(1150, 2) -- white egg
product:addIngredient(52, 1) -- bucket of water

-- nut bread
product = baking:addProduct(catId, 3723, 1)
product:addIngredient(2, 4) -- flour
product:addIngredient(Item.beeHoney, 3)
product:addIngredient(759, 4) -- nuts
product:addIngredient(1150, 3) -- white egg
product:addIngredient(52, 1) -- bucket of water

-- custard pie
product = baking:addProduct(catId, 1153, 1)
product:addIngredient(2, 2) -- flour
product:addIngredient(1150, 10) -- white egg
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(2502, 1) -- bottle of milk
product:addIngredient(52, 1) -- bucket of water

-- elderberry pie
product = baking:addProduct(catId, 3610, 1)
product:addIngredient(2, 6) -- flour
product:addIngredient(143, 20) -- red elder
product:addIngredient(81, 5) -- berries
product:addIngredient(1207, 1) -- orange
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water

M.baking = baking
return M
