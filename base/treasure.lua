-- Basic functions for treasure maps
-- Useable for creating maps and finding treasures

require("base.common")

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
                return ( lang == 0 and "Versteck von Gnom-Forschern" or "a hiding place of gnome-researchers" );
            elseif ( level == 6 ) then
                return ( lang == 0 and "eine Absturzstelle eines silbrigen Objektes" or "the site of a crashed silver object" );
            elseif ( level == 7 ) then
                return ( lang == 0 and "einen Piratenschatz" or "a pirate's treasure" );
            elseif ( level == 8 ) then
                return ( lang == 0 and "einen eventuell verlassenen Drachenhort" or "a probably abandoned dragon treasure" );
            elseif ( level == 9 ) then
                return ( lang == 0 and "einen Yr-Schatz" or "a Yr-treasure" );
            else
                return ( lang == 0 and "keinen Schatz" or "no treasure" );
            end
        else
            if ( level == 0 ) then
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

        monsters={};
        monsters[-1]={131, 132, 133, 134, 124, 126}; --Insects, Flies, Gnats, Mosquitos, Small Wasp, Fire Wasp
        monsters[0]={131, 132, 133, 134, 124, 126}; --Insects, Flies, Gnats, Mosquitos, Small Wasp, Fire Wasp
        monsters[1]={131, 132, 133, 134, 124, 126}; --Insects, Flies, Gnats, Mosquitos, Small Wasp, Fire Wasp
        monsters[2]={135, 162, 72, 82, 121, 122, 123, 101, 103, 104, 105, 107, 114, 211, 212, 213, 214}; --Dragonflies, Small Scorpion, Small Panther, Small Wolf, Wasp, Agressive Wasp, Big Wasp, Mummy, Slow Mummy, Poisonous Mummy, Smelly Mummy, Mummy of Madness, Crippled Skeleton, Skull, Evil Skull, Skull Ram, Skull Mage
        monsters[3]={161, 163, 164, 165, 71, 73, 74, 81, 83, 84, 125, 21, 24, 102, 111, 112, 113, 115, 215}; --Scorpion, Big Scorpion, Deathly Scorpion, Scorpion King, Panther, Angry Panther, Big Panther, Wolf, Big Wolf, Giant Wolf, Wasp Queen, Halfling, Halfling Peasant, Agressive Mummy, Skeleton, Rusted Skeleton, Strong Skeleton, Skeleton Mage, Fire Spitting Skull
        monsters[4]={75, 85, 5, 14, 22, 23, 25, 43, 55, 221, 231, 232, 233, 235}; --Giant Panther, Alpha-Wolf, Human Thief, Dwarven Smith, Halfling Warrior, Halfling Thief, Halfling Hunter, Orc Thief, Lizard Thief, Forest Troll, Shadow Skeleton, Poltergeist, Shadow Skeleton Mage, Evil Shadow Skeleton
        monsters[5]={1, 3, 4, 11, 13, 15, 31, 33, 34, 35, 41, 44, 45, 51, 53, 54, 152, 222, 223, 224, 234, 244, 254}; --Human, Human Mage, Human Necromancer, Dwarf, Dwarven Priest, Dwarven Hunter, Elf, Elven Priest, Elven Necromancer, Elven Hunter, Orc, Orc Hunter, Orc Shaman, Lizard, Lizard Mage, Lizard Priest, Small Spider, Forest Troll Warrior, Forest Troll Shaman, Forest Troll Hunter, Shadow Skeleton Warrior, Small Ogre, Gnoll Thief
        monsters[6]={2, 12, 32, 42, 52, 151, 153, 154, 171, 182, 225, 241, 242, 243, 245, 251, 252, 253, 255, 271, 272, 273, 274, 275, 281, 282, 283, 284}; --Human Warrior, Dwarven Warrior, Elven Warrior, Orc Warrior, Lizard Temple Warrior, Spider, Large Tarantula, Fire Spider, Demon Skeleton, Small Rotworm, Forest Troll Forester, Ogre, Ogre Warrior, Ogre Shaman, Poisonous Ogre, Gnoll, Gnoll Warrior, Gnoll Shaman, Gnoll Forester, Drow, Drow Warrior, Drow Mage, Drow Priest, Drow Patriarch, Female Drow, Female Drow Warrior, Female Drow Mage, Female Drow Priest
        monsters[7]={155, 172, 173, 174, 191, 262, 285, 301, 302, 303, 341, 352}; --Spider Queen, Demon Skeleton Mage, Demon Skeleton Warrior, Old Demon Skeleton, Lower Demon, Fire Dragon Cub, Drow Matriarch, Stone Golem, Copper Golem, Iron Golem, Fallen, Ice Dragon Cub
        monsters[8]={175, 192, 193, 194, 195, 201, 202, 203, 204, 261, 263, 264, 304, 342, 343, 344, 351, 353, 354}; --Lich, Unholy Alcolyte, Moshran's Warrior, Undead Raptor, Lower Demon Mage, Higher Demon, Higher Demon Warrior, Unholy Archmage, Red Ram, Fire Dragon, Big Red Dragon, Ancient Fire Dragon, Gold Golem, Drown, Swamp Body, Swamp Crawler, Ice Dragon, Big Blue Dragon, Ancient Ice Dragon
        monsters[9]={205, 265, 305, 345, 355}; --Son of Ashkatuul, Son of Bragon, Merinium Golem, Drown King, Son of Tanora

        monster1=monsters[level][math.random(1,table.getn(monsters[level]))];
        monster2=monsters[level-1][math.random(1,table.getn(monsters[level-1]))];
        monster3=monsters[level-1][math.random(1,table.getn(monsters[level-1]))];
        monster4=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];
        monster5=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];
        monster6=monsters[level-2][math.random(1,table.getn(monsters[level-2]))];

        return {monster1,monster2,monster3,monster4,monster5,monster6};

    end

    function GetTreasure( level )

        stuff={};
        stuff[1]={{64,10,0},{237,10,0},{294,1,0},{322,10,0},{549,10,0},{1266,10,0},{2645,1,0},{3,1,0},{21,1,0},{22,1,0},{26,1,0},{50,1,0},{56,1,0},{69,1,0},{168,1,0},{170,1,0},{293,1,0},{314,1,0},{333,1,0},{543,1,0},{544,1,0},{726,1,0},{733,1,0},{735,1,0},{2529,1,0},{2536,1,0},{2560,1,0},{2586,1,0},{2786,1,0},{41,1,0},{54,1,0},{104,1,0},{174,1,0},{175,1,0},{176,1,0},{177,1,0},{178,1,0},{179,1,0},{234,1,0},{251,1,0},{255,1,0},{316,1,0},{431,1,0},{545,1,0},{546,1,0},{736,1,0},{2534,1,0},{2535,1,0},{2543,1,0},{2547,1,0},{2550,1,0},{2577,1,0},{2579,1,0},{2716,1,0},{2717,1,0},{2738,1,0}}; --arrow, bolt, throwing star, wind arrows, poisoned arrow, stone, throwing axe, conifer wood, coal, iron ore, clay, thread, bough, raw leather, ball of wool, wool, throwing spear, pott ash, horn, cherry wood, naldor wood, coarse sand, stone block, raw stone, honeycomb, copper ore, deciduous wood, fur, branch, glass ingot, green cloth, silver ingot, red cloth, black cloth, grey cloth, yellow cloth, white cloth, blue cloth, gold nuggets, raw amethysts, raw rubies, quartz sand, wax, cherry wood boards, naldor wood boards, unfired bricks, ore, iron ingot, conifer wooden boards, leather, copper ingot, yellow cloth, green cloth, apple wood boards, pins and cotters, pins
        stuff[2]={{252,1,0},{253,1,0},{43,1,0},{46,1,0},{164,1,0},{197,1,0},{222,1,0},{223,1,0},{224,1,0},{236,1,0},{256,1,0},{257,1,0},{310,1,0},{445,1,0},{1001,1,0},{1317,1,0},{1840,1,0},{1858,1,0},{1908,1,0},{2031,1,0},{2055,1,0},{2183,1,0},{2184,1,0},{2185,1,0},{2457,1,0},{2498,1,0},{2525,1,0},{2527,1,0},{2528,1,0},{2530,1,0},{2537,1,0},{2541,1,0},{2544,1,0},{2548,1,0},{2549,1,0},{2561,1,0},{2566,1,0},{2567,1,0},{2570,1,0},{2571,1,0},{2572,1,0},{2573,1,0},{2584,1,0},{2585,1,0},{2588,1,0},{2696,1,0},{2745,1,0},{2935,1,0},{2952,1,0}}; --raw blackstone, raw bluestone, candles, ruby, empty bottle, amethyst, amulet, iron goblet, golden goblet, gold ingot, raw smaragd, raw topaz, mug with lid, wodden sword, plate, small empty bottle, copper goblet, goblet, glass mug, plate, glass, clay mug, clay cup, wooden cup, wine glass, large empty bottle, axehandle, large ornated handle, small handle, dagger handle, iron plate, hammer handle, large handle, mace handle, morning star handle, saw handle, scythe handle, shovel handle, sickle handle, merinium ingot, staff handle, long staff handle, sword handle, big sword handle, bricks, metal pieces, parchment, soup bowl, plate
        stuff[3]={{97,1,0},{254,1,0},{384,1,0},{390,1,0},{391,1,0},{399,1,0},{463,1,0},{466,1,0},{469,1,0},{828,1,0},{829,1,0},{830,1,0},{831,1,0},{832,1,0},{1318,1,0},{1319,1,0},{1862,1,0},{1909,1,0},{2445,1,0},{2647,1,0},{2719,1,0},{2744,1,0},{17,1,0},{283,1,0},{284,1,0},{356,1,0},{2278,1,0},{2295,1,0},{18,1,0},{369,1,0},{34,1,0},{45,1,0},{67,1,0},{79,1,0},{183,1,0},{198,1,0},{235,1,0},{324,1,0},{447,1,0},{450,1,0},{459,1,0},{460,1,0},{461,1,0},{821,1,0},{822,1,0},{823,1,0},{824,1,0},{825,1,0},{826,1,0},{827,1,0},{2664,1,0},{27,1,0},{39,1,0},{2290,1,0},{2635,1,0},{2668,1,0},{2711,1,0}}; --leather bag, raw diamonds, thieve's gloves, lamp oil, torch, candlestick, quill, handcuffs, lamp oil, blue hat with feather, yellow hat with feather, grey hat with feather, green hat with feather, red hat with feather, bottle of elven wine, bottle of rum, candlestick, beer mug, small wooden shield, cutlery, comb, pipe, wooden shield, blackstone, bluestone, hat, cabbage stew, cloth gloves, light metal shield, leather shoes, black trousers, emerald, ruby amulet, amethyst amulet, green trousers, topaz, golden ring, chain helmet, ruby powder, amethyst powder, red trousers, yellow trousers, blue trousers, blue trousers, yellow trousers, grey trousers, green trousers, red trousers, black trousers, white trousers, club, simple dagger, skull staff, round steel hat, poisoned halfling axe, poisoned simple dagger, halfling axe
        stuff[4]={{6,1,0},{9,1,0},{23,1,0},{24,1,0},{47,1,0},{51,1,0},{58,1,0},{72,1,0},{74,1,0},{78,1,0},{89,1,0},{90,1,0},{92,1,0},{118,1,0},{121,1,0},{122,1,0},{126,1,0},{186,1,0},{227,1,0},{258,1,0},{271,1,0},{285,1,0},{311,1,0},{312,1,0},{336,1,0},{374,1,0},{393,1,0},{397,1,0},{429,1,0},{532,1,0},{533,1,0},{734,1,0},{737,1,0},{739,1,0},{799,1,0},{1008,1,0},{2140,1,0},{2495,1,0},{2659,1,0},{2697,1,0},{2709,1,0},{2710,1,0},{2715,1,0},{2723,1,0},{2725,1,0},{2746,1,0},{2747,1,0},{2748,1,0},{2751,1,0},{2752,1,0},{2760,1,0},{2763,1,0},{2781,1,0},{1,1,0},{7,1,0},{40,1,0},{65,1,0},{230,1,0},{326,1,0},{367,1,0},{2694,1,0}}; --scissors, saw, hammer, shovel, needle, bucket, mortar, fishing rod, hatchet, machete, sling, flute, oil lamp, rolling pin, peel, finesmithing hammer, sickle, round metal shield, cooking spoon, flail, scythe, diamond, glass blow pipe, wooden shovel, mirror, trap set, lantern, oil lamp, candle mold, panpipe, drum, brick mold, chisel, Lock picks, wicker basket, cauldron, tongs, pan, nail board, rasp, carpenter hammer, mould, slicer, executioner's axe, poisened executioner's axe, razor blade, crucible, crucible, crucible-pincers, carving tools, rope, pick-axe, dying rod, serinjah-sword, horned helmet, cleric's staff, short bow, mace, steel boots, short leather legs, poisoned serinjah-sword
        stuff[5]={{71,1,0},{82,1,0},{202,1,0},{325,1,0},{446,1,0},{449,1,0},{19,1,0},{53,1,0},{48,1,0},{2194,1,0},{2302,1,0},{62,1,0},{68,1,0},{83,1,0},{277,1,0},{448,1,0},{451,1,0},{20,1,0},{16,1,0},{187,1,0},{196,1,0},{335,1,0},{357,1,0},{358,1,0},{385,1,0},{452,1,0},{800,1,0},{801,1,0},{802,1,0},{803,1,0},{804,1,0},{805,1,0},{806,1,0},{833,1,0},{834,1,0},{835,1,0},{836,1,0},{837,1,0},{838,1,0},{839,1,0},{840,1,0},{841,1,0},{842,1,0},{843,1,0},{844,1,0},{845,1,0},{846,1,0},{847,1,0},{848,1,0},{849,1,0},{850,1,0},{851,1,0},{852,1,0},{2380,1,0},{2384,1,0},{2946,1,0},{189,1,0},{2672,1,0},{278,1,0},{279,1,0},{2642,1,0}}; --bluestone amulet, blackstone amulet, steel cap, steel gloves, bluestone powder, blackstone powder, large metal shield, leather boots, leather gloves, short hardwood greaves, gynkese mercenarie's helmet, emerald amulet, ruby ring, topaz amulet, amethyst ring, emerald powder, topaz powder, knight shield, orc helmet, steel hat, grey coat, lute, blue wizard hat, red wizard hat, blue dress, diamond powder, blue dress, yellow dress, grey dress, green dress, red dress, black dress, white dress, black blue dress, black yellow dress, black yellow dress, black green dress, black red dress, black white dress, blue white skirt, yellow white skirt, grey white skirt, green white skirt, red white skirt, black white skirt, blue green heraldic dress, blue red heraldic dress, yellow blue heraldic dress, yellow green heraldic dress, red yellow heraldic dress, grey heraldic dress, black red heraldic dress, white heraldic dress, blue coat, black coat, hatchet, dagger, poisened dagger, blackstone ring, bluestone ring, orc axe
        stuff[6]={{57,1,0},{180,1,0},{181,1,0},{182,1,0},{366,1,0},{457,1,0},{458,1,0},{528,1,0},{699,1,0},{807,1,0},{808,1,0},{809,1,0},{810,1,0},{811,1,0},{812,1,0},{813,1,0},{814,1,0},{815,1,0},{816,1,0},{817,1,0},{818,1,0},{819,1,0},{820,1,0},{917,1,0},{2117,1,0},{2291,1,0},{2646,1,0},{2737,1,0},{25,1,0},{2714,1,0},{88,1,0},{190,1,0},{297,1,0},{389,1,0},{398,1,0},{444,1,0},{2689,1,0},{55,1,0},{193,1,0},{194,1,0},{195,1,0},{332,1,0},{363,1,0},{368,1,0},{370,1,0},{371,1,0},{2193,1,0},{2377,1,0},{2378,1,0},{2416,1,0},{2418,1,0},{2419,1,0},{2420,1,0},{2421,1,0},{2444,1,0},{2757,1,0}}; --simple mage's staff, red shirt, blue shirt, black shirt, leather legs, green shirt, yellow shirt, salkamarian steel gloves, salkamarian steel boots, blue doublet, yellow doublet, grey doublet, green doublet, red doublet, black doublet, white doublet, blue tunic, yellow tunic, grey tunic, green tunic, red tunic, black tunic, white tunic, cursed shield, short iron greaves, salkamaerian paladin's helmet, serinjah-rider's bow, morning star, sabre, hunting bow, longaxe, ornate dagger, gilded dagger, silvered dagger, coppered dagger, merinium-plated dagger, poisoned ornate dagger, green robe, blue robe, black robe, yellow robe, harp, leather scale armor, yellow priest robe, colourful wizard hat, expensive wizard hat, hardwood greaves, red mage robe, black cult robe, brown priest robe, grey priest robe, red priest robe, black priest robe, white priest robe, serinjah helmet, scimitar
        stuff[7]={{77,1,0},{76,1,0},{281,1,0},{282,1,0},{204,1,0},{2388,1,0},{526,1,0},{697,1,0},{101,1,0},{280,1,0},{365,1,0},{465,1,0},{529,1,0},{547,1,0},{2287,1,0},{2448,1,0},{2655,1,0},{2658,1,0},{2727,1,0},{94,1,0},{2740,1,0},{2780,1,0},{383,1,0},{4,1,0},{95,1,0},{231,1,0},{323,1,0},{548,1,0},{2390,1,0},{2551,1,0},{2552,1,0},{2553,1,0},{2554,1,0},{2708,1,0}}; --halberd, mage's staff, smaragd ring, topaz ring, bastard sword, red steel shield, studded leather gloves, fur boots, chain shirt, diamond ring, half leather armor, diadem, dwarfen metal gloves, novice mage robe, albarian soldier's helmet, legionaire's tower shield, poisened broadsword, broadsword, fire-hunters bow, pot helmet, red dagger, magical poisonbow, waraxe, plate armor, heraldic shield, morning star, mage's staff, mage robe, dwarven state armor, pure air, pure earth, pure fire, pure water, long bow
        stuff[8]={{84,1,0},{85,1,0},{98,1,0},{123,1,0},{209,1,0},{771,1,0},{2114,1,0},{2303,1,0},{2441,1,0},{2675,1,0},{2701,1,0},{2705,1,0},{96,1,0},{124,1,0},{192,1,0},{208,1,0},{229,1,0},{296,1,0},{364,1,0},{530,1,0},{558,1,0},{2172,1,0},{2629,1,0},{2364,1,0},{2731,1,0},{2778,1,0}}; --gilded longsword, coppered longsword, silvered longsword, merinium-plated longsword, elven mage's staff, albarian steel boots, short brass greaves, drow helmet, storm cap, rapier, longsword, poisoned longsword, steel tower shield, gilded battle axe, coppered battle axe, ornate mage's staff, silvered battle axe, merinium-plated battle axe, light hunting armor, albarian steelgloves, mage robe, heavy steel greaves, light battleaxt, steel plate, two-handed sword, elvensword
        stuff[9]={{184,1,0},{188,1,0},{698,1,0},{207,1,0},{527,1,0},{916,1,0},{2112,1,0},{2286,1,0},{225,1,0},{2403,1,0},{2660,1,0},{2718,1,0},{70,1,0},{226,1,0},{2447,1,0},{2788,1,0},{185,1,0},{2775,1,0},{205,1,0},{362,1,0},{2284,1,0},{2369,1,0},{2439,1,0},{2636,1,0},{770,1,0},{2113,1,0}}; --visored helmet, large waraxe, serinjah leather boots, battle staff, serinjah leather gloves, ornate tower shield, short chain pants, flame helmet, crown, elven silversteel armor, dwarven axe, elven composite longbow, crossbow, war hammer, mosaic shield, snake sword, black visored helmet, elven rainbowsword, double axe, full leatherarmor, Shield of the Sky, albarian steel plate, cloud shield, poisoned longaxe, knight boots, brass greaves
        stuff[10]={{531,1,0},{696,1,0},{2116,1,0},{2111,1,0},{2360,1,0},{2407,1,0},{2782,1,0},{2783,1,0},{2784,1,0},{2785,1,0},{2777,1,0},{3035,1,0},{2395,1,0},{91,1,0},{2685,1,0},{2739,1,0},{2742,1,0},{2656,1,0},{206,1,0},{334,1,0},{2389,1,0},{2627,1,0},{2640,1,0},{2671,1,0},{2359,1,0},{2400,1,0},{2693,1,0},{2654,1,0},{2704,1,0},{45,1,1},{46,1,1},{197,1,1},{198,1,1},{283,1,1},{284,1,1},{285,1,1}}; --knight gloves, lizard armor, iron greaves, chain pants, Lor-Angur guardian's armor, light breastplate, earthwand, wand of fire, wand of water, wand of wind, drow blade, drow sword, dwarvenplate, malachin dagger, elven shortbow, magical icebow, red fire dagger, fire broadsword, fire longsword, charm of the icebird, salkamaerian armor, fire waraxe, large fire-waraxe, magical dagger, mercenary armor, elven state armor, magical serinjah-sword, magical broadsword, magical longsword, Magical emerald Level 1, Magical ruby Level 1, Magical amethyst Level 1, Magical topaz Level 1, Magical blackstone Level 1, Magical bluestone Level 1, Magical diamond Level 1
        stuff[11]={{2363,1,0},{2626,1,0},{2662,1,0},{2365,1,0},{2399,1,0},{2402,1,0},{2357,1,0},{2367,1,0},{2393,1,0},{2559,1,0},{45,1,2},{46,1,2},{197,1,2},{198,1,2},{283,1,2},{284,1,2},{285,1,2}}; --nightplate, magical waraxe, magical dwarven axe, salkamaerian officer's armor, light elven armor, drow armor, shadowplate, albarian noble's armor, heavy plate armor, ring of the archmage, Magical emerald Level 2, Magical ruby Level 2, Magical amethyst Level 2, Magical topaz Level 2, Magical blackstone Level 2, Magical bluestone Level 2, Magical diamond Level 2
 
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
    
    treasureMonsters = {};

    function SpawnMonsters( User, level )
	    TargetPos=User.pos; --attempt to fix a bug by Estralis
        if not treasureMonsters[User.id] then
            treasureMonsters[User.id] = {};
        end
        local monList = GetMonsterList( level );
        local newPos;
        local showMsgs = {};
        local mon;
        for i, monID in pairs(monList) do
            newPos=getFreePos( TargetPos, 4 );
            world:gfx(31,newPos);
            world:createMonster(monID, newPos, 10);

            if ( monID > 260 and monID < 270 ) then
                table.insert( showMsgs, {
                    "Der Drache schimmert und flirrt in der Luft. Er scheint 'nur' eine real wirkende Illusion zu sein.",
                    "The dragon gleams and shimmers in the air. It seems that it is 'just' an illusion." }
                );
            end

            mon = world:getCharacterOnField( newPos );
            table.insert( treasureMonsters[User.id], mon );
        end
    end

    function CheckMonsters( User )
        if not treasureMonsters[User.id] then
            return true;
        end

        for i,mon in pairs(treasureMonsters[User.id]) do
            if mon and mon:increaseAttrib("hitpoints",0) > 0 then
                return false;
            end
        end

        treasureMonsters[User.id] = nil;
        return true;
    end

    function KillMonsters( User )
        if not treasureMonsters[User.id] then
            return true;
        end

        for i,mon in pairs(treasureMonsters[User.id]) do
            if mon and mon:increaseAttrib("hitpoints",0) > 0 then
                mon:increaseAttrib("hitpoints",-10000);
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
                tileID = world:getField( TargetPos ):tile();
                if tileID ~= 0 and tileID ~= 5 and tileID ~= 6 and tileID~=42 and tileID ~= 43 and tileID~= 34 then --no inpassable tiles
                    return tarPos;
                end
            end
        end
    end

    function SpawnTreasure( level, posi )
        local itemList = GetTreasure( level );
        for i, itemData in pairs(itemList) do
            world:createItemFromId( itemData[1], itemData[2], posi, true, GetQuality( level ), itemData[3] and itemData[3] or 0 );
        end
        world:createItemFromId(3077,math.random(math.ceil(0.5*level*level),math.ceil(1.5*level*level)),posi,true,333,0);
    end

    function getDistance( User, Item )
        local RealTarget = base.common.DataToPosition( Item.data );
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
        local RealTarget = base.common.DataToPosition( Item.data );
        local TargetLocation = modPosition( User, RealTarget );
        if not TargetLocation then
            return false;
        end
        User:inform("Real Target --> x: "..RealTarget.x.." - y: "..RealTarget.y.." - z: "..RealTarget.z );
        User:inform("Modified Target --> x: "..TargetLocation.x.." - y: "..TargetLocation.y.." - z: "..TargetLocation.z );
        local dir = base.common.GetDirection( User.pos, TargetLocation );
        
        if dir~=nil then 
            User:inform("dir = "..dir);
        else
            User:inform("dir = nil");
        end
        
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
			base.common.TempInformNLS(User,
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
            newPos=position(math.random(475,1000),math.random(0,650),0); --only in the wilderness, outside any homeland
            tileID = world:getField(newPos):tile();
            if tileID == 2 or tileID == 3 or tileID == 4 or tileID == 8 or tileID == 9 or tileID == 10 or tileID == 11 or tileID == 15 then -- only "non-urban" basic tiles 
                if not world:isItemOnField(newPos) then
                    return newPos;
                end
            end
            i = i + 1;
            if i == 40 then
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
            User:inform( "map check failed" );
            return false;
        end

        local treasureLevel = math.floor( mapItem.quality / 100 );
        if ( treasureLevel > maxToFind ) then
            base.common.TempInformNLS( User,
            "Du bist nicht erfahren genug in der Bergarbeit um diesen Schatz auszugraben.",
            "You are not skilled enough in mining to dig out the treasure." );
            return false;
        end

        local mapPosData = mapItem.data;
        if diggingOutMsg and not foundTreasureAt[mapItem.data] then
            User:inform( diggingOutMsg );
            foundTreasureAt[mapItem.data] = true;
            return true;
        end

        if foundMessage then
            User:inform( foundMessage );
        else
            base.common.TempInformNLS( User,
            "Du gr‰bst den Schatz aus dem Boden aus und musst dabei leider feststellen, dass der Schatz einige W‰chter hat.",
            "You dig the treasure out of the ground and realize that the treasure sadly has some guards." );
        end

        local fndTreasure;
        local treasureEff;
        fndTreasure, treasureEff = User.effects:find(16);
        if not fndTreasure then --User:inform("Effect given");
            treasureEff=CLongTimeEffect(16,1);
            treasureEff:addValue("pos",mapItem.data);
            User:inform("added pos value: "..mapItem.data);
            treasureEff:addValue("category",treasureLevel);
            User.effects:addEffect(treasureEff);
        else
            InformNLS(User,
                "Du hast schon einen Schatz ausgegraben und die W‰chter noch nicht besiegt.",
                "You already dug out a treasure and didn't overcome the guardians." );
            treasureEff.nextCalled =20;
        end
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
        local neededData = base.common.PositionToData( TargetPosition );
        for i=1,17 do
            myItem = User:getItemAt( i );
            if ( myItem.id == 505 and myItem.data == neededData ) then
                return true, myItem, 0;
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
                if ( myItem.id == 505 and myItem.data == neededData ) then
                    return true, myItem, i;
                end
            end
        until not worked;
        return false,0,0;
    end
