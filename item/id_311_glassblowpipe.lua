-- Glas Produkte Herstellen

-- UPDATE common SET com_script='item.id_311_glassblowpipe' WHERE com_itemid=311;

require("item.general.metal")
require("item.base.crafts")

module("item.id_311_glassblowpipe", package.seeall, package.seeall(item.general.metal))

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        glassblowing = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                                  LeadSkill = "glass blowing",
                                  LeadSkillGroup = 2,
                                  DefaultFoodConsumption = 300,
                                  DefaultRepair = false
                                };
        
        glassblowing:AddTool( 313 ); -- Glasschmelzofen

        glassblowing:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        glassblowing:AddInterruptMessage(
        "Du verlierst einen Moment das Gleichgewicht und das Glas nimmt eine bedenklich krumme Form an. Nach kurzem Drehen und Balancieren gelingt es dir, das Werkstück zu retten.",
        "You lose your balance and the glowing glass bends worringly. By twisting and balancing, you manage to save the product.");
        
        glassblowing:AddInterruptMessage(
        "Du stößt ein bereits fertiges Stück an und es droht zu Boden zu fallen. Im letzten Moment gelingt es dir, das Stück mit der Hand zu greifen.",
        "You touch a finished good and it almost drops to the floor. With luck, you manage to grap it with your hands, preventing the loss.");
        
        glassblowing:AddInterruptMessage(
        "Du hältst einen Moment inne und überlegst eine Gravur anzubringen, entscheidest dich aber dagegen.",
        "You interrupt to apply a gravure, but you reconsider.");
        
--Small Empty Bottle
product = glassblowing:AddProduct( 0, 1317, { 0, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Empty Bottle
product = glassblowing:AddProduct( 0, 164, { 10, 50}, 1, { 15, 30 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Empty Bottle (790) (Smoothies :p)
product = glassblowing:AddProduct( 0, 790, { 15, 50}, 1, { 15, 30 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Empty Bottle(518) (Rum)
product = glassblowing:AddProduct( 0, 518, { 20, 50}, 1, { 15, 30 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Large Empty Bottle
product = glassblowing:AddProduct( 0, 2498, { 30, 70}, 1, { 25, 50 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Glass
product = glassblowing:AddProduct( 0, 2055, { 50, 90}, 1, { 35, 70 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Glass Mug
product = glassblowing:AddProduct( 0, 1908, { 60, 100}, 1, { 40, 80 } );
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Vase
product = glassblowing:AddProduct( 0, 315, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 41, 1, "all" }, 3 ); -- Glass Ingot: 3x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1 
        
        InitDone = true;
    end
    return glassblowing;
end --function


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    Glassblowing = InitCraftingTool( );
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
end --function
