-- ds_base_alchemy.lua

require("base.common");
module("alchemy.base.alchemy", package.seeall)

function InitAlchemy()
    InitPlantSubstance()
	InitPotions()
end

-- the list of plants with their substances
plantSubstanceList = {};

function InitPlantSubstance()
    if plantSubstanceList == nil then
	    plantSubstanceList = {}
	end	
	setPlantSubstance(133, "Adrazin", "Orcanol") -- sunherb / Sonnenkraut
    setPlantSubstance(758, "Adrzain", "") -- heart blood / Herzblut
	setPlantSubstance(15 , ""       , "") -- apple / Apfel
end

function setPlantSubstance(id, plusSubstance, minusSubstance)
    if plantList == nil then
	    plantList = {}
	end	
	plantList[id] = {plusSubstance, minusSubstance}
end

function getPlantSubstance(id, User)
    if not plantList[id] then
	    return false
	end	
	local plus, minus
	if plantList[id][1] ~= nil then
	    plus = plantList[id][1]
	end	
	if plantList[id][2] ~= nil then
	    minus = plantList[id][2]
	end     	
	return plus, minus    
end

-- the list of possible potions effects
potionsList = {};

-- on reload, this function is called
-- setPotion(effect id, stock data, gemdust ,Herb1, Herb2, Herb3, Herb4, Herb5, Herb6, Herb7, Herb8)
-- every effect id is only used once!
-- gemdust is the id of the gemdust used. indirectly, the potion kind
-- stock data is the concentration of the active substances put together in the following order: Adrazin, Illidrium, Caprazin, Hyperborelium, Echolon, Dracolin, Orcanol, Fenolin 
-- Herb1...Herb8 are optional. If you use only x Herbs and x < 8 just write false for the rest
-- Example: setPotion(15, 459, 95554553, 133, 15, 81, false, false, false, false, false)
-- document properly, please
function InitPotions()
    setPotion(45, 450, 55555555, 775, 3443, 33, false, false, false, false, false);
end;

--- Set the effect of a potion
-- @param resultingEffect the resulting effect of the potion
-- @param ... the components effecting the potion one by one
function setPotion(resultingEffect, ...)
	local currentList = potionsList;
	for i, v in ipairs(arg) do
		if (currentList[v] == nil) then
			currentList[v] = {};
		end;
		currentList = currentList[v];
	end;
	currentList[0] = resultingEffect;
end;

--- Get the effect of a potion
-- @param ... the components effecting the potion one by one
-- @return the resulting effect of the potion
function getPotion(...)
	local currentList = potionsList;
	for i, v in ipairs(arg) do
			if (currentList[v] == nil) then
					return 0;
			end;
			currentList = currentList[v];
	end;
   
	if (currentList[0] == nil) then
			return 0;
	end;
	return currentList[0];
end;


--Qualitätsbezeichnungen
qListDe={"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"};
qListEn={"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"};

--                stock,sapphire,ruby,emerald,obsidian,amethyst,topaz,diamant
gemList        = {"non",446      ,447 ,448    ,449       ,450     ,451  ,452}
cauldronPotion = {1012 ,1011     ,1016,1013   ,1009      ,1015    ,1018 ,1017} 
bottlePotion   = {331  ,327      ,59  ,165    ,329       ,166     ,167  ,330}

-- Liste der Wirkstoffnamen
wirkstoff = {};
wirkung_de = {};
wirkung_en = {};

wirkstoff[1] = "Adrazin";
wirkstoff[2] = "Illidrium";
wirkstoff[3] = "Caprazin";
wirkstoff[4] = "Hyperborlium";
wirkstoff[5] = "Echolon";
wirkstoff[6] = "Dracolin";
wirkstoff[7] = "Orcanol";
wirkstoff[8] = "Fenolin";

wirkung_de[1] = "gesättigte Anreicherung von";
wirkung_de[2] = "eine sehr ausgeprägte Menge";
wirkung_de[3] = "merklich";
wirkung_de[4] = "schwache Konzentration an";
wirkung_de[5] = "kein";
wirkung_de[6] = "geringe Mengen";
wirkung_de[7] = "etwas";
wirkung_de[8] = "konzentriertes";
wirkung_de[9] = "hoch toxisches";

wirkung_en[1] = "highly toxic";
wirkung_en[2] = "dominant marked";
wirkung_en[3] = "distinctive";
wirkung_en[4] = "slightly marked";
wirkung_en[5] = "no";
wirkung_en[6] = "slightly pronounced";
wirkung_en[7] = "enriched";
wirkung_en[8] = "dominant pronounced";
wirkung_en[9] = "highly noxious";

-- Liste der Krankheiten

illness = {};

illness[1] = {};
illness[2] = {};
-- deutsche Bezeichnugnen                -- englische Bezeichnungen

illness[1][1] = "Ork-Fieber";            illness[2][1] = "orc-fever";
illness[1][2] = "Sumpfkrampf";           illness[2][2] = "bog-attack";
illness[1][3] = "Trollsucht";            illness[2][3] = "Troll's rash";
illness[1][4] = "Gnom-Wahn";             illness[2][4] = "gnome-paranoia";
illness[1][5] = "Vein'sches Syndrom";    illness[2][5] = "Veins'syndrome";
illness[1][6] = "Drachenpocken";         illness[2][6] = "dragon's pox";
illness[1][7] = "Skorpion-Seuche";       illness[2][7] = "scorpion's pestilence";
illness[1][8] = "Wolfspest";             illness[2][8] = "wolves pest";

-- illness seriousness: 1-8
illness_seriousness = {};

illness_seriousness[1] = 1;
illness_seriousness[2] = 2;
illness_seriousness[3] = 3;
illness_seriousness[4] = 4;
illness_seriousness[5] = 5;
illness_seriousness[6] = 6;
illness_seriousness[7] = 7;
illness_seriousness[8] = 8;

--Wirkungen auf Attribute
--Reihe 1
attr_r1 = {};                   untererGrenzwert = {};      obererGrenzwert = {};
attr_r1[1] ="hitpoints";        untererGrenzwert[1] = 0;    obererGrenzwert[1] = 10000;
attr_r1[2] ="body_height";      untererGrenzwert[2] = 35;   obererGrenzwert[2] = 84;
attr_r1[3] ="foodlevel";        untererGrenzwert[3] = 0;    obererGrenzwert[3] = 50000;
attr_r1[4] ="luck"       ;      untererGrenzwert[4] = 0;    obererGrenzwert[4] = 100;
attr_r1[5] ="attitude";         untererGrenzwert[5] = 0;    obererGrenzwert[5] = 100;
attr_r1[6] ="poisonvalue";      untererGrenzwert[6] = 0;    obererGrenzwert[6] = 10000;
attr_r1[7] ="mental capacity";  untererGrenzwert[7] = 0;    obererGrenzwert[7] = 2400;
attr_r1[8] ="mana";             untererGrenzwert[8] = 0;    obererGrenzwert[8] = 10000;
--Reihe 2
attr_r2 = {};
attr_r2[1] ="strength";
attr_r2[2] ="perception";
attr_r2[3] ="dexterity";
attr_r2[4] ="intelligence";
attr_r2[5] ="essence";
attr_r2[6] ="willpower";
attr_r2[7] ="constitution";
attr_r2[8] ="agility";

taste = {};
taste[0]   ={"fruchtig","herb"     ,"bitter"    ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"   ,"süß"};
taste[1]   ={"fruity"  ,"tartly"   ,"bitter"    ,"putrefactive","sour"        ,"salty"  ,"hot"      ,"sweet"};

-- -------------------------------------------------------------------------------
function CheckAttrRow(User,dataZList)

   retVal = true
   if dataZList[9] == 0 then
      -- Attributsreihe 1 soll angewandt werden
   else
      -- Attributsreihe 2 soll angewandt werden
      retVal = false
   end
   return retVal
end
-- -------------------------------------------------------------------------------
function ImpactRow1(User,dataZList)

  for i=1,8 do

    if dataZList[i] < 4 then

        User:inform(dataZList[i].." Vor-Wirkung R1 : "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
        User:setAttrib(attr_r1[i],(User:increaseAttrib(attr_r1[i],0)*(dataZList[i]*30/100)))
        User:inform("Nach-Wirkung R1: "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))

    elseif dataZList[i] > 5 then

        User:inform(dataZList[i].." Vor-Wirkung R1 : "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
        dasIstWirkung = math.floor(User:increaseAttrib(attr_r1[i],0)+(User:increaseAttrib(attr_r1[i],0)*(dataZList[i]-5)*10/100))

          if dasIstWirkung > obererGrenzwert[i] then
             dasIstWirkung = obererGrenzwert[i]
          end

          User:setAttrib(attr_r1[i],dasIstWirkung)
          User:inform("Nach-Wirkung R1: "..attr_r1[i].." : "..User:increaseAttrib(attr_r1[i],0 ))
     end

  end


  --User:inform("debug 13")
end
-- --------------------------------------------------------------------------------
function generateTasteMessage(Character,dataZList)
    local textDe = "Der Trank schmeckt ";
	local textEn = "The potion tastes ";
    local anyTaste = false;

    local usedTastes = {};

    for i=1,8 do
        if dataZList[i] > 5 then
            if usedTastes[i]==nil or usedTastes[i]<dataZList[i] then
                usedTastes[i] = dataZList[i];
            end
            anyTaste = true;
        elseif dataZList[i] < 5 then
            if usedTastes[9-i]==nil or usedTastes[9-i]<dataZList[i] then
                usedTastes[9-i] = dataZList[i];
            end
            anyTaste = true;
        end
    end
    if not anyTaste then
		textDe = textDe .. "nach nichts.";
		textEn = textEn .. "like nothing.";
    else
        for i=1,8 do
            if usedTastes[i]~=nil then
                if usedTastes[i] > 8 or usedTastes[i] < 2 then
					textDe = textDe .. "sehr ";
					textEn = textEn .. "very ";
                elseif (usedTastes[i] < 7 and usedTastes[i] > 5) or (usedTastes[i] > 3 and usedTastes[i] < 5) then
					textDe = textDe .. "etwas ";
					textEn = textEn .. "slightly ";
                end
                textDe = textDe..taste[0][i]..", ";
				textEn = textEn..taste[1][i]..", ";
            end
        end
        textDe = string.sub(textDe, 0, -3);
        textDe = textDe..".";
		textEn = string.sub(textEn, 0, -3);
        textEn = textEn..".";
    end
    base.common.InformNLS(Character,textDe,textEn);
end

function CheckIfGemDust(SourceItem, User)
local retVal = nil;
for i,checkId in pairs(gemList) do
    User:inform("debug al 1")
	theItem = SourceItem
	User:inform("debug al 2: "..theItem.id)
	if theItem.id == checkId then
    User:inform("debug al 3")
	retVal = theItem
    break;
    end
end	
return retVal
end

function GetCauldronInfront(User)
    local retVal = nil
    Item = base.common.base.common.GetFrontItem(User)
	if (Item.id >= 1008) and (Item.id <= 1018) then
	    retVal = Item
	end
	return retVal
end

function CheckIfAlchemist(User,textDE,textEN)
    if (User:getMagicType() ~= 3) or (User:getMagicFlags(3) <= 0) then
	    User:inform(textDE,textEN)
		return false
	else
        return true
    end		
end

function RemoveEssenceBrew(Item)
    for i=1,8 do
	    Item:setData("essenceHerb"..i,"")  
	end	
end

function RemoveStock(Item)
    for i=1,8 do
	    Item:setData(wirkstoff[i].."Concentration","")
	end
end

function RemoveAll(Item)
    RemoveEssenceBrew(Item)
	RemoveStock(Item)
	Item:setData("potionEffectId","")
	Item:setData("potionQuality","")
	Item:setData("filledWith","")
	if (Item.id >= 1008) or (Item.id <= 1018) then
	    Item.id = 1008
	else
	    Item.id = 164
	end
end

function EmptyBottle(User,Bottle)
    if math.random(1,20) == 1 then
	   User:eraseItem(SourceItem,1) -- bottle breaks
	   base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
	else	
		Bottle.id = 164
	    Bottle.quality = 333
		world:changeItem(Bottle)
	end
end

function CopyAllDatas(fromItem,toItem)
-- copies all datas from fromItem to toItem
	for i=1,8 do
	    toItem:setData(wirkstoff[i].."Concentration",fromItem:getData(wirkstoff[i].."Concentration")) 
		toItem:setData("essenceHerb"..i,fromItem:getData("essenceHerb"..i))
	end	
    toItem:setData("filledWith",fromItem:getData("filledWith")) 
	toItem:setData("potionEffectId",fromItem:getData("potionEffectId"))
	toItem:setData("potionQuality",fromItem:getData("potionQuality")) 

end

function CauldronDestruction(User,cauldron,effectId)
    
	if (effectId < 1) or (effectId > 3) or (effectId == nil) then
	    effectId = 1
	end
	
	local textDE = nil; local textEN = nil
	if effectId == 1 then
	    world:gfx(1,cauldron.pos)
		world:makeSound(5,cauldron.pos)
	    User:inform("Der Inhalt des Kessels verpufft, als du das Kraut hinzu tust.",
		            "The substance in the cauldron blows out, as you put the herb in."
					)
	elseif effectId == 2 then
	    world:makeSound(5,cauldron.pos)
		world:gfx(36,cauldron.pos)
	    User:inform("Deine letzte Handlung scheint den Inhalt des Kessels zerstört und zu einer Explosion geführt zu haben.",
		            "Your last doing seems to have destroyed the substance in the cauldron and caused an explosion."
		            )
		local myVictims = world:getPlayersInRangeOf(cauldron.pos,1) -- we hurt everyone around the cauldron!
	    for i=1,#myVictims do
			myVictims[i]:increaseAttrib("hitpoints",-3000)
			base.common.HighInformNLS(myVictims[i], "Du wirst von einer Explosion getroffen.", "You are hit by an explosion.")
	    end			
	end
	RemoveAll(cauldron)
	cauldron.id = 1008
	world:changeItem(cauldron)
end

function SetQuality(User,Item)
    quali = 999 -- replace with formula
	Item:setData("potionQuality",quali)
end

gemDustList  = {"non",446      ,447 ,448    ,449       ,450     ,451  ,452}
cauldronList = {1012 ,1011     ,1016,1013   ,1009      ,1015    ,1018 ,1017} 
bottleList   = {331  ,327      ,59  ,165    ,329       ,166     ,167  ,330}

function GemDustBottleCauldron(gemdust, cauldron, bottle, User)
    -- this function returns matching gemdust id, cauldron id and bottle id
    -- only one parameter is needed; if there are more than one, only the first one will be taken into account
    User:inform("debug gbc1")
	local myList
	local myValue
    if gemDust then
	    myList = gemdustList
		myValue = gemdust.id
	elseif cauldron then
	    User:inform("debug gbc2")
		myList = cauldronList
		myValue = cauldron.id
    elseif bottle then
        myList = bottleList	
		myValue = bottle.id
    else 
	    return 
	end	
	local reGemdust; local reCauldron; local reBottle
	for i=1,#myList do
	    if myList[i] == myValue then
		    User:inform("debug gbc3")
			reGemdust = gemDustList[i]
	        reCauldron = cauldronList[i]
			reBottle = bottleList[i]
	        break
		end
	end
	return reGemdust, reCauldron, reBottle
end
----------------------------------------------------
-- combine of stock and essence brew to create a potion
-- function is only called when item 331 is a stock or when a potion-bottle is an essence brew
function CombineStockEssence( User, stock, essenceBrew)
   
    local cauldron = GetCauldronInfront(User)
    if cauldron then
        
		-- we get the gem dust used as an ingredient; and the new cauldron id we need later
		local ingredientGemdust; local newCauldron
		if cauldron:getData("filledWith") == "essenceBrew" then
		    ingredientGemdust, newCauldron = GemDustBottleCauldron(nil, essenceBrew, nil)
		else
		    ingredientGemdust, newCauldron = GemDustBottleCauldron(nil, nil, essenceBrew)
		end
		
		-- create our ingredients list
		local myIngredients = {}
		-- firstly, the gem dust which has been used (indirectly, that is the potion kind)
		myIngredients[1] = ingredientGemdust
		-- secondly, the stock
		local stockConc = ""
		for i=1,8 do 
		    local currentSubs = stock:getData(wirkstoff[1].."Concentration")
			if currentSubs == "" then
			    currentSubs = 5
			end	
			stockConc = stockConc..currentSubs
		end
        myIngredients[2] = tonumber(stockConc)
		-- thirdly, the (at maximum) eight herbs of the essenceBrew
		for i=1,8 do
		    if essenceBrew:getData("essenceHerb"..i) ~= "" then
			    myIngredients[i+2] = tonumber(essenceBrew:getData("essenceHerb"..i))
		    else
			    myIngredients[i+2] = false
			end	
	    end
	    -- get the potion effect id
		local effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8])
		-- delte old cauldron datas
		RemoveAll(cauldron)
		SetQuality(User,cauldron)
		cauldron.id = newCauldron
		world:changeItem(cauldron)
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)
	end
end