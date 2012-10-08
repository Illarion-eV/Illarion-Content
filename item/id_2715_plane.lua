-- Holzarbeiten mit dem Hobel

-- UPDATE common SET com_script='item.id_2715_plane' WHERE com_itemid IN (2715);

require("item.general.wood")
require("item.base.crafts")

module("item.id_2715_plane", package.seeall, package.seeall(item.general.wood))

-- Holzarbeiten mit dem Hobel
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        carpentry = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "carpentry",
                              LeadSkillGroup = 2,
                              DefaultFoodConsumption = 200,
                              DefaultRepair = false,
                              DefaultSfx = { 14, 17 }
                            };
                            
        carpentry:AddTool( 724 ); -- Werkbank
        carpentry:AddTool( 725 ); -- Werkbank
        
        carpentry:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat from your forehead.");
        
        carpentry:AddInterruptMessage(
        "Du pustest kurz die Sägespäne von deiner Kleidung.",
        "You brush some sawdust off your clothes.");
        
        carpentry:AddInterruptMessage(
        "Du schleifst kurz eine raue Stelle nach.",
        "You smooth out a rough area.");
        
        carpentry:AddInterruptMessage(
        "Du stellst die Abfallholzteile zur Seite um wieder mehr Platz auf der Werkbank zu haben.",
        "You throw away some rubbish to get more working space.");
        
        carpentry:AddInterruptMessage(
        "Du bekommst einige Späne in den Mund und musst husten.",
        "Sawdust finds its way into your mouth, causing you to cough loudly.");
        
        carpentry:AddInterruptMessage(
        "Du bekommst einen Holzsplitter in den Finger und musst Pause machen um ihn zu entfernen.",
        "You get a splinter of wood in your finger and have to pause to remove it.");
        
        carpentry:AddInterruptMessage(
        "Du überprüfst kurz die Maße des Werkstücks.",
        "You inspect the finer details of your work.");

        --------------------------------------------------------------------------------------------
        local CurrentCatID = carpentry:AddCategory( 2715 ) -- Tools and Other Items
    
     --Slicer
local product = carpentry:AddProduct( CurrentCatID, 2715, { 0, 20}, 1, { 5, 10 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Plate
product = carpentry:AddProduct( CurrentCatID, 2952, { 0, 20}, 1, { 5, 10 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Bowl
product = carpentry:AddProduct( CurrentCatID, 2935, { 0, 20}, 1, { 5, 10 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Wooden Cup
product = carpentry:AddProduct( CurrentCatID, 2185, { 3, 23}, 1, { 6, 12 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Comb
product = carpentry:AddProduct( CurrentCatID, 2719, { 6, 26}, 1, { 6, 12 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Cooking Spoon
product = carpentry:AddProduct( CurrentCatID, 227, { 9, 29}, 1, { 7, 14 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1

--Nailboard
product = carpentry:AddProduct( CurrentCatID, 2659, { 10, 30}, 1, { 7, 14 } );
product:AddProductionSteps( { 2716, 1, "all" }, 1 ); -- Apple Wooden Boards: 1x1
product:AddProductionSteps( { 2738, 1, "all" }, 1 ); -- Nails: 1x1

--Wooden Shovel
product = carpentry:AddProduct( CurrentCatID, 312, { 12, 32}, 1, { 8, 16 } );
product:AddProductionSteps( { 2716, 1, "all" }, 2 ); -- Apple Wooden Boards: 2x1

--Candle Mold
product = carpentry:AddProduct( CurrentCatID, 429, { 15, 35}, 1, { 9, 18 } );
product:AddProductionSteps( { 2716, 1, "all" }, 2 ); -- Apple Wooden Boards: 2x1

--Bucket
product = carpentry:AddProduct( CurrentCatID, 51, { 18, 38}, 1, { 9, 18 } );
product:AddProductionSteps( { 2716, 1, "all" }, 3 ); -- Apple Wooden Boards: 3x1

--Peel
product = carpentry:AddProduct( CurrentCatID, 121, { 21, 41}, 1, { 10, 20 } );
product:AddProductionSteps( { 2716, 1, "all" }, 2 ); -- Apple Wooden Boards: 2x1

CurrentCatID = carpentry:AddCategory( 2646 ) --bows

--Shortbow
product = carpentry:AddProduct( CurrentCatID, 65, { 20, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 546, 1, "all" }, 3 ); -- Naldor Wooden Boards: 3x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Serinjah-Rider's Bow
product = carpentry:AddProduct( CurrentCatID, 2646, { 30, 50}, 1, { 12, 24 } );
product:AddProductionSteps( { 546, 1, "all" }, 3 ); -- Naldor Wooden Boards: 3x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Hunting Bow
product = carpentry:AddProduct( CurrentCatID, 2714, { 40, 60}, 1, { 15, 30 } );
product:AddProductionSteps( { 546, 1, "all" }, 4 ); -- Naldor Wooden Boards: 4x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Serinjah Firebow
product = carpentry:AddProduct( CurrentCatID, 2727, { 50, 70}, 1, { 17, 34 } );
product:AddProductionSteps( { 546, 1, "all" }, 4 ); -- Naldor Wooden Boards: 4x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Ebony Wooden Bow
product = carpentry:AddProduct( CurrentCatID, 2780, { 60, 80}, 1, { 20, 40 } );
product:AddProductionSteps( { 546, 1, "all" }, 5 ); -- Naldor Wooden Boards: 5x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Elven Composite Longbow
product = carpentry:AddProduct( CurrentCatID, 2718, { 70, 90}, 1, { 22, 44 } );
product:AddProductionSteps( { 546, 1, "all" }, 5 ); -- Naldor Wooden Boards: 5x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Crossbow
product = carpentry:AddProduct( CurrentCatID, 70, { 80, 100}, 1, { 25, 50 } );
product:AddProductionSteps( { 546, 1, "all" }, 6 ); -- Naldor Wooden Boards: 6x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingots: 2x1

--Magical Elven Bow
product = carpentry:AddProduct( CurrentCatID, 2685, { 90, 110}, 1, { 27, 54 } );
product:AddProductionSteps( { 546, 1, "all" }, 7 ); -- Naldor Wooden Boards: 7x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 2 ); -- Bluestone: 2x1

CurrentCatID = carpentry:AddCategory( 90 ) --instruments

--Horn
product = carpentry:AddProduct( CurrentCatID, 333, { 10, 20}, 1, { 7, 14 } );
product:AddProductionSteps( { 545, 1, "all" }, 2 ); -- Cherry Wooden Boards: 2x1

--Flute
product = carpentry:AddProduct( CurrentCatID, 90, { 20, 30}, 1, { 10, 20 } );
product:AddProductionSteps( { 545, 1, "all" }, 3 ); -- Cherry Wooden Boards: 3x1

--Panpipe
product = carpentry:AddProduct( CurrentCatID, 532, { 30, 40}, 1, { 10, 20 } );
product:AddProductionSteps( { 545, 1, "all" }, 3 ); -- Cherry Wooden Boards: 3x1

--Drum
product = carpentry:AddProduct( CurrentCatID, 533, { 40, 50}, 1, { 12, 24 } );
product:AddProductionSteps( { 2543, 1, "all" }, 2 ); -- Conifer Wooden Boards: 2x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Lute
product = carpentry:AddProduct( CurrentCatID, 335, { 50, 60}, 1, { 15, 30 } );
product:AddProductionSteps( { 545, 1, "all" }, 2 ); -- Cherry Wooden Boards: 2x1
product:AddProductionSteps( { 50, 1, "all" }, 2 ); -- Thread: 2x1

--Harp
product = carpentry:AddProduct( CurrentCatID, 332, { 60, 70}, 1, { 17, 34 } );
product:AddProductionSteps( { 545, 1, "all" }, 5 ); -- Cherry Wooden Boards: 5x1
product:AddProductionSteps( { 51, 1, "all" }, 3 ); -- Thread: 3x1

CurrentCatID = carpentry:AddCategory( 18 ) --shields

--Small wooden Shield
product = carpentry:AddProduct( CurrentCatID, 2445, { 10, 30}, 1, { 7, 14 } );
product:AddProductionSteps( { 2543, 1, "all" }, 3 ); -- Conifer Wooden Boards: 3x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1

--Wooden Shield
product = carpentry:AddProduct( CurrentCatID, 17, { 17, 37}, 1, { 9, 18 } );
product:AddProductionSteps( { 2543, 1, "all" }, 3 ); -- Conifer Wooden Boards: 3x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1

--Light Metal shield
product = carpentry:AddProduct( CurrentCatID, 18, { 24, 44}, 1, { 11, 22 } );
product:AddProductionSteps( { 2543, 1, "all" }, 3 ); -- Conifer Wooden Boards: 3x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingots: 1x1

--Round Metal shield
product = carpentry:AddProduct( CurrentCatID, 186, { 31, 51}, 1, { 13, 26 } );
product:AddProductionSteps( { 2543, 1, "all" }, 4 ); -- Conifer Wooden Boards: 4x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingots: 1x1

--Metal shield
product = carpentry:AddProduct( CurrentCatID, 19, { 38, 58}, 1, { 14, 28 } );
product:AddProductionSteps( { 2543, 1, "all" }, 4 ); -- Conifer Wooden Boards: 4x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingots: 1x1

--Large Metal Shield
product = carpentry:AddProduct( CurrentCatID, 20, { 45, 65}, 1, { 16, 32 } );
product:AddProductionSteps( { 2543, 1, "all" }, 4 ); -- Conifer Wooden Boards: 4x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingots: 2x1

--Cursed Shield
product = carpentry:AddProduct( CurrentCatID, 917, { 52, 72}, 1, { 18, 36 } );
product:AddProductionSteps( { 2543, 1, "all" }, 5 ); -- Conifer Wooden Boards: 5x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Red Steel Shield
product = carpentry:AddProduct( CurrentCatID, 2388, { 59, 79}, 1, { 20, 40 } );
product:AddProductionSteps( { 2543, 1, "all" }, 5 ); -- Conifer Wooden Boards: 5x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingots: 2x1

--Legionaire's Tower shield
product = carpentry:AddProduct( CurrentCatID, 2448, { 66, 86}, 1, { 21, 42 } );
product:AddProductionSteps( { 2543, 1, "all" }, 5 ); -- Conifer Wooden Boards: 5x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Heraldic Shield
product = carpentry:AddProduct( CurrentCatID, 95, { 73, 93}, 1, { 23, 46 } );
product:AddProductionSteps( { 2543, 1, "all" }, 6 ); -- Conifer Wooden Boards: 6x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Steel Tower shield
product = carpentry:AddProduct( CurrentCatID, 96, { 80, 100}, 1, { 25, 50 } );
product:AddProductionSteps( { 2543, 1, "all" }, 6 ); -- Conifer Wooden Boards: 6x1
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingots: 3x1

--Ornate Tower Shield
product = carpentry:AddProduct( CurrentCatID, 916, { 87, 107}, 1, { 27, 54 } );
product:AddProductionSteps( { 2543, 1, "all" }, 6 ); -- Conifer Wooden Boards: 6x1
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingots: 3x1

--Shield of the sky
product = carpentry:AddProduct( CurrentCatID, 2284, { 90, 110}, 1, { 27, 54 } );
product:AddProductionSteps( { 2543, 1, "all" }, 7 ); -- Conifer Wooden Boards: 7x1
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 3 ); -- Bluestone: 3x1

--Cloud Shield
product = carpentry:AddProduct( CurrentCatID, 2439, { 100, 120}, 1, { 30, 60 } );
product:AddProductionSteps( { 2543, 1, "all" }, 7 ); -- Conifer Wooden Boards: 7x1
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 5 ); -- Bluestone: 5x1

CurrentCatID = carpentry:AddCategory( 2194 ) -- leggings

--Short Hardwood Greaves
product = carpentry:AddProduct( CurrentCatID, 2194, { 30, 50}, 1, { 12, 24 } );
product:AddProductionSteps( { 546, 1, "all" }, 5 ); -- Naldor Wooden Boards: 5x1
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1

--Hardwood Greaves
product = carpentry:AddProduct( CurrentCatID, 2193, { 44, 64}, 1, { 16, 32 } );
product:AddProductionSteps( { 546, 1, "all" }, 7 ); -- Naldor Wooden Boards: 7x1
product:AddProductionSteps( { 176, 1, "all" }, 4 ); -- Grey Cloth: 4x1 
        
        InitDone = true;
    end
    return carpentry;
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DON'T EDIT THIS LINE!

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
        User:inform("Error while loading crafting values.");
        return
    end

    if menstate[ User.id ]==nil then                           -- Menüstatus initialisieren.
        menstate[ User.id ]=0;
    end
    
    if not carpenter:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        carpenter:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Schnitzmesser in der Hand
        base.common.InformNLS( User, 
        "Du musst den Hobel in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the slicer in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Hobeln.",
        "Your armour disturbs you while slicing." );
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
        carpenter:GenerateItemList( User, Param , SourceItem);
        menstate[ User.id ] = 2;
        carpenter:SwapToInactiveItem( User );
        return
    elseif (menstate[ User.id ] == 2) then
        carpenter:ToolCreateItem( User, Param, nil, ltstate,SourceItem );
    end
end --function
