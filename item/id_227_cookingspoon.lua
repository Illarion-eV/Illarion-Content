-- Kochen und Brauen mit Kessel und Fass

-- UPDATE common SET com_script='item.id_227_cookingspoon' WHERE com_itemid IN (227);

require("item.general.wood")
require("item.base.crafts")

module("item.id_227_cookingspoon", package.seeall)

-- Kochen und Brauen Initieren Initieren
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        brewing = item.base.crafts.Craft:new{
                             craftEN = "brewing",
                             craftDE = "Brauen",
                             leadSkill = Character.cookingAndBaking,
                             defaultFoodConsumption = 100,
                             sfx = 10,
                             sfxDuration = 15,
                           };

        cooking = item.base.crafts.Craft:new{
                             craftEN = "cooking",
                             craftDE = "Kochen",
                             leadSkill = Character.cookingAndBaking,
                             defaultFoodConsumption = 100,
                             sfx = 7,
                             sfxDuration = 15,
                             fallbackCraft = brewing,
                           };

		
        cooking:addTool(2488) -- kettle
        brewing:addTool(339) -- barrel
        
        --------------------------------------------------------------------------------------------
        local catId = cooking:addCategory("soups", "Suppen") -- Suppenschüssel ( Suppen )
        
        ---------------- MUSHROOM SOUP - 2456 ----------------------
        product = cooking:addProduct(catId, 2456, 7, 27, 7, 14)
        product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x         
        product:addIngredient(52)
        product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
        product:addIngredient(163, 5) -- Step 3: Champignon(163) 5x
        -------------- PILZSUPPE - DONE ----------------


        ---------------- ONION SOUP - 2923 ----------------------
        product = cooking:addProduct(catId, 2923, 15, 35, 9, 18)
        product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
        product:addIngredient(52)
        product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
        product:addIngredient(201, 5) -- Step 3: Onion (201) 5x
        -------------- ONION SOUP - DONE ----------------


        ---------------- CABBAGE STEW - 2278 ----------------------
        local product = cooking:addProduct(catId, 2278, 30, 50, 12, 24)
        product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
        product:addIngredient(52)
        product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
        product:addIngredient(290, 5) -- Step 3: Cabbage (290) 5x
        -------------- CABBAGE STEW - DONE ----------------
     
       
        ---------------- MULLIGAN - 2276 ----------------------
        product = cooking:addProduct(catId, 2276, 40, 60, 15, 30)
        product:addIngredient(2935) -- Step 1: Soup Bowl (2935) 1x
        product:addIngredient(52)
        product:addRemnant(51) -- Step 2: Bucket with water (52) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
        product:addIngredient(200) -- Step 5: Tomatoe(200) 1x

        --------------------------------------------------------------------------------------------
        local catId = cooking:addCategory("dishes", "Gerichte") -- Teller ( Tellergerichte )

        ---------------- SAUSAGE - 3051 ----------------------
        product = cooking:addProduct(catId, 3051, 0, 20, 5, 10, 2)
        product:addIngredient(307) -- Step 1: Pork(307) 1x
        product:addIngredient(63) -- Step 2: Insides(63) 1x
        -------------- SAUSAGE - DONE ----------------

        
        ---------------- STEAK - 2940 ----------------------
        product = cooking:addProduct(catId, 2940, 5, 25, 6, 12)
        product:addIngredient(307) -- Step 1: Pork(307) 1x
        -------------- STEAK - DONE ----------------

        
        ---------------- FISH FILET - 2459 ----------------------
        product = cooking:addProduct(catId, 2459, 20, 40, 15, 30)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(73) -- Step 2: Trout(73) 1x
        product:addIngredient(290) -- Step 3: Cabbage (290) 1x
        product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
        -------------- FISH FILET - DONE ----------------


        ---------------- SALMON DISH - 556 ----------------------
        product = cooking:addProduct(catId, 556, 35, 55, 14, 28)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(355) -- Step 2: Salmon(355) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
        -------------- SALMON DISH - DONE ----------------

      
        ---------------- MEAT DISH - 2277 ----------------------
        product = cooking:addProduct(catId, 2277, 50, 70, 17, 34)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(307) -- Step 2: Pork(307) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
        -------------- MEAT DISH - DONE ----------------


        ---------------- SAUSAGE DISH - 2922 ----------------------
        product = cooking:addProduct(catId, 2922, 60, 80, 20, 40)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(3051) -- Step 2: Sausage(3051) 1x
        product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
        product:addIngredient(290) -- Step 4: Cabbage (290) 1x
        -------------- SAUSAGE DISH - DONE ----------------


        ---------------- STEAK DISH - 557 ----------------------
        product = cooking:addProduct(catId, 557, 65, 85, 21, 42)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(2940) -- Step 2: Steak(2940) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
        -------------- STEAK DISH - DONE ----------------

        
        ---------------- RABBIT DISH - 555 ----------------------
        product = cooking:addProduct(catId, 555, 75, 95, 24, 48)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(553) -- Step 2: Rabbit meat(553) 1x
        product:addIngredient(2493) -- Step 3: Carrots(2493) 1x
        product:addIngredient(200) -- Step 4: Tomatoe(200) 1x
        product:addIngredient(290) -- Step 5: Cabbage (290) 1x
        -------------- BUNNY DISH - DONE ----------------
        
        
        ---------------- LAMB DISH - 559 ----------------------
        product = cooking:addProduct(catId, 559, 85, 100, 26, 52)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(2934) -- Step 2: Lamb meat(2934) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(2493) -- Step 4: Carrots(2493) 1x
        product:addIngredient(200) -- Step 5: Tomatoe(200) 1x
        -------------- LAMB DISH - DONE ----------------

        
        ---------------- VENISON DISH - 554 ----------------------
        product = cooking:addProduct(catId, 554, 90, 100, 27, 54)
        product:addIngredient(2952) -- Step 1: Plate(2952) 1x
        product:addIngredient(552) -- Step 2: Deer meat(552) 1x
        product:addIngredient(201) -- Step 3: Onion (201) 1x
        product:addIngredient(290) -- Step 4: Cabbage (290) 1x
        product:addIngredient(81, 5) -- Step 5: Berries(81) 5x
        -------------- VENISON DISH - DONE ----------------
        
        -----------------------------------------------------------------------------------------------------
        --#################################################################################################--
        -----------------------------------------------------------------------------------------------------
        
		local catId = brewing:addCategory("light alcohol", "Leichter Alkohol") -- Bierflasche(2501), Leichte Alkoholika 
		
        ------------------- FLASCHE MIT CIDER - 2499 -------------------------- 
        product = brewing:addProduct(catId, 2499, 0, 20, 5, 10)
        product:addIngredient(2498) -- Schritt 4: leere Flasche(2498) 1x
        product:addIngredient(52)
        product:addRemnant(51) -- Schritt 3: Eimer mit Wasser(52) 1x
        product:addIngredient(15, 3) -- Schritte 1 - 2: Apfel(15) 2x
        ------------------ FLASCHE MIT CIDER - FERTIG ------------------------- 
        
        -------------------- FLASCHE MIT MET - 2497 ---------------------------
        product = brewing:addProduct(catId, 2497, 15, 30, 9, 18)
        product:addIngredient(2498) -- Schritt 5: leere Flasche(2498) 1x
        product:addIngredient(2529, 3) -- Schritte 1 - 3: Honigwaben(2529) 2x
        product:addIngredient(52)
        product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT MET - FERTIG --------------------------
        
        ------------------- FLASCHE MIT BIER - 2501 ---------------------------
        product = brewing:addProduct(catId, 2501, 32, 50, 12, 24)
        product:addIngredient(2498) -- Schritt 7: leere Flasche(2498) 1x
        product:addIngredient(259, 2) -- Schritte 1 - 2: Getreide(259) 1x
        product:addIngredient(154) -- Schritte 3 - 4: Hopfen(154) 1x
        product:addIngredient(52)
        product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------ FLASCHE MIT BIER - FERTIG --------------------------
        
        ------------------- FLASCHE MIT WEIN - 2500 ---------------------------
        product = brewing:addProduct(catId, 2500, 47, 65, 16, 32, 2)
        product:addIngredient(2498) -- Schritt 5: leere Flasche(2498) 1x
        product:addIngredient(388, 3) -- Schritte 1 - 3: Weinbeeren(388) 2x
        product:addIngredient(52)
        product:addRemnant(51) -- Schritt 4: Eimer mit Wasser(52) 1x
        ------------------ FLASCHE MIT WEIN - FERTIG --------------------------       
        
		local catId = brewing:addCategory("heavy alcohol", "Harter Alkohol") -- Das harte Zeug 
		
		------------------- FLASCHE MIT RUM - 517 ---------------------------
		product = brewing:addProduct(catId, 517, 52, 70, 17, 34)
		product:addIngredient(518) -- Schritt 6: leere Flasche(1317) 1x
		product:addIngredient(778, 4) -- Schritte 1 - 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT RUM - FERTIG ---------------------------
		
		------------------- FLASCHE MIT BEERENSCHNAPS - 1315 ---------------------------
		product = brewing:addProduct(catId, 1315, 54, 75, 19, 38)
		product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
		product:addIngredient(81, 2*2) -- Schritt 1 - 2: Beeren(81) 2x
		product:addIngredient(147, 2*2) -- Schritt 3 - 4: Brombeeren(147) 2x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BEERENSCHNAPS - FERTIG ---------------------------
		
		------------------- FLASCHE MIT BÄRENTÖTER - 1316 ---------------------------
		product = brewing:addProduct(catId, 1316, 56, 75, 19, 38)
		product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
		product:addIngredient(15, 4*2) -- Schritt 1 - 4: Apfel(15) 2x
		product:addIngredient(2529, 2) -- Schritt 5: Honig(2529) x2
		product:addIngredient(159) -- Schritt 6: Fliegenpilz(159) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT BÄRENTÖTER - FERTIG ---------------------------
		
		------------------- FLASCHE MIT ELBENWEIN - 1318 ---------------------------
		product = brewing:addProduct(catId, 1318, 87, 100, 27, 54)
		product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
		product:addIngredient(759, 2) -- Schritt 1 - 2: Nüsse(759) x1
		product:addIngredient(80, 3) -- Schritt 3: Beeren(81) x3
		product:addIngredient(2529, 2) -- Schritt 4: Honig(2529) x2
		------------------- FLASCHE MIT ELBENWEIN - FERTIG ---------------------------
		
		------------------- FLASCHE MIT KIRSCHSCHNAPS - 1319 ---------------------------
		product = brewing:addProduct(catId, 1319, 77, 95, 24, 48)
		product:addIngredient(1317) -- Schritt 6: leere Flasche(1317) 1x
		product:addIngredient(302, 4*2) -- Schritt 1 - 4: Kirschen(302) 2x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
        ------------------- FLASCHE MIT KIRSCHSCHNAPS - FERTIG ---------------------------
		
		local catId = brewing:addCategory("juices", "Säfte") -- Tee, Smoothies, Saft :p
		
		------------------- FLASCHE MIT BROMBEERSAFT - 783 Dunkelblau ---------------------------
		product = brewing:addProduct(catId, 783, 63, 85, 21, 42)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(157, 3*2) -- Schritt 1 - 3: Brombeeren(157) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BROMBEERSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT MANDARINENSAFT - 784 ---------------------------
		product = brewing:addProduct(catId, 784, 68, 90, 22, 44)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(199, 3*2) -- Schritt 1 - 3: Mandarinen(199) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT MANDARINENSAFT - FERTIG ---------------------------

		------------------- FLASCHE MIT BANANENSAFT - 785 ---------------------------
		product = brewing:addProduct(catId, 785, 78, 100, 25, 50)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(80, 3*2) -- Schritt 1 - 3: Bananen(80) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT BANANENSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT KOHLSAFT - 786 ---------------------------
		product = brewing:addProduct(catId, 786, 33, 50, 12, 24)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(155, 4*2) -- Schritt 1 - 4: Kohl(290) 2x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT KOHLSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT JUNGFERNKRAUTTEE - 787 --------------------------- 
		product = brewing:addProduct(catId, 787, 29, 45, 11, 22)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(144, 3*2) -- Schritt 1 - 3: Jungfernkraut(144) 2x
		product:addIngredient(157, 2) -- Schritt 4: Brombeeren(157) 2x
		product:addIngredient(2529) -- Schritt 5: Honig(2529) x1
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT TEE - FERTIG --------------------------- 
		
		------------------- FLASCHE MIT KAROTTENSAFT - 788 ---------------------------
		product = brewing:addProduct(catId, 788, 57, 75, 19, 38)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(2493, 3*2) -- Schritt 1 - 3: Karotten(2493) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 7: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT KAROTTENSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT ERDBEERSAFT - 789 ---------------------------
		product = brewing:addProduct(catId, 789, 73, 95, 24, 48)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(151, 3*2) -- Schritt 1 - 3: Erdbeeren(151) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT ERDBEERSAFT - FERTIG ---------------------------
		
		------------------- FLASCHE MIT TRAUBENSAFT - 791 ---------------------------
		product = brewing:addProduct(catId, 791, 83, 100, 25, 50)
		product:addIngredient(790) -- Schritt 6: leere Flasche(790) 1x
		product:addIngredient(388, 3*2) -- Schritt 1 - 3: Trauben(388) 2x
		product:addIngredient(778) -- Schritt 4: Zuckerrohr(778) 1x
		product:addIngredient(52)
        product:addRemnant(51) -- Schritt 5: Eimer mit Wasser(52) 1x
		------------------- FLASCHE MIT TRAUBENSAFT - FERTIG ---------------------------
		
		
		InitDone = true;
    end
    return cooking
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)  -- DONT EDIT THIS LINE!
    local Cooking = InitCraftingTool()
    Cooking:showDialog(User, SourceItem)
end
