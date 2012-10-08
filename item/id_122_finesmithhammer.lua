-- Goldschmieden mit Goldschmiedehammer und Amboss

-- UPDATE common SET com_script='item.id_122_finesmithhammer' WHERE com_itemid IN (122);

require("item.general.metal")
require("item.base.crafts")

module("item.id_122_finesmithhammer", package.seeall, package.seeall(item.general.metal))

-- Schmiedeprodukte Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        smithing = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "goldsmithing",
                              LeadSkillGroup = 2,
                              DefaultFoodConsumption = 300,
                              DefaultRepair = true,
                              DefaultSfx = { 8, 15 }
                            };
                            
        smithing:AddTool( 172 ); -- Amboss        
        smithing:AddActiveTool( 172, 13 ); -- Amboss mit glühendem Metall
        
        smithing:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        smithing:AddInterruptMessage(
        "Du schlägst dir mit dem Hammer auf den Finger.",
        "You hit your finger with the hammer.");
        
        smithing:AddInterruptMessage(
        "Du betrachtest das Werkstück kurz um die Stellen zu finden welche du noch verbessern möchtest.",
        "You examine your current work, keeping an eye out for any mistakes.");
        
        smithing:AddInterruptMessage(
        "Du schleifst und polierst eine raue Stelle kurz nach.",
        "You correct a very rough area.");
        
        smithing:AddInterruptMessage(
        "Du schüttest etwas Kohle auf das Metall und klopfst sie ein um die Härte zu steigern.",
        "You pour some coal upon the metal and hit it into to increase the hardness.");
        
        smithing:AddInterruptMessage(
        "Du hältst einen Moment inne und überlegst eine zusätzliche Gravur anzubringen, entscheidest dich aber dagegen.",
        "You think about to include a additional gravur a moment, but you decide against.");
        
        smithing:AddInterruptMessage(
        "Du überprüfst kurz die Maße des Werkstücks.",
        "You check the fine details of your work.");
        
        --------------------------------------------------------------------------------------------
        local CurrentCatID = smithing:AddCategory( 1858 ) -- Random Stuff
     
	 --Goblet
local product = smithing:AddProduct( CurrentCatID, 1858, { 0, 40}, 1, { 5, 10 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Oil Lamp
product = smithing:AddProduct( CurrentCatID, 92, { 9, 49}, 1, { 7, 14 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Candlestick
product = smithing:AddProduct( CurrentCatID, 399, { 18, 58}, 1, { 9, 18 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Lantern
product = smithing:AddProduct( CurrentCatID, 393, { 27, 67}, 1, { 12, 24 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Plate
product = smithing:AddProduct( CurrentCatID, 1001, { 36, 76}, 1, { 14, 28 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Copper Goblet
product = smithing:AddProduct( CurrentCatID, 1840, { 45, 85}, 1, { 16, 32 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Gold Goblet
product = smithing:AddProduct( CurrentCatID, 224, { 54, 94}, 1, { 18, 36 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Plate
product = smithing:AddProduct( CurrentCatID, 2031, { 63, 103}, 1, { 21, 42 } );
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Cutlery
product = smithing:AddProduct( CurrentCatID, 2647, { 72, 112}, 1, { 23, 46 } );
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Mirror
product = smithing:AddProduct( CurrentCatID, 336, { 81, 101}, 1, { 25, 50 } );
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

CurrentCatID = smithing:AddCategory( 82 ) -- amulets
--Amulets
product = smithing:AddProduct( CurrentCatID, 222, { 20, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

--Amethyst Amulet
product = smithing:AddProduct( CurrentCatID, 79, { 30, 50}, 1, { 12, 24 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1

--Ruby Amulet
product = smithing:AddProduct( CurrentCatID, 67, { 40, 60}, 1, { 15, 30 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1

--Blackstone Amulet
product = smithing:AddProduct( CurrentCatID, 82, { 50, 70}, 1, { 17, 34 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 283, 1, "all" }, 1 ); -- Blackstone: 1x1

--Bluestone Amulet
product = smithing:AddProduct( CurrentCatID, 71, { 60, 80}, 1, { 20, 40 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Emerald Amulet
product = smithing:AddProduct( CurrentCatID, 62, { 70, 90}, 1, { 22, 44 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 45, 1, "all" }, 1 ); -- Emerald: 1x1

--Topas Amulet
product = smithing:AddProduct( CurrentCatID, 83, { 80, 100}, 1, { 25, 50 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1

--Charm of the Icebird
product = smithing:AddProduct( CurrentCatID, 334, { 90, 110}, 1, { 27, 54 } );
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 285, 1, "all" }, 2 ); -- Diamond: 2x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Mernium Ingot: 1x1

CurrentCatID = smithing:AddCategory( 465 ) --Headware

--Diadem
product = smithing:AddProduct( CurrentCatID, 465, { 50, 70}, 1, { 17, 34 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Crown
product = smithing:AddProduct( CurrentCatID, 225, { 70, 90}, 1, { 22, 44 } );
product:AddProductionSteps( { 2250, 1, "all" }, 3 ); -- Copper Ingot: 3x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1
product:AddProductionSteps( { 285, 1, "all" }, 2 ); -- Diamond: 2x1

CurrentCatID = smithing:AddCategory( 277 ) --Rings

--Golden Ring
product = smithing:AddProduct( CurrentCatID, 235, { 5, 25}, 1, { 6, 12 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Amethyst Ring
product = smithing:AddProduct( CurrentCatID, 277, { 15, 35}, 1, { 9, 18 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1

--Ruby Ring
product = smithing:AddProduct( CurrentCatID, 68, { 25, 45}, 1, { 11, 22 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1

--Blackstone Ring
product = smithing:AddProduct( CurrentCatID, 278, { 35, 55}, 1, { 14, 28 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 283, 1, "all" }, 1 ); -- Blackstone: 1x1

--Bluestone Ring
product = smithing:AddProduct( CurrentCatID, 279, { 45, 65}, 1, { 16, 32 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Emerald Ring
product = smithing:AddProduct( CurrentCatID, 281, { 55, 75}, 1, { 19, 38 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 45, 1, "all" }, 1 ); -- Emerald: 1x1

--Topas Ring
product = smithing:AddProduct( CurrentCatID, 282, { 65, 85}, 1, { 21, 42 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1

--Diamond Ring
product = smithing:AddProduct( CurrentCatID, 280, { 75, 95}, 1, { 24, 48 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 285, 1, "all" }, 1 ); -- Diamond: 1x1

--Ring of the Archmage
product = smithing:AddProduct( CurrentCatID, 2559, { 90, 110}, 1, { 27, 54 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 285, 1, "all" }, 1 ); -- Diamond: 1x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1
product:AddProductionSteps( { 2554, 1, "all" }, 1 ); -- Pure Water: 1x1 

        InitDone = true;
    end
    return smithing;
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    base.common.ResetInterruption( User, ltstate )
    Smithing = InitCraftingTool( );
    if not menstate then
        menstate = { };
    end
	
	ThorsHammer(User, SourceItem);

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
        Smithing:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end

    if menstate[ User.id ]==nil then                           -- menustatus initialisieren.
        menstate[ User.id ]=0;
    end
    
    if not Smithing:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        Smithing:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Hammer in der Hand
        base.common.InformNLS( User, 
        "Du musst den Goldschmiedehammer in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the finesmithing hammer in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim feinschmieden.",
        "Your armour disturbs you while fine smithing." );
        Smithing:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if Cooking:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			Cooking:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        menstate[ User.id ]=1;
        if ( Smithing:GenerateMenu( User,SourceItem ) ) then
            Smithing:SwapToInactiveItem( User );
            return
        end
    end
    if (menstate[ User.id ] == 1) then
        Smithing:GenerateItemList( User, Param, SourceItem );
        menstate[ User.id ] = 2;
        Smithing:SwapToInactiveItem( User );
        return
    elseif (menstate[ User.id ] == 2) then
        Smithing:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end --function

------------------------SKRIPT FÜR DIE PRIESTER SILBERBRANDS(Flammensäule erschaffen aka THOR'S HAMMER)------------
function ThorsHammer( User, SourceItem )
	if (User.id==1551888478 or User.id==1322717830) then  --for the Priests in Silverbrand(1551888478=Ferin Zwergenblut, 1322717830=Thogrimm)
		if SourceItem:getType() == 4 then
			return;
		end
		local TargetPos = base.common.GetFrontPosition(User);
		world:createItemFromId(359, 1, TargetPos, true, 677, 0);   --create flame
		world:gfx(36,TargetPos);
		User:increaseAttrib("hitpoints",-(1600+math.random(500))); --2000HP damage for the Irmorom priest
	end
end
