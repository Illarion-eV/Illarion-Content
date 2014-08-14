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
require("item.base.crafts")
require("content.craft.brewing")

module("content.craft.cooking", package.seeall)

cooking = item.base.crafts.Craft:new{
                     craftEN = "cooking",
                     craftDE = "Kochen",
                     handTool = 227,
                     leadSkill = Character.cookingAndBaking,
                     defaultFoodConsumption = 100,
                     sfx = 15,
                     sfxDuration = 40,
                     fallbackCraft = content.craft.brewing.brewing,
                   };


cooking:addTool(2488) -- kettle

--------------------------------------------------------------------------------------------
local catId = cooking:addCategory("Soups", "Suppen") -- Suppenschüssel ( Suppen )

---------------- FISH SOUP - 3572 ----------------------
product = cooking:addProduct(catId, 3572, 75, 95, 8, 160)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52) -- Step 2: Bucket with water (52) 1x
product:addRemnant(51) -- Remnant: Empty bucket (51) 1x
product:addIngredient(1209) -- Step 3: Horse Mackerel (1209) 1x
product:addIngredient(355) -- Step 4: Salmon (355) 1x
product:addIngredient(3567) -- Step 5: Potato(3568) 1x
product:addIngredient(290) -- Step 6: Cabbage (290) 1x
product:addIngredient(2502) -- Step 6: Milk (2502) 1x
product:addRemnant(2498) -- Remnant: Empty Bottle (2498) 1x
---------------------FISH SOUP DONE--------------------

---------------- EGG SALAD - 3570 ----------------------
product = cooking:addProduct(catId, 3570, 65, 85, 75, 150)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52) -- Step 2: Bucket with water (52) 1x
product:addRemnant(51) -- Remnant: Empty bucket (51) 1x
product:addIngredient(1150, 2) -- Step 3: Eggs (1150) 2x
product:addIngredient(2493) -- Step 4: Carrot(2493) 1x
product:addIngredient(201) -- Step 5: Onion(201) 1x
product:addIngredient(3573) -- Step 6: Cheese (3573) 1x
---------------------EGG SALAD DONE--------------------

---------------- CHICKEN SOUP - 1152 ----------------------
product = cooking:addProduct(catId, 1152, 55, 75, 75, 150)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52) -- Step 2: Bucket with water (52) 1x
product:addRemnant(51) -- Remnant: Empty bucket (51) 1x
product:addIngredient(1151) -- Step 3: Chicken Meat (1151) 1x
product:addIngredient(2) -- Step 4: Flour(2) 1x
product:addIngredient(2493) -- Step 5: Carrot(2493) 1x
product:addIngredient(2502) -- Step 6: Milk (2502) 1x
product:addRemnant(2498) -- Remnant: Empty Bottle (2498) 1x
product:addIngredient(788) -- Step 7: Carrot juice (788) 1x
product:addRemnant(790) -- Remnant: Empty Juice Bottle (790) 1x
---------------------CHICKEN SOUP DONE--------------------

---------------- MULLIGAN - 2276 ----------------------
product = cooking:addProduct(catId, 2276, 40, 60, 75, 150)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52) -- Step 2: Bucket with water (52) 1x
product:addRemnant(51) -- Remnant: Empty bucket (51) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
product:addIngredient(200) -- Step 5: Tomatoe(200) 1x
---------------------Mulligan Done--------------------------

---------------- POTATO SOUP- 3569 ----------------------
product = cooking:addProduct(catId, 3569, 35, 55, 60, 120)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52) -- Step 2: Bucket with water (52) 1x
product:addRemnant(51) -- Remnant: Empty bucket (51) 1x
product:addIngredient(3567, 3) -- Step 3: Potatoes (201) 3x
product:addIngredient(201, 2) -- Step 4: Onions (201) 2x
---------------------Potato soup Done--------------------------

---------------- CABBAGE STEW - 2278 ----------------------
product = cooking:addProduct(catId, 2278, 30, 50, 36, 72)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(290, 5) -- Step 3: Cabbage (290) 5x
-------------- CABBAGE STEW - DONE ----------------

---------------- ONION SOUP - 2923 ----------------------
product = cooking:addProduct(catId, 2923, 15, 35, 27, 54)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(201, 5) -- Step 3: Onion (201) 5x
-------------- ONION SOUP - DONE ----------------

---------------- MUSHROOM SOUP - 2456 ----------------------
local product = cooking:addProduct(catId, 2456, 7, 27, 21, 42)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(163, 5) -- Step 3: Champignon(163) 5x
--------------  MUSHROOM SOUP - DONE ----------------




--------------------------------------------------------------------------------------------
catId = cooking:addCategory("Dishes", "Gerichte") -- Teller ( Tellergerichte )

---------------- CHICKEN DISH - 1155 ----------------------
product = cooking:addProduct(catId, 1155, 92, 100, 175, 350)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(1151, 2) -- Step 2: chicken Meat (1151) 2x
product:addIngredient(290) -- Step 3: Cabbage (290) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
product:addIngredient(517) -- Step 5: Rum (517) 1x
product:addRemnant(518) -- Remnant: Empty Rum Bottle (518) 1x
product:addIngredient(784) -- Step 6: Tangerine juice (788) 1x
product:addRemnant(790) -- Remnant: Empty Juice Bottle (790) 1x
-------------- CHICKEN DISH - DONE ----------------

---------------- VENISON DISH - 554 ----------------------
product = cooking:addProduct(catId, 554, 90, 100, 135, 270)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(552) -- Step 2: Deer meat(552) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(290) -- Step 4: Cabbage (290) 1x
product:addIngredient(81, 5) -- Step 5: Berries(81) 5x
-------------- VENISON DISH - DONE ----------------

---------------- LAMB DISH - 559 ----------------------
product = cooking:addProduct(catId, 559, 85, 100, 130, 260)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(2934) -- Step 2: Lamb meat(2934) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
product:addIngredient(200) -- Step 5: Tomatoe(200) 1x
-------------- LAMB DISH - DONE ----------------

---------------- RABBIT DISH - 555 ----------------------
product = cooking:addProduct(catId, 555, 75, 95, 120, 240)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(553) -- Step 2: Rabbit meat(553) 1x
product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
product:addIngredient(290) -- Step 5: Cabbage (290) 1x
-------------- BUNNY DISH - DONE ----------------

---------------- STEAK DISH - 557 ----------------------
product = cooking:addProduct(catId, 557, 65, 85, 84, 168)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(2940) -- Step 2: Steak(2940) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- STEAK DISH - DONE ----------------

---------------- SAUSAGE DISH - 2922 ----------------------
product = cooking:addProduct(catId, 2922, 60, 80, 80, 160)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(3051) -- Step 2: Sausage(3051) 1x
product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
product:addIngredient(290) -- Step 4: Cabbage (290) 1x
-------------- SAUSAGE DISH - DONE ----------------

---------------- MEAT DISH - 2277 ----------------------
product = cooking:addProduct(catId, 2277, 50, 70, 68, 136)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(307) -- Step 2: Pork(307) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
-------------- MEAT DISH - DONE ----------------

---------------- FRIED EGGS - 1154 ----------------------
product = cooking:addProduct(catId, 1154, 45, 65, 60, 120)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(3051) -- Step 2: Sausage(3051) 1x
product:addIngredient(1150, 2) -- Step 3: White Egg (50) 2x

-------------- FRIED EGGS - DONE ----------------

---------------- SALMON DISH - 556 ----------------------
product = cooking:addProduct(catId, 556, 35, 55, 56, 112)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(355) -- Step 2: Salmon(355) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- SALMON DISH - DONE ----------------

---------------- FISH FILET - 2459 ----------------------
product = cooking:addProduct(catId, 2459, 20, 40, 60, 120)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(73) -- Step 2: Trout(73) 1x
product:addIngredient(290) -- Step 3: Cabbage (290) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- FISH FILET - DONE ----------------

---------------- CHEESE - 3573 ----------------------
product = cooking:addProduct(catId, 3573, 10, 30, 12, 24)
product:addIngredient(2502, 2) -- Step 1: Milk (2502) 2x
product:addRemnant(2498, 2) -- Remnant: Empty Bottle (2498) 2x
-------------- CHEESE - DONE ----------------

---------------- STEAK - 2940 ----------------------
product = cooking:addProduct(catId, 2940, 5, 25, 6, 12)
product:addIngredient(307) -- Step 1: Pork(307) 1x
-------------- STEAK - DONE ----------------

---------------- SAUSAGE - 3051 ----------------------
product = cooking:addProduct(catId, 3051, 0, 20, 10, 20, 2)
product:addIngredient(307) -- Step 1: Pork(307) 1x
product:addIngredient(63) -- Step 2: Insides(63) 1x
-------------- SAUSAGE - DONE ----------------





