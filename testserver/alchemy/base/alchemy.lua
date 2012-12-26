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
	
	setPlantSubstance(15,"","")
	setPlantSubstance(80,"","")
	setPlantSubstance(154,"","")
	setPlantSubstance(200,"","")
	setPlantSubstance(201,"","")
	setPlantSubstance(259,"","")
	setPlantSubstance(290,"","")
	setPlantSubstance(302,"","")
	setPlantSubstance(772,"","")
	setPlantSubstance(778,"","")
	setPlantSubstance(2493,"","")
	
	setPlantSubstance(138,"","Dracolin")
	setPlantSubstance(146,"","Echolon")
	setPlantSubstance(152,"Echolon","")
	setPlantSubstance(754,"","Caprazin")
	setPlantSubstance(755,"","Illidrium")
	setPlantSubstance(756,"Caprazin","")
	setPlantSubstance(757,"Dracolin","")
	setPlantSubstance(758,"Adrazin","")
	setPlantSubstance(760,"","Fenolin")
	setPlantSubstance(761,"Illidrium","")
	setPlantSubstance(762,"","Orcanol")
	setPlantSubstance(764,"","Adrazin")
	setPlantSubstance(765,"Hyperborelium","")
	setPlantSubstance(766,"","Hyperborelium")
	setPlantSubstance(768,"Orcanol","")
	setPlantSubstance(769,"Fenolin","")
	
	setPlantSubstance(81,"Illidrium","Orcanol")
	setPlantSubstance(133,"Adrazin","Orcanol")
	setPlantSubstance(134,"Fenolin","Illidrium")
	setPlantSubstance(135,"Fenolin","Adrazin")
	setPlantSubstance(136,"Adrazin","Fenolin")
	setPlantSubstance(137,"Echolon","Illidrium")
	setPlantSubstance(140,"Fenolin","Hyperborelium")
	setPlantSubstance(141,"Caprazin","Echolon")
	setPlantSubstance(142,"Hyperborelium","Dracolin")
	setPlantSubstance(143,"Illidrium","Dracolin")
	setPlantSubstance(144,"Adrazin","Dracolin")
	setPlantSubstance(145,"Hyperborelium","Orcanol")
	setPlantSubstance(147,"Echolon","Adrazin")  
	setPlantSubstance(148,"Echolon","Caprazin")
	setPlantSubstance(149,"Hyperborelium","Echolon")
	setPlantSubstance(151,"Caprazin","Dracolin") 
	setPlantSubstance(153,"Fenolin","Caprazin")
	setPlantSubstance(155,"Illidrium","Echolon")
	setPlantSubstance(156,"Orcanol","Adrazin")     
	setPlantSubstance(158,"Illidrium","Fenolin")
	setPlantSubstance(159,"Dracolin","Hyperborelium")
	setPlantSubstance(160,"Adrazin","Echolon")
	setPlantSubstance(161,"Orcanol","Hyperborelium")
	setPlantSubstance(162,"Hyperborelium","Fenolin")
	setPlantSubstance(163,"Orcanol","Illidrium")
	setPlantSubstance(199,"Caprazin","Orcanol")
	setPlantSubstance(388,"Caprazin","Fenolin")
	setPlantSubstance(752,"Orcanol","Caprazin")
	setPlantSubstance(753,"Dracolin","Adrazin")
	setPlantSubstance(759,"Dracolin","Illidrium")
	setPlantSubstance(763,"Dracolin","Caprazin")
	setPlantSubstance(767,"Echolon","Hyperborelium")
	
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
ingredientsList = {}
potionName = {}
idList = {}

-- on reload, this function is called
-- setPotion(effect id, stock data, gemdust ,Herb1, Herb2, Herb3, Herb4, Herb5, Herb6, Herb7, Herb8)
-- every effect id is only used once!
-- gemdust is the id of the gemdust used. indirectly, the potion kind
-- stock data is the concentration of the active substances put together in the following order: Adrazin, Illidrium, Caprazin, Hyperborelium, Echolon, Dracolin, Orcanol, Fenolin 
-- Herb1...Herb8 are optional. If you use only x Herbs and x < 8 just write false for the rest
-- Example: setPotion(15, 459, 95554553, 133, 15, 81, false, false, false, false, false)
-- for an better overview, we save the names in an own list
function InitPotions()
    
-- bombs 
    potionName[301]	= {"Small Explosion","Kleine Explosion"}
	setPotion(301, 446, 15761498, 146, 764, 141, false, false, false, false, false)
	potionName[302]	= {"Medium Explosion","Mittlere Explosion"}
	setPotion(302, 446, 15761498, 146, 764, 764, 141, 141, false, false, false)
	potionName[304]	= {"Big Explosion","Große Explosion"}
	setPotion(304, 446, 15761498, 146, 764, 764, 764, 141, 141, 141, false)
	potionName[306]	= {"Small Mana Annihilator","Kleiner Manaannihilator"}
	setPotion(306, 446, 15761498, 146, 134, 141, false, false, false, false, false)
	potionName[307]	= {"Medium Mana Annihilator","Mittlerer Manaannihilator"}
	setPotion(307, 446, 15761498, 146, 134, 134, 141, 141, false, false, false)
	potionName[309]	= {"Big Mana Annihilator","Großer Manaannihilator"}
	setPotion(309, 446, 15761498, 146, 134, 134, 134, 141, 141, 141, false)
	potionName[311]	= {"Small Nutrition Annihilator","Kleiner Nahrungsannihilator"}
	setPotion(311, 446, 15761498, 146, 754, 141, false, false, false, false, false)
	potionName[312]	= {"Medium Nutrition Annihilator","Mittlerer Nahrungsannihilator"}
	setPotion(312, 446, 15761498, 146, 754, 754, 141, 141, false, false, false)
	potionName[314]	= {"Big Nutrition Annihilator","Großer Nahrungsannihilator"}
	setPotion(314, 446, 15761498, 146, 754, 754, 754, 141, 141, 141, false)
	potionName[316]	= {"Small Slime Barrier","Kleine Schleimbarriere"}
	setPotion(316, 446, 91535851, 146, 140, 140, 152, 141, 141, false, false)
	potionName[317]	= {"Big Slime Barrier","Große Schleimbarriere"}
	setPotion(317, 446, 91535851, 146, 140, 140, 140, 152, 152, 141, 141)
-- bombs end	
	
-- quality raiser
	potionName[400] = {"Quality Raiser for Potions based on Emerald Powder","Qualitätsheber für Tränke auf Smaragdstaubbasis"}
	setPotion(400, 448, 95155955, 133, 133, 133, 146, false, false, false, false)
    potionName[401] = {"Quality Raiser for Potions based on Ruby Powder","Qualitätsheber für Tränke auf Rubinstaubbasis"}
	setPotion(401, 448, 95155955, 133, 133, 133, 764, false, false, false, false)
	potionName[402] = {"Quality Raiser for Potions based on Sapphire Powder","Qualitätsheber für Tränke auf Saphirstaubbasis"}
	setPotion(402, 448, 95155955, 133, 133, 133, 761, false, false, false, false)
	potionName[403] = {"Quality Raiser for Potions based on Obsidian Powder","Qualitätsheber für Tränke auf Obsidianstaubbasis"}
	setPotion(403, 448, 95155955, 133, 133, 133, 766, false, false, false, false)
	potionName[404] = {"Quality Raiser for Potions based on Amethyst Powder","Qualitätsheber für Tränke auf Amethyststaubbasis"}
	setPotion(404, 448, 95155955, 133, 133, 133, 152, false, false, false, false)
	potionName[405] = {"Quality Raiser for Potions based on Topaz Powder","Qualitätsheber für Tränke auf Topasstaubbasis"}
	setPotion(405, 448, 95155955, 133, 133, 133, 758, false, false, false, false)
	potionName[406] = {"Quality Raiser for Potions based on Diamond Powder","Qualitätsheber für Tränke auf Diamantstaubbasis"}
	setPotion(406, 448, 95155955, 133, 133, 133, 765, false, false, false, false)
-- quality raiser end

-- transformation potions
	potionName[500] = {"Shape Shifter Male Human","Verwandler Männlicher Mensch"}
	setPotion(500, 449, 53415955, 766, 161, 769, false, false, false, false, false)
	potionName[501] = {"Shape Shifter Female Human","Verwandler Weiblicher Mensch"}
	setPotion(501, 449, 53415955, 766, 162, 769, false, false, false, false, false)
	potionName[510] = {"Shape Shifter Male Dwarf","Verwandler Männlicher Zwerg"}
	setPotion(510, 449, 53415955, 766, 161, 762, false, false, false, false, false)
	potionName[511] = {"Shape Shifter Female Dwarf","Verwandler Weiblicher Zwerg"}
	setPotion(511, 449, 53415955, 766, 162, 762, false, false, false, false, false)
	potionName[520] = {"Shape Shifter Male Halfling","Verwandler Männlicher Halbling"}
	setPotion(520, 449, 53415955, 766, 161, 768, false, false, false, false, false)
	potionName[521] = {"Shape Shifter Female Halfling","Verwandler Weiblicher Halbling"}
	setPotion(521, 449, 53415955, 766, 162, 768, false, false, false, false, false)
	potionName[530] = {"Shape Shifter Male Elf","Verwandler Männlicher Elf"}
	setPotion(530, 449, 53415955, 766, 161, 138, false, false, false, false, false)
	potionName[531] = {"Shape Shifter Female Elf","Verwandler Weiblicher Elf"}
	setPotion(531, 449, 53415955, 766, 162, 138, false, false, false, false, false)
	potionName[540] = {"Shape Shifter Male Orc","Verwandler Männlicher Ork"}
	setPotion(540, 449, 53415955, 766, 161, 764, false, false, false, false, false)
	potionName[541] = {"Shape Shifter Female Orc","Verwandler Weiblicher Ork"}
	setPotion(541, 449, 53415955, 766, 162, 764, false, false, false, false, false)
	potionName[550] = {"Shape Shifter Male Lizardman","Verwandler Männlicher Lizardman"}
	setPotion(550, 449, 53415955, 766, 161, 761, false, false, false, false, false)
	potionName[551] = {"Shape Shifter Female Echsenmensch","Verwandler Weiblicher Echsenmensch"}
	setPotion(551, 449, 53415955, 766, 162, 761, false, false, false, false, false)
-- transformation potions end

--language potions
	potionName[600] = {"Language Potion Common Language","Sprachtrank Handelssprache"}
	setPotion(600, 452, 58541757, 756, 765, 135, false, false, false, false, false)
    potionName[601] = {"Language Potion Human Language","Sprachtrank Menschensprache"}
	setPotion(601, 452, 58541757, 756, 765, 769, false, false, false, false, false)
	potionName[602] = {"Language Potion Dwarf Language","Sprachtrank Zwergenspreche"}
	setPotion(602, 452, 58541757, 756, 765, 762, false, false, false, false, false)
	potionName[603] = {"Language Potion Elf Language","Sprachtrank Elfensprache"}
	setPotion(603, 452, 58541757, 756, 765, 138, false, false, false, false, false)
	potionName[604] = {"Language Potion Lizard Language","Sprachtrank Echsensprache"}
	setPotion(604, 452, 58541757, 756, 765, 761, false, false, false, false, false)
	potionName[605] = {"Language Potion Orc Language","Sprachtrank Orksprache"}
	setPotion(605, 452, 58541757, 756, 765, 764, false, false, false, false, false)
	potionName[606] = {"Language Potion Halfling Language","Sprachtrank Halblingssprache"}
	setPotion(606, 452, 58541757, 756, 765, 768, false, false, false, false, false)
	potionName[607] = {"Language Potion Ancient Language","Sprachtrank Antike Sprache"}
	setPotion(607, 452, 25796346, 756, 756, 765, 152, false, false, false, false)
-- language potions end	
	
end

function setPotion(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)

    table.insert(idList,effect)
    setPotionEffect(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
	setPotionIngredients(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)

end

--- Set the effect of a potion
-- @param resultingEffect the resulting effect of the potion
-- @param ... the components effecting the potion one by one
function setPotionEffect(resultingEffect, ...)
	local currentList = potionsList;
	for i, v in ipairs(arg) do
		if (currentList[v] == nil) then
			currentList[v] = {};
		end;
		currentList = currentList[v];
	end;
	currentList[0] = resultingEffect;
end;

function setPotionIngredients(effect,gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8)
    if ingredientsList == nil then
	    ingredientsList = {}
	end
    ingredientsList[effect]	= {gemdust,stock,essenceHerb1,essenceHerb2,essenceHerb3,essenceHerb4,essenceHerb5,essenceHerb6,essenceHerb7,essenceHerb8}
end

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

function getIngredients(effectId)

    if ingredientsList[effectId] == nil then
	    return
	else
        return ingredientsList[effectId]
    end		
end

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
wirkstoff[4] = "Hyperborelium";
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

wirkung_en[1] = "saturated solution of";
wirkung_en[2] = "dominant marked";
wirkung_en[3] = "distinctive";
wirkung_en[4] = "slightly marked";
wirkung_en[5] = "no";
wirkung_en[6] = "slightly pronounced";
wirkung_en[7] = "enriched";
wirkung_en[8] = "dominant pronounced";
wirkung_en[9] = "highly toxic";

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

function CheckIfPotionBottle(SourceItem, User)
local retVal = nil;
for i,checkId in pairs(bottleList) do
    theItem = SourceItem
	if theItem.id == checkId then
    retVal = theItem
    break;
    end
end	
return retVal
end

function GetCauldronInfront(User,Item)
    local retVal = nil
    Item = base.common.base.common.GetFrontItem(User)
	if (Item ~= nil) and (Item.id >= 1008) and (Item.id <= 1018) then
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

function getBottleFromEffect(effectId)
-- won't work with NORMAL primar and secundar attribute potins, since the both have 11111111 - 99999999 as a range for effect ids
    if (effectId >= 1) and (effectId <= 99) then
	    return 166
	elseif (effectId >= 100) and (effectId <= 199) then
	    return 59
    elseif (effectId >= 200) and (effectId <= 299) then
	    return 167
	elseif (effectId >= 300) and (effectId <= 399) then
	    return 327
    elseif (effectId >= 400) and (effectId <= 499) then
	    return 165		
    elseif (effectId >= 500) and (effectId <= 599) then
	    return 329
	elseif (effectId >= 600) and (effectId <= 699) then
	    return 330
    end
    return	
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
	end
	if toItem.id >= 1008 and toItem.id <= 1018 then
		local reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, nil, fromItem)
		toItem.id = reCauldron
	else
		local reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, fromItem, nil)
		toItem.id = reBottle
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
-- skill has an influence of 75% on the mean
    local skillQuali = User:getSkill(Character.alchemy)*0.75 
-- attributes have an influence of 25% on the mean (if the sum of the attributes is 40 or higher, we reach the maixmum influence)	
	local attribCalc = (((User:increaseAttrib("essence",0) + User:increaseAttrib("perception",0))/2))*5 
	local attribQuali = base.common.Scale(0,25,attribCalc)
-- the mean	
	local mean =  base.common.Scale(1,9,(attribQuali + skillQuali)) 
-- normal distribution; mean determined by skill and attributes; fixed standard deviation	
	local quality 
	repeat 
	    quality = Random.normal(mean, 4.5)
	until (quality >= 1 and quality <= 9)	
	
	Item:setData("potionQuality",quality*100+99)-- duarability is useless, we set it anway
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
		-- check if char is able to combine
		if effectID > 0 then
			if User:getQuestProgress(effectID+1000) == 0 then
				User:inform("Du versuchst die Gebräue zu verbinden, doch sie scheinen sich nicht vermischen zu wollen. Scheinbar beherrscht du diesen Trank noch nicht richtig.",
							"You try to combine the brews but they just don't admix. It seem that you haven't learned how to create this potion properly.")
				return false
			end
        end			
		-- delte old cauldron datas and add new ones
		RemoveAll(cauldron)
		SetQuality(User,cauldron);User:inform(""..newCauldron)
		cauldron.id = newCauldron
		cauldron:setData("potionEffectId", effectID)
		cauldron:setData("filledWith", "potion")
		world:changeItem(cauldron)
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)
	    -- and learn!
	    User:learn(Character.alchemy, 80, 100)
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
			actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
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
				local check = CombineStockEssence( User, SourceItem, cauldron, Counter, Param, ltstate )
				if check == false then
				    return
				end	
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