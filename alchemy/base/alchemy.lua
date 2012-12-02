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
potionName = {}

-- on reload, this function is called
-- setPotion(effect id, stock data, gemdust ,Herb1, Herb2, Herb3, Herb4, Herb5, Herb6, Herb7, Herb8)
-- every effect id is only used once!
-- gemdust is the id of the gemdust used. indirectly, the potion kind
-- stock data is the concentration of the active substances put together in the following order: Adrazin, Illidrium, Caprazin, Hyperborelium, Echolon, Dracolin, Orcanol, Fenolin 
-- Herb1...Herb8 are optional. If you use only x Herbs and x < 8 just write false for the rest
-- Example: setPotion(15, 459, 95554553, 133, 15, 81, false, false, false, false, false)
-- document properly, please
function InitPotions()
    setPotion(45, 450, 65555545, 133, 133, 133, false, false, false, false, false);
	potionName[45] = {"that's my test potion!","mein test trank!"}
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


              --stock,sapphire ,ruby,emerald,obsidian  ,amethyst,topaz,diamant
gemDustList  = {"non",446      ,447 ,448    ,449       ,450     ,451  ,452}
gemList      = {"non",284      ,46  ,45     ,283       ,197     ,198  ,285}
cauldronList = {1012 ,1011     ,1016,1013   ,1009      ,1015    ,1018 ,1017} 
bottleList   = {331  ,327      ,59  ,165    ,329       ,166     ,167  ,330}

--Qualitätsbezeichnungen
qListDe={"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"};
qListEn={"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"};

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
function SplitData(User,theData)
    local myData
	dataZList = {}
	for i=1,8 do
	    myData = math.floor(theData/(10^(8-i)))
		myData = myData - (math.floor(myData/10))*10
		dataZList[i] = myData
    end
	return dataZList
end


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
for i,checkId in pairs(gemDustList) do
    theItem = SourceItem
	if theItem.id == checkId then
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
		if Bottle.number > 1 then -- if we empty a bottle (stock, potion or essence brew) it should normally never be a stack! but to be one the safe side, we check anyway
		    User:createItem(164,1,333,nil)
			User:eraseItem(Bottle,1)
		else
			RemoveAll(Bottle)
			Bottle.id = 164
			Bottle.quality = 333
			world:changeItem(Bottle)
		end	
	end
end

function FillFromTo(fromItem,toItem)
-- copies all datas (and quality and id) from fromItem to toItem
	for i=1,8 do
	    toItem:setData(wirkstoff[i].."Concentration",fromItem:getData(wirkstoff[i].."Concentration")) 
		toItem:setData("essenceHerb"..i,fromItem:getData("essenceHerb"..i))
	end	
    toItem:setData("filledWith",fromItem:getData("filledWith")) 
	toItem:setData("potionEffectId",fromItem:getData("potionEffectId"))
	if fromItem:getData("filledWith") == "potion" then
		if toItem.id >= 1008 and toItem.id <= 1018 then
		    toItem:setData("potionQuality",fromItem.quality) 
		else
			toItem.quality = tonumber(fromItem:getData("potionQuality"))
		end	
	elseif fromItem:getData("filledWith") == "potion" or fromItem:getData("filledWith") == "essenceBrew" or fromItem:getData("filledWith") == "stock" then
	    if toItem.id >= 1008 and toItem.id <= 1018 then
		    local reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, nil, fromItem)
			toItem.id = reCauldron
		else
			local reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, fromItem, nil)
			toItem.id = reCauldron
		end	
	end
end

function CauldronDestruction(User,cauldron,effectId)
    
	if (effectId < 1) or (effectId > 3) or (effectId == nil) then
	    effectId = 1
	end
	
	local textDE = nil; local textEN = nil
	if effectId == 1 then
	    world:gfx(1,cauldron.pos)
		world:makeSound(5,cauldron.pos)
	    User:inform("Der Inhalt des Kessels verpufft.",
		            "The substance in the cauldron blows out."
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

function GemDustBottleCauldron(gem, gemdust, cauldron, bottle)
    -- this function returns matching gem id, gemdust id, cauldron id and bottle id
    -- only one parameter is needed; if there are more than one, only the first one will be taken into account
    local myList
	local myValue
    if gem then
	    myList = gemList
		myValue = gem.id
	elseif gemdust then
	    myList = gemDustList
		myValue = gemdust.id
	elseif cauldron then
	    myList = cauldronList
		myValue = cauldron.id
    elseif bottle then
        myList = bottleList	
		myValue = bottle.id
    else 
	    return 
	end
	
	local reGem, reGemdust, reCauldron, reBottle
	for i=1,#myList do
	    if myList[i] == myValue then
		    reGem = gemList[i]
			reGemdust = gemDustList[i]
	        reCauldron = cauldronList[i]
			reBottle = bottleList[i]
	        break
		end
	end
	return reGem, reGemdust, reCauldron, reBottle
end
----------------------------------------------------
-- combine of stock and essence brew to create a potion
-- function is only called when item 331 is a stock or when a potion-bottle is an essence brew
function CombineStockEssence( User, stock, essenceBrew)
   
    local cauldron = GetCauldronInfront(User)
    if cauldron then
        
		-- we get the gem dust used as an ingredient; and the new cauldron id we need later
		local reGem, ingredientGemdust, newCauldron, reBottle
		if cauldron:getData("filledWith") == "essenceBrew" then
		    reGem, ingredientGemdust, newCauldron, reBottle = GemDustBottleCauldron(nil, nil, essenceBrew, nil)
		else
		    reGem, ingredientGemdust, newCauldron, reBottle = GemDustBottleCauldron(nil, nil, nil, essenceBrew)
		end
		
		-- create our ingredients list
		local myIngredients = {}
		-- firstly, the gem dust which has been used (indirectly, that is the potion kind)
		myIngredients[1] = ingredientGemdust
		-- secondly, the stock
		local stockConc = ""
		for i=1,8 do 
		    local currentSubs = stock:getData(wirkstoff[i].."Concentration")
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
		local effectID
		if (myIngredients[3] == false) and (ingredientGemdust == 447 or ingredientGemdust == 450) then
		    -- potion kind is primary or secondary attributes AND there was no plant in the essence brew -> stock concentration determines the effect
			effectID = stockConc
		else
            effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8],myIngredients[9],myIngredients[10])		
		end
		-- delte old cauldron datas and add new ones
		RemoveAll(cauldron)
		SetQuality(User,cauldron)
		cauldron.id = newCauldron
		cauldron:setData("potionEffectId", effectID)
		cauldron:setData("filledWith", "potion")
		world:changeItem(cauldron)
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)
	    -- and learn!
	    User:learn(Character.alchemy, 20, 100)
	end
end

function FillIntoCauldron(User,SourceItem,cauldron,Counter,Param,ltstate)
    -- function to fill stock, essencebrew or potion into a cauldron
	-- is the char an alchemist?
	local anAlchemist = CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
	if not anAlchemist then
		return
    end
	   
    if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	    return
	end
		
	if ( ltstate == Action.none ) then
		if (SourceItem:getData("filledWith") =="essenceBrew") and (cauldron:getData("filledWith") == "stock") then
			actionDuration = 40 -- when we combine a stock and an essence brew, it takes longer
		else
			actionDuration = 20
		end				
		User:startAction( actionDuration, 21, 5, 10, 45)
		return
	end	
	
    if (SourceItem:getData("filledWith") =="essenceBrew") then -- essence brew should be filled into the cauldron
		-- water, essence brew or potion is in the cauldron; leads to a failure
		if cauldron:getData("cauldronFilledWith") == "water" then
			CauldronDestruction(User,cauldron,1)
			
		elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			CauldronDestruction(User,cauldron,2)
			
		elseif cauldron:getData("filledWith") == "potion" then
			if cauldron.id == 1011 then -- support potion
				alchemy.item.id_165_blue_bottle.SupportEssencebrew(User,cauldron,SourceItem)
			else
				CauldronDestruction(User,cauldron,2)
		    end
			
		elseif cauldron:getData("filledWith") == "stock" then -- stock is in the cauldron; we call the combin function
				CombineStockEssence( User, SourceItem, cauldron, Counter, Param, ltstate )
				
		else -- nothing in the cauldron, we just fill in the essence brew
			FillFromTo(SourceItem,cauldron)	
		end
		
	elseif (SourceItem:getData("filledWith")=="potion") then -- potion should be filled into the cauldron
		    -- water, essence brew, potion or stock is in the cauldron; leads to a failure
		if cauldron:getData("cauldronFilledWith") == "water" then
			CauldronDestruction(User,cauldron,1)
			
		elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			CauldronDestruction(User,cauldron,2)
			
		elseif cauldron:getData("filledWith") == "potion" then
			if cauldron.id == 1011 then -- support potion
			    alchemy.item.id_165_blue_bottle.SupportPotion(User,cauldron,SourceItem)
			else
				CauldronDestruction(User,cauldron,2)
			end
				
		elseif cauldron:getData("filledWith") == "stock" then
			CauldronDestruction(User,cauldron,2)
			
		else -- nothing in the cauldron, we just fill in the potion
            FillFromTo(SourceItem,cauldron)	
		end
                
    end
	EmptyBottle(User,SourceItem)
	world:changeItem(SourceItem)
	world:changeItem(cauldron)	
end