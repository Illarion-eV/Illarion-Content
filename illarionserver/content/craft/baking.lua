require("item.base.crafts")

module("content.craft.baking", package.seeall)

baking = item.base.crafts.Craft:new{
                     craftEN = "baking",
                     craftDE = "Backen",
                     handTool = 121,
                     leadSkill = Character.cookingAndBaking,
                     defaultFoodConsumption = 100,
                   };
baking:addTool( 119 ); -- baking oven
baking:addTool( 120 ); -- baking oven

--------------------------------------------------------------------------------------------

local catId = baking:addCategory("baked goods", "Backwaren")

---------------- BREAD ROLL - 191 ----------------------
local product = baking:addProduct(catId, 191, 0, 20, 5, 10)
product:addIngredient(5) -- Step 1: Dough (5) 1x
-------------- BRÖTCHEN - DONE ----------------

---------------- COOKIES - 453 ----------------------
product = baking:addProduct(catId, 453, 10, 30, 14, 28, 2)
product:addIngredient(5) -- Step 1: Dough (5) 1x
product:addIngredient(2529) -- Step 2: Honey(2529) 1x
-------------- COOKIES - DONE ----------------

---------------- BREAD - 49 ----------------------
product = baking:addProduct(catId, 49, 25, 45, 22, 44)
product:addIngredient(5, 2) -- Stepe 1 - 2: Dough (5) 1x
-------------- BREAD - DONE ----------------

---------------- MUFFIN - 454 ----------------------
product = baking:addProduct(catId, 454, 45, 65, 64, 128, 2)
product:addIngredient(5, 2) -- Step 1-2: Dough (5) 1x
product:addIngredient(2529) -- Step 3: Honey(2529) 1x
product:addIngredient(147, 5) -- Step 4: Blackberry(147) 5x
-------------- MUFFIN - DONE ----------------

---------------- APPLE PIE - 353 ----------------------
product = baking:addProduct(catId, 353, 55, 75, 95, 190)
product:addIngredient(5, 2) -- Step 1-2: Dough (5) 1x
product:addIngredient(2529, 2) -- Step 3: Honey(2529) 2x
product:addIngredient(15, 10) -- Step 4-5: Apple(15) 5x

-------------- APPLE PIE - DONE ----------------

---------------- CHERRY CAKE - 303 ----------------------
product = baking:addProduct(catId, 303, 70, 90, 132, 264)
product:addIngredient(5, 3) -- Step 1-3: Dough (5) 1x
product:addIngredient(2529, 2) -- Step 4: Honey(2529) 2x
product:addIngredient(302, 10) -- Step 5-6: Cherries(302) 5x
-------------- CHERRY CAKE - DONE ----------------

---------------- STRAWBERRY CAKE - 354 ----------------------
product = baking:addProduct(catId, 354, 80, 100, 175, 350)
product:addIngredient(5, 4) -- Step 1-4: Dough (5) 1x
product:addIngredient(2529, 2) -- Step 5: Honey(2529) 2x
product:addIngredient(151, 10) -- Step 6-7: Strawberries(151) 5x
-------------- STRAWBERRY CAKE - DONE ---------------- 
