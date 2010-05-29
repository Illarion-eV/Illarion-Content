-- ds_base_alchemy.lua

-- PFLANZENLISTE:

-- 133 Sonnenkraut                15 / 9001 / 81 "Einbl�ttrige Vierbeere" / "oneleaved fourberry"
-- 134 Vierbl�ttrige Einbeere     16 / 9002 / 72 "Blaue Vogelbeere" / "blue birdsberry"
-- 135 Gelbkraut                  17 / 9003 / 63 "Schwefelkraut" / "sulfur weed"
-- 136 Wutbeere                   18 / 9004 / 48 "Frommbeere" / "pious berry"
-- 137 Flamkelchbl�te             25 / 9005 / 53 "Wasserbl�te" / "water blossom"
-- 138 Nachtengelsbl�te           26 / 9006 / 64 "Tagteufel" / "daydevil"
-- 140 Donfblatt                  27 / 9007 / 71 "Rauchblatt" / "reek leave"
-- 141 Schwarze Distel            28 / 9008 / 73 "Graue Distel" / "grey thistle"
-- 142 Sandbeere                  35 / 9009 / 82 "W�stenbeere" / "desert berry"
-- 144 Jungfernkraut              37 / 9010 / 74 "Altweiberkraut" / "gossamer weed"
-- 145 Heidebl�te                 38 / 9011 / 83 "Regenkraut" / "rain weed"
-- 146 W�stenhimmelskapsel        45 / 9012 / 84 "Gottesblume" / "godsflower"
-- 148 Firnisbl�te                47 / 9014 / 46 "Trugbl�te" / "con blossom"
-- 152 Lebenswurz                 51 / 9013 / 62 "Feuerwurz" / "Fire root"
-- 153 Fussblatt                  52 / 9016 / 36 "Wiesen-Rhabarber" / "meadow rhabarb"
-- 156 Steppenfarn                61 / 9015 / 54 "Wolfsfarn" / "wolverine fern"

module("druid.base.alchemy", package.seeall)

dataZList = { }
plantList =     { 9001,133,134,135,136,137,138,140,141,142,9016,144,145,146,9014,148,9004,152,153,9005,9015,156,9013,9003,9006,9007,9002,9008,9009,9010,9011,9012}
plantDataList = {   81, 15, 16, 17, 18, 25, 26, 27, 28, 35,  36, 37, 38, 45,  46, 47,  48, 51, 52,  53,  54, 61,  62,  63,  64,  71,  72,  73,  82,  74,  83,  84}

plantDataListById = {};
for i,plant in pairs(plantList) do
	plantDataListById[plant] = plantDataList[i];
end

--Qualit�tsbezeichnungen
qListDe={"f�rchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","gro�artige","hervorragende"};
qListEn={"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"};

bottleList = { 164,331 }
bottleExchList = {166,329,165,330,59,327,328,167}
--alte Mineralien-Liste:
--gemList = { 251,252,253,254,255,256,257,234 }
--neue Mineralien-Liste (Beutel mit Mineralienstaub)
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

wirkung_de[1] = "ges�ttigte Anreicherung von";
wirkung_de[2] = "eine sehr ausgepr�gte Menge";
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

-- --------------------------------------------------------------------
function ds_CheckIfCoalInHand(User)    -- Kohle in der Hand ?
	local checkId = 21;
	local retVal = nil;
	local theItem = nil;
	theItem = User:getItemAt(5);
	if theItem.id == checkId then
		retVal = theItem;
	else
		theItem = User:getItemAt(6);
		if theItem.id == checkId then
			retVal = theItem;
		end
	end
	return retVal;
end
-- --------------------------------------------------------------------
function CheckIfRtbInHand(User)     -- Faulbaumrinde in der Hand ? (rotten tree bark)
	local checkId = 157;
	local retVal = nil;
	local theItem = nil;
	theItem = User:getItemAt(5);
	if theItem.id == checkId then
		retVal = theItem;
	else
		theItem = User:getItemAt(6);
		if theItem.id == checkId then
			retVal = theItem;
		end
	end
	return retVal;
end
-- --------------------------------------------------------------------
function CheckIfPlantInHand(User)
  -- Hier muss noch abgefangen werden, wenn die Pflanze einen Datawert von 0 hat

	local retVal = nil;
	local theItem = nil;
	for i,checkId in pairs(plantList) do
		theItem = User:getItemAt(5);
		if theItem.id == checkId then
			retVal = theItem;
			break;
		else
			theItem = User:getItemAt(6);
			if theItem.id == checkId then
				retVal = theItem;
				break;
			end
		end
	end
	return retVal;
end
-- --------------------------------------------------------------------

function CheckIfGemInHand(User)
	local retVal1 = nil;
	local retVal2 = nil;
	local theItem = nil;
	for i,checkId in pairs(gemList) do
		theItem = User:getItemAt(5);
		if theItem.id == checkId then
			retVal1 = theItem;
			retVal2 = bottleExchList[i];
			break;
		else
			theItem = User:getItemAt(6);
			if theItem.id == checkId then
				retVal1 = theItem;
				retVal2 = bottleExchList[i];
				break;
			end
		end
	end
	return retVal1,retVal2;
end
-- --------------------------------------------------------------------
function SplitPlantData(Plant)

  local plantData = plantDataListById[Plant];
  local plusWertPos = math.floor(plantData/10)
  local minusWertPos= plantData-plusWertPos*10
  return math.min(8,math.max(1,plusWertPos)),math.min(8,math.max(1,minusWertPos))
end
-- --------------------------------------------------------------------
function CheckIfBottleInHand(User)
	local retVal = nil;
	local theItem = nil;
	for i,checkId in pairs(bottleList) do
		theItem = User:getItemAt(5);
		if theItem.id == checkId then
			retVal = theItem;
			break;
		else
			theItem = User:getItemAt(6);
			if theItem.id == checkId then
				retVal = theItem;
				break;
			end
		end
	end
	return retVal;
end
-- --------------------------------------------------------------------
function SplitBottleData(User,bottleData)
    local dataZList = {};
	local thisDigit;
	local workData=bottleData
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
-- --------------------------------------------------------------------
function IsThatAPlant(einItem)
   retVal = false
   for i =1,table.getn(plantList) do
      if plantList[i] == einItem.id then
         retVal = true
      end
   end
   return retVal
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
-- ---------------------------------------------------------------------
function BottleHasSpecfunction(dataZList)
   retVal = false
   specFuncNo = 0

   for i=1,8 do
      if dataZList[i] == 9 then
         specFuncNo = specFuncNo + 2^(i-1)
      end
   end
   return retVal, specFuncNo
end
-- -------------------------------------------------------------------------------
function BottleHasIllnessFunction(dataZList)
   retVal = false
   illnessNo = 0

   for i = 1,8 do
      if dataZList[i] == 0 then
         illnessNo = i
         retVal = true
      end
   end
   return retVal, illnessNo
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
-- -------------------------------------------------------------------------------
function ImpactRow2(User,dataZList)
  for i=1,8 do
     -- block
     -- Wirkungen der Reihe 2 k�nnen erst eingebaut werden, wenn wir Zeiteffekte haben.
  end
end
-- -------------------------------------------------------------------------------
function IsItemBlackBottle(TargetItem)
	retVal = false
	if TargetItem.id == 2501 then
		retVal = true
	end
	return retVal
end
-- -------------------------------------------------------------------------------
function IsBottleAlreadyInfected(dataZList)
	infect = 0
	for i = 1,8 do
		if dataZList[i] == 0 then
			infect = i
		end
	end
	return infect
end
-- --------------------------------------------------------------------------------
function generateTasteMessage(lang,dataZList)
    local text = "";
    if ( lang == 0 ) then
        text = "Der Trank schmeckt ";
    else
        text = "The potion tasts ";
    end
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
        text = text..(lang == 0 and "nach nichts." or "like nothing.");
    else
        for i=1,8 do
            if usedTastes[i]~=nil then
                if usedTastes[i] > 8 or usedTastes[i] < 2 then
                    text = text..(lang == 0 and "sehr " or "very ");
                elseif (usedTastes[i] < 7 and usedTastes[i] > 5) or (usedTastes[i] > 3 and usedTastes[i] < 5) then
                    text = text..(lang == 0 and "etwas " or "slighty ");
                end
                text = text..taste[lang][i]..", ";
            end
        end
        text = string.sub(text, 0, -3);
        text = text..".";
    end
    return text;
end

function ds_skillgain(User)
  --Alchemieskill erh�hen
  User:learn(6,"alchemy",3,100)
  --Auf Runengewinn pr�fen
  --Nur Druiden bekommen Runen
  if ( (User:getMagicType() == 3) ) then
      factor_1 = 4
      factor_2 = 2
    if User:getSkill("alchemy") < 24 then
      factor_1 = 3
      factor_2 = 0
    elseif User:getSkill("alchemy") >51 then
      factor_1 = 5
      factor_2 = 4
    elseif User:getSkill("alchemy") >89 then
      factor_1 = 100
      factor_2 = 1
    end
    -- Runenaufteilung:
    -- Runen des Lehrlings: Runen 01 - 07 (alchemySkill  0 - 23)
    -- Runen des Gesellen:  Runen 08 - 14 (alchemySkill 24 - 50)
    -- Runen des Meister:   Runen 15 - 21 (alchemySkill 51 - 89)
    -- R. des Gro�meisters: Runen 22 - 28 (alchemySkill 90 - 99) nur durch Questvergabe
    -- GM-Runen             Runen 29 - 32

    umlauf = math.floor(User:getSkill("alchemy")/factor_1) +factor_2
    for i=1,umlauf do
      User:teachMagic(3,i-1)
    end
  end
end