require("item.base.crafts")

module("content.craft.dyemaking", package.seeall)

dyemaking = item.base.crafts.Craft:new{
                    craftEN = "tailoring",
                    craftDE = "Schneidern",
                    leadSkill = Character.tailoring,
                    defaultFoodConsumption = 300,
                  }

dyemaking:addTool(12) -- camp fire

local catId = dyemaking:addCategory("dyes", "Farbstoffe")
        
--Red Dye
local product = dyemaking:addProduct(catId, 2681, 0, 20, 5, 10)
product:addIngredient(302, 3) -- Cherries: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Green Dye
product = dyemaking:addProduct(catId, 2679, 5, 25, 6, 12)
product:addIngredient(290, 3) -- Cabbage: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Black Dye
product = dyemaking:addProduct(catId, 2678, 10, 30, 7, 14)
product:addIngredient(136, 3) -- Anger berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Yellow Dye
product = dyemaking:addProduct(catId, 2682, 15, 35, 9, 18)
product:addIngredient(135, 3) -- Yellow Weed: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Blue Dye
product = dyemaking:addProduct(catId, 2680, 20, 40, 10, 20)
product:addIngredient(753, 3) -- Blue Bird's Berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1 
