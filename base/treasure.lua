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
-- Basic functions for treasure maps
-- Useable for creating maps and finding treasures

require("base.common")
require("item.gems")

module("base.treasure", package.seeall)

    function GetTreasureName( level, lang, details )
        if details then
            if ( level == 1 ) then
                return ( lang == 0 and "vergrabene Habseligkeiten von Bauern" or "buried belongings of farmers" );
            elseif ( level == 2 ) then
                return ( lang == 0 and "vergrabenes Diebesgut" or "buried stolen goods" );
            elseif ( level == 3 ) then
                return ( lang == 0 and "vergrabene Beute von Straﬂenr‰ubern" or "buried loot of bandits" );
            elseif ( level == 4 ) then
                return ( lang == 0 and "ein Schmugglerversteck" or "a hiding place of smugglers loot" );
            elseif ( level == 5 ) then
                return ( lang == 0 and "Versteck von Zwergenh‰ndlern" or "a stash of dwarven traders" );
            elseif ( level == 6 ) then
                return ( lang == 0 and "eine Absturzstelle eines silbrigen Objektes" or "the site of a crashed silver object" );
            elseif ( level == 7 ) then
                return ( lang == 0 and "eine Kiste mit Piratenbeute" or "a pirate's booty" );
            elseif ( level == 8 ) then
                return ( lang == 0 and "einen eventuell verlassenen Drachenhort" or "a probably abandoned dragon treasure" );
            elseif ( level == 9 ) then
                return ( lang == 0 and "einen Schatz aus Nabranoo" or "a treasure from Nabranoo" );
            else
                return ( lang == 0 and "keinen Schatz" or "no treasure" );
            end
        else
            if ( not level ) or ( level == 0) then
                return ( lang == 0 and "leere Schatzkiste" or "empty treasure chest" );
            elseif ( level <= 2 ) then
                return ( lang == 0 and "einen kleinen Schatz" or "a small treasure" );
            elseif ( level <= 4 ) then
                return ( lang == 0 and "einen mittelgroﬂen Schatz" or "an average sized treasure" );
            elseif ( level <= 7 ) then
                return ( lang == 0 and "einen groﬂen Schatz" or "a big treasure" );
            else
                return ( lang == 0 and "einen riesigen Schatz" or "a giant treasure" );
            end
        end
    end

    function GetMonsterList( level )

        --Please add any new monsters according to their level!

        local monsters={};

        monsters[-1]={271,274,278,581,582,592,601,622,991,1031,1051,1071}; --Level 1
        monsters[0]={271,274,278,581,582,592,601,622,991,1031,1051,1071}; --Level 1
        monsters[1]={271,274,278,581,582,592,601,622,991,1031,1051,1071}; --Level 1
        monsters[2]={101,103,104,107,114,151,172,196,272,273,392,393,583,593,602,762,881,891,921,941,962,972,1001,1022,1032,1041,1052}; --Level 2
        monsters[3]={21,24,102,111,112,115,152,171,311,391,394,421,431,502,551,571,594,603,611,612,752,753,763,822,871,882,892,922,931,942,951,961,971,981,1011,1021,1033,1042,1053}; --Level 3
        monsters[4]={5,14,22,23,25,43,55,91,113,141,173,211,301,395,401,501,512,521,552,553,572,604,613,701,754,761,764,791,821,841,872,883,893,901,932,1043}; --Level 4
        monsters[5]={1,3,4,11,13,15,31,33,34,35,41,44,45,51,53,54,92,93,94,142,191,192,321,411,492,511,522,523,531,532,614,711,741,751,782,783,784,792,801,831,842,851,861,873,902}; --Level 5
        monsters[6]={2,12,32,42,52,61,62,63,64,65,95,121,122,143,193,201,202,221,231,331,491,524,525,533,541,561,721,742,744,802,811,832,852,862,903}; --Level 6
        monsters[7]={123,124,131,195,203,204,232,261,341,534,542,543,562,651,671,681,731,743,812,853,863}; --Level 7
        monsters[8]={125,132,205,262,631,661,691,912}; --Level 8
        monsters[9]={302,641,911}; --Level 9

        monster1=monsters[level][math.random(1,table.getn(monsters[level]))];
        monster2=monsters[level-1][math.random(1,table.getn(monsters[level-1]))];
        monster3=monsters[level-1][math.random(1,table.getn(monsters[level-1]))];
        monster4=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];
        monster5=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];
        monster6=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];

        return {monster1,monster2,monster3,monster4,monster5,monster6};

    end

    function magicGem(gem, quantity)
        local level = 1
        local id = item.gems.getMagicGemId(gem, level)
        local data = item.gems.getMagicGemData(level)
        return {id, quantity, data}
    end

    function GetTreasure( level )

        local stuff={};
        stuff[1]={
			-- Ammo: arrow, bolt, throwing star, wind arrows, poisoned arrow, stone, throwing axe, throwing spear,
			{64,100,nil}, {237,100,nil}, {294,20,nil}, {322,50,nil}, {549,50,nil}, {1266,100,nil}, {2645,20,nil}, {293,20,nil},
			-- Ore/Gems: coal, iron ore, copper ore, merinium ore, silver ore, gold nuggets, raw amethysts, raw rubies,
			{21,10,nil}, {22,10,nil}, {2536,10,nil}, {2534,1,nil}, {1062,5,nil}, {234,5,nil}, {251,5,nil}, {255,5,nil},
			-- Ingots: copper ingot, iron ingot, glass ingot, silver ingot,
			{2550,5,nil}, {2535,5,nil}, {41,5,nil}, {104,5,nil},
			-- Cloth: raw leather, leather, fur, green cloth, red cloth, black cloth, grey cloth, yellow cloth, white cloth, blue cloth, (yellow cloth, green cloth,)
			{69,10,nil}, {2547,10,nil}, {2586,10,nil}, {54,5,nil}, {174,5,nil}, {175,5,nil}, {176,5,nil}, {177,5,nil}, {178,5,nil}, {179,5,nil}, -- {2577,1,nil},{2579,1,nil},
			-- Wood: cherry boards, naldor boards, conifer boards, apple boards, conifer wood, cherry wood, naldor wood, applewood,
			{545,10,nil}, {546,10,nil}, {2543,10,nil}, {2716,10,nil}, {3,10,nil}, {543,10,nil}, {544,10,nil}, {2560,10,nil},
			-- Misc: pins and cotters, pins, unfired bricks, stone block,
			{2717,10,nil}, {2738,10,nil}, {736,10,nil}, {733,10,nil},
			-- Trash: clay, thread, bough, ball of wool, wool, quartz sand, wax, branch, potash, horn, coarse sand, raw stone, honeycomb,
			{26,1,nil},{50,1,nil},{56,1,nil},{168,1,nil},{170,1,nil},{316,1,nil},{431,1,nil},{2786,1,nil}, {314,1,nil},{333,1,nil},{726,1,nil},{735,1,nil},{2529,1,nil},
		};
        stuff[2]={
			-- Ore/Gems: raw obsidian, raw sapphire, raw smaragd, raw topaz, ruby, amethyst,
			{252,5,nil}, {253,5,nil}, {256,5,nil}, {257,5,nil}, {46,5,nil}, {197,5,nil},
			-- Ingots: gold ingot, merinium ingot, bricks, (metal pieces, iron plate,)
			{236,5,nil}, {2571,1,nil}, {2588,10,nil}, --{2696,10,nil}, {2537,10,nil},
			-- Usables: parchment, soup bowl, plate, candles, small empty bottle, empty bottle, large empty bottle,
			{2745,10,nil}, {2935,10,nil}, {2952,10,nil}, {43,10,nil}, {1317,10,nil}, {164,10,nil}, {2498,10,nil},
			-- Misc: amulet, iron goblet, golden goblet, mug with lid, wodden sword, plate, copper goblet, goblet, glass mug, plate, glass, clay mug, clay cup, wooden cup, wine glass,
			{222,1,nil},{223,1,nil},{224,1,nil},{310,1,nil},{445,1,nil},{1001,1,nil},{1840,1,nil},{1858,1,nil},{1908,1,nil},{2031,1,nil},{2055,1,nil},{2183,1,nil},{2184,1,nil},{2185,1,nil},{2457,1,nil},
			-- Handles: axehandle, large ornated handle, dagger handle, hammer handle, large handle, mace handle, morning star handle, saw handle, scythe handle, shovel handle, sickle handle, staff handle, long staff handle, sword handle, big sword handle, (small handle,)
			{2525,10,nil},{2527,10,nil},{2530,10,nil},{2541,10,nil},{2544,10,nil},{2548,10,nil},{2549,10,nil},{2561,10,nil},{2566,10,nil},{2567,10,nil},{2570,10,nil},{2572,10,nil},{2573,10,nil},{2584,10,nil},{2585,10,nil} --, {2528,1,nil},
		};
        stuff[3]={
			-- Ore/Gems: raw diamonds, obsidian, sapphire, emerald, topaz, ruby powder, amethyst powder,
			{254,5,nil}, {283,5,nil}, {284,5,nil}, {45,5,nil}, {198,5,nil}, {447,5,nil}, {450,5,nil},
			-- Jewellery: ruby amulet, amethyst amulet, golden ring,
			{67,1,nil}, {79,1,nil}, {235,1,nil},
			-- Usables: lamp oil, torch, quill, (lamp oil,)
			{390,10,nil}, {391,10,nil}, {463,10,nil}, --{469,10,nil},
			-- Items: candlestick, handcuffs, candlestick, beer mug, cutlery, comb, pipe,
			{399,1,nil}, {466,1,nil}, {1862,1,nil}, {1909,1,nil}, {2647,1,nil}, {2719,1,nil}, {2744,1,nil},
			-- Consumables: bottle of elven wine, bottle of rum, cabbage stew,
			{1318,1,nil}, {1319,1,nil}, {2278,1,nil},
			-- Clothes: leather bag, thieve's gloves, blue hat with feather, yellow hat with feather, grey hat with feather, green hat with feather, red hat with feather, hat, cloth gloves,
			{97,1,nil}, {384,1,nil}, {828,1,nil}, {829,1,nil}, {830,1,nil}, {831,1,nil}, {832,1,nil}, {356,1,nil}, {2295,1,nil},
			-- Clothes:leather shoes, black trousers, green trousers, red trousers, yellow trousers, blue trousers, blue trousers, yellow trousers, grey trousers, green trousers, red trousers, black trousers, white trousers,
			{369,1,nil},{34,1,nil},{183,1,nil},{459,1,nil},{460,1,nil},{461,1,nil},{821,1,nil},{822,1,nil},{823,1,nil},{824,1,nil},{825,1,nil},{826,1,nil},{827,1,nil},
			-- Shields/Armor: small wooden shield, wooden shield, light metal shield, chain helmet, round steel hat,
			{2445,1,nil}, {17,1,nil}, {18,1,nil}, {324,1,nil}, {2290,1,nil},
			-- Weapons: club, simple dagger, skull staff, poisoned halfling axe, poisoned simple dagger, halfling axe
			{2664,1,nil}, {27,1,nil}, {39,1,nil}, {2635,1,nil}, {2668,1,nil}, {2711,1,nil}
		};
        stuff[4]={
			-- Ore/Gems: diamond,
			{285,5,nil},
			-- Tools: scissors, saw, hammer, shovel, needle, bucket, mortar, fishing rod, hatchet, rolling pin, peel, finesmithing hammer, sickle,  cooking spoon, flail, scythe, glass blow pipe, wooden shovel,
			{6,1,nil},{9,1,nil},{23,1,nil},{24,1,nil},{47,1,nil},{51,1,nil},{58,1,nil},{72,1,nil},{74,1,nil},{118,1,nil},{121,1,nil},{122,1,nil},{126,1,nil},{227,1,nil},{258,1,nil},{271,1,nil},{311,1,nil},{312,1,nil},
			-- Tools: candle mold, brick mould, chisel, tongs, plane, razor blade, crucible-pincers, carving tools rope, pick-axe, dying rod,
			{429,1,nil}, {734,1,nil}, {737,1,nil}, {2140,1,nil}, {2715,1,nil},  {2746,1,nil}, {2751,1,nil}, {2752,1,nil}, {2760,1,nil}, {2763,1,nil}, {2781,1,nil},
			-- Misc: wicker basket, flute, panpipe, drum, oil lamp, mirror, trap set, lantern, ( lit oil lamp,)
			{799,1,nil}, {90,1,nil}, {532,1,nil}, {533,1,nil}, {92,1,nil}, {336,1,nil}, {374,1,nil}, {393,1,nil}, --{397,1,nil},
			-- Shields/Armor: horned helmet,  steel boots, short leather legs, round metal shield,
			{7,1,nil}, {326,1,nil}, {367,1,nil}, {186,1,nil},
			-- Weapons: executioner's axe, poisened executioner's axe, serinjah-sword, poisoned serinjah-sword, shortsword, sling, cleric's staff, short bow, mace,
			{2723,1,nil}, {2725,1,nil}, {1,1,nil}, {2694,1,nil}, {78,1,nil}, {89,1,nil}, {40,1,nil}, {65,1,nil}, {230,1,nil},
			-- Unusable Tools: lock picks, cauldron, pan, nail board, rasp, carpenter hammer, mould,
			-- {739,1,nil},{1008,1,nil},{2495,1,nil},{2659,1,nil},{2697,1,nil},{2709,1,nil},{2710,1,nil},
		};
        stuff[5]={
			-- Ore/Gems: sapphire powder, obsidian powder, emerald powder, topaz powder, diamond powder,
			{446,5,nil}, {449,5,nil}, {448,5,nil}, {451,5,nil}, {452,5,nil},
			-- Jewellery: sapphire amulet, obsidian amulet, emerald amulet, ruby ring, topaz amulet, amethyst ring, obsidian ring, sapphire ring,
			{71,1,nil}, {82,1,nil}, {62,1,nil}, {68,1,nil}, {83,1,nil}, {277,1,nil}, {278,1,nil}, {279,1,nil},
			-- Shields/Armor: steel cap, steel gloves, large metal shield, leather boots, leather gloves, short hardwood greaves, gynkese mercenary's helmet, knight shield, orc helmet, steel hat,
			{202,1,nil}, {325,1,nil}, {19,1,nil}, {53,1,nil}, {48,1,nil}, {2194,1,nil}, {2302,1,nil}, {20,1,nil}, {16,1,nil}, {187,1,nil},
			-- Weapons: battle axe, dagger, poisened dagger,  orc axe
			{2946,1,nil}, {189,1,nil}, {2672,1,nil}, {2642,1,nil},
			-- clothes: grey coat, lute, blue wizard hat, red wizard hat, blue dress, blue dress, yellow dress, grey dress, green dress, red dress, black dress, white dress, black blue dress, black yellow dress, black yellow dress, black green dress, black red dress, black white dress, blue white skirt, yellow white skirt, grey white skirt, green white skirt, red white skirt, black white skirt, blue green heraldic dress, blue red heraldic dress, yellow blue heraldic dress, yellow green heraldic dress, red yellow heraldic dress, grey heraldic dress, black red heraldic dress, white heraldic dress, blue coat, black coat,
			{196,1,nil},{335,1,nil},{357,1,nil},{358,1,nil},{385,1,nil},{800,1,nil},{801,1,nil},{802,1,nil},{803,1,nil},{804,1,nil},{805,1,nil},{806,1,nil},{833,1,nil},{834,1,nil},{835,1,nil},{836,1,nil},{837,1,nil},{838,1,nil},{839,1,nil},{840,1,nil},{841,1,nil},{842,1,nil},{843,1,nil},{844,1,nil},{845,1,nil},{846,1,nil},{847,1,nil},{848,1,nil},{849,1,nil},{850,1,nil},{851,1,nil},{852,1,nil},{2380,1,nil},{2384,1,nil},
		};
        stuff[6]={
			-- Shields/Armor: leather legs, albarian steel gloves, salkamarian steel boots, cursed shield, short iron greaves, leather scale armor, hardwood greaves, serinjah helmet,
			{366,1,nil}, {530,1,nil},{699,1,nil}, {917,1,nil},{2117,1,nil}, {363,1,nil}, {2193,1,nil}, {2444,1,nil},
			-- Weapons: simple mage's staff, serinjah-rider's bow, morning star, sabre, hunting bow, longaxe, ornate dagger, gilded dagger, silvered dagger, coppered dagger, merinium-plated dagger, poisoned ornate dagger,  scimitar
			{57,1,nil}, {2646,1,nil},{2737,1,nil},{25,1,nil},{2714,1,nil},{88,1,nil},{190,1,nil},{297,1,nil},{389,1,nil},{398,1,nil},{444,1,nil},{2689,1,nil}, {2757,1,nil},
			-- Clothes: red shirt, blue shirt, black shirt, green shirt, yellow shirt, blue doublet, yellow doublet, grey doublet, green doublet, red doublet, black doublet, white doublet, blue tunic, yellow tunic, grey tunic, green tunic, red tunic, black tunic, white tunic,
			{180,1,nil},{181,1,nil},{182,1,nil},{457,1,nil},{458,1,nil},{807,1,nil},{808,1,nil},{809,1,nil},{810,1,nil},{811,1,nil},{812,1,nil},{813,1,nil},{814,1,nil},{815,1,nil},{816,1,nil},{817,1,nil},{818,1,nil},{819,1,nil},{820,1,nil},
			-- Clothes: green robe, blue robe, black robe, yellow robe, harp, yellow priest robe, colourful wizard hat, expensive wizard hat, red mage robe, black cult robe, brown priest robe, grey priest robe, red priest robe, black priest robe, white priest robe,
			{55,1,nil},{193,1,nil},{194,1,nil},{195,1,nil},{332,1,nil},{368,1,nil},{370,1,nil},{371,1,nil},{2377,1,nil},{2378,1,nil},{2416,1,nil},{2418,1,nil},{2419,1,nil},{2420,1,nil},{2421,1,nil},
		};
        stuff[7]={
			-- Jewellery: smaragd ring, topaz ring, diamond ring, diadem,
			{281,1,nil}, {282,1,nil}, {280,1,nil}, {465,1,nil},
			--Shields/Armor: red steel shield, studded leather gloves, fur boots, chain shirt, half leather armor, dwarfen metal gloves, albarian soldier's helmet, legionaire's tower shield, pot helmet, plate armor, heraldic shield,dwarven state armor,
			{2388,1,nil}, {526,1,nil}, {697,1,nil}, {101,1,nil}, {365,1,nil}, {529,1,nil}, {2287,1,nil}, {2448,1,nil}, {94,1,nil}, {4,1,nil}, {95,1,nil}, {2390,1,nil},
			-- Weapons: halberd, mage's staff, bastard sword, poisened broadsword, broadsword, fire-hunters bow, red dagger, magical poisonbow, waraxe, morning star, mage's staff, long bow
			{77,1,nil}, {76,1,nil}, {204,1,nil}, {2655,1,nil}, {2658,1,nil}, {2727,1,nil}, {2740,1,nil}, {2780,1,nil}, {383,1,nil}, {231,1,nil}, {323,1,nil}, {2708,1,nil},
			-- Clothes: novice mage robe,  mage robe,
			{547,1,nil}, {548,1,nil},
			-- Elements: pure air, pure earth, pure fire, pure water,
			{2551,1,nil}, {2552,1,nil}, {2553,1,nil}, {2554,1,nil}
		};
        stuff[8]={
			-- Shields/Armor: albarian steel boots, short fur trousers, drow helmet, storm cap, steel tower shield, light hunting armor, albarian steelgloves, heavy steel greaves, steel plate,
			{771,1,nil}, {2114,1,nil}, {2303,1,nil}, {2441,1,nil}, {96,1,nil}, {364,1,nil}, {530,1,nil}, {2172,1,nil}, {2364,1,nil},
			-- Weapons: gilded longsword, coppered longsword, silvered longsword, merinium-plated longsword, elven mage's staff, rapier, longsword, poisoned longsword, gilded battle axe, coppered battle axe, ornate mage's staff, silvered battle axe, merinium-plated battle axe, light battleaxe, two-handed sword, elvensword
			{84,1,nil},{85,1,nil},{98,1,nil},{123,1,nil},{209,1,nil}, {2675,1,nil},{2701,1,nil},{2705,1,nil}, {124,1,nil},{192,1,nil},{1044,1,nil},{229,1,nil},{296,1,nil}, {2629,1,nil}, {2731,1,nil},{2778,1,nil},
			-- Clothes: archmage robe,
			{558,1,nil}

		};
        stuff[9]={
			-- Jewellery: crown,
			{225,1,nil},
			--Shields/Armor: visored helmet, serinjah leather boots, serinjah leather gloves, ornate tower shield, short chain pants, flame helmet,elven silversteel armor, black visored helmet, full leatherarmor, Shield of the Sky, albarian steel plate, cloud shield, knight boots, brass greaves
			{184,1,nil},{698,1,nil},{527,1,nil},{916,1,nil},{2112,1,nil},{2286,1,nil},{2403,1,nil},{185,1,nil},{362,1,nil},{2284,1,nil},{2369,1,nil},{2439,1,nil},{770,1,nil},{2113,1,nil},
			-- Weapons: large waraxe, battle staff, dwarven axe, elven composite longbow, war hammer, snake sword, elven rainbowsword, double axe, poisoned longaxe,
			{188,1,nil}, {207,1,nil}, {2660,1,nil}, {2718,1,nil}, {226,1,nil}, {2788,1,nil}, {2775,1,nil}, {205,1,nil}, {2636,1,nil}
		};
        stuff[10]={
			-- Jewellery: charm of the icebird,
			{334,1,nil},
			-- Shields/Armor: knight gloves, lizard armor, iron greaves, chain pants, Lor-Angur guardian's armor, light breastplate, dwarvenplate, salkamaerian armor, mercenary armor, elven state armor,
			{531,1,nil},{696,1,nil},{2116,1,nil},{2111,1,nil},{2360,1,nil},{2407,1,nil},{2395,1,nil}, {2389,1,nil}, {2359,1,nil},{2400,1,nil},
			-- Weapons: drow blade, drow sword, malachin dagger, elven shortbow, magical icebow, red fire dagger, fire broadsword, fire longsword, fire waraxe, large fire-waraxe, magical dagger, magical serinjah-sword, magical broadsword, magical longsword,
			{2777,1,nil},{3035,1,nil}, {91,1,nil},{2685,1,nil},{2742,1,nil},{2656,1,nil},{206,1,nil},{2627,1,nil},{2640,1,nil},{2671,1,nil},{2693,1,nil},{2654,1,nil},{2704,1,nil},
			-- Wands: earthwand, wand of fire, wand of water, wand of air,
			{2782,1,nil}, {2783,1,nil}, {2784,1,nil}, {2785,1,nil},
			-- Magical emerald Level 1, Magical ruby Level 1, Magical amethyst Level 1, Magical topaz Level 1, Magical obsidian Level 1, Magical sapphire Level 1
			magicGem(item.gems.EMERALD, 1),magicGem(item.gems.RUBY, 1),magicGem(item.gems.AMETHYST, 1),magicGem(item.gems.TOPAZ, 1),magicGem(item.gems.OBSIDIAN, 1),magicGem(item.gems.SAPPHIRE, 1)
		};
        stuff[11]={
			-- Jewellery: ring of the archmage,
			{2559,1,nil},
			-- Shields/Armor: nightplate, salkamaerian officer's armor, light elven armor, drow armor, shadowplate, albarian noble's armor, heavy plate armor,
			{2363,1,nil}, {2365,1,nil}, {2399,1,nil}, {2402,1,nil}, {2357,1,nil}, {2367,1,nil}, {2393,1,nil},
			-- Weapons: magical waraxe, magical dwarven axe,
			{2626,1,nil}, {2662,1,nil},
			-- Magical emerald Level 2, Magical ruby Level 2, Magical amethyst Level 2, Magical topaz Level 2, Magical obsidian Level 2, Magical sapphire Level 2
			magicGem(item.gems.EMERALD, 2),magicGem(item.gems.RUBY, 2),magicGem(item.gems.AMETHYST, 2),magicGem(item.gems.TOPAZ, 2),magicGem(item.gems.OBSIDIAN, 2),magicGem(item.gems.SAPPHIRE, 2)
		};

        stuff1=stuff[level+2][math.random(1,table.getn(stuff[level+2]))];
        stuff2=stuff[level+1][math.random(1,table.getn(stuff[level+1]))];
        stuff3=stuff[level+1][math.random(1,table.getn(stuff[level+1]))];
        stuff4=stuff[level][math.random(1,table.getn(stuff[level]))];
        stuff5=stuff[level][math.random(1,table.getn(stuff[level]))];
        stuff6=stuff[level][math.random(1,table.getn(stuff[level]))];

        return {stuff1,stuff2,stuff3,stuff4,stuff5,stuff6};

    end

    function GetQuality( level )
        return math.random(6,9)*100+math.random(50,99);
    end

	treasurePositions = {};
    treasureCategory = {};
	treasureMonsters = {};
	treasureHunters = {}

	function SpawnMonsters( User, level, TargetPosition )
	    TargetPos=TargetPosition

		treasureMonsters[TargetPos] = {};
        treasureCategory[TargetPos] = {};
        treasureCategory[TargetPos] = level
		table.insert(treasurePositions,TargetPos)
		treasureHunters[TargetPos] = {}

		local players = world:getPlayersInRangeOf(TargetPos,15)
		for i=1,#players do
			if players[i]:increaseAttrib("hitpoints",0) > 0 then
				treasureHunters[TargetPos][players[i].id] = true
			end
		end

        local monList = GetMonsterList( level );
        local newPos;
        local showMsgs = {};
        local mon;
        for i, monID in pairs(monList) do
            newPos=getFreePos( TargetPos, 5 );

            world:gfx(31,newPos);
            mon = world:createMonster(monID, newPos, 10);
            if isValidChar(mon) then
                if ( monID > 260 and monID < 270 ) then
                    table.insert( showMsgs, {
                        "Der Drache schimmert und flirrt in der Luft. Er scheint 'nur' eine real wirkende Illusion zu sein.",
                        "The dragon gleams and shimmers in the air. It seems that it is 'just' an illusion." }
                    );
                end

				table.insert( treasureMonsters[TargetPos], mon );
            end
        end
    end

    function CheckMonsters( TargetPos)
        if not treasureMonsters[TargetPos] then
            return true;
        end

        for i,mon in pairs(treasureMonsters[TargetPos]) do
            if isValidChar(mon) then
                if mon:increaseAttrib("hitpoints",0) > 0 then
                    return false;
                end
            end
        end
        treasureMonsters[TargetPos] = nil;
		for i=1,#treasurePositions do
			if treasurePositions[i] == TargetPos then
				table.remove(treasurePositions,i)
				break
			end
		end
		local players = world:getPlayersInRangeOf(TargetPos,30)
		for i=1,#players do
			if players[i]:increaseAttrib("hitpoints",0) > 0 then
				if treasureHunters[TargetPos][players[i].id] == true then
					local old = players[i]:getQuestProgress(60)
					players[i]:setQuestProgress(60,old+1)
					players[i]:inform("Die W‰chter des Schatzes wurden besiegt. Gebt nicht alles auf einmal aus!",
									 "The guardians of the treasure have been slain. Do not spend it all at once!")
				end
			end
		end

		treasureHunters[TargetPos] = nil
        return true;
    end

    function KillMonsters( User )

        if not treasureMonsters[User.id] then

            return true;
        end

        for i,mon in pairs(treasureMonsters[User.id]) do

            if isValidChar(mon) then
                if mon:increaseAttrib("hitpoints",0) > 0 then

                    mon:increaseAttrib("hitpoints",-10000);
                end
            end
        end

        treasureMonsters[User.id] = nil;

        return true;
    end

    function getFreePos( CenterPos, Rad )
        local tarPos;
        while true do
            tarPos = position(CenterPos.x+math.random(-Rad,Rad),CenterPos.y+math.random(-Rad,Rad),CenterPos.z);
            if not world:isItemOnField( tarPos ) and not world:isCharacterOnField( tarPos ) then
                tileID = world:getField( tarPos ):tile();
                if tileID ~= 0 and tileID ~= 5 and tileID ~= 6 and tileID~=42 and tileID ~= 43 and tileID~= 34 then --no inpassable tiles
                    return tarPos;
                end
            end
        end
    end

    function SpawnTreasure( level, posi )
        local itemList = GetTreasure( level );
        for i, itemData in pairs(itemList) do
            world:createItemFromId( itemData[1], math.random(1, itemData[2]), posi, true, GetQuality( level ), itemData[3] );
        end

		if level < 5 then -- silver coins
            world:createItemFromId(3077,math.random(math.ceil(5*level*level),math.ceil(15*level*level)),posi,true,333,nil);
		else -- gold coins
		    world:createItemFromId(61,math.random(math.ceil(0.05*level*level),math.ceil(0.15*level*level)),posi,true,333,nil);
		end

		treasureCategory[posi] = nil
    end

    function getDistance( User, Item )
        local MapData = {Item:getData("MapPosX"),Item:getData("MapPosY"),Item:getData("MapPosZ")}
		local RealTarget = base.common.DataToPosition( MapData );
        local TargetLocation = modPosition( User, RealTarget );
        if not TargetLocation then
            return false;
        end
        local metricDistance = User:distanceMetricToPosition ( TargetLocation );
        if ( metricDistance < 20 ) then
            return base.common.GetNLS( User, "sehr nah", "very close" );
        elseif ( metricDistance < 60 ) then
            return base.common.GetNLS( User, "nah", "close" );
        elseif ( metricDistance < 200 ) then
            return base.common.GetNLS( User, "fern", "far" );
        elseif ( metricDistance < 500 ) then
            return base.common.GetNLS( User, "sehr fern", "very far" );
        else
            return base.common.GetNLS( User, "‰uﬂerst fern", "extremely far" );
        end
    end

    function getDirection( User, Item )
        local RealTarget = base.common.DataToPosition( {Item:getData("MapPosX"),Item:getData("MapPosY"),Item:getData("MapPosZ")} );
        local TargetLocation = modPosition( User, RealTarget );
        if not TargetLocation then
            return false;
        end

        local dir = base.common.GetDirection( User.pos, TargetLocation );

        if ( dir == 0 ) then
            return base.common.GetNLS( User, "Norden", "north" );
        elseif ( dir == 1 ) then
            return base.common.GetNLS( User, "Nordosten", "northeast" );
        elseif ( dir == 2 ) then
            return base.common.GetNLS( User, "Osten", "east" );
        elseif ( dir == 3 ) then
            return base.common.GetNLS( User, "S¸dosten", "southeast" );
        elseif ( dir == 4 ) then
            return base.common.GetNLS( User, "S¸den", "south" );
        elseif ( dir == 5 ) then
            return base.common.GetNLS( User, "S¸dwesten", "southwest" );
        elseif ( dir == 6 ) then
            return base.common.GetNLS( User, "Westen", "west" );
        elseif ( dir == 7 ) then
            return base.common.GetNLS( User, "Nordwesten", "northwest" );
        elseif ( dir == 8 or dir == 9 ) then
            return "wrong";
        end
    end

    function modPosition( User, posi )
    	local UserPer = User:increaseAttrib( "perception", 0 );
    	math.randomseed( User.id + UserPer+math.abs(posi.x) );

    	local diff = math.ceil( -0.007342*UserPer*UserPer-0.676*UserPer+15.1336 );
    	diff = math.min( 15, math.max( 0, diff ) );
    	local modBy = math.random( 0, diff );
    	local rad = math.rad( math.random(0, 360) );

    	local newPos = position( posi.x + (modBy * math.sin(rad)), posi.y + (modBy * math.cos(rad)), posi.z )
    	if User:isInRangeToPosition( newPos, diff ) then
    	    return false;
    	else
    	    return newPos;
    	end
    end

    function createMap( Char )
        local MapPosition = findPosition( );
        if not MapPosition then
            return false;
        end
        local MapData = base.common.PositionToData( MapPosition )
        local MapQuality = (10-math.floor(math.sqrt(math.random(1,99))))*100+99;
        if Char:createItem(505,1,MapQuality,MapData) ~= 0 then
            world:createItemFromId(505, 1, Char.pos, true, MapQuality, MapData);
			base.common.InformNLS(Char,
				"Du kannst nichts mehr tragen.",
				"You can't carry any more.");
        end
		return true;
    end

    function findPosition( )
        local newPos;
        local tileID;
        local itemID;
        local i = 0;
        while true do
            newPos=position(math.random(475,925),math.random(50,650),0); --only in the wilderness, outside any homeland
            tileID = world:getField(newPos):tile();
            if tileID == 2 or tileID == 3 or tileID == 4 or tileID == 8 or tileID == 9 or tileID == 10 or tileID == 11 or tileID == 15 then -- only "non-urban" basic tiles
                if not world:isItemOnField(newPos) then
                    return newPos;
                end
            end
            i = i + 1;
            if i == 100 then --aborting after 100 tries; ugly solution!
                return false;
            end
        end
        return newPos;
    end

    foundTreasureAt = {};

    function DigForTreasure( User, TargetPosition, maxToFind, diggingOutMsg, foundMessage )
        local worked;
        local mapItem;
        local mapItemNr;

        worked,mapItem,mapItemNr = checkMap( User, TargetPosition );
        if not worked then

            return false;
        end

        local treasureLevel = math.floor( mapItem.quality / 100 );
        if ( treasureLevel > maxToFind ) then
            base.common.InformNLS( User,
            "Du bist nicht erfahren genug in der Bergarbeit um diesen Schatz auszugraben.",
            "You are not skilled enough in mining to dig out the treasure." );
            return false;
        end

        local mapPosCheck = ""..mapItem:getData("MapPosX").." "..mapItem:getData("MapPosY").." "..mapItem:getData("MapPosZ")
        if diggingOutMsg and not foundTreasureAt[mapPosCheck] then
            User:inform( diggingOutMsg );
            foundTreasureAt[mapPosCheck] = true;
            return true;
        end

		if treasureMonsters[TargetPosition] ~= nil then
			User:inform("Du findest in der bereits aufgew¸hlten Erde einen Zettel: 'Versuchs sp‰ter nochmal.'",
				        "You find a note in the already searched through dirt: 'Try again later.'")
			return
		end

        if foundMessage then
            User:inform( foundMessage );
        else
            base.common.InformNLS( User,
            "Du gr‰bst den Schatz aus dem Boden aus und musst dabei leider feststellen, dass der Schatz einige W‰chter hat.",
            "You dig the treasure out of the ground and realize that the treasure sadly has some guards." );
        end
--[[
        local fndTreasure;
        local treasureEff;
        fndTreasure, treasureEff = User.effects:find(16);
        if not fndTreasure then --User:inform("Effect given");
            treasureEff=LongTimeEffect(16,1);
            treasureEff:addValue("posX",tonumber(mapItem:getData("MapPosX")))
            treasureEff:addValue("posY",tonumber(mapItem:getData("MapPosY")))
			treasureEff:addValue("posZ",tonumber(mapItem:getData("MapPosZ")))
			treasureEff:addValue("category",treasureLevel);
            User.effects:addEffect(treasureEff);
        else
            base.common.InformNLS(User,
                "Du hast schon einen Schatz ausgegraben und die W‰chter noch nicht besiegt.",
                "You already dug out a treasure and didn't overcome the guardians." );
            treasureEff.nextCalled =20;
        end]]

		SpawnMonsters( User, treasureLevel, TargetPosition )

	   if ( mapItemNr > 0 ) then
            local thisBP=User:getBackPack();
            thisBP:takeItemNr(mapItemNr,255);
        else
            world:erase( mapItem, 1 );
        end
        return true;
    end

    function analyzeMap( Item )
        local mapDiff=math.floor(Item.quality/100);
        local mapPartsMax=math.floor(math.mod(Item.quality, 100)/10);
        local mapPartsThis=math.mod(Item.quality, 10);

        return mapDiff, mapPartsMax, mapPartsThis
    end

    function checkMap( User, TargetPosition )
        if User:countItem(505)==0 then
            return false,0,0;
        end

        -- inventory
        local myItem;
        local theMax;
        local theDiff;
        local thePart;
        local neededPosition = TargetPosition
		for i=1,17 do
            myItem = User:getItemAt( i );
            if myItem.id == 505 then
				if myItem:getData("MapPosX") ~= "" and myItem:getData("MapPosY")  ~= "" and myItem:getData("MapPosZ") ~= "" then --valid treasure map
					local MapData = {myItem:getData("MapPosX"),myItem:getData("MapPosY"),myItem:getData("MapPosZ")}
					local MapPosition = base.common.DataToPosition( MapData )
					if MapPosition == neededPosition then
						return true, myItem, 0;
					end
				end
			end
        end

        -- backpack
        local theBackpack=User:getBackPack();
        if theBackpack==nil then
            return false,0,0;
        end
        local i = 0;
        local worked = true;
        local thisCont;
        repeat
            i = i + 1;
            worked,myItem,thisCont=theBackpack:viewItemNr(i);
            if worked then
                if myItem.id == 505 then
					if myItem:getData("MapPosX") ~= "" and myItem:getData("MapPosY")  ~= "" and myItem:getData("MapPosZ") ~= "" then --valid treasure map
						local MapData = {myItem:getData("MapPosX"),myItem:getData("MapPosY"),myItem:getData("MapPosZ")}
						local MapPosition = base.common.DataToPosition( MapData )
						if MapPosition == neededPosition then
							return true, myItem, i;
						end
					end
                end
		   end
        until not worked;
        return false,0,0;
    end
