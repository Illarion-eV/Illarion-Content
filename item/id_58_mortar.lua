-- Farben herstellen

-- UPDATE common SET com_script='item.id_58_mortar' WHERE com_itemid=58;

require("item.general.jewel")
require("item.base.crafts")

module("item.id_58_mortar", package.seeall, package.seeall(item.general.jewel))

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        mortar = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                            LeadSkill = "tailoring",
                            LeadSkillGroup = 2,
                            DefaultFoodConsumption = 300,
                            DefaultRepair = false
                          };
        
        mortar:AddTool( 12 ); -- Lagerfeuer
        
        mortar:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        mortar:AddInterruptMessage(
        "Dir fällt der Mörser aus der Hand. Zum Glück ist er ganz geblieben.",
        "You drop your mortar. Luckily it didn't break.");
        
        mortar:AddInterruptMessage(
        "Du überlegst ob du die Farbe noch intensiver machen solltest, aber entscheidest dich dagegen.",
        "You evaluate whether you should deepen the colour, deciding against doing so.");
        
        mortar:AddInterruptMessage(
        "Ein großer dicker Käfer ist irgendwie in die Zutaten gelangt. Du benötigst eine Weile ihn zu fangen und mit ihm das zu machen was er verdient hat.",
        "A big, fat bug has found its way into your ingredients. It takes a while to catch it and seal its fate.");
        
        --Red Dye
product = mortar:AddProduct( 0, 2681, { 0, 20}, 1, { 5, 10 } );
product:AddProductionSteps( { 302, 1, "all" }, 3 ); -- Cherries: 3x1
product:AddProductionSteps( { 52, 1, "all" }, 1 ); -- Water bucket: 1x1

--Green Dye
product = mortar:AddProduct( 0, 2679, { 5, 25}, 1, { 6, 12 } );
product:AddProductionSteps( { 290, 1, "all" }, 3 ); -- Cabbage: 3x1
product:AddProductionSteps( { 52, 1, "all" }, 1 ); -- Water bucket: 1x1

--Black Dye
product = mortar:AddProduct( 0, 2678, { 10, 30}, 1, { 7, 14 } );
product:AddProductionSteps( { 136, 1, "all" }, 3 ); -- Anger berry: 3x1
product:AddProductionSteps( { 52, 1, "all" }, 1 ); -- Water bucket: 1x1

--Yellow Dye
product = mortar:AddProduct( 0, 2682, { 15, 35}, 1, { 9, 18 } );
product:AddProductionSteps( { 135, 1, "all" }, 3 ); -- Yellow Weed: 3x1
product:AddProductionSteps( { 52, 1, "all" }, 1 ); -- Water bucket: 1x1

--Blue Dye
product = mortar:AddProduct( 0, 2680, { 20, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 753, 1, "all" }, 3 ); -- Blue Bird's Berry: 3x1
product:AddProductionSteps( { 52, 1, "all" }, 1 ); -- Water bucket: 1x1 
        
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
	
	Mortar = InitCraftingTool( );
    base.common.ResetInterruption( User, ltstate );
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
        Mortar:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end
    
    if not Mortar:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        Mortar:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Glasblasrohr in der Hand
        base.common.InformNLS( User, 
        "Du musst den Mörser in die Hand nehmen um damit zu arbeiten.",
        "You have to take the mortar in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Farben herstellen.",
        "Your armour disturbs you while creating dyes." );
        Mortar:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if Mortar:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			Mortar:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        Mortar:GenerateItemList( User, Param, SourceItem );
        Mortar:SwapToInactiveItem( User );
        return
    else
        Mortar:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end 

function CreateHerbalGemDust(User, SourceItem)
User:inform("lalala")
end   