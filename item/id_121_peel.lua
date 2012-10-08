-- Backen mit Ofenschieber und Backofen

-- UPDATE common SET com_script='item.id_121_peel' WHERE com_itemid IN (121);

require("item.general.wood")
require("item.base.crafts")

module("item.id_121_peel", package.seeall, package.seeall(item.general.wood))

-- Backprodukte Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        baking = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                             LeadSkill = "baking",
                             LeadSkillGroup = 2,
                             DefaultFoodConsumption = 100,
                             DefaultRepair = false
                           };
        baking:AddTool( 119 ); -- Backofen
        baking:AddTool( 120 ); -- Backofen
        
        baking:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        baking:AddInterruptMessage(
        "Du schaust einen Moment in den Ofen und freust dich wie gut der Teig aufgeht.",
        "You take a look into the oven and watch with joy how the dough rises.");
        
        baking:AddInterruptMessage(
        "Du hältst einen Moment inne und überlegst eine zusätzliche Zutat hinzuzufügen, entscheidest dich aber dagegen.",
        "You hesitate and consider to add additional ingredients to the recipe. Finally, you revise your decision.");
        
        baking:AddInterruptMessage(
        "Du wäschst dir kurz den klebrigen Teig von den Fingern.",
        "You stop to wash the slippery dough off your hands.");
        
        --------------------------------------------------------------------------------------------
        
        ---------------- BREAD ROLL - 191 ----------------------
        product = baking:AddProduct( 0, 191, {0, 20 }, 1, { 5, 10 } );
        product:AddProductionSteps( {   5, 1, "all" }, 1 ); -- Step 1: Dough (5) 1x
        -------------- BRÖTCHEN - DONE ----------------

        ---------------- COOKIES - 453 ----------------------
        product = baking:AddProduct( 0, 453, {10, 30 }, 2, { 7, 14 } );
        product:AddProductionSteps( {   5, 1, "all" }, 1 ); -- Step 1: Dough (5) 1x
        product:AddProductionSteps( {2529, 1, "all" }, 1 ); -- Step 2: Honey(2529) 1x
        -------------- COOKIES - DONE ----------------
        
        ---------------- BREAD - 49 ----------------------
        product = baking:AddProduct( 0, 49, {25, 45 }, 1, { 11, 22 } );
        product:AddProductionSteps( {   5, 1, "all" }, 2 ); -- Stepe 1 - 2: Dough (5) 1x
        -------------- BREAD - DONE ----------------

        ---------------- MUFFIN - 454 ----------------------
        product = baking:AddProduct( 0, 454, {45, 65 }, 2, { 16, 32 } );
        product:AddProductionSteps( {   5, 1, "all" }, 2 ); -- Step 1-2: Dough (5) 1x
        product:AddProductionSteps( {2529, 1, "all" }, 1 ); -- Step 3: Honey(2529) 1x
        product:AddProductionSteps( { 147, 5, "all" }, 1 ); -- Step 4: Blackberry(147) 5x
        -------------- MUFFIN - DONE ----------------
        
        ---------------- APPLE PIE - 353 ----------------------
        product = baking:AddProduct( 0, 353, {55, 75 }, 1, { 19, 38 } );
        product:AddProductionSteps( {   5, 1, "all" }, 2 ); -- Step 1-2: Dough (5) 1x
        product:AddProductionSteps( {2529, 2, "all" }, 1 ); -- Step 3: Honey(2529) 2x
        product:AddProductionSteps( {  15, 5, "all" }, 2 ); -- Step 4-5: Apple(15) 5x

        -------------- APPLE PIE - DONE ----------------
        
        ---------------- CHERRY CAKE - 303 ----------------------
        product = baking:AddProduct( 0, 303, {70, 90 }, 1, { 22, 44 } );
        product:AddProductionSteps( {   5, 1, "all" }, 3 ); -- Step 1-3: Dough (5) 1x
        product:AddProductionSteps( {2529, 2, "all" }, 1 ); -- Step 4: Honey(2529) 2x
        product:AddProductionSteps( { 302, 5, "all" }, 2 ); -- Step 5-6: Cherries(302) 5x
        -------------- CHERRY CAKE - DONE ----------------
        
        ---------------- STRAWBERRY CAKE - 354 ----------------------
        product = baking:AddProduct( 0, 354, {80, 100 }, 1, { 25, 50 } );
        product:AddProductionSteps( {   5, 1, "all" }, 4); -- Step 1-4: Dough (5) 1x
        product:AddProductionSteps( {2529, 2, "all" }, 1); -- Step 5: Honey(2529) 2x
        product:AddProductionSteps( { 151, 5, "all" }, 2 ); -- Step 6-7: Strawberries(151) 5x
        -------------- STRAWBERRY CAKE - DONE ---------------- 
        
        InitDone = true;
    end
    return baking;
end --function

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    baking = InitCraftingTool( );
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

        baking:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end
    
    if not baking:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        baking:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Ofenschieber in der Hand
        base.common.InformNLS( User, 
        "Du musst den Ofenschieber in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the peel in your hand to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr steife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim backen.",
        "Your armor disturbs you while baking." );
        baking:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if baking:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			baking:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        baking:GenerateItemList( User, Param, SourceItem );
        baking:SwapToInactiveItem( User );
        return
    else
        baking:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end --function
