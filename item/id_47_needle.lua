-- Schneidern mit Nadel, Schneidertisch

-- UPDATE common SET com_script='item.id_47_needle' WHERE com_itemid IN (47);

require("item.general.wood")
require("item.base.crafts")

module("item.id_47_needle", package.seeall, package.seeall(item.general.wood))

-- Schneiderprodukte Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        tailoring = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                              LeadSkill = "tailoring",
                              LeadSkillGroup = 2,
                              DefaultFoodConsumption = 300,
                              DefaultRepair = true
                            };
                            
        tailoring:AddTool( 102 ); -- Schneidertisch
        tailoring:AddTool( 103 ); -- Schneidertisch
        
        tailoring:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        tailoring:AddInterruptMessage(
        "Du stichst dir mit der Nadel in den Finger.",
        "You sting yourself with the needle into your finger.");
        
        tailoring:AddInterruptMessage(
        "Du überprüfst kurz die Maße deiner Arbeit.",
        "You check some of your work's fine details.");
        
        tailoring:AddInterruptMessage(
        "Du bist dir einen Moment unschlüssig mit der Wahl des Materials, aber nach kurzer Überlegung entscheidest du dich doch das Material weiter zu benutzen.",
        "You think a moment about the material you use but then you decide to continue with your current materials.");
        
        tailoring:AddInterruptMessage(
        "Dir fällt die Nadel zu Boden und du musst sie kurz suchen.",
        "The needle falls to the floor and you need a while to find it again.");
        
        tailoring:AddInterruptMessage(
        "Du musst kurz unter den Stoffen nach der Schere suchen um den Faden abschneiden zu können.",
        "You search for a pair of scissors under the cloth.");
        
        tailoring:AddInterruptMessage(
        "Dir rutscht der Faden aus der Nadel, du benötigst einen Augenblick um ihn wieder einzufädeln.",
        "The thread slips out of the needle. You need a while to thread it again.");
        
        --------------------------------------------------------------------------------------------
        local CurrentCatID = tailoring:AddCategory( 832 ) --headware
        
		--Grey Hat with feather
local product = tailoring:AddProduct( CurrentCatID, 830, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 176, 1, "all" }, 2 ); -- Grey Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1

--Green Hat w Feather
product = tailoring:AddProduct( CurrentCatID, 831, { 44, 64}, 1, { 32, 64 } );
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 54, 1, "all" }, 2 ); -- Green Cloth: 2x1

--Red Hat with Feather
product = tailoring:AddProduct( CurrentCatID, 832, { 49, 69}, 1, { 35, 70 } );
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 174, 1, "all" }, 2 ); -- Red Cloth: 2x1

--Yellow Hat with Feather
product = tailoring:AddProduct( CurrentCatID, 829, { 53, 73}, 1, { 37, 74 } );
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 177, 1, "all" }, 2 ); -- Yellow Cloth: 2x1

--Blue hat with Feather
product = tailoring:AddProduct( CurrentCatID, 828, { 58, 78}, 1, { 39, 78 } );
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 179, 1, "all" }, 2 ); -- Blue Cloth: 2x1

--Red Wizard Hat
product = tailoring:AddProduct( CurrentCatID, 358, { 62, 82}, 1, { 41, 82 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Blue wizard hat
product = tailoring:AddProduct( CurrentCatID, 357, { 67, 87}, 1, { 44, 88 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Colourful Wizard Hat
product = tailoring:AddProduct( CurrentCatID, 370, { 71, 91}, 1, { 46, 92 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 108, 1, "all" }, 1 ); -- Topas: 1x1

--Expensive Wizard Hat
product = tailoring:AddProduct( CurrentCatID, 371, { 76, 96}, 1, { 48, 96 } );
product:AddProductionSteps( { 177, 1, "all" }, 2 ); -- Yellow Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 108, 1, "all" }, 1 ); -- Topas: 1x1

CurrentCatID = tailoring:AddCategory( 838 ) -- Dresses

--Grey Dress
product = tailoring:AddProduct( CurrentCatID, 802, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--White Dress
product = tailoring:AddProduct( CurrentCatID, 806, { 4, 24}, 1, { 12, 24 } );
product:AddProductionSteps( { 178, 1, "all" }, 3 ); -- White Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Green Dress
product = tailoring:AddProduct( CurrentCatID, 803, { 7, 27}, 1, { 14, 28 } );
product:AddProductionSteps( { 54, 1, "all" }, 3 ); -- Green Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Green Dress
product = tailoring:AddProduct( CurrentCatID, 836, { 9, 29}, 1, { 15, 30 } );
product:AddProductionSteps( { 54, 1, "all" }, 2 ); -- Green Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1

--Black Dress
product = tailoring:AddProduct( CurrentCatID, 805, { 13, 33}, 1, { 17, 34 } );
product:AddProductionSteps( { 175, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black White Dress
product = tailoring:AddProduct( CurrentCatID, 838, { 15, 35}, 1, { 18, 36 } );
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 175, 1, "all" }, 2 ); -- Black Cloth: 2x1

--Red Dress
product = tailoring:AddProduct( CurrentCatID, 804, { 16, 36}, 1, { 18, 36 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Red Dress
product = tailoring:AddProduct( CurrentCatID, 837, { 18, 38}, 1, { 19, 38 } );
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 174, 1, "all" }, 2 ); -- Red Cloth: 2x1

--Yellow Dress
product = tailoring:AddProduct( CurrentCatID, 801, { 21, 41}, 1, { 21, 42 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Yellow Dress
product = tailoring:AddProduct( CurrentCatID, 834, { 23, 43}, 1, { 22, 44 } );
product:AddProductionSteps( { 175, 1, "all" }, 2 ); -- Black Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1

--Black Yellow Dress
product = tailoring:AddProduct( CurrentCatID, 835, { 27, 47}, 1, { 24, 48 } );
product:AddProductionSteps( { 175, 1, "all" }, 2 ); -- Black Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1

--Blue Dress
product = tailoring:AddProduct( CurrentCatID, 385, { 29, 49}, 1, { 25, 50 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Blue Dress
product = tailoring:AddProduct( CurrentCatID, 833, { 32, 52}, 1, { 26, 52 } );
product:AddProductionSteps( { 175, 1, "all" }, 2 ); -- Black Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 179, 1, "all" }, 1 ); -- Blue Cloth: 1x1

--Blue Dress
product = tailoring:AddProduct( CurrentCatID, 800, { 34, 54}, 1, { 27, 54 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Grey Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 850, { 36, 56}, 1, { 28, 56 } );
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--White Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 852, { 38, 58}, 1, { 29, 58 } );
product:AddProductionSteps( { 178, 1, "all" }, 5 ); -- White Cloth: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Black Red Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 851, { 39, 59}, 1, { 30, 60 } );
product:AddProductionSteps( { 175, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 174, 1, "all" }, 2 ); -- Red Cloth: 2x1

--Red Yellow Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 849, { 41, 61}, 1, { 31, 62 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 177, 1, "all" }, 2 ); -- Yellow Cloth: 2x1

--Yellow Green Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 848, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 54, 1, "all" }, 2 ); -- Green Cloth: 2x1

--Yellow Blue Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 847, { 45, 65}, 1, { 33, 66 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 179, 1, "all" }, 2 ); -- Blue Cloth: 2x1

--Blue Green Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 845, { 46, 66}, 1, { 33, 66 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 54, 1, "all" }, 2 ); -- Green Cloth: 2x1

--Blue Red Heraldic Dress
product = tailoring:AddProduct( CurrentCatID, 846, { 48, 68}, 1, { 34, 68 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 174, 1, "all" }, 2 ); -- Red Cloth: 2x1

CurrentCatID = tailoring:AddCategory(841) -- Skirts

--Grey White Skirt
product = tailoring:AddProduct( CurrentCatID, 841, { 2, 22}, 1, { 11, 22 } );
product:AddProductionSteps( { 176, 1, "all" }, 1 ); -- Grey Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1

--Green White Skirt
product = tailoring:AddProduct( CurrentCatID, 842, { 5, 25}, 1, { 13, 26 } );
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 54, 1, "all" }, 1 ); -- Green Cloth: 1x1

--Black White Skirt
product = tailoring:AddProduct( CurrentCatID, 844, { 11, 31}, 1, { 16, 32 } );
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1

--Red White Skirt
product = tailoring:AddProduct( CurrentCatID, 843, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 174, 1, "all" }, 1 ); -- Red Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1

--Yellow White Skirt
product = tailoring:AddProduct( CurrentCatID, 840, { 25, 45}, 1, { 23, 46 } );
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1

--Blue White Skirt
product = tailoring:AddProduct( CurrentCatID, 839, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 179, 1, "all" }, 2 ); -- Blue Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1

CurrentCatID = tailoring:AddCategory( 816 ) --Man clothes

--Grey Tunic
product = tailoring:AddProduct( CurrentCatID, 816, { 1, 21}, 1, { 11, 22 } );
product:AddProductionSteps( { 176, 1, "all" }, 4 ); -- Grey Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Grey Doublet
product = tailoring:AddProduct( CurrentCatID, 809, { 4, 24}, 1, { 12, 24 } );
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--White Tunic
product = tailoring:AddProduct( CurrentCatID, 820, { 6, 26}, 1, { 13, 26 } );
product:AddProductionSteps( { 178, 1, "all" }, 4 ); -- White Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--White Doublet
product = tailoring:AddProduct( CurrentCatID, 813, { 9, 29}, 1, { 15, 30 } );
product:AddProductionSteps( { 178, 1, "all" }, 3 ); -- White Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Green Shirt
product = tailoring:AddProduct( CurrentCatID, 457, { 12, 32}, 1, { 16, 32 } );
product:AddProductionSteps( { 54, 1, "all" }, 3 ); -- Green Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Green Doublet
product = tailoring:AddProduct( CurrentCatID, 810, { 14, 34}, 1, { 17, 34 } );
product:AddProductionSteps( { 54, 1, "all" }, 3 ); -- Green Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Green Tunic
product = tailoring:AddProduct( CurrentCatID, 817, { 17, 37}, 1, { 19, 38 } );
product:AddProductionSteps( { 54, 1, "all" }, 4 ); -- Green Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Black Shirt
product = tailoring:AddProduct( CurrentCatID, 182, { 19, 39}, 1, { 20, 40 } );
product:AddProductionSteps( { 182, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Doublet
product = tailoring:AddProduct( CurrentCatID, 812, { 22, 42}, 1, { 21, 42 } );
product:AddProductionSteps( { 182, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Black Tunic
product = tailoring:AddProduct( CurrentCatID, 819, { 25, 45}, 1, { 23, 46 } );
product:AddProductionSteps( { 182, 1, "all" }, 4 ); -- Black Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Red Shirt
product = tailoring:AddProduct( CurrentCatID, 180, { 27, 47}, 1, { 24, 48 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Red Doublet
product = tailoring:AddProduct( CurrentCatID, 811, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Red Tunic
product = tailoring:AddProduct( CurrentCatID, 818, { 33, 53}, 1, { 27, 54 } );
product:AddProductionSteps( { 174, 1, "all" }, 4 ); -- Red Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Yellow Shirt
product = tailoring:AddProduct( CurrentCatID, 458, { 35, 55}, 1, { 28, 56 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Yellow Doublet
product = tailoring:AddProduct( CurrentCatID, 808, { 38, 58}, 1, { 29, 58 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

--Yellow Tunic
product = tailoring:AddProduct( CurrentCatID, 815, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 177, 1, "all" }, 4 ); -- Yellow Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Blue Tunic
product = tailoring:AddProduct( CurrentCatID, 814, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 179, 1, "all" }, 4 ); -- Blue Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Blue Shirt
product = tailoring:AddProduct( CurrentCatID, 181, { 46, 66}, 1, { 33, 66 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Blue Doublet
product = tailoring:AddProduct( CurrentCatID, 807, { 48, 68}, 1, { 34, 68 } );
product:AddProductionSteps( { 179, 1, "all" }, 4 ); -- Blue Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2550, 1, "all" }, 1 ); -- Copper Ingot: 1x1

CurrentCatID = tailoring:AddCategory( 48 ) -- Leather gloves and hats

--Leather Gloves
product = tailoring:AddProduct( CurrentCatID, 48, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Studded Leather Gloves
product = tailoring:AddProduct( CurrentCatID, 526, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2535, 1, "all" }, 1 ); -- Iron Ingot: 1x1

--Serinjah Leather Gloves
product = tailoring:AddProduct( CurrentCatID, 527, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2547, 1, "all" }, 4 ); -- Leather: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Slouch Hat
product = tailoring:AddProduct( CurrentCatID, 356, { 0, 20}, 1, { 10, 20 } );
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Thief Gloves
product = tailoring:AddProduct( CurrentCatID, 384, { 20, 40}, 1, { 20, 40 } );
product:AddProductionSteps( { 178, 1, "all" }, 3 ); -- White Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Cloth Gloves
product = tailoring:AddProduct( CurrentCatID, 2295, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 178, 1, "all" }, 4 ); -- White Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

CurrentCatID = tailoring:AddCategory( 363 ) --Chest armours

--Leather Scale Armour
product = tailoring:AddProduct( CurrentCatID, 363, { 32, 52}, 1, { 26, 52 } );
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Half Leather Armour
product = tailoring:AddProduct( CurrentCatID, 365, { 42, 62}, 1, { 31, 62 } );
product:AddProductionSteps( { 2547, 1, "all" }, 6 ); -- Leather: 6x1
product:AddProductionSteps( { 50, 2, "all" }, 6 ); -- Thread: 6x2

--Light Hunting Armour
product = tailoring:AddProduct( CurrentCatID, 364, { 52, 72}, 1, { 36, 72 } );
product:AddProductionSteps( { 2547, 1, "all" }, 6 ); -- Leather: 6x1
product:AddProductionSteps( { 50, 2, "all" }, 6 ); -- Thread: 6x2

--Full Leatherarmour
product = tailoring:AddProduct( CurrentCatID, 362, { 62, 82}, 1, { 41, 82 } );
product:AddProductionSteps( { 2547, 1, "all" }, 7 ); -- Leather: 7x1
product:AddProductionSteps( { 50, 2, "all" }, 7 ); -- Thread: 7x2
product:AddProductionSteps( { 2586, 1, "all" }, 2 ); -- Fur: 2x1

CurrentCatID = tailoring:AddCategory( 196 ) --coats and robes

--Grey Coat
product = tailoring:AddProduct( CurrentCatID, 196, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 176, 1, "all" }, 5 ); -- Grey Cloth: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Grey Priest Robe
product = tailoring:AddProduct( CurrentCatID, 2418, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 176, 1, "all" }, 4 ); -- Grey Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--White Priest Robe
product = tailoring:AddProduct( CurrentCatID, 2421, { 46, 66}, 1, { 33, 66 } );
product:AddProductionSteps( { 178, 1, "all" }, 4 ); -- White Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Green Robe
product = tailoring:AddProduct( CurrentCatID, 55, { 48, 68}, 1, { 34, 68 } );
product:AddProductionSteps( { 54, 1, "all" }, 4 ); -- Green Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Black Robe
product = tailoring:AddProduct( CurrentCatID, 194, { 51, 71}, 1, { 36, 72 } );
product:AddProductionSteps( { 175, 1, "all" }, 4 ); -- Black Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Black Cult Robe
product = tailoring:AddProduct( CurrentCatID, 2378, { 54, 74}, 1, { 37, 74 } );
product:AddProductionSteps( { 175, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2
product:AddProductionSteps( { 174, 1, "all" }, 1 ); -- Red Cloth: 1x1

--Black Coat
product = tailoring:AddProduct( CurrentCatID, 2384, { 57, 77}, 1, { 39, 78 } );
product:AddProductionSteps( { 175, 1, "all" }, 5 ); -- Black Cloth: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Black Priest Robe
product = tailoring:AddProduct( CurrentCatID, 2420, { 59, 79}, 1, { 40, 80 } );
product:AddProductionSteps( { 175, 1, "all" }, 4 ); -- Black Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Novice Mage Robe
product = tailoring:AddProduct( CurrentCatID, 547, { 62, 82}, 1, { 41, 82 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1

--Red Priest Robe
product = tailoring:AddProduct( CurrentCatID, 2419, { 65, 85}, 1, { 43, 86 } );
product:AddProductionSteps( { 174, 1, "all" }, 4 ); -- Red Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Red Mage Robe
product = tailoring:AddProduct( CurrentCatID, 2377, { 68, 88}, 1, { 44, 88 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1

--Yellow Robe
product = tailoring:AddProduct( CurrentCatID, 195, { 71, 91}, 1, { 46, 92 } );
product:AddProductionSteps( { 177, 1, "all" }, 4 ); -- Yellow Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Yellow Priest Robe
product = tailoring:AddProduct( CurrentCatID, 368, { 73, 93}, 1, { 47, 94 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2
product:AddProductionSteps( { 178, 1, "all" }, 1 ); -- White Cloth: 1x1

--Brown Priest Robe
product = tailoring:AddProduct( CurrentCatID, 2416, { 76, 96}, 1, { 48, 96 } );
product:AddProductionSteps( { 174, 1, "all" }, 2 ); -- Red Cloth: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2
product:AddProductionSteps( { 177, 1, "all" }, 2 ); -- Yellow Cloth: 2x1

--Blue Robe
product = tailoring:AddProduct( CurrentCatID, 193, { 79, 99}, 1, { 50, 100 } );
product:AddProductionSteps( { 179, 1, "all" }, 4 ); -- Blue Cloth: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Blue Coat
product = tailoring:AddProduct( CurrentCatID, 2380, { 82, 102}, 1, { 51, 102 } );
product:AddProductionSteps( { 179, 1, "all" }, 5 ); -- Blue Cloth: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Mage Robe
product = tailoring:AddProduct( CurrentCatID, 548, { 84, 104}, 1, { 52, 104 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 177, 1, "all" }, 1 ); -- Yellow Cloth: 1x1
product:AddProductionSteps( { 175, 1, "all" }, 1 ); -- Black Cloth: 1x1
product:AddProductionSteps( { 46, 1, "all" }, 2 ); -- Ruby: 2x1
product:AddProductionSteps( { 198, 1, "all" }, 2 ); -- Topas: 2x1
product:AddProductionSteps( { 285, 1, "all" }, 2 ); -- Diamond: 2x1

--Master Mage Robe
product = tailoring:AddProduct( CurrentCatID, 558, { 87, 107}, 1, { 54, 108 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 6 ); -- Thread: 6x2
product:AddProductionSteps( { 177, 1, "all" }, 2 ); -- Yellow Cloth: 2x1
product:AddProductionSteps( { 285, 1, "all" }, 3 ); -- Diamond: 3x1
product:AddProductionSteps( { 284, 1, "all" }, 3 ); -- Bluestone: 3x1
product:AddProductionSteps( { 283, 1, "all" }, 3 ); -- Blackstone: 3x1

CurrentCatID = tailoring:AddCategory( 366 ) -- leggings

--Short Leather Legs
product = tailoring:AddProduct( CurrentCatID, 367, { 30, 50}, 1, { 25, 50 } );
product:AddProductionSteps( { 2547, 1, "all" }, 4 ); -- Leather: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Leather Legs
product = tailoring:AddProduct( CurrentCatID, 366, { 43, 63}, 1, { 32, 64 } );
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

--Short Fur trousers
product = tailoring:AddProduct( CurrentCatID, 2114, { 56, 76}, 1, { 38, 76 } );
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 2586, 1, "all" }, 2 ); -- Fur: 2x1

--Fur Trousers
product = tailoring:AddProduct( CurrentCatID, 2113, { 69, 89}, 1, { 45, 90 } );
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2
product:AddProductionSteps( { 2586, 1, "all" }, 5 ); -- Fur: 5x1

CurrentCatID = tailoring:AddCategory( 827 ) -- Pants

--Grey Trousers
product = tailoring:AddProduct( CurrentCatID, 823, { 1, 21}, 1, { 11, 22 } );
product:AddProductionSteps( { 176, 1, "all" }, 3 ); -- Grey Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--White Trousers
product = tailoring:AddProduct( CurrentCatID, 827, { 4, 24}, 1, { 12, 24 } );
product:AddProductionSteps( { 178, 1, "all" }, 3 ); -- White Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Green Trousers
product = tailoring:AddProduct( CurrentCatID, 183, { 8, 28}, 1, { 14, 28 } );
product:AddProductionSteps( { 54, 1, "all" }, 3 ); -- Green Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Green Trousers
product = tailoring:AddProduct( CurrentCatID, 824, { 11, 31}, 1, { 16, 32 } );
product:AddProductionSteps( { 54, 1, "all" }, 3 ); -- Green Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Trousers
product = tailoring:AddProduct( CurrentCatID, 34, { 14, 34}, 1, { 17, 34 } );
product:AddProductionSteps( { 175, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Black Trousers
product = tailoring:AddProduct( CurrentCatID, 826, { 18, 38}, 1, { 19, 38 } );
product:AddProductionSteps( { 175, 1, "all" }, 3 ); -- Black Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Red Trousers
product = tailoring:AddProduct( CurrentCatID, 459, { 21, 41}, 1, { 21, 42 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Red Trousers
product = tailoring:AddProduct( CurrentCatID, 825, { 24, 44}, 1, { 22, 44 } );
product:AddProductionSteps( { 174, 1, "all" }, 3 ); -- Red Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Yellow Trousers
product = tailoring:AddProduct( CurrentCatID, 460, { 28, 48}, 1, { 24, 48 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Yellow Trousers
product = tailoring:AddProduct( CurrentCatID, 822, { 31, 51}, 1, { 26, 52 } );
product:AddProductionSteps( { 177, 1, "all" }, 3 ); -- Yellow Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Blue Trousers
product = tailoring:AddProduct( CurrentCatID, 461, { 34, 54}, 1, { 27, 54 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Blue Trousers
product = tailoring:AddProduct( CurrentCatID, 821, { 38, 58}, 1, { 29, 58 } );
product:AddProductionSteps( { 179, 1, "all" }, 3 ); -- Blue Cloth: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

CurrentCatID = tailoring:AddCategory( 369 ) -- Footwear

--Leather Shoes
product = tailoring:AddProduct( CurrentCatID, 369, { 40, 60}, 1, { 30, 60 } );
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2

--Leather Boots
product = tailoring:AddProduct( CurrentCatID, 53, { 50, 70}, 1, { 35, 70 } );
product:AddProductionSteps( { 2547, 1, "all" }, 4 ); -- Leather: 4x1
product:AddProductionSteps( { 50, 2, "all" }, 4 ); -- Thread: 4x2

--Fur Boots
product = tailoring:AddProduct( CurrentCatID, 697, { 60, 80}, 1, { 40, 80 } );
product:AddProductionSteps( { 2547, 1, "all" }, 3 ); -- Leather: 3x1
product:AddProductionSteps( { 50, 2, "all" }, 3 ); -- Thread: 3x2
product:AddProductionSteps( { 2586, 1, "all" }, 2 ); -- Fur: 2x1

--Serinjah Leather Boots
product = tailoring:AddProduct( CurrentCatID, 698, { 70, 90}, 1, { 45, 90 } );
product:AddProductionSteps( { 2547, 1, "all" }, 5 ); -- Leather: 5x1
product:AddProductionSteps( { 50, 2, "all" }, 5 ); -- Thread: 5x2

CurrentCatID = tailoring:AddCategory( 89 ) --slings, and more slings

--Sling
product = tailoring:AddProduct( CurrentCatID, 89, { 10, 30}, 1, { 15, 30 } );
product:AddProductionSteps( { 2547, 1, "all" }, 2 ); -- Leather: 2x1
product:AddProductionSteps( { 50, 2, "all" }, 2 ); -- Thread: 2x2 
		
        
        InitDone = true;
    end
    return tailoring;
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    base.common.ResetInterruption( User, ltstate );
    Tailoring = InitCraftingTool( );
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
        Tailoring:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end

    if menstate[ User.id ]==nil then                           -- menustatus initialisieren.
        menstate[ User.id ]=0;
    end
    
    if not Tailoring:LocationFine( User, ltstate ) then
        return
    end
    
    if not base.common.CheckItem( User, SourceItem ) then
        Tailoring:SwapToInactiveItem( User );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Hammer in der Hand
        base.common.InformNLS( User, 
        "Du musst die Nagel in die Hand nehmen um damit zu arbeiten.", 
        "You have to take the needle in your hand, to work with it." )
        return
    end

    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim schneidern.",
        "Your armour disturbs you while tailoring." );
        Tailoring:SwapToInactiveItem( User );
        return
    end

    local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if TargetItem then
		if Tailoring:IsProduct(TargetItem.id) then
			base.common.InformNLS( User,
			"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
			"You try to work on the item in your hand." );
			Tailoring:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
			return;
		end
	end

    if (Param == 0) then
        menstate[ User.id ]=1;
        if ( Tailoring:GenerateMenu( User, SourceItem ) ) then
            Tailoring:SwapToInactiveItem( User );
            return
        end
    end
    if (menstate[ User.id ] == 1) then
        Tailoring:GenerateItemList( User, Param , SourceItem);
        menstate[ User.id ] = 2;
        Tailoring:SwapToInactiveItem( User );
        return
    elseif (menstate[ User.id ] == 2) then
        if (Param == 97) then
            if (User:countItemAt("all",50) < 2) then
                base.common.InformNLS( User,
                "Du braucht mehr Garn um eine Tasche zu fertigen.",
                "You need more yarn to make a bag.");
                return
            end
        end
        Tailoring:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
        if ((Param == 97) and (ltstate == Action.success)) then
            User:eraseItem(50,2);
        end
    end
end --function
