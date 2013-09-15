require("item.base.crafts")

module("content.craft.glassblowing", package.seeall)

glassblowing = item.base.crafts.Craft:new{
                          craftEN = "glass blowing",
                          craftDE = "Glasblasen",
                          handTool = 311,
                          leadSkill = Character.glassBlowing,
                          DefaultFoodConsumption = 300,
                        };

glassblowing:addTool(313) -- glass melting oven

catId = glassblowing:addCategory("Bottles", "Flaschen")

-- glassblowing:addProduct(category, item, difficulty, learnLimit, minTime, maxTime, quantity=1, data={})

--Empty Bottle
product = glassblowing:addProduct(catId, 164, 40, 60, 12, 24)
product:addIngredient(41, 3) -- Glass Ingot: 3x

--Empty Round Body Bottle(518) (Rum)
product = glassblowing:addProduct(catId, 518, 20, 50, 7, 14)
product:addIngredient(41, 2) -- Glass Ingot: 2x

--Large Empty Bottle
product = glassblowing:addProduct(catId, 2498, 15, 40, 7, 14)
product:addIngredient(41, 2) -- Glass Ingot: 2x

--Small Empty Bottle
product = glassblowing:addProduct(catId, 1317, 10, 30, 7, 14)
product:addIngredient(41) -- Glass Ingot: 1x

--Empty Juice Bottle (790) (Smoothies :p)
product = glassblowing:addProduct(catId, 790, 0, 25, 5, 10)
product:addIngredient(41) -- Glass Ingot: 1x


catId = glassblowing:addCategory("Other", "Sonstiges")

--Mirror
product = glassblowing:addProduct(catId, 336, 90, 100, 125, 250)
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(41, 2) -- Glass Ingot: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Vase
product = glassblowing:addProduct(catId, 315, 81, 100, 135, 270)
product:addIngredient(41, 3) -- Glass Ingot: 3x
product:addIngredient(197) -- Amethyst: 1x
product:addIngredient(46) -- Ruby: 1x

--Glass Mug
product = glassblowing:addProduct(catId, 1908, 60, 90, 20, 40)
product:addIngredient(41, 2) -- Glass Ingot: 2x

--Glass
product = glassblowing:addProduct(catId, 2055, 50, 80, 17, 34)
product:addIngredient(41, 2) -- Glass Ingot: 2x

--Lantern
product = glassblowing:addProduct(catId, 393, 27, 67, 36, 72)
product:addIngredient(2550, 1) -- Copper Ingot: 1x1
product:addIngredient(41, 3) -- Glass Ingot: 3x1

