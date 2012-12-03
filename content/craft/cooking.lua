require("item.base.crafts")
require("content.craft.brewing")

module("content.craft.cooking", package.seeall)

cooking = item.base.crafts.Craft:new{
                     craftEN = "cooking",
                     craftDE = "Kochen",
                     handTool = 227,
                     leadSkill = Character.cookingAndBaking,
                     defaultFoodConsumption = 100,
                     sfx = 7,
                     sfxDuration = 15,
                     fallbackCraft = content.craft.brewing.brewing,
                   };


cooking:addTool(2488) -- kettle

--------------------------------------------------------------------------------------------
local catId = cooking:addCategory("soups", "Suppen") -- Suppenschüssel ( Suppen )

---------------- MUSHROOM SOUP - 2456 ----------------------
local product = cooking:addProduct(catId, 2456, 7, 27, 7, 14)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x         
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(163, 5) -- Step 3: Champignon(163) 5x
-------------- PILZSUPPE - DONE ----------------


---------------- ONION SOUP - 2923 ----------------------
product = cooking:addProduct(catId, 2923, 15, 35, 9, 18)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(201, 5) -- Step 3: Onion (201) 5x
-------------- ONION SOUP - DONE ----------------


---------------- CABBAGE STEW - 2278 ----------------------
product = cooking:addProduct(catId, 2278, 30, 50, 12, 24)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(290, 5) -- Step 3: Cabbage (290) 5x
-------------- CABBAGE STEW - DONE ----------------


---------------- MULLIGAN - 2276 ----------------------
product = cooking:addProduct(catId, 2276, 40, 60, 15, 30)
product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
product:addIngredient(52)
product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
product:addIngredient(200) -- Step 5: Tomatoe(200) 1x

--------------------------------------------------------------------------------------------
catId = cooking:addCategory("dishes", "Gerichte") -- Teller ( Tellergerichte )

---------------- SAUSAGE - 3051 ----------------------
product = cooking:addProduct(catId, 3051, 0, 20, 5, 10, 2)
product:addIngredient(307) -- Step 1: Pork(307) 1x
product:addIngredient(63) -- Step 2: Insides(63) 1x
-------------- SAUSAGE - DONE ----------------


---------------- STEAK - 2940 ----------------------
product = cooking:addProduct(catId, 2940, 5, 25, 6, 12)
product:addIngredient(307) -- Step 1: Pork(307) 1x
-------------- STEAK - DONE ----------------


---------------- FISH FILET - 2459 ----------------------
product = cooking:addProduct(catId, 2459, 20, 40, 15, 30)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(73) -- Step 2: Trout(73) 1x
product:addIngredient(290) -- Step 3: Cabbage (290) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- FISH FILET - DONE ----------------


---------------- SALMON DISH - 556 ----------------------
product = cooking:addProduct(catId, 556, 35, 55, 14, 28)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(355) -- Step 2: Salmon(355) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- SALMON DISH - DONE ----------------


---------------- MEAT DISH - 2277 ----------------------
product = cooking:addProduct(catId, 2277, 50, 70, 17, 34)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(307) -- Step 2: Pork(307) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
-------------- MEAT DISH - DONE ----------------


---------------- SAUSAGE DISH - 2922 ----------------------
product = cooking:addProduct(catId, 2922, 60, 80, 20, 40)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(3051) -- Step 2: Sausage(3051) 1x
product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
product:addIngredient(290) -- Step 4: Cabbage (290) 1x
-------------- SAUSAGE DISH - DONE ----------------


---------------- STEAK DISH - 557 ----------------------
product = cooking:addProduct(catId, 557, 65, 85, 21, 42)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(2940) -- Step 2: Steak(2940) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
-------------- STEAK DISH - DONE ----------------


---------------- RABBIT DISH - 555 ----------------------
product = cooking:addProduct(catId, 555, 75, 95, 24, 48)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(553) -- Step 2: Rabbit meat(553) 1x
product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
product:addIngredient(290) -- Step 5: Cabbage (290) 1x
-------------- BUNNY DISH - DONE ----------------


---------------- LAMB DISH - 559 ----------------------
product = cooking:addProduct(catId, 559, 85, 100, 26, 52)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(2934) -- Step 2: Lamb meat(2934) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
product:addIngredient(200) -- Step 5: Tomatoe(200) 1x
-------------- LAMB DISH - DONE ----------------


---------------- VENISON DISH - 554 ----------------------
product = cooking:addProduct(catId, 554, 90, 100, 27, 54)
product:addIngredient(2952) -- Step 1: Plate(2952) 1x
product:addIngredient(552) -- Step 2: Deer meat(552) 1x
product:addIngredient(201) -- Step 3: Onion (201) 1x
product:addIngredient(290) -- Step 4: Cabbage (290) 1x
product:addIngredient(81, 5) -- Step 5: Berries(81) 5x
-------------- VENISON DISH - DONE ----------------
