-- Glasprodukte herstellen

-- UPDATE common SET com_script='item.id_311_glassblowpipe' WHERE com_itemid=311;

require("item.general.metal")
require("item.base.crafts")

module("item.id_311_glassblowpipe", package.seeall)

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        glassblowing = item.base.crafts.Craft:new{
                                  craftEN = "glass blowing",
                                  craftDE = "Glasblasen",
                                  leadSkill = Character.glassBlowing,
                                  DefaultFoodConsumption = 300,
                                };
        
        glassblowing:addTool( 313 ); -- Glasschmelzofen

local catId = glassblowing:addCategory("bottles", "Flaschen")
local product

-- glassblowing:addProduct(category, item, difficulty, learnLimit, minTime, maxTime, quantity=1, data={})

--Small Empty Bottle
product = glassblowing:addProduct(catId, 1317, 0, 40, 5, 10)
product:addIngredient(41) -- Glass Ingot: 1x

--Empty Bottle
product = glassblowing:addProduct(catId, 164, 10, 50, 7, 14)
product:addIngredient(41) -- Glass Ingot: 1x

--Empty Bottle (790) (Smoothies :p)
product = glassblowing:addProduct(catId, 790, 15, 50, 7, 14)
product:addIngredient(41) -- Glass Ingot: 1x

--Empty Bottle(518) (Rum)
product = glassblowing:addProduct(catId, 518, 20, 50, 7, 14)
product:addIngredient(41) -- Glass Ingot: 1x

--Large Empty Bottle
product = glassblowing:addProduct(catId, 2498, 30, 70, 12, 24)
product:addIngredient(41) -- Glass Ingot: 1x

--Glass
product = glassblowing:addProduct(catId, 2055, 50, 90, 17, 34)
product:addIngredient(41) -- Glass Ingot: 1x

--Glass Mug
product = glassblowing:addProduct(catId, 1908, 60, 100, 20, 40)
product:addIngredient(41) -- Glass Ingot: 1x

catId = glassblowing:addCategory("decoration", "Dekoration")

--Vase
product = glassblowing:addProduct(catId, 315, 90, 110, 27, 54)
product:addIngredient(41, 3) -- Glass Ingot: 3x
product:addIngredient(197) -- Amethyst: 1x
product:addIngredient(46) -- Ruby: 1x
        
        InitDone = true;
    end
    return glassblowing;
end --function


function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)  -- DONT EDIT THIS LINE!
    Glassblowing = InitCraftingTool()
    Glassblowing:showDialog(User, SourceItem)
end
