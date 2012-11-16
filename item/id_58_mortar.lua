-- Farben herstellen

-- UPDATE common SET com_script='item.id_58_mortar' WHERE com_itemid=58;

require("item.general.jewel")
require("item.base.crafts")

module("item.id_58_mortar", package.seeall)

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        mortar = item.base.crafts.Craft:new{
                            craftEN = "tailoring",
                            craftDE = "Schneidern",
                            leadSkill = Character.tailoring,
                            defaultFoodConsumption = 300,
                          }
        
        mortar:addTool(12) -- camp fire

        local catId = mortar:addCategory("dyes", "Farbstoffe")
        
        --Red Dye
local product = mortar:addProduct(catId, 2681, 0, 20, 5, 10)
product:addIngredient(302, 3) -- Cherries: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Green Dye
product = mortar:addProduct(catId, 2679, 5, 25, 6, 12)
product:addIngredient(290, 3) -- Cabbage: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Black Dye
product = mortar:addProduct(catId, 2678, 10, 30, 7, 14)
product:addIngredient(136, 3) -- Anger berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Yellow Dye
product = mortar:addProduct(catId, 2682, 15, 35, 9, 18)
product:addIngredient(135, 3) -- Yellow Weed: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Blue Dye
product = mortar:addProduct(catId, 2680, 20, 40, 10, 20)
product:addIngredient(753, 3) -- Blue Bird's Berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1 
        
        InitDone = true;
    end
    return mortar;
end --function


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    -- for the alchemy system
	if (base.common.GetFrontItemID(User) == 550) or (base.common.GetFrontItemID(User) == 551) then
	    CreateHerbalGemDust(User, SourceItem)
	    return
	end
	-- end
	
	local Mortar = InitCraftingTool()
    Mortar:showDialog(User, Sourceitem)
end 

function CreateHerbalGemDust(User, SourceItem)
User:inform("lalala")
end   
