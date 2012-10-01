-- Schmieden mit Hammer, Amboss

-- UPDATE common SET com_script='item.id_23_smithinghammer' WHERE com_itemid IN (23);

require("item.general.metal")
require("item.base.crafts")

module("item.id_23_smithinghammer", package.seeall, package.seeall(item.general.metal))

-- Schmiedeprodukte Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        smithing = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "smithing",
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
local CurrentCatID = smithing:AddCategory( 23 ) --hammer
		
--Pins
local product = smithing:AddProduct( CurrentCatID, 2738, { 0, 20}, 5, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Hammer
product = smithing:AddProduct( CurrentCatID, 23, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2541, 1, "all" }, 1 ); -- Hammer Handle: 1x1

--Pickaxe
product = smithing:AddProduct( CurrentCatID, 2763, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2544, 1, "all" }, 1 ); -- Large handle: 1x1

--Chisel
product = smithing:AddProduct( CurrentCatID, 737, { 2, 22}, 1, { 11, 22 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- iron Ingot: 2x1

--Crucible-Princers
product = smithing:AddProduct( CurrentCatID, 2751, { 4, 24}, 1, { 12, 24 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

--Tongs
product = smithing:AddProduct( CurrentCatID, 2140, { 6, 26}, 1, { 13, 26 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

--Needle
product = smithing:AddProduct( CurrentCatID, 47, { 8, 28}, 1, { 14, 28 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Scissors
product = smithing:AddProduct( CurrentCatID, 6, { 10, 30}, 1, { 15, 30 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1

--Finesmithing
product = smithing:AddProduct( CurrentCatID, 122, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2541, 1, "all" }, 1 ); -- Hammer Handle: 1x1

--Sickle
product = smithing:AddProduct( CurrentCatID, 126, { 14, 34}, 1, { 17, 34 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2570, 1, "all" }, 1 ); -- Sickle Handle: 1x1

--Scyte
product = smithing:AddProduct( CurrentCatID, 271, { 16, 36}, 1, { 18, 36 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2566, 1, "all" }, 1 ); -- Scythe Handle: 1x1

--Saw
product = smithing:AddProduct( CurrentCatID, 9, { 18, 38}, 1, { 19, 38 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2561, 1, "all" }, 1 ); -- Saw Handle: 1x1

--Hatchet
product = smithing:AddProduct( CurrentCatID, 74, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Shovel
product = smithing:AddProduct( CurrentCatID, 24, { 22, 42}, 1, { 21, 42 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2567, 1, "all" }, 1 ); -- Shovel Handle: 1x1

--Razor
product = smithing:AddProduct( CurrentCatID, 2746, { 24, 44}, 1, { 22, 44 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2570, 1, "all" }, 1 ); -- Sickle Handle: 1x1

CurrentCatID = smithing:AddCategory( 94 ) --Helmets

--Horned Helm
product = smithing:AddProduct( CurrentCatID, 7, { 13, 33}, 1, { 17, 34 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1

--Orc Helmet
product = smithing:AddProduct( CurrentCatID, 16, { 26, 46}, 1, { 23, 46 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1

--Serinjah Helm
product = smithing:AddProduct( CurrentCatID, 2444, { 39, 59}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Storm cap
product = smithing:AddProduct( CurrentCatID, 2441, { 52, 72}, 1, { 36, 72 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 176, 1, "all" }, 2 ); -- Grey Cloth: 2x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Chain helmet
product = smithing:AddProduct( CurrentCatID, 324, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- iron Ingot: 4x1

--Gynkese Merc Helmet
product = smithing:AddProduct( CurrentCatID, 2302, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1

--Salkmaerian Paladin Helm
product = smithing:AddProduct( CurrentCatID, 2291, { 25, 45}, 1, { 23, 46 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Albarian Soldier's Helm
product = smithing:AddProduct( CurrentCatID, 2287, { 38, 58}, 1, { 29, 58 } );
product:AddProductionSteps( { 2535, 1, "all" }, 6 ); -- Iron Ingot: 6x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Flame Helmet
product = smithing:AddProduct( CurrentCatID, 2286, { 51, 71}, 1, { 36, 72 } );
product:AddProductionSteps( { 2535, 1, "all" }, 8 ); -- Iron Ingot: 8x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Round Steel Helmets
product = smithing:AddProduct( CurrentCatID, 2290, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1

--Steel Cap
product = smithing:AddProduct( CurrentCatID, 202, { 11, 31}, 1, { 16, 32 } );
product:AddProductionSteps( { 2535, 1, "all" }, 6 ); -- Iron Ingot: 6x1

--Steel Hat
product = smithing:AddProduct( CurrentCatID, 187, { 21, 41}, 1, { 21, 42 } );
product:AddProductionSteps( { 2535, 1, "all" }, 6 ); -- Iron Ingot: 6x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Pot Helmet
product = smithing:AddProduct( CurrentCatID, 94, { 31, 51}, 1, { 26, 52 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Visored Helm
product = smithing:AddProduct( CurrentCatID, 184, { 41, 61}, 1, { 31, 62 } );
product:AddProductionSteps( { 2535, 1, "all" }, 8 ); -- Iron Ingot: 8x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1

--Black Visored Helm
product = smithing:AddProduct( CurrentCatID, 185, { 51, 71}, 1, { 36, 72 } );
product:AddProductionSteps( { 2535, 1, "all" }, 9 ); -- Iron Ingot: 9x1
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

CurrentCatID = smithing:AddCategory( 4 ) -- Armours

--Light Blue Breastplate
product = smithing:AddProduct( CurrentCatID, 2407, { 72, 92}, 1, { 46, 92 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Light Mercenary Armour
product = smithing:AddProduct( CurrentCatID, 2359, { 82, 102}, 1, { 51, 102 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Light Elven Armour
product = smithing:AddProduct( CurrentCatID, 2399, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 2550, 1, "all" }, 4 ); -- Copper Ingot: 4x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 2554, 1, "all" }, 1 ); -- Pure Water

--Chain Shirt
product = smithing:AddProduct( CurrentCatID, 101, { 33, 53}, 1, { 27, 54 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1

--Dwarven State armour
product = smithing:AddProduct( CurrentCatID, 2390, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 176, 1, "all" }, 2 ); -- Grey Cloth: 2x1

--Elven Silversteel
product = smithing:AddProduct( CurrentCatID, 2403, { 53, 73}, 1, { 37, 74 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Lizard Armour
product = smithing:AddProduct( CurrentCatID, 696, { 63, 83}, 1, { 42, 84 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1
product:AddProductionSteps( { 176, 1, "all" }, 4 ); -- Grey Cloth: 4x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Salkmaerian Armour
product = smithing:AddProduct( CurrentCatID, 2389, { 73, 93}, 1, { 47, 94 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Salkmaerian Officers Armour
product = smithing:AddProduct( CurrentCatID, 2365, { 83, 103}, 1, { 52, 104 } );
product:AddProductionSteps( { 2535, 1, "all" }, 17 ); -- Iron Ingot: 17x1
product:AddProductionSteps( { 176, 1, "all" }, 6 ); -- Grey Cloth: 6x1
product:AddProductionSteps( { 2550, 1, "all" }, 4 ); -- Copper Ingot: 4x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Albarian Noble Armour
product = smithing:AddProduct( CurrentCatID, 2367, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 2535, 1, "all" }, 20 ); -- Iron Ingot: 20x1
product:AddProductionSteps( { 176, 1, "all" }, 7 ); -- Grey Cloth: 7x1
product:AddProductionSteps( { 2550, 1, "all" }, 5 ); -- Copper Ingot: 5x1
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 284, 1, "all" }, 3 ); -- Bluestone: 3x1
product:AddProductionSteps( { 198, 1, "all" }, 3 ); -- Topas: 3x1

--Plate Armour
product = smithing:AddProduct( CurrentCatID, 4, { 31, 51}, 1, { 26, 52 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 2547, 1, "all" }, 1 ); -- Leather: 1x1

--Steel Plate
product = smithing:AddProduct( CurrentCatID, 2364, { 41, 61}, 1, { 31, 62 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1
product:AddProductionSteps( { 176, 1, "all" }, 6 ); -- Grey Cloth: 6x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Albarian Steel Plate
product = smithing:AddProduct( CurrentCatID, 2369, { 51, 71}, 1, { 36, 72 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1
product:AddProductionSteps( { 176, 1, "all" }, 7 ); -- Grey Cloth: 7x1
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1

--Dwarvenplate
product = smithing:AddProduct( CurrentCatID, 2395, { 61, 81}, 1, { 41, 82 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 176, 1, "all" }, 8 ); -- Grey Cloth: 8x1
product:AddProductionSteps( { 2547, 1, "all" }, 4 ); -- Leather: 4x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1

--Nightplate
product = smithing:AddProduct( CurrentCatID, 2363, { 71, 91}, 1, { 46, 92 } );
product:AddProductionSteps( { 2535, 1, "all" }, 17 ); -- Iron Ingot: 17x1
product:AddProductionSteps( { 176, 1, "all" }, 9 ); -- Grey Cloth: 9x1
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 2550, 1, "all" }, 4 ); -- Copper Ingot: 4x1

--Shadowplate
product = smithing:AddProduct( CurrentCatID, 2357, { 81, 101}, 1, { 51, 102 } );
product:AddProductionSteps( { 2535, 1, "all" }, 20 ); -- Iron Ingot: 20x1
product:AddProductionSteps( { 176, 1, "all" }, 10 ); -- Grey Cloth: 10x1
product:AddProductionSteps( { 2547, 1, "all" }, 6 ); -- Leather: 6x1
product:AddProductionSteps( { 2550, 1, "all" }, 5 ); -- Copper Ingot: 5x1
product:AddProductionSteps( { 283, 1, "all" }, 5 ); -- Blackstone: 5x1

--Heavy Plate
product = smithing:AddProduct( CurrentCatID, 2393, { 90, 110}, 1, { 55, 110 } );
product:AddProductionSteps( { 2535, 1, "all" }, 25 ); -- Iron Ingot: 25x1
product:AddProductionSteps( { 176, 1, "all" }, 10 ); -- Grey Cloth: 10x1
product:AddProductionSteps( { 2547, 1, "all" }, 7 ); -- Leather: 7x1
product:AddProductionSteps( { 2550, 1, "all" }, 7 ); -- Copper Ingot: 7x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Merinium Ingot

--Lor-Angur Guardians
product = smithing:AddProduct( CurrentCatID, 2360, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 5 ); -- Copper Ingot: 5x1
product:AddProductionSteps( { 284, 1, "all" }, 3 ); -- Bluestone: 3x1

--Magical Elven Armour
product = smithing:AddProduct( CurrentCatID, 2400, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 176, 1, "all" }, 7 ); -- Grey Cloth: 7x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold: 3x1
product:AddProductionSteps( { 2550, 1, "all" }, 5 ); -- Copper Ingot: 5x1
product:AddProductionSteps( { 46, 1, "all" }, 3 ); -- Ruby: 3x1
product:AddProductionSteps( { 198, 1, "all" }, 3 ); -- Topas: 3x1

CurrentCatID = smithing:AddCategory(528) -- Gloves and Stuff

--Steel Gloves
product = smithing:AddProduct( CurrentCatID, 325, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1

--Salkmaerian steel gloves
product = smithing:AddProduct( CurrentCatID, 528, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1

--Dwarven Metal Gloves
product = smithing:AddProduct( CurrentCatID, 529, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1

--Albarian Steel Gloves
product = smithing:AddProduct( CurrentCatID, 530, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper: 2x1

--Knight Gloves
product = smithing:AddProduct( CurrentCatID, 531, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper: 3x1

--Short Chain Pants
product = smithing:AddProduct( CurrentCatID, 2112, { 57, 77}, 1, { 39, 78 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1

--Chain Pants
product = smithing:AddProduct( CurrentCatID, 2111, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1

--Short Iron Greaves
product = smithing:AddProduct( CurrentCatID, 2117, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1

--Steel Greaves
product = smithing:AddProduct( CurrentCatID, 2172, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

--Iron Greaves
product = smithing:AddProduct( CurrentCatID, 2116, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1

--Steel Boots
product = smithing:AddProduct( CurrentCatID, 326, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1

--Salkmaerian Steel Boots
product = smithing:AddProduct( CurrentCatID, 699, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2535, 1, "all" }, 10 ); -- Iron Ingot: 10x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper: 1x1

--Albarian Steel Boots
product = smithing:AddProduct( CurrentCatID, 771, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2535, 1, "all" }, 13 ); -- Iron Ingot: 13x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper: 2x1

--Knight Boots
product = smithing:AddProduct( CurrentCatID, 770, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2535, 1, "all" }, 15 ); -- Iron Ingot: 15x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper: 3x1
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1

CurrentCatID = smithing:AddCategory(230) --maces n other stuff

--Mace
product = smithing:AddProduct( CurrentCatID, 230, { 18, 38}, 1, { 19, 38 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2548, 1, "all" }, 1 ); -- Mace Handle: 1x1

--Morning Star
product = smithing:AddProduct( CurrentCatID, 2737, { 36, 56}, 1, { 28, 56 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2549, 1, "all" }, 1 ); -- Morning Star: 1x1

--Morning Star
product = smithing:AddProduct( CurrentCatID, 231, { 48, 68}, 1, { 34, 68 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 2549, 1, "all" }, 1 ); -- Morning Star: 1x1

--Warhammer
product = smithing:AddProduct( CurrentCatID, 226, { 72, 92}, 1, { 46, 92 } );
product:AddProductionSteps( { 2535, 1, "all" }, 9 ); -- Iron Ingot: 9x1
product:AddProductionSteps( { 2544, 1, "all" }, 1 ); -- Large Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

CurrentCatID = smithing:AddCategory(1) -- Slashing items

--Barbarian Axe
product = smithing:AddProduct( CurrentCatID, 2711, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Short Sword
product = smithing:AddProduct( CurrentCatID, 78, { 6, 26}, 1, { 13, 26 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Serinjah Sword
product = smithing:AddProduct( CurrentCatID, 1, { 9, 29}, 1, { 15, 30 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Battleaxe
product = smithing:AddProduct( CurrentCatID, 2946, { 15, 35}, 1, { 18, 36 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Orc Axe
product = smithing:AddProduct( CurrentCatID, 2642, { 19, 39}, 1, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Sabre
product = smithing:AddProduct( CurrentCatID, 25, { 23, 43}, 1, { 22, 44 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Scimitar
product = smithing:AddProduct( CurrentCatID, 2757, { 27, 47}, 1, { 24, 48 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Broadsword
product = smithing:AddProduct( CurrentCatID, 2658, { 31, 51}, 1, { 26, 52 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Longsword
product = smithing:AddProduct( CurrentCatID, 2701, { 39, 59}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Gilded Longsword
product = smithing:AddProduct( CurrentCatID, 84, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Coppered Longsword
product = smithing:AddProduct( CurrentCatID, 85, { 47, 67}, 1, { 34, 68 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Silvered Longsword
product = smithing:AddProduct( CurrentCatID, 98, { 51, 71}, 1, { 36, 72 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 104, 1, "all" }, 1 ); -- Silver Ingot: 1x1

--Merinium Plated Longsword
product = smithing:AddProduct( CurrentCatID, 123, { 55, 75}, 1, { 38, 76 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Merinium Ingot: 1x1

--Heavy Battleaxe
product = smithing:AddProduct( CurrentCatID, 2629, { 63, 83}, 1, { 42, 84 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Gilded Battleaxe
product = smithing:AddProduct( CurrentCatID, 124, { 67, 87}, 1, { 44, 88 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Coppered Battleaxe
product = smithing:AddProduct( CurrentCatID, 192, { 71, 91}, 1, { 46, 92 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Silvered Battleaxe
product = smithing:AddProduct( CurrentCatID, 229, { 75, 95}, 1, { 48, 96 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 104, 1, "all" }, 1 ); -- Silver Ingot: 1x1

--Merinium Plated Battleaxe
product = smithing:AddProduct( CurrentCatID, 296, { 79, 99}, 1, { 50, 100 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Merinium Ingot: 1x1

--Elvensword
product = smithing:AddProduct( CurrentCatID, 2778, { 82, 102}, 1, { 51, 102 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Dwarven Axe
product = smithing:AddProduct( CurrentCatID, 2660, { 85, 105}, 1, { 53, 106 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 198, 1, "all" }, 1 ); -- Topas: 1x1

--Snakesword
product = smithing:AddProduct( CurrentCatID, 2788, { 89, 109}, 1, { 55, 110 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- SwordHandle: 1x1
product:AddProductionSteps( { 197, 1, "all" }, 1 ); -- Amethyst: 1x1

--Elven rainbowsword
product = smithing:AddProduct( CurrentCatID, 2775, { 89, 109}, 1, { 55, 110 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 1 ); -- Ruby: 1x1
product:AddProductionSteps( { 284, 1, "all" }, 1 ); -- Bluestone: 1x1

--Fire Broadsword
product = smithing:AddProduct( CurrentCatID, 2656, { 92, 112}, 1, { 56, 112 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Fire Longsword
product = smithing:AddProduct( CurrentCatID, 206, { 94, 114}, 1, { 57, 114 } );
product:AddProductionSteps( { 2535, 1, "all" }, 6 ); -- Iron Ingot: 6x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Magical Serinjah Sword
product = smithing:AddProduct( CurrentCatID, 2693, { 96, 116}, 1, { 58, 116 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1

--Magical Broadsword
product = smithing:AddProduct( CurrentCatID, 2654, { 98, 118}, 1, { 59, 118 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1

--Magical Longsword
product = smithing:AddProduct( CurrentCatID, 2704, { 99, 119}, 1, { 60, 120 } );
product:AddProductionSteps( { 2535, 1, "all" }, 6 ); -- Iron Ingot: 6x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1
product:AddProductionSteps( { 2551, 1, "all" }, 1 ); -- Pure Air: 1x1

--Magical Dwarven Axe
product = smithing:AddProduct( CurrentCatID, 2662, { 100, 120}, 1, { 60, 120 } );
product:AddProductionSteps( { 2535, 1, "all" }, 7 ); -- Iron Ingot: 7x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Merinium Ingot: 1x1

CurrentCatID = smithing:AddCategory(189) -- stabby weapons

--Simple Dagger
product = smithing:AddProduct( CurrentCatID, 27, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1

--Dagger
product = smithing:AddProduct( CurrentCatID, 189, { 16, 36}, 1, { 18, 36 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1

--Ornate Dagger
product = smithing:AddProduct( CurrentCatID, 190, { 32, 52}, 1, { 26, 52 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1

--Gilded Dagger
product = smithing:AddProduct( CurrentCatID, 297, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1

--Silvered Dagger
product = smithing:AddProduct( CurrentCatID, 389, { 48, 68}, 1, { 34, 68 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 104, 1, "all" }, 1 ); -- Silver Ingot: 1x1

--Copped Dagger
product = smithing:AddProduct( CurrentCatID, 398, { 56, 76}, 1, { 38, 76 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Merinium Plated Dagger
product = smithing:AddProduct( CurrentCatID, 444, { 64, 84}, 1, { 42, 84 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 2571, 1, "all" }, 1 ); -- Merinium Ingot: 1x1

--Red Dagger
product = smithing:AddProduct( CurrentCatID, 2740, { 80, 100}, 1, { 50, 100 } );
product:AddProductionSteps( { 2535, 1, "all" }, 2 ); -- Iron Ingot: 2x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1

--Rapier
product = smithing:AddProduct( CurrentCatID, 2675, { 88, 108}, 1, { 54, 108 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Malachin Dagger
product = smithing:AddProduct( CurrentCatID, 91, { 93, 113}, 1, { 57, 114 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 2751, 1, "all" }, 1 ); -- Merinium: 1x1

--Red Fire Dagger
product = smithing:AddProduct( CurrentCatID, 2742, { 97, 117}, 1, { 59, 118 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Magical Dagger
product = smithing:AddProduct( CurrentCatID, 2671, { 100, 120}, 1, { 60, 120 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1
product:AddProductionSteps( { 2530, 1, "all" }, 1 ); -- Dagger Handle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 2751, 1, "all" }, 1 ); -- Merinium: 1x1

CurrentCatID = smithing:AddCategory(88) -- two handed slashing

--Executioner's Axe
product = smithing:AddProduct( CurrentCatID, 2723, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Long Staff Handle: 1x1

--Longaxe
product = smithing:AddProduct( CurrentCatID, 88, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 3 ); -- Iron Ingot: 3x1
product:AddProductionSteps( { 2544, 1, "all" }, 1 ); -- Large Handle: 1x1

--Halberd
product = smithing:AddProduct( CurrentCatID, 77, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2573, 1, "all" }, 1 ); -- Long Staff Handle: 1x1

--Bastard sword
product = smithing:AddProduct( CurrentCatID, 204, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Waraxe
product = smithing:AddProduct( CurrentCatID, 383, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2535, 1, "all" }, 4 ); -- Iron Ingot: 4x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Two-Handed Sword
product = smithing:AddProduct( CurrentCatID, 2731, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2584, 1, "all" }, 1 ); -- Sword Handle: 1x1

--Large Waraxe
product = smithing:AddProduct( CurrentCatID, 188, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Double Axe
product = smithing:AddProduct( CurrentCatID, 205, { 80, 100}, 1, { 50, 100 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1

--Firewaraxe
product = smithing:AddProduct( CurrentCatID, 2627, { 93, 113}, 1, { 57, 114 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1
product:AddProductionSteps( { 236, 1, "all" }, 1 ); -- Gold Ingot: 1x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Fireaxe
product = smithing:AddProduct( CurrentCatID, 2640, { 97, 117}, 1, { 59, 118 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 2 ); -- Copper Ingot: 2x1
product:AddProductionSteps( { 236, 1, "all" }, 2 ); -- Gold Ingot: 2x1
product:AddProductionSteps( { 2553, 1, "all" }, 1 ); -- Pure Fire: 1x1

--Magical Waraxe
product = smithing:AddProduct( CurrentCatID, 2626, { 100, 120}, 1, { 60, 120 } );
product:AddProductionSteps( { 2535, 1, "all" }, 5 ); -- Iron Ingot: 5x1
product:AddProductionSteps( { 2525, 1, "all" }, 1 ); -- AxeHandle: 1x1
product:AddProductionSteps( { 2550, 1, "all" }, 3 ); -- Copper Ingot: 3x1
product:AddProductionSteps( { 236, 1, "all" }, 3 ); -- Gold Ingot: 3x1
product:AddProductionSteps( { 2751, 1, "all" }, 1 ); -- Merinium: 1x1

CurrentCatID = smithing:AddCategory(294) -- throwing things and ammo

--Throwing Star
product = smithing:AddProduct( CurrentCatID, 294, { 10, 30}, 10, { 15, 30 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Throwing Axe
product = smithing:AddProduct( CurrentCatID, 2645, { 20, 40}, 5, { 20, 40 } );
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1 


        InitDone = true;
    end
    return smithing;
end


function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    Smithing = InitCraftingTool( );
    base.common.ResetInterruption( User, ltstate )
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

    if not base.common.CheckItem( User, SourceItem, {13} ) then
        Smithing:SwapToInactiveItem( User );
        return
    end

    if ( SourceItem:getType() ~= 4 ) then -- Hammer in der Hand
        base.common.InformNLS( User,
        "Du musst den Hammer in die Hand nehmen um damit zu arbeiten.",
        "You have to take the hammer in your hand, to work with it." );
        Smithing:SwapToInactiveItem( User );
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim schmieden.",
        "Your armour disturbs you while smithing." );
        Smithing:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if Smithing:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			Smithing:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        menstate[ User.id ]=1;
        if ( Smithing:GenerateMenu( User, SourceItem ) ) then
            Smithing:SwapToInactiveItem( User );
            return
        end
    end
    if (menstate[ User.id ] == 1) then
        Smithing:GenerateItemList( User, Param , SourceItem);
        menstate[ User.id ] = 2;
        Smithing:SwapToInactiveItem( User );
        return
    elseif (menstate[ User.id ] == 2) then
        Smithing:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
    end
end --function
