-- Skript für das Druidensystem
-- Pflanzennamen
require("base.common")

module("druid.base.plants", package.seeall)

		dummyIDList = {9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016}
		dummyNameListDE = {}
		dummyNameListEN = {}		
		dummyNameListDE[1] = "Einblättrige Vierbeere";		-- Sonnenkraut
		dummyNameListDE[2] = "Blaue Vogelbeere";			-- Vierblättrige Einbeere
		dummyNameListDE[3] = "Schwefelkraut";				-- Gelbkraut
		dummyNameListDE[4] = "Frommbeere";					-- Wutbeere
		dummyNameListDE[5] = "Wasserblüte";					-- Flamkelchblüte
		dummyNameListDE[6] = "Tagteufel";					-- Nachtengelsblüte
		dummyNameListDE[7] = "Rauchblatt";					-- Donfblatt
		dummyNameListDE[8] = "Graue Distel";				-- Schwarze Distel
		dummyNameListDE[9] = "Wüstenbeere";					-- Sandbeere
		dummyNameListDE[10] = "Altweiberkraut";				-- Jungfernkraut
		dummyNameListDE[11] = "Regenkraut";					-- Heideblüte
		dummyNameListDE[12] = "Gottesblume";				-- Wüstenhimmelskapsel
		dummyNameListDE[13] = "Feuerwurz";					-- Lebenswurz
		dummyNameListDE[14] = "Trugblüte";					-- Firnisblüte
		dummyNameListDE[15] = "Wolfsfarn"					-- Steppenfarn
		dummyNameListDE[16] = "Wiesen-Rhabarber"			-- Fussblatt
		
		dummyNameListEN[1] = "oneleaved fourberry";
		dummyNameListEN[2] = "blue birdsberry";		
		dummyNameListEN[3] = "sulfur weed";
		dummyNameListEN[4] = "pious berry";
		dummyNameListEN[5] = "water blossom";
		dummyNameListEN[6] = "daydevil";
		dummyNameListEN[7] = "reek leave";		
		dummyNameListEN[8] = "grey thistle";
		dummyNameListEN[9] = "desert berry";
		dummyNameListEN[10] = "gossamer weed";
		dummyNameListEN[11] = "rain weed";
		dummyNameListEN[12] = "godsflower";
		dummyNameListEN[13] = "fire root";
		dummyNameListEN[14] = "con blossom";	
		dummyNameListEN[15] = "wolverine fern";
		dummyNameListEN[16] = "meadow rhabarb";
		
function getDummyIDList()
	return dummyIDList
end

function getDummyNameDE(i)
	return dummyNameListDE[i]
end

function getDummyNameEN(i)
	return dummyNameListEN[i]
end

function LookAtItem(User,Item)
-- 133 Sonnenkraut                15 / 9001 / 81
-- 134 Vierblättrige Einbeere     16 / 9002 / 72
-- 135 Gelbkraut                  17 / 9003 / 63
-- 136 Wutbeere                   18 / 9004 / 48
-- 137 Flamkelchblüte             25 / 9005 / 53
-- 138 Nachtengelsblüte           26 / 9006 / 64
-- 140 Donfblatt                  27 / 9007 / 71
-- 141 Schwarze Distel            28 / 9008 / 73
-- 142 Sandbeere                  35 / 9009 / 82
-- 144 Jungfernkraut              37 / 9010 / 74
-- 145 Heideblüte                 38 / 9011 / 83
-- 146 Wüstenhimmelskapsel        45 / 9012 / 84
-- 148 Firnisblüte                47 / 9014 / 46
-- 152 Lebenswurz				  51 / 9013 / 62
-- 153 Fussblatt				  52 / 9016 / 36 
-- 156 Steppenfarn                61 / 9015 / 54
	
	ItemName=world:getItemName( Item.id, User:getPlayerLanguage() );
	textDE = ItemName
	textEN = ItemName
	--initSpecialPlants()

	for i=1,16 do
		if dummyIDList[i] == Item.data then

			textDE = dummyNameListDE[i]
			textEN = dummyNameListEN[i]
		end
	end	
	if User:getPlayerLanguage() == 0 then
    	world:itemInform(User,Item,textDE)
	else  
		world:itemInform(User,Item,textEN)
	end
end
