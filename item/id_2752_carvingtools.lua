-- Working with carving tools

-- UPDATE common SET com_script='item.id_2752_carvingtools' WHERE com_itemid IN (2752);

require("item.general.metal")
require("item.base.crafts")

module("item.id_2752_carvingtools", package.seeall, package.seeall(item.general.metal))

-- Holzarbeiten mit dem Schnitzmesser
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        carpentery = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "carpentry",
                              LeadSkillGroup = 2,
                              DefaultFoodConsumption = 200,
                              DefaultRepair = false,
                              DefaultSfx = { 14, 17 }
                            };

        carpentery:AddTool( 724 ); -- Werkbank
        carpentery:AddTool( 725 ); -- Werkbank

        carpentery:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat from your forehead.");

        carpentery:AddInterruptMessage(
        "Du pustest kurz die Sägespäne von deiner Kleidung.",
        "You brush some wood shavings off your clothes.");

        carpentery:AddInterruptMessage(
        "Du schleifst kurz eine raue Stelle nach.",
        "You smooth out a rough area.");

        carpentery:AddInterruptMessage(
        "Du Stellst die Abfallholzteile zur Seite um wieder mehr Platz auf der Werkbank zu haben.",
        "You throw away some rubbish to get more working space.");

        carpentery:AddInterruptMessage(
        "Du bekommst einige Späne in den Mund und mußt husten.",
        "A wood chip flicks from your blade and nearly hits you in the eye. You rub the spot briefly.");

        carpentery:AddInterruptMessage(
        "Du bekommst einen Holzsplitter in den Finger und mußt Pause machen um ihn zu entfernen.",
        "You get a splinter of wood in your finger and pause to get it out.");

        carpentery:AddInterruptMessage(
        "Du überprüfst kurz die Maße des Werkstücks.",
        "You inspect the finer details of your work.");

        --------------------------------------------------------------------------------------------
        local CurrentCatID = carpentery:AddCategory( 2752 ) -- Tools and stuff

       --Carving Tools
local product = carpentery:AddProduct( CurrentCatID, 2752, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2570, 1, "all" }, 1 ); -- Sickle Handle: 1x1

--Pins and Cotters
product = carpentery:AddProduct( CurrentCatID, 2717, { 0, 20}, 5, { 10, 20 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2738, 5, "all" }, 1 ); -- Pins: 1x5

--Pipe
product = carpentery:AddProduct( CurrentCatID, 2744, { 4, 24}, 1, { 12, 24 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Torch
product = carpentery:AddProduct( CurrentCatID, 391, { 8, 28}, 1, { 14, 28 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Rolling Pin
product = carpentery:AddProduct( CurrentCatID, 118, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Brick Mould
product = carpentery:AddProduct( CurrentCatID, 734, { 16, 36}, 1, { 18, 36 } );
product:AddProductionSteps( { 2716, 1, "all" }, 2 ); -- Apple Wooden Boards: 2x1

--Flail
product = carpentery:AddProduct( CurrentCatID, 258, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Dyeing Rod
product = carpentery:AddProduct( CurrentCatID, 2781, { 24, 44}, 1, { 22, 44 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Fishing rod
product = carpentery:AddProduct( CurrentCatID, 72, { 28, 48}, 1, { 24, 48 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 50, 1, "all" }, 1 ); -- Thread: 1x1


CurrentCatID = carpentery:AddCategory( 2541 ) -- Item handles

--Handle
product = carpentery:AddProduct( CurrentCatID, 2541, { 3, 23}, 1, { 12, 24 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Sickle Handle
product = carpentery:AddProduct( CurrentCatID, 2570, { 6, 26}, 1, { 13, 26 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- bough: 1x1

--Scythe Handle
product = carpentery:AddProduct( CurrentCatID, 2566, { 9, 29}, 1, { 15, 30 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Shovel Handle
product = carpentery:AddProduct( CurrentCatID, 2567, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Saw Handle
product = carpentery:AddProduct( CurrentCatID, 2561, { 15, 35}, 1, { 18, 36 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Large Handle
product = carpentery:AddProduct( CurrentCatID, 2544, { 18, 38}, 1, { 19, 38 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

CurrentCatID = carpentery:AddCategory( 2584 ) -- weapon handles

--Long Staff Handle
product = carpentery:AddProduct( CurrentCatID, 2573, { 10, 50}, 1, { 15, 30 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Axe Handle
product = carpentery:AddProduct( CurrentCatID, 2525, { 23, 63}, 1, { 22, 44 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Dagger Handle
product = carpentery:AddProduct( CurrentCatID, 2530, { 26, 66}, 1, { 23, 46 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Sword Handle
product = carpentery:AddProduct( CurrentCatID, 2584, { 29, 69}, 1, { 0, 0 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Mace Handle
product = carpentery:AddProduct( CurrentCatID, 2548, { 32, 72}, 1, { 26, 52 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Large Ornate handle
product = carpentery:AddProduct( CurrentCatID, 2527, { 35, 75}, 1, { 28, 56 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

--Morning Star Handle
product = carpentery:AddProduct( CurrentCatID, 2549, { 40, 80}, 1, { 30, 60 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2543, 1, "all" }, 1 ); -- Conifer Wooden Boards: 1x1

CurrentCatID = carpentery:AddCategory( 445 ) --weapons

--Wooden Sword
product = carpentery:AddProduct( CurrentCatID, 445, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Club
product = carpentery:AddProduct( CurrentCatID, 2664, { 6, 26}, 1, { 13, 26 } );
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2548, 1, "all" }, 1 ); -- Mace Handle: 1x1

--Skull Staff
product = carpentery:AddProduct( CurrentCatID, 39, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Cleric's Staff
product = carpentery:AddProduct( CurrentCatID, 40, { 24, 44}, 1, { 22, 44 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Simple Mage Staff
product = carpentery:AddProduct( CurrentCatID, 57, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Mage's Staff
product = carpentery:AddProduct( CurrentCatID, 76, { 42, 62}, 1, { 31, 62 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 3 ); -- Naldor Wooden Boards: 3x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Elven Mage's Staff
product = carpentery:AddProduct( CurrentCatID, 209, { 54, 74}, 1, { 37, 74 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 3 ); -- Naldor Wooden Boards: 3x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Ornate Mage's Staff
product = carpentery:AddProduct( CurrentCatID, 208, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 3 ); -- Naldor Wooden Boards: 3x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1

--Battle Staff
product = carpentery:AddProduct( CurrentCatID, 207, { 66, 86}, 1, { 43, 86 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 546, 1, "all" }, 2 ); -- Naldor Wooden Boards: 2x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Large Staff Handle: 1x1
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

CurrentCatID = carpentery:AddCategory( 64 ) --ammunition and throwing stuff

--Throwing Spear
product = carpentery:AddProduct( CurrentCatID, 293, { 30, 50}, 10, { 25, 50 } );
product:AddProductionSteps( { 56, 1, "all" }, 2 ); -- Bough: 2x1

--Arrow
product = carpentery:AddProduct( CurrentCatID, 64, { 10, 30}, 20, { 15, 30 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Bolt
product = carpentery:AddProduct( CurrentCatID, 237, { 30, 50}, 10, { 25, 50 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1

--Wind Arrows
product = carpentery:AddProduct( CurrentCatID, 322, { 90, 110}, 100, { 55, 110 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1

CurrentCatID = carpentery:AddCategory( 323 ) --Wands

--Wand
product = carpentery:AddProduct( CurrentCatID, 323, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 545, 1, "all" }, 2 ); -- Cherry Wooden Boards: 2x1
product:AddProductionSteps( { 2527, 1, "all" }, 1 ); -- Large Ornated Staff Handle: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1

--Wand of Earth
product = carpentery:AddProduct( CurrentCatID, 2782, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 545, 1, "all" }, 3 ); -- Cherry Wooden Boards: 3x1
product:AddProductionSteps( { 2527, 1, "all" }, 1 ); -- Large Ornated Staff Handle: 1x1
product:AddProductionSteps( { 283, 1, "all" }, 3 ); -- Blackstone: 3x1
product:AddProductionSteps( { 2552, 1, "all" }, 1 ); -- Pure Earth: 1x1

--Wand of Fire
product = carpentery:AddProduct( CurrentCatID, 2783, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 545, 1, "all" }, 4 ); -- Cherry Wooden Boards: 4x1
product:AddProductionSteps( { 2527, 1, "all" }, 1 ); -- Large Ornated Staff Handle: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 3 ); -- Ruby: 3x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Wand of Water
product = carpentery:AddProduct( CurrentCatID, 2784, { 80, 100}, 1, { 50, 100 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 545, 1, "all" }, 5 ); -- Cherry Wooden Boards: 5x1
product:AddProductionSteps( { 2527, 1, "all" }, 1 ); -- Large Ornated Staff Handle: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 3 ); -- Bluestone: 3x1
product:AddProductionSteps( { 2554, 1, "all" }, 1 ); -- Pure Water: 1x1

--Water of Wind
product = carpentery:AddProduct( CurrentCatID, 2785, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 56, 1, "all" }, 1 ); -- Bough: 1x1
product:AddProductionSteps( { 545, 1, "all" }, 6 ); -- Cherry Wooden Boards: 6x1
product:AddProductionSteps( { 2527, 1, "all" }, 1 ); -- Large Ornated Staff Handle: 1x1
product:AddProductionSteps( { 285, 1, "all" }, 3 ); -- Diamond: 3x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1 

        InitDone = true;
    end
    return carpentery;
end



function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DON'T EDIT THIS LINE!
    base.common.ResetInterruption( User, ltstate )
    carpenter = InitCraftingTool( );
    if not menstate then
        menstate = { };
    end

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
        carpenter:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading values.");
        return
    end

    if menstate[ User.id ]==nil then                           -- Menüstatus initialisieren.
        menstate[ User.id ]=0;
    end

    if not carpenter:LocationFine( User ) then
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        carpenter:SwapToInactiveItem( User );
        return
    end

    if ( SourceItem:getType() ~= 4 ) then -- Schnitzmesser in der Hand
        base.common.InformNLS( User,
        "Du mußt die Schnitzmesser in die Hand nehmen um damit zu arbeiten.",
        "You have to take the carving tools in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim schnitzen.",
        "Your armour disturbs you while carve." );
        carpenter:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
   if TargetItem then
      if carpenter:IsProduct(TargetItem.id) then
         base.common.InformNLS( User,
         "Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
         "You try to work on the item in your hand." );
         carpenter:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
         return;
      end
   end

    if (Param == 0) then
        menstate[ User.id ]=1;
        if ( carpenter:GenerateMenu( User, SourceItem ) ) then
            carpenter:SwapToInactiveItem( User );
            return
        end
    end
    if (menstate[ User.id ] == 1) then
        carpenter:GenerateItemList( User, Param, SourceItem );
        menstate[ User.id ] = 2;
        carpenter:SwapToInactiveItem( User );
        return
    elseif (menstate[ User.id ] == 2) then
        carpenter:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end --function