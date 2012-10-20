-- ds_base_alchemy.lua

require("base.common");
module("alchemy.base.alchemy", package.seeall)

function InitAlchemy()
    InitPlants()
	InitPotions()
end

-- the list of plants with their substances
plantSubstanceList = {};

function InitPlantSubstance()
    setPlant(133, "Adrazin", "Orcanol") -- sunherb / Sonnenkraut
    setPlant(758, "Adrzain", "") -- heart blood / Herzblut
end;

function setPlantSubstance(id, plusSubstance, minusSubstance)
    plantList[id] = {plusSubstance, minusStubstance}
end

function getPlantSubstance(id)
    if not plantList[id] then
	    return false
	end	
	local plus; local minus
	if plantList[id][1] == nil then
	    plus = ""
	elseif plantList[id][2] == nil then
	    minus = ""
	else
        plus = plantList[id][1]
		minus = plantList[id][2]
    end     	
	return plus, minus    
end


-- the list of possible potions effects
potionsList = {};

-- on reload, this function is called
-- setPotion(effect id, stock data, Herb1, Herb2, Herb3, Herb4, Herb5, Herb6, Herb7, Herb8)
-- every effect id is only used once!
-- stock data is the concentration of the active substances put together in the following order: Adrazin, Illidrium, Caprazin, Hyperborelium, Echolon, Dracolin, Orcanol, Fenolin 
-- Herb1...Herb8 are optional. If you use only x Herbs and x < 8 just leave the others out
-- Example: setPotion(15, 95554553, 133, 15, 81)
-- document properly, please
function InitPotions()
    setPotion(45, 55555555, 45, 775, 3443, 33);
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


dataZList = { }
plantList =     { 158,159,160,161,162,758,759,763,15,155,388,81,80,151,147,199,9001,133,134,135,136,137,138,140,141,142,9016,144,145,146,9014,148,9004,152,153,9005,9015,156,9013,9003,9006,9007,9002,9008,9009,9010,9011,9012}
plantDataList = {   1,  2,  3,  4,  5,  6,  7,  8,10, 20, 30,40,50, 60, 70, 80,  81, 15, 16, 17, 18, 25, 26, 27, 28, 35,  36, 37, 38, 45,  46, 47,  48, 51, 52,  53,  54, 61,  62,  63,  64,  71,  72,  73,  82,  74,  83,  84}
plantNames = {"a", "b","c","df","ww","rer","wf","jwe","wd","fe","je","pe","bj","qk","fqq","qg","qq","wh","öö","klk","rrg","fef","ilui","fgege","efc","jjhth","few","threg","he","rg","gr","rgr","grerg","rgerg","jzgheg","efe","ilztg","uwef","grq","rbw","gr","dwd","fwsd","urs","erh","wfw","wfki","htw","sdf"} 

plantDataListById = {};
for i,plant in pairs(plantList) do
	plantDataListById[plant] = plantDataList[i];
end

--Qualitätsbezeichnungen
qListDe={"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"};
qListEn={"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"};

bottleList = { 164,166,331 }
bottleExchList = {166,329,165,330,59,327,328,167}

-- list with gemDust
gemList = {450,449,446,452,447,448,451,234}

newBottle = {}
for i, gem in pairs(gemList) do
  newBottle[gem] = bottleExchList[i]
end



-- Liste der Wirkstoffnamen
wirkstoff = {};
wirkung_de = {};
wirkung_en = {};

wirkstoff[1] = "Adrazin";
wirkstoff[2] = "Echolon";
wirkstoff[3] = "Orcanol";
wirkstoff[4] = "Illidrium";
wirkstoff[5] = "Hyperborelium";
wirkstoff[6] = "Fenolin";
wirkstoff[7] = "Caprazin";
wirkstoff[8] = "Dracolin";

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


-- --------------------------------------------------------------------
function SplitBottleData(User,potionEffectId)
    local dataZList = {};
	local thisDigit;
	local workData=potionEffectId
   for digit=1,8 do
      thisDigit=math.floor(workData/10^(8-digit));
      workData=workData-thisDigit*10^(8-digit);
      dataZList[digit] = (thisDigit==0 and 5 or math.min(9,math.max(1,thisDigit)));
   end
   return dataZList;
end
-- --------------------------------------------------------------------
function PasteBottleData(User,dataZList)

   -- neuen Datawert basteln:
   local NDW = 0
   for i=1,8 do
		NDW = NDW + math.min(9,math.max(1,dataZList[i]))*10^(8-i);
   end
   return NDW

end
-- --------------------------------------------------------------------

function DisplayData(User,debugtxt,wert)
    User:inform("debug:"..debugtxt..wert)
end
-- ---------------------------------------------------------------------
function IsThatABottle(einItem)
   retVal = false
   for i =1,table.getn(bottleList) do
      if bottleList[i] == einItem.id then
         retVal = true
      end
   end
   return retVal
end
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
   --User:inform("debug 12")

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

function ds_skillgain(User)
	--Alchemieskill erhöhen
	User:learn("alchemy",6,30,100,User:increaseAttrib("willpower",0));
	--Auf Runengewinn prüfen
	if(User:getMagicType() == 3) then
		local alcskill = User:getSkill("alchemy");
		if(alcskill >= 10 and alcskill <= 20) then
			User:teachMagic(3, 2^3); -- analyze stock
		elseif(alcskill <= 30) then
			User:teachMagic(3, 2^3); -- analyze stock
			User:teachMagic(3, 2^4); -- quality stock
		elseif(alcskill <= 40) then
			User:teachMagic(3, 2^3); -- analyze stock
			User:teachMagic(3, 2^4); -- quality stock
			User:teachMagic(3, 2^5); -- analyze potion
		elseif(alcskill <= 50) then
			User:teachMagic(3, 2^3); -- analyze stock
			User:teachMagic(3, 2^4); -- quality stock
			User:teachMagic(3, 2^5); -- analyze potion
			User:teachMagic(3, 2^6); -- quality potion
		elseif(alcskill > 50) then
			User:teachMagic(3, 2^3); -- analyze stock
			User:teachMagic(3, 2^4); -- quality stock
			User:teachMagic(3, 2^5); -- analyze potion
			User:teachMagic(3, 2^6); -- quality potion
			User:teachMagic(3, 2^9); -- analyze illness
		end
	end
end

function checkPotionSpam(User)
	-- Check ob der Begrenzungseffekt da ist
	foundEffect, myEffect = User.effects:find(331);
	if not foundEffect then -- nicht da, also erstellen
		myEffect=LongTimeEffect(331,144000);
		User.effects:addEffect(myEffect);
		myEffect:addValue("potioncount", 1);
		return false;
	else -- Effekt schon da, potioncount prüfen
		found, count = myEffect:findValue("potioncount");
		if(found) then -- increase potioncount
			count = count + 1;
		else -- looks like a bug, so simply set potioncount to 1
			count = 1;
		end
		
		if(count >= 3) then -- more than 3 potions in 4 hours? no!
			return true;
		end
		
		myEffect:addValue("potioncount", count);
		
		-- all is fine
		return false;
	end
end

function SplitCauldronData(User,CauldronData)
    local dataZList = {};
	local thisDigit;
	local workData=CauldronData
     for digit=1,8 do
      thisDigit=math.floor(workData/10^(8-digit));
      workData=workData-thisDigit*10^(8-digit);
      dataZList[digit] = (thisDigit==0 and 5 or math.min(9,math.max(1,thisDigit)));
   end
   return dataZList;
end

function PasteCauldronData(User,dataZList)

-- create new data:
local NDW = 0
     for i=1,8 do
     NDW = NDW + math.min(9,math.max(1,dataZList[i]))*10^(8-i);
     end
     return NDW

end

function CheckIfGemDust(SourceItem)
local retVal = nil;
for i,checkId in pairs(gemList) do
    theItem = SourceItem
	if theItem.id == checkId then
    retVal = theItem
    break;
    end
end	
return retVal
end

function CheckIfAlchemist(User,textDE,textEN)
    if User:getMagicType() ~= 3 then
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
    world:changeItem(Item)
end

function RemoveStock(Item)
    for i=1,8 do
	    Item:setData(wirkstoff[i].."Concentration","")
	end
	world:changeItem(Item)
end

function RemoveAll(Item)
    RemoveEssenceBrew(Item)
	RemoveStock(Item)
	cauldron:setData("potionEffectId","")
	cauldron:setData("potionQuality","")
	cauldron:setData("cauldronFilledWith","")
	cauldron:setData("potionId","") -- cauldron.id = X 
	world:changeItem(cauldron)
end

function CauldronDestruction(User,cauldron,effectId)
    
	if (effectId < 1) or (effectId > 3) or (effectId == nil) then
	    effectId = 1
	end
	
	local textDE = nil; local textEN = nil
	if effectId == 1 then
	    world:gfx(1,cauldron.pos)
		world:makeSound(5,cauldron.pos)
	    User:inform("Du Inhalt des Kessels verpufft, als Du das Kraut hinzu tust.",
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
end

function GetQuality(User)
return 999
end
----------------------------------------------------
-- combine of stock and essence brew to create a potion
-- function is only called when item 331 is a stock or when a potion-bottle is an essence brew
function CombineStockEssence( User, SourceItem, TargetItem, Counter, Param, ltstate )
    local ourStock
	local ourEssence
	local potionId
	local essenceHerbs
	local potionEffectId
	
	if base.common.GetFrontItemID(User) == 1008 then
		TargetItem = base.common.GetFrontItem( User ); -- cauldron
		
		if SourceItem.id == 331 then
		    ourStock = SourceItem -- SourceItem is a stock, so it becomes our stock!
		    ourEssence = TargetItem -- and the essence brew is in the cauldron (TargetItem)
		    potionId = ourEssence:getData("potionId") -- essence brew in cauldron: we need to check the data
		else -- not a stock bottle (but a potion bottle = essence brew)
		    ourStock = TargetItem -- the stock is in the cauldron
			ourEssence = SourceItem -- and the essence brew in the bottle
		    potionId = ourEssence.id -- essence brew in bottle: we use the id of the SourceItem
		end
        
		essenceHerbs = ourEssence:getData("essenceHerbs")  
	
        if checkStringEssence == "" then -- when there was not even one herb in the essence brew
		    if (potionId == 166) or (potionId == 59) then -- attribute pushers and healing potions do not need essenced hersb
			    potionEffectId = ourStock:getData("stockData") -- the PotionEffectId is the same as the stock data
			else 
                potionEffectId = 0 -- effect id 0 means no effect			
	        end
		else
            for i=1,#ListPotionStock[potionId] do
                if ListPotionStock[potionId][i] == ourStock:getData("stockData") then
	                if ListPotionEssence[potionId][i] == essenceHerbs then
	                    potionEffectId = ListPotionEffectId[potionId][i] -- we have a stock and an essence brew which matchn so that's our effect id
	                    break
	                end
                end
            end
        end
        
		if not potionEffectId then -- if the potion effect id hasn't been set yet, it has to be 0
		    potionEffectId = 0 
		end
		
		-- now we have to put everything together
		TargetItem:setData("stockData","")
		TargetItem:setData("potionId",""..potionId)
		TargetItem:setData("potionEffectId",""..potionEffectId)
		potionQuality = 999
	    TargetItem:setData("potionQuality",""..potionQuality)
	    world:changeItem(TargetItem)
	    world:makeSound(13,TargetItem.pos)
		world:gfx(53,TargetItem.pos)
	end    
end	
-------------------------------------------------------		
-- ListPotionStock[potion.id][x] and ListPotionEssence[potion.id][x] ->  ListPotionEffectId[potion.id][x]
-- in ListPotionStock: stockData
-- in ListPotionEssence: herbs the essence brew has to contain; must not be more herbs than 8! 
-- never the exact same combination of herbs twice in one essence brew list of the same potion kind!
-- in ListPotionEffectId: the id of the effect, obviously

ListPotionStock = {}
ListPotionEssence = {}		
ListPotionEffectId = {}
-- red bottle:
ListPotionStock[59] = {}
ListPotionEssence[59] = {}		
ListPotionEffectId[59] = {}
-- light blue bottle:
ListPotionStock[165] = {}
ListPotionEssence[165] = {}		
ListPotionEffectId[165] = {}
-- pink bottle: 
ListPotionStock[166] = {}
ListPotionEssence[166] = {}		
ListPotionEffectId[166] = {}
-- dark blue bottle:
ListPotionStock[327] = {}
ListPotionEssence[327] = {}		
ListPotionEffectId[327] = {}
-- orange bottle:
ListPotionStock[328] = {}
ListPotionEssence[328] = {}		
ListPotionEffectId[328] = {}
-- black bottle: 
ListPotionStock[329] = {"65554555","75553555"}
ListPotionEssence[329] = {"133"   ,"133 133"}		
ListPotionEffectId[329] = {1     ,2}
-- white bottle:
ListPotionStock[330] = {}
ListPotionEssence[330] = {}		
ListPotionEffectId[330] = {}
