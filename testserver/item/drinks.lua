require("base.common")

module("item.drinks", package.seeall)

-- UPDATE common SET com_script='item.drinks' WHERE com_itemid IN (2189, 2188, 2187, 2186, 2059, 2058, 2057, 2056, 1910, 1909, 1907, 1906, 1861, 2502, 1841, 1842, 1843, 1844, 1853, 1854, 1855, 1856, 1857, 1859, 1860, 517, 1315, 1316, 1318,1319);

function InitDrinks()
    if ( drinkList == nil) then
        -- item ID,  food value,  leftover item, alcohol strength
        drinkList={};
        drinkList[2502] = {  800,  164,   0}; -- bottle with sheep milk
        drinkList[1841] = {  100, 1840,   0}; -- goblet with water
        drinkList[1842] = {  800, 1840,  15}; -- goblet with wine
        drinkList[1843] = { 1000, 1840,  10}; -- goblet with mead
        drinkList[1844] = {  800, 1840,  20}; -- goblet with cider
        drinkList[1853] = { 1000, 1858,  10}; -- goblet with mead
        drinkList[1854] = {  100,  224,   0}; -- goblet with water
        drinkList[1855] = {  100, 1858,   0}; -- goblet with water
        drinkList[1856] = { 1000,  224,  10}; -- goblet with mead
        drinkList[1857] = {  800,  224,  15}; -- goblet with wine
        drinkList[1859] = {  800, 1858,  20}; -- goblet with cider
        drinkList[1860] = {  800, 1858,  15}; -- goblet with wine
        drinkList[1861] = {  800,  224,  20}; -- goblet with cider
        drinkList[1906] = {  200, 1908,  10}; -- beer mug
        drinkList[1907] = {  200, 1910,  10}; -- beer mug
        drinkList[1909] = {  200, 1907,  10}; -- beer mug
        drinkList[1910] = {  200, 1906,  10}; -- beer mug
        drinkList[2056] = {  500, 2055,  10}; -- goblet with mead
        drinkList[2057] = {  400, 2055,  15}; -- goblet with wine
        drinkList[2058] = {   50, 2055,   0}; -- goblet with water
        drinkList[2059] = {  400, 2055,  20}; -- goblet with cider
        drinkList[2186] = {  100, 2185,   0}; -- mug with water
        drinkList[2187] = {  800, 2185,  15}; -- mug with wine
        drinkList[2188] = { 1000, 2185,  10}; -- mug with mead
        drinkList[2189] = {  800, 2185,  20}; -- mug with cider
		drinkList[517] = {  400, 518,  35}; -- bottle of rum
		drinkList[1315] = {  400, 1317,  35}; -- bottle of berry booze
		drinkList[1316] = {  400, 1317,  35}; -- bottle of bear slayer
		drinkList[1318] = {  400, 1317,  35}; -- bottle of elven wine
		drinkList[1319] = {  400, 1317,  35}; -- bottle of cherry schnapps
		drinkList[783] = {500, 790, 0}; -- bottle of blackberry juice
		drinkList[784] = {500, 790, 0}; -- bottle of tangerine juice
		drinkList[785] = {500, 790, 0}; -- bottle of banana juice		
		drinkList[786] = {500, 790, 0}; -- bottle of cabbage juice
		drinkList[787] = {500, 790, 0}; -- bottle of virgings weed tea
		drinkList[788] = {500, 790, 0}; -- bottle of carrot juice
		drinkList[789] = {500, 790, 0}; -- bottle of strawberry juice
		drinkList[791] = {500, 790, 0}; -- bottle of grape juice
		
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    InitDrinks();
    if User.attackmode then
        base.common.InformNLS( User, "Du würdest alles verschütten.", "You'd spill everything.");
        return -- Abbrechen wenn Spieler im Kampf ist
    end
    local food = drinkList[ SourceItem.id ];
    if (food == nil ) then
        User:inform("Unknown drinking Item: ID"..SourceItem.id.." Please Report this to a developer.");
        return
    end
    foodLevel = User:increaseAttrib("foodlevel",0) + food[1]; -- Foodlevel anheben
    world:makeSound(12,User.pos); -- Trinkgeräuusch machen
    if ( math.random( 50 ) <= 1 ) then -- 1/50 das die Flasche zerbricht
        world:erase(SourceItem,1);
        base.common.InformNLS( User, "Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.");
    else
        world:swap( SourceItem,food[2],333);
    end
    if ( food[3] == 0 ) then -- kein Alkohol
        if ( foodLevel > 40000 ) then 
            base.common.InformNLS( User, "Du hast genug getrunken.", "You have drunk enough.");
        elseif ( foodLevel > 40000 ) then 
            base.common.InformNLS( User, "Du schaffst es nicht noch mehr zu trinken.", "You don't manage it to drink more.");
            foodLevel = foodLevel - food[1];
        end
    else -- Alkohol
        -- Edit by abcfantasy: Wine brewing contest
        if ( food[3] == 15 ) then -- wine
            local perc = User:increaseAttrib("perception",0);
            if perc>19 then
                perc=19;
            end
            local itemData = tonumber(SourceItem:getData("wineData")) + math.random( -40 + (perc*2), 40 - (perc*2) );
            local wineQual = 0;
            local modv = itemData - math.floor(itemData/10)*10;
            local result = itemData / 10;
            if ( modv >= 5 ) then
                wineQual = math.ceil( result )
            else
                wineQual = math.floor( result )
            end;
            

            if ( wineQual < 1 ) then
                base.common.InformNLS( User, "", "The wine tastes plainly horrible. You won't even dare another sip." );
            elseif ( wineQual < 3 ) then
                base.common.InformNLS( User, "", "It's not wine that you would spit out, but a bad taste nonetheles." );
            elseif ( wineQual < 5 ) then
                base.common.InformNLS( User, "", "The taste leaves you just a bit discontent." );
            elseif ( wineQual < 7 ) then
                base.common.InformNLS( User, "", "The taste is so and so, leaving you a bit unsure." );
            elseif ( wineQual < 9 ) then
                base.common.InformNLS( User, "", "That's a promising wine, not quite good, but not bad at all." );
            elseif ( wineQual < 11 ) then
                base.common.InformNLS( User, "", "You can state that that wine is good wine, but not the best." );
            elseif ( wineQual < 13 ) then
                base.common.InformNLS( User, "", "The taste of this wine on your lips makes you content, definitely good and fine wine." );
            elseif ( wineQual < 15 ) then
                base.common.InformNLS( User, "", "Elven wine perhaps? This one tastes fantastic and makes you crave more." );
            elseif ( wineQual >= 15 ) then
                base.common.InformNLS( User, "", "Perfect wine! You have never tasted wine as good as this before." );
            end;
        end
        -- end edit
        
        -- Abhandlung Foodlevel
        if ( foodLevel > 40000 ) then 
            base.common.InformNLS( User, "Du hast genug getrunken.", "You have drunk enough.");
        elseif ( foodLevel > 40000 ) then 
            base.common.InformNLS( User, "Du schaffst es nicht noch mehr zu trinken.", "You don't manage it to drink more.");
            foodLevel = foodLevel - food[1];
        end
        -- Abhandlung Foodlevel fertig
       
	    --[[-- LTE 1 crasht den Server -> raus damit
        -- Alkohol Effekt
        -- Arbeitet mit LTE ID 1 - "alcohol"
        foundalc,alcEffect = User.effects:find(1); -- LTE 1 "alcohol" suchen
        if not foundalc then -- Spieler hat den Effekt nicht
            oldAlcValue = 0; -- daher auch keinen alten Alkoholwert
        else -- Spieler hat den Effekt
            found,value = alcEffect:findValue("alcohol"); -- alten Alkoholwert suchen
            oldAlcValue = ( found and value or 0 ); -- und uebertragen
            User.alcEffect:removeEffect(1); -- alten Effekt entfernen
        end
        alcEffect = LongTimeEffect( 1, 300 ); -- Effektstruktur erstellen
        alcEffect:addValue("alcohol",oldAlcValue + math.floor(food[1]*(food[3]/100))); -- neuen Alkoholwert hinzufuegen
        User.effects:addEffect(alcEffect); -- Effekt an User senden
        -- Alkoholabhandlung fertig]]
		
    end
    if ( User:increaseAttrib("foodlevel",0) ~= foodLevel ) then -- Prüfen ob Nahrungspunkte geändert wurden
        User:increaseAttrib("foodlevel",-(User:increaseAttrib("foodlevel",0)-foodLevel)); -- Änderung durchführen
    end
end


function LookAtItem(User, Item)
    InitDrinks();
    local food = drinkList[ Item.id ];
    
    if food == nil then
        User:inform("unkown drink item ID"..Item.id);
        return
    end

    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.NONE))
end
