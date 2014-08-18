--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- ds_base_alchemy.lua

require("base.common");
require("base.licence")
module("alchemy.base.alchemy", package.seeall)

function InitAlchemy()
    InitPlantSubstance()
	InitPotions()
end

function InitPlantSubstance()

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
	setPlantSubstance(1207,"","")
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

-- body liquid potions
    potionName[10]	= {"Dragon Breath","Drachenatem"}
	setPotion(10, 450, 58325631, 755, 755, 141, 141, 141, 146, false, false) -- done
-- body liquid end

-- bombs
    potionName[301]	= {"Small Explosion","Kleine Explosion"}
	setPotion(301, 446, 34374416, 755, 755, 755, 146, 141 ,141, 141, 133)
	potionName[302]	= {"Medium Explosion","Mittlere Explosion"}
	setPotion(302, 446, 44156426, 755, 755, 146, 146, 141 ,141, 141, 133)
	potionName[304]	= {"Big Explosion","Große Explosion"}
	setPotion(304, 446, 22446419, 755, 146, 146, 146, 141 ,141, 141, 133) -- done
	potionName[306]	= {"Small Mana Annihilator","Kleiner Manaannihilator"}
	setPotion(306, 446, 22856451, 138, 138, 138, 146, 134, 134, 134, 133)
	potionName[307]	= {"Medium Mana Annihilator","Mittlerer Manaannihilator"}
	setPotion(307, 446, 21957432, 138, 138, 146, 146, 134, 134, 134, 133)
	potionName[309]	= {"Big Mana Annihilator","Großer Manaannihilator"}
	setPotion(309, 446, 22955451, 138, 146, 146, 146, 134, 134, 134, 133)
	potionName[311]	= {"Small Nutrition Annihilator","Kleiner Nahrungsannihilator"}
	setPotion(311, 446, 26843821, 754, 754, 754, 146, 135, 135, 135, 133)
	potionName[312]	= {"Medium Nutrition Annihilator","Mittlerer Nahrungsannihilator"}
	setPotion(312, 446, 15873523, 754, 754, 146, 146, 135, 135, 135, 133)
	potionName[314]	= {"Big Nutrition Annihilator","Großer Nahrungsannihilator"}
	setPotion(314, 446, 15783424, 754, 146, 146, 146, 135, 135, 135, 133)
	potionName[316]	= {"Small Slime Barrier","Kleine Schleimbarriere"}
	setPotion(316, 446, 86386546, 140, 140, 140, 152, 146, false, false, false)
	potionName[317]	= {"Big Slime Barrier","Große Schleimbarriere"}
	setPotion(317, 446, 76576456, 140, 140, 140, 140, 152, 152, 146, 146)
	potionName[318]	= {"Lennier's Dream","Lenniers Traum"}
	setPotion(318, 446, 57932798, 765,146,146,146,148,15,151,764)
-- bombs end

-- quality raiser
	potionName[400] = {"Quality Raiser for Potions based on Emerald Powder","Qualitätsheber für Tränke auf Smaragdstaubbasis"}
	setPotion(400, 448, 69487354, 763, 768, 133, 133, 133, false, false, false)
    potionName[401] = {"Quality Raiser for Potions based on Ruby Powder","Qualitätsheber für Tränke auf Rubinstaubbasis"}
	setPotion(401, 448, 64966357, 763, 758, 133, 133, 133, false, false, false)
	potionName[402] = {"Quality Raiser for Potions based on Sapphire Powder","Qualitätsheber für Tränke auf Saphirstaubbasis"}
	setPotion(402, 448, 62497378, 763, 146, 133, 133, 133, false, false, false)
	potionName[403] = {"Quality Raiser for Potions based on Obsidian Powder","Qualitätsheber für Tränke auf Obsidianstaubbasis"}
	setPotion(403, 448, 64489753, 763, 766, 133, 133, 133, false, false, false)
	potionName[404] = {"Quality Raiser for Potions based on Amethyst Powder","Qualitätsheber für Tränke auf Amethyststaubbasis"}
	setPotion(404, 448, 67645954, 763, 152, 133, 133, 133, false, false, false)
	potionName[405] = {"Quality Raiser for Potions based on Topaz Powder","Qualitätsheber für Tränke auf Topasstaubbasis"}
	setPotion(405, 448, 64873297, 763, 761, 133, 133, 133, false, false, false)
	potionName[406] = {"Quality Raiser for Potions based on Diamond Powder","Qualitätsheber für Tränke auf Diamantstaubbasis"}
	setPotion(406, 448, 64763659, 763, 756, 133, 133, 133, false, false, false)
-- quality raiser end

-- transformation potions
	potionName[500] = {"Shape Shifter Male Human","Verwandler Männlicher Mensch"}
	setPotion(500, 449, 64135842, 766, 161, 754, 752, false, false, false, false)
	potionName[501] = {"Shape Shifter Female Human","Verwandler Weiblicher Mensch"}
	setPotion(501, 449, 64135842, 766, 162, 754, 752, false, false, false, false)
	potionName[510] = {"Shape Shifter Male Dwarf","Verwandler Männlicher Zwerg"}
	setPotion(510, 449, 74385866, 766, 161, 762, 759, false, false, false, false)
	potionName[511] = {"Shape Shifter Female Dwarf","Verwandler Weiblicher Zwerg"}
	setPotion(511, 449, 74385866, 766, 162, 762, 759, false, false, false, false)
	potionName[520] = {"Shape Shifter Male Halfling","Verwandler Männlicher Halbling"}
	setPotion(520, 449, 84452136, 766, 161, 765, 151, false, false, false, false)
	potionName[521] = {"Shape Shifter Female Halfling","Verwandler Weiblicher Halbling"}
	setPotion(521, 449, 84452136, 766, 162, 765, 151, false, false, false, false)
	potionName[530] = {"Shape Shifter Male Elf","Verwandler Männlicher Elf"}
	setPotion(530, 449, 87372749, 766, 161, 756, 753, false, false, false, false)
	potionName[531] = {"Shape Shifter Female Elf","Verwandler Weiblicher Elf"}
	setPotion(531, 449, 87372749, 766, 162, 756, 753, false, false, false, false)
	potionName[540] = {"Shape Shifter Male Orc","Verwandler Männlicher Ork"}
	setPotion(540, 449, 63584498, 766, 161, 764, 763, false, false, false, false)
	potionName[541] = {"Shape Shifter Female Orc","Verwandler Weiblicher Ork"}
	setPotion(541, 449, 63584498, 766, 162, 764, 763, false, false, false, false)
	potionName[550] = {"Shape Shifter Male Lizardman","Verwandler Männlicher Echsenmensch"}
	setPotion(550, 449, 23417592, 766, 161, 760, 767, false, false, false, false)
	potionName[551] = {"Shape Shifter Female Echsenmensch","Verwandler Weiblicher Echsenmensch"}
	setPotion(551, 449, 23417592, 766, 162, 760, 767, false, false, false, false)
	potionName[560] = {"Shape Shifter Dog","Verwandler Hund"}
	setPotion(560, 449, 31397191, 766, 152, 81, 81, 762, false, false, false)
-- transformation potions end

--language potions
	potionName[600] = {"Language Potion Common Language","Sprachtrank Handelssprache"}
	setPotion(600, 452, 26727482, 756, 765, 135, false, false, false, false, false)
    potionName[601] = {"Language Potion Human Language","Sprachtrank Menschensprache"}
	setPotion(601, 452, 28751379, 756, 765, 769, false, false, false, false, false)
	potionName[602] = {"Language Potion Dwarf Language","Sprachtrank Zwergensprache"}
	setPotion(602, 452, 23369487, 756, 765, 762, false, false, false, false, false)
	potionName[603] = {"Language Potion Elf Language","Sprachtrank Elfensprache"}
	setPotion(603, 452, 51397674, 756, 765, 138, false, false, false, false, false)
	potionName[604] = {"Language Potion Lizard Language","Sprachtrank Echsensprache"}
	setPotion(604, 452, 85612648, 756, 765, 761, false, false, false, false, false)
	potionName[605] = {"Language Potion Orc Language","Sprachtrank Orksprache"}
	setPotion(605, 452, 58641767, 756, 765, 764, false, false, false, false, false)
	potionName[606] = {"Language Potion Halfling Language","Sprachtrank Halblingssprache"}
	setPotion(606, 452, 56612824, 756, 765, 768, false, false, false, false, false)
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
	local args = table.pack(...)
    for i=1,args.n do
		if (currentList[args[i]] == nil) then
			currentList[args[i]] = {};
		end;
		currentList = currentList[args[i]];
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
    local args = table.pack(...)
	for i=1,args.n do
			if (currentList[args[i]] == nil) then
					return 0;
			end;
			currentList = currentList[args[i]];
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

wirkung_de[1] = "gesättigte Anreicherung";
wirkung_de[2] = "eine sehr ausgeprägte Menge";
wirkung_de[3] = "merklich";
wirkung_de[4] = "schwache Konzentration";
wirkung_de[5] = "kein";
wirkung_de[6] = "geringe Mengen";
wirkung_de[7] = "etwas";
wirkung_de[8] = "konzentriertes";
wirkung_de[9] = "hoch toxisches";

wirkung_en[1] = "saturated solution";
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

function DataListToNumber(dataList)
	theData = 0
	for i=1,8 do
		theData = theData + dataList[i]*10^(8-i)
	end
	return theData
end

function SubstanceDatasToList(theItem)
    local substanceList = {}
	for i=1,8 do
	    local concentration = tonumber(theItem:getData(wirkstoff[i].."Concentration"))
		if concentration ~= nil then
			table.insert(substanceList,concentration)
		end
	end

	return substanceList
end

-- probably, works only with lists containing no other lists
-- todo: make it also possibel to check lists containing list(s)
function CheckListsIfEqual(ListOne,ListTwo)
    local check = true
	if #ListOne == #ListTwo then
	    for i=1,#ListOne do
		    if ListOne[i] ~= ListTwo[i] then
			    check = false
			    break
			end
		end
	else
		check = false
	end
    return check
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

function CheckIfGemDust(itemId)
local retVal = nil;
for i,checkId in pairs(gemDustList) do
    if itemId == checkId then
    retVal = itemId
    break;
    end
end
return retVal
end

FOOD_NEEDED = 250

function checkFood(User)
	if not base.common.FitForHardWork(User, FOOD_NEEDED) then
		return false
	end
	return true
end

function lowerFood(User)
	base.common.GetHungry(User, FOOD_NEEDED)
end

function CheckIfPlant(itemId)
	if plantList[itemId] ~= nil or itemId == 157 then
		return true
	end
	return false
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
    Item = base.common.GetFrontItem(User)
	if (Item ~= nil) and (Item.id >= 1008) and (Item.id <= 1018) then
	    retVal = Item
	end
	return retVal
end

function CheckIfAlchemist(User)
    if (User:getMagicType() ~= 3) then
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
	   world:erase(Bottle,1) -- bottle breaks
	   base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
	else
		if Bottle.number > 1 then -- if we empty a bottle (stock, potion or essence brew) it should normally never be a stack! but to be one the safe side, we check anyway
		    User:createItem(164,1,333,nil)
			world:erase(Bottle,1)
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
	local quality = tonumber(fromItem:getData("potionQuality"))
	if quality == nil then
	    quality = fromItem.quality
	end
	if toItem.id >= 1008 and toItem.id <= 1018 then
		toItem:setData("potionQuality",quality)
	else
		toItem.quality = quality
	end
    local reGem, reDust, reCauldron, reBottle
	if fromItem.id >= 1008 and fromItem.id <= 1018 then
	   reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, fromItem.id, nil)
	else
	    reGem, reDust, reCauldron, reBottle = GemDustBottleCauldron(nil, nil, nil, fromItem.id)
	end
	if toItem.id >= 1008 and toItem.id <= 1018 then
		toItem.id = reCauldron
	else
		toItem.id = reBottle
	end
    world:changeItem(toItem)
end

function CheckExplosionAndCleanList(User)
   local check = false
	if USER_EXPLOSION_LIST then
		if USER_EXPLOSION_LIST[User.id] == true then
			check = true
		    USER_EXPLOSION_LIST[User.id] = nil
		end
    end
    return check
end

function CauldronDestruction(User,cauldron,effectId)
    if USER_EXPLOSION_LIST == nil then -- note: it's global!
		USER_EXPLOSION_LIST = {}
	end

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
	USER_EXPLOSION_LIST[User.id] = true
	RemoveAll(cauldron)
	cauldron.id = 1008
	world:changeItem(cauldron)
end

function SetQuality(User,Item)
-- skill has an influence of 75% on the mean
    local skillQuali = User:getSkill(Character.alchemy)*0.75
-- attributes have an influence of 25% on the mean (if the sum of the attributes is 54 or higher, we reach the maixmum influence)
	local attribCalc = (((User:increaseAttrib("essence",0) + User:increaseAttrib("perception",0) + User:increaseAttrib("intelligence",0) )/3))*5
	local attribQuali = base.common.Scale(0,25,attribCalc)
-- the mean
	local mean =  base.common.Scale(1,9,(attribQuali + skillQuali))
-- normal distribution; mean determined by skill and attributes; fixed standard deviation
	local quality = Random.normal(mean, 4.5);
	quality = base.common.Limit(quality, 1, 9);

	Item:setData("potionQuality",quality*100+99)-- duarability is useless, we set it anway
end

function GemDustBottleCauldron(gemId, gemdustId, cauldronId, bottleId)
    -- this function returns matching gem id, gemdust id, cauldron id and bottle id
    -- only one parameter is needed; if there are more than one, only the first one will be taken into account
    local myList
	local myValue
    if gemId then
	    myList = gemList
		myValue = gemId
	elseif gemdustId then
	    myList = gemDustList
		myValue = gemdustId
	elseif cauldronId then
	    myList = cauldronList
		myValue = cauldronId
    elseif bottleId then
        myList = bottleList
		myValue = bottleId
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
		    reGem, ingredientGemdust, newCauldron, reBottle = GemDustBottleCauldron(nil, nil, essenceBrew.id, nil)
		else
			reGem, ingredientGemdust, newCauldron, reBottle = GemDustBottleCauldron(nil, nil, nil, essenceBrew.id)
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
            if ingredientGemdust == 447 then
				if myIngredients[3] == 136 and myIngredients[4] == 136 and myIngredients[5] == 761 and myIngredients[6] == 765 and myIngredients[7] == 159 then
					debug("stockCocn is "..stockConc)
					effectID = 59*100000000+stockConc
					debug("eefctID is "..effectID)
				else
				    effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8],myIngredients[9],myIngredients[10])
				end
			else
				effectID = getPotion(myIngredients[1],myIngredients[2],myIngredients[3],myIngredients[4],myIngredients[5],myIngredients[6],myIngredients[7],myIngredients[8],myIngredients[9],myIngredients[10])
			end
		end
		-- check if char is able to combine
		effectID = tonumber(effectID)
		if effectID >= 1000 and effectID <= 1999 then
			if User:getQuestProgress(effectID+1000) == 0 then
				User:inform("Du versuchst die Gebräue zu verbinden, doch sie scheinen sich nicht vermischen zu wollen. Scheinbar beherrscht du diesen Trank noch nicht richtig.",
							"You try to combine the brews but they just don't admix. It seem that you haven't learned how to create this potion properly.")
				return false
			end
        end
		-- delte old cauldron datas and add new ones
		RemoveAll(cauldron)
		SetQuality(User,cauldron)
		cauldron.id = newCauldron
		debug("effect id 2: "..effectID)
		cauldron:setData("potionEffectId", ""..effectID)
		cauldron:setData("filledWith", "potion")
		world:changeItem(cauldron)
		debug("effect id after adding: "..cauldron:getData("potionEffectId"))
		world:makeSound(13,cauldron.pos)
		world:gfx(52,cauldron.pos)
	    -- and learn!
	    User:learn(Character.alchemy, 80/2, 100)
		return true
	end
end

function FillIntoCauldron(User,SourceItem,cauldron,ltstate)
    -- function to fill stock, essencebrew or potion into a cauldron
	-- is the char an alchemist?
	local anAlchemist = CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
	if not anAlchemist then
		return
    end

    if base.licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	if not alchemy.base.alchemy.checkFood(User) then
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
		if cauldron:getData("filledWith") == "water" then
			CauldronDestruction(User,cauldron,1)

		elseif cauldron:getData("filledWith") == "essenceBrew" then
			CauldronDestruction(User,cauldron,2)

		elseif cauldron:getData("filledWith") == "potion" then
			if cauldron.id == 1013 then -- support potion
				alchemy.item.id_165_blue_bottle.SupportEssencebrew(User,cauldron,SourceItem)
			else
				CauldronDestruction(User,cauldron,2)
		    end

		elseif cauldron:getData("filledWith") == "stock" then -- stock is in the cauldron; we call the combin function
				CombineStockEssence( User, cauldron, SourceItem)
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
			if cauldron.id == 1013 then -- support potion
			    alchemy.item.id_165_blue_bottle.SupportPotion(User,cauldron,SourceItem)
			else
				CauldronDestruction(User,cauldron,2)
			end

		elseif cauldron:getData("filledWith") == "stock" then
			CauldronDestruction(User,cauldron,2)

		else -- nothing in the cauldron, we just fill in the potion
            FillFromTo(SourceItem,cauldron)
		    world:changeItem(cauldron)
		end

    end
	EmptyBottle(User,SourceItem)
end

-- a bug led to a situation that some potions missed the "filledWith"-data
-- this function will be called whenever seomething is done to a potion and set the proper data
function repairPotion(Item)
    if tonumber(Item:getData("potionEffectId")) ~= nil then
	    Item:setData("filledWith","potion")
		world:changeItem(Item)
	end
end

-- return a list containing values for actionStart
--@param theIngredient can be: "water","bottle","plant","gemPowder","stock","essenceBrew","potion"; everything else gets a default value
function GetStartAction(User, theIngredient, cauldron)

	local duration = 0
	local gfxId = 0
	local gfxIntervall = 0
	local sfxId = 0
	local sfxIntervall = 0

	if theIngredient == "water" then -- bucket with water
        duration = 20
		gfxId = 21
		gfxIntervall = 5
		sfxId = 0
		sfxIntervall = 0

	elseif theIngredient == "bottle" then -- empty bottle
        duration = 20
		gfxId = 21
		gfxIntervall = 5
		sfxId = 15
		sfxIntervall = 25

	elseif theIngredient == "plant" then -- plant or rotten tree bark
	    duration = 50
		gfxId = 21
		gfxIntervall = 5
		sfxId = 15
		sfxIntervall = 25

	elseif theIngredient == "gemPowder" then -- gem powder
		duration = 80
		gfxId = 21
		gfxIntervall = 5
		sfxId = 0
		sfxIntervall = 0

	elseif (theIngredient == "stock" and cauldron:getData("filledWith")=="essenceBrew") or (theIngredient =="essenceBrew" and cauldron:getData("filledWith")=="stock") then
		-- we combine stock and essence brew
		duration = 80
		gfxId = 21
		gfxIntervall = 5
		sfxId = 10
		sfxIntervall = 45

	elseif theIngredient == "stock" or theIngredient == "essenceBrew" or theIngredient == "potion" then
	    duration = 20
		gfxId = 21
		gfxIntervall = 5
		sfxId = 10
		sfxIntervall = 45
    end
	return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end
