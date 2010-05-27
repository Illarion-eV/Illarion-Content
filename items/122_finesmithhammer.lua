-- Goldschmieden mit Goldschmiedehammer und Amboss

-- UPDATE common SET com_script='items.122_finesmithhammer' WHERE com_itemid IN (122);

require("items.general.metal")
require("items.base.crafts")

module("items.122_finesmithhammer", package.seeall, package.seeall(items.general.metal))

-- Schmiedeprodukte Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        smithing = items.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "goldsmithing",
                              LeadSkillGroup = 2,
                              DefaultFoodConsumption = 300,
                              DefaultRepair = true,
                              DefaultSfx = { 8, 15 }
                            };
                            
        smithing:AddTool( 172 ); -- Amboss        
        smithing:AddActiveTool( 172, 13 ); -- Amboss mit gl�hendem Metall
        
        smithing:AddInterruptMessage(
        "Du wischst dir den Schwei� von der Stirn.",
        "You wipe sweat off your forehead.");
        
        smithing:AddInterruptMessage(
        "Du schl�gst dir mit dem Hammer auf den Finger.",
        "You hit your finger with the hammer.");
        
        smithing:AddInterruptMessage(
        "Du betrachtest das Werkst�ck kurz um die Stellen zu finden welche du noch verbessern m�chtest.",
        "You examine your current work, keeping an eye out for any mistakes.");
        
        smithing:AddInterruptMessage(
        "Du schleifst und polierst eine raue Stelle kurz nach.",
        "You correct a very rough area.");
        
        smithing:AddInterruptMessage(
        "Du sch�ttest etwas Kohle auf das Metall und klopfst sie ein um die H�rte zu steigern.",
        "You pour some coal upon the metal and hit it into to increase the hardness.");
        
        smithing:AddInterruptMessage(
        "Du h�ltst einen Moment inne und �berlegst eine zus�tzliche Gravur anzubringen, entscheidest dich aber dagegen.",
        "You think about to include a additional gravur a moment, but you decide against.");
        
        smithing:AddInterruptMessage(
        "Du �berpr�fst kurz die Ma�e des Werkst�cks.",
        "You check the fine details of your work.");
        
        --------------------------------------------------------------------------------------------
        local CurrentCatID = smithing:AddCategory( 1858 ) -- Random Stuff
     
	 --Goblet
local product = smithing:AddProduct( CurrentCatID, 1858, { 0, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Oil Lamp
product = smithing:AddProduct( CurrentCatID, 92, { 9, 49}, 1, { 15, 30 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Candlestick
product = smithing:AddProduct( CurrentCatID, 399, { 18, 58}, 1, { 19, 38 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Lantern
product = smithing:AddProduct( CurrentCatID, 393, { 27, 67}, 1, { 24, 48 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

--Plate
product = smithing:AddProduct( CurrentCatID, 1001, { 36, 76}, 1, { 28, 56 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Copper Goblet
product = smithing:AddProduct( CurrentCatID, 1840, { 45, 85}, 1, { 33, 66 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Gold Goblet
product = smithing:AddProduct( CurrentCatID, 224, { 54, 94}, 1, { 37, 74 } );
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Plate
product = smithing:AddProduct( CurrentCatID, 2031, { 63, 103}, 1, { 42, 84 } );
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Cutlery
product = smithing:AddProduct( CurrentCatID, 2647, { 72, 112}, 1, { 46, 92 } );
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Mirror
product = smithing:AddProduct( CurrentCatID, 336, { 81, 101}, 1, { 51, 102 } );
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 41, 1, "all" }, 1 ); -- Glass Ingot: 1x1

CurrentCatID = smithing:AddCategory( 82 ) -- amulets
--Amulets
product = smithing:AddProduct( CurrentCatID, 222, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

--Amethyst Amulet
product = smithing:AddProduct( CurrentCatID, 79, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1

--Ruby Amulet
product = smithing:AddProduct( CurrentCatID, 67, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1

--Blackstone Amulet
product = smithing:AddProduct( CurrentCatID, 82, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 283, 1, "all" }, 1 ); -- Blackstone: 1x1

--Bluestone Amulet
product = smithing:AddProduct( CurrentCatID, 71, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Emerald Amulet
product = smithing:AddProduct( CurrentCatID, 62, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 45, 1, "all" }, 1 ); -- Emerald: 1x1

--Topas Amulet
product = smithing:AddProduct( CurrentCatID, 83, { 80, 100}, 1, { 50, 100 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1

--Charm of the Icebird
product = smithing:AddProduct( CurrentCatID, 334, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 285, 1, "all" }, 2 ); -- Diamond: 2x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Mernium Ingot: 1x1

CurrentCatID = smithing:AddCategory( 465 ) --Headware

--Diadem
product = smithing:AddProduct( CurrentCatID, 465, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Crown
product = smithing:AddProduct( CurrentCatID, 225, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2250, 1, "all" }, 3 ); -- Copper Ingot: 3x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1
product:AddProductionSteps( { 285, 1, "all" }, 2 ); -- Diamond: 2x1

CurrentCatID = smithing:AddCategory( 277 ) --Rings

--Golden Ring
product = smithing:AddProduct( CurrentCatID, 235, { 5, 25}, 1, { 13, 26 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Amethyst Ring
product = smithing:AddProduct( CurrentCatID, 277, { 15, 35}, 1, { 18, 36 } );
product:AddProductionSteps( { 2250, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1

--Ruby Ring
product = smithing:AddProduct( CurrentCatID, 68, { 25, 45}, 1, { 23, 46 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1

--Blackstone Ring
product = smithing:AddProduct( CurrentCatID, 278, { 35, 55}, 1, { 28, 56 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 283, 1, "all" }, 1 ); -- Blackstone: 1x1

--Bluestone Ring
product = smithing:AddProduct( CurrentCatID, 279, { 45, 65}, 1, { 33, 66 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Emerald Ring
product = smithing:AddProduct( CurrentCatID, 281, { 55, 75}, 1, { 38, 76 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 45, 1, "all" }, 1 ); -- Emerald: 1x1

--Topas Ring
product = smithing:AddProduct( CurrentCatID, 282, { 65, 85}, 1, { 43, 86 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1

--Diamond Ring
product = smithing:AddProduct( CurrentCatID, 280, { 75, 95}, 1, { 48, 96 } );
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 285, 1, "all" }, 1 ); -- Diamond: 1x1

--Ring of the Archmage
product = smithing:AddProduct( CurrentCatID, 2559, { 90, 110}, 1, { 55, 110 } );
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
     
------------------------AB HIER,SKRIPT F�R DIE PRIESTER SILBERBRANDS(Flammens�ule erschaffen aka THOR'S HAMMER)------------    
------------------------Part 1:------- 
  if (User.id==1551888478 or User.id==1322717830) then --for the Priests in Silverbrand(1551888478=Ferin Zwergenblut, 1322717830=Thogrimm)
  	if ( SourceItem:getType() ~= 4 ) then -- Wenn Hammer nicht in der Hand dann
       	if (TargetItem.id~=0) then
			if (User.id==1551888478 or User.id==1322717830) then  --not so strong flame
				world:createItemFromId(359, 1, TargetItem.pos, true, 677, 0);   --create flame
                world:gfx(36,TargetItem.pos);
        		User:increaseAttrib("hitpoints",-(1600+math.random(500))); --2000HP damage for the Irmorom priest
        	end
		else
			base.common.InformNLS( User, "Du musst schon die Stelle anvisieren wo die Flamme erscheinen soll",
							 "You have to target a field where the flame shall appear.");
		end    
        
    
    else
    
	if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
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
        "Du mu�t den Goldschmiedehammer in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the finesmithing hammer in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife R�stung?
        base.common.InformNLS( User,
        "Deine R�stung behindert beim feinschmieden.",
        "Your armor disturbes you while fine smithing." );
        Smithing:SwapToInactiveItem( User );
        return
    end

    if ( TargetItem.id ~= 0 ) then
        if (TargetItem:getType() == 5) then
            Smithing:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
        end
        return
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
	end
	
---------------------------------------------		
  else 
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
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
        "Du mu�t den Goldschmiedehammer in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the finesmithing hammer in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife R�stung?
        base.common.InformNLS( User,
        "Deine R�stung behindert beim feinschmieden.",
        "Your armor disturbes you while fine smithing." );
        Smithing:SwapToInactiveItem( User );
        return
    end

    if ( TargetItem.id ~= 0 ) then
        if (TargetItem:getType() == 5) then
            Smithing:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
        end
        return
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
  end  
end --function

------------------------Part 2:-------
function UseItemWithField( User, SourceItem,TargetPos ,Counter , Param)
		if (User.id==1551888478 or User.id==1322717830) then  --not so strong flame
				world:createItemFromId(359, 1, TargetPos, true, 677, 0);   --create flame
				world:gfx(36,TargetPos);
        		User:increaseAttrib("hitpoints",-(1600+math.random(500))); --2000HP damage for the Irmorom priest
		end
end

function UseItemWithCharacter(User,SourceItem,TargetChar,Counter,Param)
		if (User.id==1551888478 or User.id==1322717830) then
			if (TargetChar.id~=User.id) then
				if (User.id==1551888478 or User.id==1322717830) then  --not so strong flame
					world:createItemFromId(359, 1, TargetChar.pos, true, 677, 0);   --create flame
					world:gfx(36,TargetChar.pos);
        			User:increaseAttrib("hitpoints",-(1600+math.random(500))); --2000HP damage for the Irmorom priest
        		end
			else
			base.common.InformNLS( User, "Du kannst dich nicht selber verbrennen",
							 "You can't burn yourself.");
			end
		end
end
--------------------------------------
