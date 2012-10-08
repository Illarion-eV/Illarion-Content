-- Edelsteine schleifen + Edelsteinstaub herstellen

-- UPDATE common SET com_script='item.id_2140_tong' WHERE com_itemid=2140;

require("item.general.metal")
require("item.base.crafts")

module("item.id_2140_tong", package.seeall, package.seeall(item.general.metal))

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        gemcutting = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                                  LeadSkill = "gemcutting",
                                  LeadSkillGroup = 2,
                                  DefaultFoodConsumption = 200,
                                  DefaultRepair = false
                                };
        
        gemcutting:AddTool( 270 );  -- Schleifstein

        gemcutting:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        gemcutting:AddInterruptMessage(
        "Der Edelstein rutscht dir aus der Hand und fällt zu Boden. Du musst kurz suchen, ehe du den Stein wieder findest.",
        "The gem slips out of your hand and falls down to the ground. You have to search for a moment to find it again.");
		
        ---------------- AMETHYST - 197 ----------------
        local product = gemcutting:AddProduct( 0, 197, {0, 40 }, 1, { 10, 20 } );
        product:AddProductionSteps( { 251, 1, "all" }, 1 ); -- Schritt 1: Rohe Amethysten(251) 1x
        -------------- AMETHYST - FERTIG ---------------
		
		---------------- AMETHYSTSTAUB - 450 ----------------
        local product = gemcutting:AddProduct( 0, 450, {0, 30 }, 1, {10, 20 } );
        product:AddProductionSteps( { 197, 2, "all" }, 1 ); -- Schritt 1: Amethyst(197) 2x
		product:AddProductionSteps( { 197, 2, "all" }, 1 ); -- Schritt 2: Amethyst(197) 2x
        -------------- AMETHYSTSTAUB - FERTIG ---------------
        
        ------------------ RUBIN - 46 ------------------
        product = gemcutting:AddProduct( 0, 46, {10, 50 }, 1, { 15, 30 } );
        product:AddProductionSteps( { 255, 1, "all" }, 1 ); -- Schritt 1: Rohe Rubine(255) 1x
        --------------- RUBIN - FERTIG -----------------
		
		---------------- RUBINSTAUB - 447 ----------------
        local product = gemcutting:AddProduct( 0, 447, {10, 40 }, 1, { 15, 30 } );
        product:AddProductionSteps( { 46, 2, "all" }, 1 ); -- Schritt 1: Rubin(46) 1x
		product:AddProductionSteps( { 46, 2, "all" }, 1 ); -- Schritt 2: Rubin(46) 2x
        -------------- RUBINSTAUB - FERTIG ---------------
        
        --------------- BLAUSTEIN - 284 ----------------
        product = gemcutting:AddProduct( 0, 284, {20, 60 }, 1, { 20, 40 } );
        product:AddProductionSteps( { 253, 1, "all" }, 1 ); -- Schritt 1: Roher Blaustein(253) 1x
        ------------- BLAUSTEIN - FERTIG ---------------
		
        --------------- BLAUSTEINSTAUB - 446 ----------------
        product = gemcutting:AddProduct( 0, 446, {20, 50 }, 1, { 20, 40 } );
        product:AddProductionSteps( { 284, 2, "all" }, 1 ); -- Schritt 1: Blaustein(284) 2x
		product:AddProductionSteps( { 284, 2, "all" }, 1 ); -- Schritt 2: Blaustein(284) 2x
        ------------- BLAUSTEINSTAUB - FERTIG ---------------
        
        ------------- SCHWARZSTEIN - 283 ---------------
        product = gemcutting:AddProduct( 0, 283, {30, 70 }, 1, { 25, 50 } );
        product:AddProductionSteps( { 252, 1, "all" }, 1 ); -- Schritt 1: Roher Schwarzstein(252) 1x
        ----------- SCHWARZSTEIN - FERTIG --------------
		
        ------------- SCHWARZSTEINSTAUB - 449 ---------------
        product = gemcutting:AddProduct( 0, 449, {30, 60 }, 1, { 25, 50 } );
        product:AddProductionSteps( { 283, 2, "all" }, 1 ); -- Schritt 1: Schwarzstein(283) 2x
        product:AddProductionSteps( { 283, 2, "all" }, 1 ); -- Schritt 2: Schwarzstein(283) 2x
        ----------- SCHWARZSTEINSTAUB - FERTIG --------------
        
        ---------------- SMARAGD - 45 ------------------
        product = gemcutting:AddProduct( 0, 45, {40, 90 }, 1, { 30, 60 } );
        product:AddProductionSteps( { 256, 1, "all" }, 1 ); -- Schritt 1: Roher Smaragd(256) 1x
        ------------- SMARAGD - FERTIG -----------------
		
        ---------------- SMARAGDSTAUB - 448 ------------------
        product = gemcutting:AddProduct( 0, 448, {40, 80 }, 1, { 30, 60 } );
        product:AddProductionSteps( { 45, 2, "all" }, 1 ); -- Schritt 1: Smaragd(45) 2x
        product:AddProductionSteps( { 45, 2, "all" }, 1 ); -- Schritt 2: Smaragd(45) 2x
        ------------- SMARAGDSTAUB - FERTIG -----------------
        
        --------------- TOPAS - 198 --------------------
        product = gemcutting:AddProduct( 0, 198, {50, 110 }, 1, { 35, 70 } );
        product:AddProductionSteps( {   257, 1, "all" }, 1 ); -- Schritt 1: Roher Topas(257) 1x
        --------------- TOPAS - FERTIG -----------------
		
		--------------- TOPASSTAUB - 451 --------------------
        product = gemcutting:AddProduct( 0, 451, {50, 100 }, 1, { 35, 70 } );
        product:AddProductionSteps( {   198, 2, "all" }, 1 ); -- Schritt 1: Topas(198) 2x
		product:AddProductionSteps( {   198, 2, "all" }, 1 ); -- Schritt 2: Topas(198) 2x
        --------------- TOPASSTAUB - FERTIG -----------------
		
		--------------- DIAMANT - 285 --------------------
        product = gemcutting:AddProduct( 0, 285, {60, 130 }, 1, { 40, 80 } );
        product:AddProductionSteps( {   254, 1, "all" }, 1 ); -- Schritt 1: Rohdiamanten(254) 1x
        --------------- DIAMANT - FERTIG -----------------
		
		--------------- DIAMANTSTAUB - 452 --------------------
        product = gemcutting:AddProduct( 0, 452, {60, 120 }, 1, { 40, 80 } );
        product:AddProductionSteps( {   285, 2, "all" }, 1 ); -- Schritt 1: Diamant(285) 2x
        product:AddProductionSteps( {   285, 2, "all" }, 1 ); -- Schritt 2: Diamant(285) 2x
        --------------- DIAMANTSTAUB - FERTIG -----------------
        
        InitDone = true;
    end
    return gemcutting;
end --function


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    GemCutting = InitCraftingTool( );
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
        GemCutting:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end
    
    if not GemCutting:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        GemCutting:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Zange in der Hand
        base.common.InformNLS( User, 
        "Du musst die Zange in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the tongs in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Edelstein schleifen.",
        "Your armour disturbs you while cutting gems." );
        GemCutting:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if GemCutting:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			GemCutting:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        GemCutting:GenerateItemList( User, Param, SourceItem );
        GemCutting:SwapToInactiveItem( User );
        return
    else
        GemCutting:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end --function
