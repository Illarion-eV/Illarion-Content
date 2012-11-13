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


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    Glassblowing = InitCraftingTool()
    Glassblowing:showDialog(User)

--[[    
    base.common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        Glassblowing:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end
    
    if not Glassblowing:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        Glassblowing:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Glasblasrohr in der Hand
        base.common.InformNLS( User, 
        "Du musst das Glasblasrohr in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the glasblowpipe in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Glas blasen.",
        "Your armour disturbs you while blowing glass." );
        Glassblowing:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if Glassblowing:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			Glassblowing:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        Glassblowing:GenerateItemList( User, Param, SourceItem );
        Glassblowing:SwapToInactiveItem( User );
        return
    else
        Glassblowing:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
--]]
end --function
