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
local crafts = require("item.base.crafts")

module("content.craft.baking", package.seeall)

baking = crafts.Craft:new{
                     craftEN = "Baking",
                     craftDE = "Backen",
                     handTool = 121,
                     leadSkill = Character.cookingAndBaking,
                     defaultFoodConsumption = 100,
                   };
baking:addTool( 119 ); -- baking oven
baking:addTool( 120 ); -- baking oven

--------------------------------------------------------------------------------------------
local catId = baking:addCategory("Baked goods", "Backwaren")

---------------- BREAD ROLL - 191 ----------------------
local product = baking:addProduct(catId, 191, 0, 20, 5, 10)
product:addIngredient(2) -- Step 1: Flour (2) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
-------------- BRÖTCHEN - DONE ----------------

---------------- COOKIES - 453 ----------------------
product = baking:addProduct(catId, 453, 10, 30, 14, 28, 2)
product:addIngredient(2) -- Step 1: Flour (2) 1x
product:addIngredient(2529) -- Step 2: Honey(2529) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 3: Bucket with water (52) 1x
-------------- COOKIES - DONE ----------------

---------------- Sausage on Bread - 3631 ----------------------
product = baking:addProduct(catId, 3631, 10, 30, 14, 28)
product:addIngredient(3051) -- Step 1: Sausage (3051) 1x
product:addIngredient(2) -- Step 2: Flour(2) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 3: Bucket with water (52) 1x
-------------- Sausage on Bread - DONE ----------------

---------------- BAKED POTATO - 3568 ----------------------
product = baking:addProduct(catId, 3568, 10, 30, 14, 28)
product:addIngredient(3567) -- Step 1: add potato
product:addIngredient(3573) -- Step 2: Cheese (3573) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
-------------- BAKED POTATO - DONE ----------------

---------------- BREAD - 49 ----------------------
product = baking:addProduct(catId, 49, 25, 45, 22, 44)
product:addIngredient(2, 2) -- Step 1: Flour (2) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
-------------- BREAD - DONE ----------------

---------------- BANANABREAD - 3609 ----------------------
product = baking:addProduct(catId, 3609, 30, 55, 24, 48, 1)
product:addIngredient(2, 2) -- Step 1: Flour (2) 1x
product:addIngredient(785) -- Step 2: banana juice
product:addRemnant(790) -- Remnant: Empty JuiceBottle (2498) 1x
-------------- BANANABREAD - DONE ----------------

---------------- MUFFIN - 454 ----------------------
product = baking:addProduct(catId, 454, 45, 65, 64, 128, 2)
product:addIngredient(2, 2) -- Step 1: Flour (2) 1x
product:addIngredient(2529) -- Step 2: Honey(2529) 1x
product:addIngredient(147, 5) -- Step 3: Blackberry(147) 5x
product:addIngredient(52)
product:addRemnant(51) -- Step 4: Bucket with water (52) 1x
-------------- MUFFIN - DONE ----------------

---------------- APPLE PIE - 353 ----------------------
product = baking:addProduct(catId, 353, 55, 75, 95, 190)
product:addIngredient(2, 2) -- Step 1: Flour (2) 1x
product:addIngredient(2529, 2) -- Step 2: Honey(2529) 2x
product:addIngredient(15, 10) -- Step 3: Apple(15) 5x
product:addIngredient(52)
product:addRemnant(51) -- Step 4: Bucket with water (52) 1x
-------------- APPLE PIE - DONE ----------------

---------------- EGG SALAD SANDWICH- 3571 ----------------------
product = baking:addProduct(catId, 3571, 65, 85, 95, 190)
product:addIngredient(2, 2) -- Step 1: Flour (2) 2x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(3570) -- Step 3: Egg Salad (3570) 1x
product:addRemnant(2935) -- Step 4: Empty Bowl (2935) 1x
-------------- EGG SALAD SANDWICH - DONE ----------------

---------------- CHERRY CAKE - 303 ----------------------
product = baking:addProduct(catId, 303, 70, 90, 132, 264)
product:addIngredient(2, 3) -- Step 1: Flour (2) 1x
product:addIngredient(2529, 2) -- Step 2: Honey(2529) 2x
product:addIngredient(302, 10) -- Step 3: Cherries(302) 5x
product:addIngredient(52)
product:addRemnant(51) -- Step 4: Bucket with water (52) 1x
-------------- CHERRY CAKE - DONE ----------------

---------------- STRAWBERRY CAKE - 354 ----------------------
product = baking:addProduct(catId, 354, 80, 100, 175, 350)
product:addIngredient(2, 4) -- Step 1: Flour (2) 1x
product:addIngredient(2529, 2) -- Step 2: Honey(2529) 2x
product:addIngredient(151, 10) -- Step 3: Strawberries(151) 5x
product:addIngredient(52)
product:addRemnant(51) -- Step 4: Bucket with water (52) 1x
-------------- STRAWBERRY CAKE - DONE ----------------

---------------- CUSTARD PIE - 1153 ----------------------
product = baking:addProduct(catId, 1153, 95, 100, 175, 350)
product:addIngredient(2, 3) -- Step 1: Flour (2) 3x
product:addIngredient(778, 2) -- Step 2: Sugar Cane (778) 2x
product:addIngredient(1150, 5) -- Step 3: White Egg (1150) 5x
product:addIngredient(517) -- Step 4: Rum (517) 1x
product:addRemnant(518) -- Remnant: Empty Rum Bottle (518) 1x
product:addIngredient(2502) -- Step 5: Milk (2502) 1x
product:addRemnant(2498) -- Remnant: Empty Bottle (2498) 1x
-------------- CUSTARD PIE - DONE ----------------

---------------- ELDERBERRY PIE - 3610 ----------------------
product = baking:addProduct(catId, 3610, 99, 100, 200, 400)
product:addIngredient(2, 2) -- Step 1: Flour (2) 2x
product:addIngredient(778, 2) -- Step 2: Sugar Cane (778) 2x
product:addIngredient(1150, 2) -- Step 3: White Egg (1150) 2x
product:addIngredient(143, 15) -- Step 4: Red Elderbrries (143) 15x
product:addIngredient(1207, 2) -- Step 5: Orange (1207) 2x
product:addIngredient(1315) -- Step 6: Bottle of Berry Booze (1315) 1x
product:addRemnant(1317) -- Remnant: Empty Bottle (1317) 1x
-------------- ELDERBERRY PIE - DONE ----------------
