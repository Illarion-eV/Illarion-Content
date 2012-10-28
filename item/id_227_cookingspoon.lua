-- Kochen und Brauen mit Kessel und Fass

-- UPDATE common SET com_script='item.id_227_cookingspoon' WHERE com_itemid IN (227);

require("item.general.wood")
require("item.base.crafts")

module("item.id_227_cookingspoon", package.seeall, package.seeall(item.general.wood))

-- Kochen und Brauen Initieren Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        cooking = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                             LeadSkill = "cookingAndBaking",
                             LeadSkillGroup = 2,
                             DefaultFoodConsumption = 100,
                             DefaultRepair = false,
                             DefaultSfx = { 7, 15 }
                           };
        
        brewing = item.base.crafts.Craft:new{ LeadAttrib = "dexterity",
                             LeadSkill = "cookingAndBaking",
                             LeadSkillGroup = 2,
                             DefaultFoodConsumption = 100,
                             DefaultRepair = false,
                             DefaultSfx = { 10, 15 }
                           };

		
        cooking:AddTool( 2488 ); -- Kettle
        brewing:AddTool( 339 ); -- Weinfass
        
        cooking:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        cooking:AddInterruptMessage(
        "Du hältst einen Moment inne und überlegst eine zusätzliche Zutat in das Rezept einbringen sollst, entscheidest dich aber dagegen.",
        "You hesitate and consider to add additional ingredients to the recipe. Finally, you revise your decision.");
        
        cooking:AddInterruptMessage(
        "Du probierst die Speise und überlegst ob du noch etwas nachwürzen solltest.",
        "You taste the dish and consider adding some additional spices.");
        
        cooking:AddInterruptMessage(
        "Du wäscht kurz das benutzte Geschirr ab bevor du weiter machst.",
        "You wash some dishes before continuing.");
        
        brewing:AddInterruptMessage(
        "Du wischst dir den Schweiß von der Stirn.",
        "You wipe sweat off your forehead.");
        
        brewing:AddInterruptMessage(
        "Du hältst einen Moment inne und überlegst eine zusätzliche Zutat in das Rezept einbringen sollst, entscheidest dich aber dagegen.",
        "You consider adding a secret ingredient to your brew, but can't remember it.");
        
        brewing:AddInterruptMessage(
        "Du rüttelst ein wenig am Gärbehälter um den Gärprozess im Gang zu halten.",
        "You shake slightly at the fermentation vessel.");
        
        brewing:AddInterruptMessage(
        "Du spülst die Flaschen mit heißem Wasser aus damit keine ungewollten 'Zutaten' in das Getränk gelangen.",
        "You scald some bottles in hot water to avoid spoiling the taste.");
        
        --------------------------------------------------------------------------------------------
        local CurrentCatID = cooking:AddCategory( 2935 ) -- Suppenschüssel ( Suppen )
        
        ---------------- MUSHROOM SOUP - 2456 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2456, {7, 27 }, 1, { 7, 14 } );
        product:AddProductionSteps( {2935, 1, "all" }, 1, nil, { 2935, 1, 80 } ); -- Step 1: Soup Bowl (2935) 1x         
        product:AddProductionSteps( {  52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Step 2: Bucket with water (52) 1x
        product:AddProductionSteps( { 163, 5, "all" }, 1 ); -- Step 3: Champignon(163) 5x
        -------------- PILZSUPPE - DONE ----------------


        ---------------- ONION SOUP - 2923 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2923, {15, 35 }, 1, { 9, 18 } );
        product:AddProductionSteps( {2935, 1, "all" }, 1, nil, { 2935, 1, 80 } ); -- Step 1: Soup Bowl (2935) 1x
        product:AddProductionSteps( {  52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Step 2: Bucket with water (52) 1x
        product:AddProductionSteps( { 201, 5, "all" }, 1 ); -- Step 3: Onion (201) 5x
        -------------- ONION SOUP - DONE ----------------


        ---------------- CABBAGE STEW - 2278 ----------------------
        local product = cooking:AddProduct( CurrentCatID, 2278, {30, 50 }, 1, { 12, 24 } );
        product:AddProductionSteps( {2935, 1, "all" }, 1, nil, { 2935, 1, 80 } ); -- Step 1: Soup Bowl (2935) 1x
        product:AddProductionSteps( {  52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Step 2: Bucket with water (52) 1x
        product:AddProductionSteps( { 290, 5, "all" }, 1 ); -- Step 3: Cabbage (290) 5x
        -------------- CABBAGE STEW - DONE ----------------
     
       
        ---------------- MULLIGAN - 2276 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2276, {40, 60 }, 1, { 15, 30 } );
        product:AddProductionSteps( {2935, 1, "all" }, 1, nil, { 2935, 1, 80 } ); -- Step 1: Soup Bowl (2935) 1x
        product:AddProductionSteps( {  52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Step 2: Bucket with water (52) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( {2493, 1, "all" }, 1 ); -- Step 4: Carrots(2493) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 5: Tomatoe(200) 1x

        --------------------------------------------------------------------------------------------
        local CurrentCatID = cooking:AddCategory( 2952 ) -- Teller ( Tellergerichte )

        ---------------- SAUSAGE - 3051 ----------------------
        product = cooking:AddProduct( CurrentCatID, 3051, {0, 20 }, 2, { 5, 10 } );
        product:AddProductionSteps( { 307, 1, "all" }, 1 ); -- Step 1: Pork(307) 1x
        product:AddProductionSteps( {  63, 1, "all" }, 1 ); -- Step 2: Insides(63) 1x
        -------------- SAUSAGE - DONE ----------------

        
        ---------------- STEAK - 2940 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2940, {5, 25 }, 1, { 6, 12 } );
        product:AddProductionSteps( { 307, 1, "all" }, 1 ); -- Step 1: Pork(307) 1x
        -------------- STEAK - DONE ----------------

        
        ---------------- FISH FILET - 2459 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2459, {20, 40 }, 1, { 15, 30 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( {  73, 1, "all" }, 1 ); -- Step 2: Trout(73) 1x
        product:AddProductionSteps( { 290, 1, "all" }, 1 ); -- Step 3: Cabbage (290) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 4: Tomatoe(200) 1x
        -------------- FISH FILET - DONE ----------------


        ---------------- SALMON DISH - 556 ----------------------
        product = cooking:AddProduct( CurrentCatID, 556, {35, 55 }, 1, { 14, 28 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( { 355, 1, "all" }, 1 ); -- Step 2: Salmon(355) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 4: Tomatoe(200) 1x
        -------------- SALMON DISH - DONE ----------------

      
        ---------------- MEAT DISH - 2277 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2277, {50, 70 }, 1, { 17, 34 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( { 307, 1, "all" }, 1 ); -- Step 2: Pork(307) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( {2493, 1, "all" }, 1 ); -- Step 4: Carrots(2493) 1x
        -------------- MEAT DISH - DONE ----------------


        ---------------- SAUSAGE DISH - 2922 ----------------------
        product = cooking:AddProduct( CurrentCatID, 2922, {60, 80 }, 1, { 20, 40 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( {3051, 1, "all" }, 1 ); -- Step 2: Sausage(3051) 1x
        product:AddProductionSteps( {2493, 1, "all" }, 1 ); -- Step 3: Carrots(2493) 1x
        product:AddProductionSteps( { 290, 1, "all" }, 1 ); -- Step 4: Cabbage (290) 1x
        -------------- SAUSAGE DISH - DONE ----------------


        ---------------- STEAK DISH - 557 ----------------------
        product = cooking:AddProduct( CurrentCatID, 557, {65, 85 }, 1, { 21, 42 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( {2940, 1, "all" }, 1 ); -- Step 2: Steak(2940) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 4: Tomatoe(200) 1x
        -------------- STEAK DISH - DONE ----------------

        
        ---------------- RABBIT DISH - 555 ----------------------
        product = cooking:AddProduct( CurrentCatID, 555, {75, 95 }, 1, { 24, 48 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( { 553, 1, "all" }, 1 ); -- Step 2: Rabbit meat(553) 1x
        product:AddProductionSteps( {2493, 1, "all" }, 1 ); -- Step 3: Carrots(2493) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 4: Tomatoe(200) 1x
        product:AddProductionSteps( { 290, 1, "all" }, 1 ); -- Step 5: Cabbage (290) 1x
        -------------- BUNNY DISH - DONE ----------------
        
        
        ---------------- LAMB DISH - 559 ----------------------
        product = cooking:AddProduct( CurrentCatID, 559, {85, 100 }, 1, { 26, 52 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( {2934, 1, "all" }, 1 ); -- Step 2: Lamb meat(2934) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( {2493, 1, "all" }, 1 ); -- Step 4: Carrots(2493) 1x
        product:AddProductionSteps( { 200, 1, "all" }, 1 ); -- Step 5: Tomatoe(200) 1x
        -------------- LAMB DISH - DONE ----------------

        
        ---------------- VENISON DISH - 554 ----------------------
        product = cooking:AddProduct( CurrentCatID, 554, {90, 100 }, 1, { 27, 54 } );
        product:AddProductionSteps( {2952, 1, "all" }, 1, nil, { 2952, 1, 80 } ); -- Step 1: Plate(2952) 1x
        product:AddProductionSteps( { 552, 1, "all" }, 1 ); -- Step 2: Deer meat(552) 1x
        product:AddProductionSteps( { 201, 1, "all" }, 1 ); -- Step 3: Onion (201) 1x
        product:AddProductionSteps( { 290, 1, "all" }, 1 ); -- Step 4: Cabbage (290) 1x
        product:AddProductionSteps( {  81, 5, "all" }, 1 ); -- Step 5: Berries(81) 5x
        -------------- VENISON DISH - DONE ----------------
        
        -----------------------------------------------------------------------------------------------------
        --#################################################################################################--
        -----------------------------------------------------------------------------------------------------
        
		local CurrentCatID = brewing:AddCategory( 2501 ) -- Bierflasche(2501), Leichte Alkoholika 
		
        ------------------- FLASCHE MIT CIDER - 2499 -------------------------- 
        product = brewing:AddProduct( CurrentCatID, 2499, { 0, 20 }, 1, { 5, 10 } );
        product:AddProductionSteps( { 2498, 1, "all" }, 1, nil, { 2498, 1, 70 }  ); -- Schritt 4: leere Flasche(2498) 1x
        product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 3: Eimer mit Wasser(52) 1x
        product:AddProductionSteps( {   15, 1, "all" }, 3 ); -- Schritte 1 - 2: Apfel(15) 2x
        ------------------ FLASCHE MIT CIDER - FERTIG ------------------------- 
        
        -------------------- FLASCHE MIT MET - 2497 ---------------------------
        product = brewing:AddProduct( CurrentCatID, 2497, { 15, 30 }, 1, { 9, 18 } );
        product:AddProductionSteps( { 2498, 1, "all" }, 1, nil, { 2498, 1, 70 }  ); -- Schritt 5: leere Flasche(2498) 1x
        product:AddProductionSteps( { 2529, 1, "all" }, 3 ); -- Schritte 1 - 3: Honigwaben(2529) 2x
        product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT MET - FERTIG --------------------------
        
        ------------------- FLASCHE MIT BIER - 2501 ---------------------------
        product = brewing:AddProduct( CurrentCatID, 2501, {32, 50 }, 1, { 12, 24 } );
        product:AddProductionSteps( { 2498, 1, "all" }, 1, nil, { 2498, 1, 70 }  ); -- Schritt 7: leere Flasche(2498) 1x
        product:AddProductionSteps( {  259, 1, "all" }, 2 ); -- Schritte 1 - 2: Getreide(259) 1x
        product:AddProductionSteps( {  154, 1, "all" }, 1 ); -- Schritte 3 - 4: Hopfen(154) 1x
        product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------ FLASCHE MIT BIER - FERTIG --------------------------
        
        ------------------- FLASCHE MIT WEIN - 2500 ---------------------------
        product = brewing:AddProduct( CurrentCatID, 2500, {47, 65 }, 2, { 16, 32 } );
        product:AddProductionSteps( { 2498, 1, "all" }, 1, nil, { 2498, 1, 70 }  ); -- Schritt 5: leere Flasche(2498) 1x
        product:AddProductionSteps( {  388, 1, "all" }, 3 ); -- Schritte 1 - 3: Weinbeeren(388) 2x
        product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------ FLASCHE MIT WEIN - FERTIG --------------------------       
        
		local CurrentCatID = brewing:AddCategory( 517 ) -- Das harte Zeug 
		
		------------------- FLASCHE MIT RUM - 517 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 517, {52, 70 }, 1, { 17, 34 } );
		product:AddProductionSteps( { 518, 1, "all" }, 1, nil, { 518, 1, 70 }  ); -- Schritt 6: leere Flasche(1317) 1x
		product:AddProductionSteps( {  778, 1, "all" }, 4 ); -- Schritte 1 - 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT RUM - FERTIG ---------------------------
		
		------------------- FLASCHE MIT BEERENSCHNAPS - 1315 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 1315, {54, 75 }, 1, { 19, 38 } );
		product:AddProductionSteps( { 1317, 1, "all" }, 1, nil, { 1317, 1, 70 }  ); -- Schritt 6: leere Flasche(1317) 1x
		product:AddProductionSteps( {  81, 2, "all" }, 2 ); -- Schritt 1 - 2: Beeren(81) 2x
		product:AddProductionSteps( {  147, 2, "all" }, 2 ); -- Schritt 3 - 4: Brombeeren(147) 2x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BEERENSCHNAPS - FERTIG ---------------------------
		
		------------------- FLASCHE MIT BÄRENTÖTER - 1316 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 1316, {56, 75 }, 1, { 19, 38 } );
		product:AddProductionSteps( { 1317, 1, "all" }, 1, nil, { 1317, 1, 70 }  ); -- Schritt 6: leere Flasche(1317) 1x
		product:AddProductionSteps( {  15, 2, "all" }, 4 ); -- Schritt 1 - 4: Apfel(15) 2x
		product:AddProductionSteps( {  2529, 2, "all" }, 1 ); -- Schritt 5: Honig(2529) x2
		product:AddProductionSteps( {  159, 1, "all" }, 1 ); -- Schritt 6: Fliegenpilz(159) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT BÄRENTÖTER - FERTIG ---------------------------
		
		------------------- FLASCHE MIT ELBENWEIN - 1318 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 1318, {87, 100 }, 1, { 27, 54 } );
		product:AddProductionSteps( { 1317, 1, "all" }, 1, nil, { 1317, 1, 70 }  ); -- Schritt 6: leere Flasche(1317) 1x
		product:AddProductionSteps( {  759, 1, "all" }, 2 ); -- Schritt 1 - 2: Nüsse(759) x1
		product:AddProductionSteps( {  80, 3, "all" }, 1 ); -- Schritt 3: Beeren(81) x3
		product:AddProductionSteps( {  2529, 2, "all" }, 1 ); -- Schritt 4: Honig(2529) x2
		------------------- FLASCHE MIT ELBENWEIN - FERTIG ---------------------------
		
		------------------- FLASCHE MIT KIRSCHSCHNAPS - 1319 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 1319, {77, 95 }, 1, { 24, 48 } );
		product:AddProductionSteps( { 1317, 1, "all" }, 1, nil, { 1317, 1, 70 }  ); -- Schritt 6: leere Flasche(1317) 1x
		product:AddProductionSteps( {  302, 2, "all" }, 4 ); -- Schritt 1 - 4: Kirschen(302) 2x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT KIRSCHSCHNAPS - FERTIG ---------------------------
		
		local CurrentCatID = brewing:AddCategory( 787 ) -- Tee, Smoothies, Saft :p
		
		------------------- FLASCHE MIT BROMBEERSAFT - 783 Dunkelblau ---------------------------
		product = brewing:AddProduct( CurrentCatID, 783, {63, 85 }, 1, { 21, 42 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  157, 2, "all" }, 3 ); -- Schritt 1 - 3: Brombeeren(157) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BROMBEERSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT MANDARINENSAFT - 784 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 784, {68, 90 }, 1, { 22, 44 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  199, 2, "all" }, 3 ); -- Schritt 1 - 3: Mandarinen(199) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT MANDARINENSAFT - FERTIG ---------------------------

		------------------- FLASCHE MIT BANANENSAFT - 785 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 785, {78, 100 }, 1, { 25, 50 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  80, 2, "all" }, 3 ); -- Schritt 1 - 3: Bananen(80) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BANANENSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT KOHLSAFT - 786 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 786, {33, 50 }, 1, { 12, 24 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( { 155, 2, "all" }, 4 ); -- Schritt 1 - 4: Kohl(290) 2x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT KOHLSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT JUNGFERNKRAUTTEE - 787 --------------------------- 
		product = brewing:AddProduct( CurrentCatID, 787, {29, 45 }, 1, { 11, 22 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( { 144, 2, "all" }, 3 ); -- Schritt 1 - 3: Jungfernkraut(144) 2x
		product:AddProductionSteps( {  157, 2, "all" }, 1 ); -- Schritt 4: Brombeeren(157) 2x
		product:AddProductionSteps( {  2529, 1, "all" }, 1 ); -- Schritt 5: Honig(2529) x1
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT TEE - FERTIG --------------------------- 
		
		------------------- FLASCHE MIT KAROTTENSAFT - 788 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 788, {57, 75 }, 1, { 19, 38 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  2493, 2, "all" }, 3 ); -- Schritt 1 - 3: Karotten(2493) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 7: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT KAROTTENSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT ERDBEERSAFT - 789 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 789, {73, 95 }, 1, { 24, 48 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  151, 2, "all" }, 3 ); -- Schritt 1 - 3: Erdbeeren(151) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT ERDBEERSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT TRAUBENSAFT - 791 ---------------------------
		product = brewing:AddProduct( CurrentCatID, 791, {83, 100 }, 1, { 25, 50 } );
		product:AddProductionSteps( { 790, 1, "all" }, 1, nil, { 790, 1, 70 }  ); -- Schritt 6: leere Flasche(790) 1x
		product:AddProductionSteps( {  388, 2, "all" }, 3 ); -- Schritt 1 - 3: Trauben(388) 2x
		product:AddProductionSteps( {  778, 1, "all" }, 1 ); -- Schritt 4: Zuckerrohr(778) 1x
		product:AddProductionSteps( {   52, 1, "all" }, 1, { 51, 1 }, nil, true ); -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT TRAUBENSAFT - FERTIG ---------------------------
		
		
		InitDone = true;
    end
    return cooking,brewing;
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!
    Cooking,Brewing = InitCraftingTool( );
    base.common.ResetInterruption( User, ltstate );
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
        Cooking:SwapToInactiveItem( User );
        Brewing:SwapToInactiveItem( User );
        return
    end

    if not InitDone then
        User:inform("Error while loading crafting values.");
        return
    end

    if menstate[ User.id ]==nil then                           -- menustatus initialisieren.
        menstate[ User.id ]=0;
    end
    
    cookstatus,cookmessage = Cooking:LocationFine( User, ltstate, true );
    if (cookstatus == 0) then
        if ( SourceItem:getType() ~= 4 ) then -- Kochlöffel in der Hand
            base.common.InformNLS( User, 
            "Du mußt den Kochlöffel in die Hand nehmen um damit zu arbeiten.", 
            "You have to take the cooking spoon in your hand to work with it." )
            return
        end
        
        if not base.common.CheckItem( User, SourceItem ) then
            Cooking:SwapToInactiveItem( User );
            return
        end
        
        if base.common.Encumbrence(User) then -- Sehr steife Rüstung?
            base.common.InformNLS( User,
            "Deine Rüstung behindert beim Kochen.",
            "Your armor disturbs you while cooking." );
            Cooking:SwapToInactiveItem( User );
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
            if ( Cooking:GenerateMenu( User, SourceItem ) ) then
                Cooking:SwapToInactiveItem( User );
                return
            end
        end
        if (menstate[ User.id ] == 1) then
            Cooking:GenerateItemList( User, Param, SourceItem );
            menstate[ User.id ] = 2;
            Cooking:SwapToInactiveItem( User );
            return
        elseif (menstate[ User.id ] == 2) then
            Cooking:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
        end
        return
    end
    
    brewstatus,brewmessage = Brewing:LocationFine( User, ltstate, true );      
    if (brewstatus == 0) then
        if ( SourceItem:getType() ~= 4 ) then -- Kochlöffel in der Hand
            base.common.InformNLS( User, 
            "Du mußt den Kochlöffel in die Hand nehmen um damit zu arbeiten.", 
            "You have to take the cooking spoon in your hand to work with it." )
            return
        end
        
        if not base.common.CheckItem( User, SourceItem ) then
            Brewing:SwapToInactiveItem( User );
            return
        end
        
        if base.common.Encumbrence(User) then -- Sehr steife Rüstung?
            base.common.InformNLS( User,
            "Deine Rüstung behindert beim brauen.",
            "Your armor disturbs you while brewing." );
            Brewing:SwapToInactiveItem( User );
            return
        end

        local TargetItem = base.common.GetTargetItem(User, SourceItem);
		if TargetItem then
			if Brewing:IsProduct(TargetItem.id) then
				base.common.InformNLS( User,
				"Du versuchst den Gegenstand in deiner Hand zu bearbeiten.",
				"You try to work on the item in your hand." );
				Brewing:ToolCreateItem( User, 0, TargetItem, ltstate, SourceItem );
				return;
			end
		end

        if (Param == 0) then
            if ( Brewing:GenerateItemList( User, 0, SourceItem ) ) then
                Brewing:SwapToInactiveItem( User );
                return
            end
        end
        Brewing:ToolCreateItem( User, Param, nil, ltstate, SourceItem );
        return
    end
    
    if (cookstatus == 1) then
        User:inform(cookmessage);
    else
        User:inform(brewmessage);
    end
end --function
