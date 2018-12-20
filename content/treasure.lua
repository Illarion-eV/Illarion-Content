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

-- This script contains the content definitions for the treasures.
local gems = require("base.gems")
local messages = require("base.messages")

local M = {}

-- Title name of the treasures
-- Get the long name of the treasure. Returns german and english
function M.getTreasureName(level)
    if level == 1 then
        return "vergrabene Habseligkeiten von Bauern", "buried belongings of farmers"
    elseif level == 2 then
        return "vergrabenes Diebesgut", "buried stolen goods"
    elseif level == 3 then
        return "vergrabene Beute von Straﬂenr‰ubern", "buried loot of bandits"
    elseif level == 4 then
        return "ein Schmugglerversteck", "a hiding place of smugglers loot"
    elseif level == 5 then
        return "Versteck von Zwergenh‰ndlern", "a stash of dwarven traders"
    elseif level == 6 then
        return "eine Absturzstelle eines silbrigen Objektes", "the site of a crashed silver object"
    elseif level == 7 then
        return "eine Kiste mit Piratenbeute", "a pirate's booty"
    elseif level == 8 then
        return "einen eventuell verlassenen Drachenhort", "a probably abandoned dragon treasure"
    elseif level == 9 then
        return "einen Schatz aus Nabranoo", "a treasure from Nabranoo"
    else
        return "keinen Schatz", "no treasure"
    end
end

-- Get the short name of the treasure. Returns german and english
function M.getTreasureShortName(level)
    if not level or level == 0 then
        return "Schatzkiste", "treasure chest"
    elseif level <= 2 then
        return "einen kleinen Schatz", "a small treasure"
    elseif level <= 4 then
        return "einen mittelgroﬂen Schatz", "an average sized treasure"
    elseif level <= 7 then
        return "einen groﬂen Schatz", "a big treasure"
    elseif level <= 9 then
        return "einen riesigen Schatz", "a giant treasure"
    else
        return "keinen Schatz", "no treasure"
    end
end

-- A set of different messages for the treasure hunting scripts
-- The maximal level limit is set to a lower value then the treasure is. This usually happens in case the players
-- does not have the sufficient skill level
M.msgTreasureLevelTooHigh = messages.Messages()
M.msgTreasureLevelTooHigh:addMessage("Du bist nicht erfahren genug mit diesem Werkzeug um diesen Schatz auszugraben.",
    "You are not skilled enough in in using this tool to dig out the treasure.")

-- The treasure was found, but to give the players some time to repair they have to digg another time into the ground
-- to trigger the spawning of the treasure.
M.msgDiggingOut = messages.Messages()
M.msgDiggingOut:addMessage("Du stˆﬂt auf etwas hartes im Boden. Das ist der Schatz! Grabe nochmal um ihn zu heben.",
    "You hit something hard in the ground. Dig another time in order to get the treasure.")

-- This message is used when the players digg up the treasure
M.msgFoundTreasure = messages.Messages()
M.msgFoundTreasure:addMessage(
    "Du gr‰bst den Schatz aus dem Boden aus und musst dabei leider feststellen, dass der Schatz einige W‰chter hat.",
    "You dig the treasure out of the ground and realize that the treasure sadly has some guards."
)

-- This message is used once all the guards are beaten and the treasure is spawned.
M.msgBeatenGuardians = messages.Messages()
M.msgBeatenGuardians:addMessage(
    "Die W‰chter des Schatzes wurden besiegt. Gebt nicht alles auf einmal aus!",
    "The guardians of the treasure have been slain. Do not spend it all at once!"
)

-- One or multiple areas were treasures may be spawned.
local treasureLocations = {
    {x = {from = 475, to = 925}, y = {from = 50, to = 650}, z = 0}
}

-- The tiles that allow a treasure to be spawned
local treasureTiles = {2, 3, 4, 8, 9, 10, 11, 15} -- only "non-urban" basic tiles

-- The Guardian Monsters
-- This expects a two dimensional list. The first level is the level of the treasure the monster is assigned to.
-- The second level contains the IDs of the monsters that may be spawned.
local guardianMonsters = {}
guardianMonsters[1] = {271, 274, 278, 581, 582, 592, 601, 622, 982, 1031, 1051} --Level 1
guardianMonsters[2] = {
    101, 103, 104, 107, 114, 151, 172, 196, 272, 273, 392, 393, 583, 593, 602, 762, 881, 891, 573, 577, 953, 955, 983,
    606, 1032, 1041, 1052
} --Level 2
guardianMonsters[3] = {
    21, 24, 102, 111, 112, 115, 152, 171, 391, 394, 403, 404, 516, 551, 571, 594, 603, 611, 612, 752, 753, 763,
    536, 871, 882, 892, 574, 575, 578, 951, 952, 954, 981, 984, 605, 1033, 1042, 1053
} --Level 3
guardianMonsters[4] = {
    5, 14, 22, 23, 25, 43, 55, 91, 113, 141, 173, 211, 301, 395, 401, 515, 512, 521, 552, 553, 572, 604, 613, 105, 754,
    761, 764, 791, 535, 539, 872, 883, 893, 901, 576, 1043
} --Level 4
guardianMonsters[5] = {
    1, 3, 4, 11, 13, 15, 31, 33, 34, 35, 41, 44, 45, 51, 53, 54, 92, 93, 94, 142, 191, 192, 402, 514, 511, 522,
    523, 531, 532, 614, 108, 741, 751, 782, 783, 784, 792, 793, 537, 540, 851, 861, 873, 902
} --Level 5
guardianMonsters[6] = {
    2, 12, 32, 42, 52, 61, 62, 63, 64, 65, 95, 121, 122, 143, 193, 201, 202, 221, 231, 513, 524, 525, 533, 541,
    561, 109, 742, 744, 578, 852, 862, 903
} --Level 6
guardianMonsters[7] = {
    123, 124, 131, 195, 203, 204, 232, 261, 534, 542, 543, 562, 633, 635, 636, 110, 743, 796, 853, 863
} --Level 7
guardianMonsters[8] = {125, 132, 205, 262, 631, 634, 637, 564} --Level 8
guardianMonsters[9] = {302, 632, 563} --Level 9

-- This list contains the valid contents of a treasure.
-- The first level contains the level of the treasure the item is assigned to.
-- The second level of the list contains the items.
-- One single entry of a item may contain just the ID of the item, or a table that stores the item ID, the amount to
-- spawn and the data value. The amount and the data is optional. In case the amount is nil, one is assumed and in
-- case the data value is nil the item will be created without data. Writing just the ID instead if the table is
-- short hand for the writing the table with amount and data set to nil.
local treasureContents = {}

local function magicGem(gem, quantity)
    local level = 1
    local id = gems.getMagicGemId(gem, level)
    local data = gems.getMagicGemData(level)
    return {id, quantity, data}
end

treasureContents[1] = {

{1266,10}, --stone
{64,10}, --arrow
{3,5}, --conifer wood
{21,5}, --coal
{22,5}, --iron ore
{26,5}, --clay
{50,5}, --thread
{56,5}, --bough
{63,5}, --entrails
{69,5}, --raw leather
{170,5}, --bale of wool
{543,5}, --cherry wood
{544,5}, --naldor wood
{549,5}, --poisoned arrow
{726,5}, --coarse sand
{733,5}, --stone block
{735,5}, --raw stone
{2529,5}, --honeycomb
{2560,5}, --applewood
{2586,5}, --fur
{2696,5}, --feathers
{176,5}, --grey cloth
{54,5}, --green cloth
{174,5}, --red cloth
{175,5}, --black cloth
{177,5}, --yellow cloth
{178,5}, --white cloth
{179,5}, --blue cloth
{314,5}, --potash
{316,5}, --quartz sand
{333,1}, --horn
{431,5}, --wax
{545,5}, --cherry wood boards
{546,5}, --naldor wood boards
{2185,1}, --wooden cup
{2535,5}, --iron ingot
{2536,5}, --copper ore
{2543,5}, --conifer wood boards
{2547,5}, --leather
{2716,5} --apple wood boards
}

treasureContents[2] = {

{1062,5}, --silver ore
{41,5}, --glass ingot
{43,5}, --candles
{223,1}, --iron goblet
{234,1}, --gold nuggets
{251,1}, --raw amethyst
{255,1}, --raw ruby
{391,1}, --torch
{1447,1}, --grey cloth gloves
{2295,1}, --white cloth gloves
{2525,1}, --axe handle
{2530,1}, --dagger handle
{2548,1}, --mace handle
{2550,1}, --copper ingot
{2572,1}, --staff handle
{2584,1}, --sword handle
{2588,1}, --bricks
{2738,1}, --pins
{104,1}, --silver ingot
{252,1}, --raw obsidian
{253,1}, --raw sapphire
{802,1}, --grey dress
{809,1}, --grey doublet
{816,1}, --grey tunic
{823,1}, --grey trousers
{841,1}, --grey white skirt
{1840,1}, --copper goblet
{2498,1}, --large empty bottle
{2537,1}, --iron plate
{2717,1}, --pins and cotters
{46,1}, --ruby
{197,1}, --amethyst
{236,1}, --gold ingot
{256,1}, --raw emerald
{257,1}, --raw topaz
{325,1}, --steel gloves
{369,1}, --leather shoes
{384,1}, --thief's gloves
{790,1}, --empty juice bottle
{806,1}, --white dress
{813,1}, --white doublet
{820,1}, --white tunic
{827,1}, --white trousers
{830,1}, --grey hat with feather
{1001,1}, --green plate
{1453,1}, --simple leather gloves
{1460,1}, --simple chain gloves
{1461,1}, --chain gloves
{1470,1}, --simple steel gloves
{1500,1}, --simple leather shoes
{1507,1}, --simple jackboots
{1508,1}, --jackboots
{1513,1}, --simple steel boots
{1520,1}, --iron boots
{1858,1}, --silver goblet
{2183,1}, --clay mug
{2528,1}, --small handle
{2541,1}, --hammer handle
{2561,1}, --saw handle
{2566,1}, --scythe handle
{2567,1}, --shovel handle
{2570,1}, --sickle handle
{2585,1}, --big sword handle
{2745,1}, --parchment
{2935,1}, --soup bowl
{2952,1}, --wooden plate
{202,1}, --steel cap
{324,1}, --chain helmet
{356,1}, --hat
{1415,1}, --white hat with feather
{16,1}, --orc helmet
{97,1}, --leather bag
{254,1}, --raw diamond
{326,1}, --steel boots
{463,1}, --quill
{518,1}, --empty rum bottle
{1057,1}, --robust jackboots
{1416,1}, --simple horned helmet
{1429,1}, --reinforced steel cap
{1501,1}, --robust leather shoes
{48,1}, --leather gloves
{1448,1}, --green cloth gloves
{1449,1}, --black cloth gloves
{1462,1}, --reinforced chain gloves
{1471,1}, --reinforced steel gloves
{7,1}, --horned helmet
{187,1}, --steel hat
{283,1}, --obsidian
{284,1}, --sapphire
{390,1}, --oil bottle
{831,1}, --green hat with feather
{1425,1}, --coppered chain helmet
{183,1}, --short green trousers
{222,1}, --iron amulet
{235,1}, --golden ring
{367,1}, --short leather leggings
{457,1}, --green shirt
{803,1}, --green dress
{810,1}, --green doublet
{817,1}, --green tunic
{824,1}, --green trousers
{842,1}, --green white skirt
{1478,1}, --simple short leather leggings
{1485,1}, --simple short scale greaves
{1492,1}, --simple short iron greaves
{2117,1}, --short iron greaves
{2194,1}, --short scale greaves
{3526,1}, --copper amethyst amulet
{3527,1}, --copper amethyst ring
{3535,1}, --golden amulet
{3553,1}, --copper ring
{3554,1}, --silver amulet
{3555,1}, --silver ring
{3558,1} --copper amulet  
}
treasureContents[3] = {

{2645,1}, --throwing axe
{196,1}, --grey coat
{1317,1}, --empty liquor bottle
{3528,1}, --silver amethyst amulet
{3529,1}, --silver amethyst ring
{79,1}, --golden amethyst amulet
{277,1}, --golden amethyst ring
{294,1}, --throwing star
{1056,1}, --guardian's boots
{1502,1}, --simple leather boots
{1514,1}, --reinforced steel boots
{45,1}, --emerald
{198,1}, --topaz
{224,1}, --golden goblet
{447,1}, --ruby powder
{450,1}, --amethyst powder
{1479,1}, --reinforced short leather leggings
{1486,1}, --reinforced short scale greaves
{1493,1}, --reinforced short iron greaves
{2418,1}, --grey priest robe
{2527,1}, --large ornamented handle
{2544,1}, --large handle
{2549,1}, --morning star handle
{2573,1}, --long staff handle
{832,1}, --red hat with feather
{1454,1}, --reinforced leather gloves
{1463,1}, --coppered chain gloves
{1472,1}, --coppered steel gloves
{3539,1}, --copper ruby amulet
{3540,1}, --copper ruby ring
{1417,1}, --coppered horned helmet
{1430,1}, --reinforced steel hat
{2444,1}, --serinjah helmet
{6,1}, --scissors
{9,1}, --saw
{23,1}, --hammer
{24,1}, --shovel
{47,1}, --needle
{51,1}, --bucket
{58,1}, --mortar
{72,1}, --fishing rod
{74,1}, --hatchet
{118,1}, --rolling pin
{121,1}, --peel
{122,1}, --finesmithing hammer
{126,1}, --sickle
{164,1}, --empty potion
{227,1}, --cooking spoon
{258,1}, --flail
{271,1}, --scythe
{285,1}, --diamond
{311,1}, --glass blow pipe
{312,1}, --wooden shovel
{399,1}, --small candlestick
{429,1}, --candle mould
{734,1}, --brick mould
{737,1}, --chisel
{739,1}, --lockpicks
{2031,1}, --collection pan
{2140,1}, --tongs
{2184,1}, --clay cup
{2421,1}, --white priest robe
{2495,1}, --pan
{2647,1}, --cutlery
{2697,1}, --rasp
{2709,1}, --armourer's hammer
{2710,1}, --mould
{2715,1}, --plane
{2746,1}, --razor blade
{2751,1}, --crucible-pincers
{2752,1}, --carving tools
{2760,1}, --rope
{2763,1}, --pick-axe
{2781,1}, --dyeing rod
{3541,1}, --silver ruby amulet
{3560,1}, --silver ruby ring
{2678,1}, --black dye
{2679,1}, --green dye
{2680,1}, --blue dye
{2681,1}, --red dye
{2682,1}, --yellow dye
{2683,1}, --white dye
{34,1}, --short black trousers
{182,1}, --black shirt
{812,1}, --black doublet
{819,1}, --black tunic
{826,1}, --black trousers
{446,1}, --sapphire powder
{449,1}, --obsidian powder
{4,1}, --plate armour
{27,1}, --simple dagger
{67,1}, --golden ruby amulet
{68,1}, --golden ruby ring
{89,1}, --sling
{101,1}, --chain mail
{445,1}, --wooden sword
{1045,1}, --wooden dagger
{1433,1}, --padded armour
{2445,1}, --small wooden shield
{2534,1}, --merinium ore
{2629,1}, --light battle axe
{2664,1}, --club
{2776,1}, --machete
{17,1}, --wooden shield
{25,1}, --sabre
{53,1}, --leather boots
{55,1}, --green robe
{65,1}, --short bow
{189,1}, --dagger
{230,1}, --mace
{363,1}, --leather scale armour
{829,1}, --yellow hat with feather
{1058,1}, --silversteel boots
{1441,1}, --reinforced plate armour
{1480,1}, --simple leather leggings
{1487,1}, --simple scale greaves
{1494,1}, --simple iron greaves
{1515,1}, --coppered steel boots
{2359,1}, --mercenary armour
{2635,1}, --poisoned halfling axe
{2668,1}, --poisoned simple dagger
{2711,1}, --halfling axe
{526,1}, --studded leather gloves
{1464,1}, --silvered chain gloves
{1473,1}, --silvered steel gloves
{1450,1}, --red cloth gloves
{90,1}, --flute
{310,1}, --mug with lid
{448,1}, --emerald powder
{451,1}, --topaz powder
{3536,1}, --copper obsidian amulet
{3537,1}, --copper obsidian ring
{18,1}, --light shield
{78,1}, --short sword
{194,1}, --black robe
{1046,1}, --simple spear
{1090,1}, --walking stick
{1418,1}, --silvered horned helmet
{1426,1}, --silvered chain helmet
{1434,1}, --simple rogue armour
{1521,1}, --nail club
{1524,1}, --sharp dagger
{1531,1}, --rider's bow
{2290,1}, --round steel hat
{2360,1}, --guardian's armour
{2364,1}, --steel plate
{2723,1}, --executioner's axe
{2725,1}, --poisoned executioner's axe
{1055,1}, --dwarven boots
{39,1}, --skull staff
{88,1}, --longaxe
{1038,1}, --snake spear
{293,1} --javelin
    
}
treasureContents[4] = {

{180,1}, --red shirt
{459,1}, --short red trousers
{529,1}, --dwarven metal gloves
{811,1}, --red doublet
{818,1}, --red tunic
{844,1}, --black white skirt
{40,1}, --cleric's staff
{828,1}, --blue hat with feather
{452,1}, --diamond powder
{466,1}, --handcuffs
{2055,1}, --glass
{3538,1}, --silver obsidian amulet
{3561,1}, --silver obsidian ring
{366,1}, --leather leggings
{1047,1}, --glaive
{1049,1}, --viper spear
{1503,1}, --robust leather boots
{1509,1}, --coppered guardian's boots
{1516,1}, --silvered steel boots
{1525,1}, --flamberge
{1528,1}, --novice's staff
{2116,1}, --iron greaves
{2193,1}, --scale greaves
{2378,1}, --black cult robe
{528,1}, --Salkamaerian chain gloves
{1455,1}, --copper studded leather gloves
{1474,1}, --gilded steel gloves
{92,1}, --oil lamp
{2571,1}, --merinium ingot
{3786,1}, --heartwood
{3787,1}, --silk
{1,1}, --serinjah sword
{231,1}, --battle flail
{398,1}, --coppered dagger
{917,1}, --red warden's shield
{1095,1}, --scale armour
{1443,1}, --coppered plate armour
{2407,1}, --light rogue armour
{2646,1}, --serinjah-rider's bow
{2694,1}, --poisoned serinjah-sword
{2946,1}, --battle axe
{82,1}, --golden obsidian amulet
{278,1}, --golden obsidian ring
{94,1}, --pot helmet
{1419,1}, --gilded horned helmet
{2441,1}, --storm cap
{2384,1}, --black coat
{465,1}, --diadem
{458,1}, --yellow shirt
{808,1}, --yellow doublet
{815,1}, --yellow tunic
{825,1}, --red trousers
{2719,1}, --comb
{1451,1}, --yellow cloth gloves
{1442,1}, --reinforced steel plate
{57,1}, --simple mage's staff
{204,1}, --greatsword
{1040,1}, --ranseur
{3542,1}, --copper sapphire ring
{3559,1}, --copper sapphire amulet
{393,1}, --lantern
{532,1}, --panpipe
{771,1}, --albarian steel boots
{1054,1}, --ornate jackboots
{1504,1}, --simple fur boots
{1481,1}, --reinforced leather leggings
{1488,1}, --reinforced scale greaves
{1495,1}, --reinforced iron greaves
{2420,1}, --black priest robe
{1456,1}, --silver studded leather gloves
{1465,1}, --gilded chain gloves
{1475,1} --squire's gloves

}
treasureContents[5] = {

{237,10}, --crossbow bolt
{2457,1}, --wine glass
{2744,1}, --pipe
{225,1}, --crown
{19,1}, --metal shield
{190,1}, --ornate dagger
{192,1}, --coppered battle axe
{365,1}, --half leather armour
{1444,1}, --silvered plate armour
{1522,1}, --maul
{2403,1}, --silversteel armour
{2689,1}, --poisoned ornate dagger
{2714,1}, --hunting bow
{2757,1}, --scimitar
{3543,1}, --silver sapphire amulet
{3544,1}, --silver sapphire ring
{1420,1}, --bull horned helmet
{1427,1}, --gilded chain helmet
{1431,1}, --reinforced pot helmet
{181,1}, --blue shirt
{460,1}, --short yellow trousers
{807,1}, --blue doublet
{814,1}, --blue tunic
{843,1}, --red white skirt
{547,1}, --novice robe
{374,1}, --trap set
{533,1}, --drum
{1059,1}, --dice cup
{1223,1}, --empty alchemy bomb
{697,1}, --fur boots
{1510,1}, --silvered guardian's boots
{1517,1}, --gilded steel boots
{71,1}, --golden sapphire amulet
{279,1}, --golden sapphire ring
{3556,1}, --queen's crown
{3557,1}, --kings's crown
{2395,1}, --dwarven plate
{530,1}, --Albarian steel gloves
{1048,1}, --voulge
{1457,1}, --gold studded leather gloves
{1466,1}, --guard's chain gloves
{1526,1}, --claymore
{1529,1}, --adepts's staff
{1482,1}, --simple short fur trousers
{1489,1}, --simple chain trousers
{1496,1}, --simple steel greaves
{2419,1}, --red priest robe
{1452,1}, --blue cloth gloves
{385,1}, --light blue dress
{800,1}, --blue dress
{801,1}, --yellow dress
{804,1}, --red dress
{805,1}, --black dress
{822,1}, --yellow trousers
{1421,1}, --Norodaj horned helmet
{1432,1}, --albarian mercenary's helmet
{2302,1}, --gynkese mercenary's helmet
{3546,1}, --copper emerald amulet
{3547,1} --copper emerald ring
    
}
treasureContents[6] = {

{1118,1}, --bottle of ink
{1117,1}, --empty ink bottle
{322,10}, --wind arrows
{2377,1}, --red mage robe
{20,1}, --knight shield
{229,1}, --silvered battle axe
{1435,1}, --simple hunting armour
{1438,1}, --coppered scale armour
{1445,1}, --gilded plate armour
{2701,1}, --longsword
{2705,1}, --poisoned longsword
{2708,1}, --long bow
{2737,1}, --war flail
{2740,1}, --red dagger
{358,1}, --red wizard hat
{1505,1}, --robust fur boots
{1511,1}, --gilded guardian's boots
{1518,1}, --paladin's steel boots
{3545,1}, --silver emerald ring
{3548,1}, --silver emerald amulet
{527,1}, --serinjah leather gloves
{531,1}, --knight gloves
{1467,1}, --gladiator's chain gloves
{195,1}, --yellow robe
{2112,1}, --short chain trousers
{2114,1}, --short fur trousers
{2172,1}, --steel greaves
{461,1}, --short blue trousers
{833,1}, --black blue dress
{834,1}, --black yellow dress
{835,1}, --black grey dress
{836,1}, --black green dress
{837,1}, --black red dress
{838,1}, --black white dress
{840,1}, --yellow white skirt
{696,1}, --lizard armour
{76,1}, --mage's staff
{77,1}, --halberd
{383,1}, --waraxe
{1422,1}, --demonic horned helmet
{1428,1}, --chain helmet of darkness
{2287,1}, --albarian soldier's helmet
{62,1}, --golden emerald amulet
{281,1}, --golden emerald ring
{357,1}, --blue wizard hat
{3642,1}, --empty salve jar
{3868,1}, --yellow wizard hat
{368,1}, --yellow priest robe
{698,1}, --serinjah leather boots
{699,1}, --salkamaerian steel shoes
{770,1} --knight boots
    
}
treasureContents[7] = {

{2303,1}, --drow helmet
{70,1}, --crossbow
{85,1}, --coppered longsword
{124,1}, --gilded battle axe
{186,1}, --round metal shield
{389,1}, --silvered dagger
{1044,1}, --battle hammer
{1436,1}, --hunting armour
{1439,1}, --silvered scale armour
{2369,1}, --albarian steel plate
{1458,1}, --reinforced serinjah leather gloves
{1468,1}, --merinium plated chain gloves
{1476,1}, --merinium plated steel gloves
{3549,1}, --copper topaz amulet
{3550,1}, --copper topaz ring
{821,1}, --blue trousers
{839,1}, --blue white skirt
{845,1}, --blue green heraldic dress
{846,1}, --blue red heraldic dress
{847,1}, --yellow blue heraldic dress
{848,1}, --yellow green heraldic dress
{849,1}, --red yellow heraldic dress
{850,1}, --grey heraldic dress
{851,1}, --black red heraldic dress
{852,1}, --white heraldic dress
{370,1}, --colourful wizard hat
{3708,1}, --witch hat
{1483,1}, --reinforced short fur trousers
{1490,1}, --reinforced chain trousers
{1497,1}, --reinforced steel greaves
{2416,1}, --brown priest robe
{184,1}, --visored helmet
{1423,1}, --merinium plated horned helmet
{2291,1}, --salkamaerian paladin's helmet
{3551,1}, --silver topaz amulet
{3552,1}, --silver topaz ring
{2388,1}, --red steel shield
{2390,1}, --dwarven state armour
{2399,1}, --light elven armour
{315,1}, --vase
{323,1}, --wand
{335,1}, --lute
{1506,1}, --leather boots of the winds
{1512,1}, --master's steel shoes
{1519,1}, --knight boots of swiftness
{193,1}, --blue robe
{188,1}, --large waraxe
{226,1}, --warhammer
{1042,1}, --partisan
{371,1}, --fine wizard hat
{1459,1}, --ranger's gloves
{1469,1}, --templar's chain gloves
{1477,1}, --grand master's gloves
{83,1}, --golden topaz amulet
{282,1}, --golden topaz ring
{336,1}, --mirror
{2551,1}, --pure air
{2552,1}, --pure earth
{2553,1}, --pure fire
{2554,1}, --pure water
{3607,1} --pure spirit
}

treasureContents[8] = {
{98,1}, --silvered longsword
{297,1}, --gilded dagger
{1446,1}, --albarian knight's armour
{1523,1}, --heavy hammer
{2357,1}, --assassin's armour
{2389,1}, --salkamaerian armour
{2448,1}, --legionnaire's tower shield
{2642,1}, --orc axe
{2655,1}, --poisoned broadsword
{2658,1}, --broadsword
{2685,1}, --elven shortbow
{2778,1}, --elven sword
{1498,1}, --knight's steel greaves
{2111,1}, --chain pants
{2113,1}, --fur trousers
{2380,1}, --blue coat
{185,1}, --visored helmet of darkness
{1424,1}, --dragon horned helmet
{2286,1}, --flame helmet
{3530,1}, --copper diamond amulet
{3531,1}, --copper diamond ring
{548,1}, --mage robe
{95,1}, --heraldic shield
{2672,1}, --ritual dagger
{3532,1}, --silver diamond amulet
{3533,1}, --silver diamond ring
{209,1}, --elven mage's staff
{1053,1}, --divine voulge
{1527,1}, --cleaver axe
{332,1}, --harp
{558,1}, --archmage robe
{1484,1}, --fur trousers of dawn
{1491,1}, --holy chain pants
{1499,1} --steel greaves of eternal night

}
treasureContents[9] = {

{84,1}, --gilded longsword
{96,1}, --steel tower shield
{364,1}, --reinforced hunting armour
{1041,1}, --spiked mace
{1440,1}, --gilded scale armour
{2367,1}, --albarian noble's armour
{2660,1}, --dwarven axe
{2675,1}, --rapier
{2775,1}, --elven rainbowsword
{2780,1}, --ebony wood bow
{2788,1}, --snake sword
{280,1}, --golden diamond ring
{334,1}, --charm of the icebird
{2559,1}, --archmage ring
{3534,1}, --golden diamond amulet
{91,1}, --MalachÌn dagger
{916,1}, --ornate tower shield
{2402,1}, --drow armour
{205,1}, --double axe
{207,1}, --battle staff
{1039,1}, --twinblade ranseur
{2636,1}, --poisoned double axe
{2731,1} --two-handed sword

}
treasureContents[10] = {

{1908,1}, --glass mug
{123,1}, --merinium-plated longsword
{206,1}, --fire longsword
{296,1}, --merinium-plated battle axe
{362,1}, --full leather armour
{444,1}, --merinium-plated dagger
{1043,1}, --dwarven hammer
{2284,1}, --shield of the sky
{2365,1}, --salkamaerian officer's armour
{2393,1}, --heavy plate armour
{2693,1}, --magical serinjah-sword
{2704,1}, --magical longsword
{2718,1}, --elven composite longbow
{2447,1}, --mosaic shield
{2782,1}, --wand of earth
{2783,1}, --wand of fire
{2784,1}, --wand of water
{2785,1}, --wand of air
{3608,1}, --wand of spirit
{208,1}, --ornate mage's staff
{1050,1}, --shadow ranseur
{2627,1}, --fire waraxe

    -- Magical emerald Level 1, Magical ruby Level 1, Magical amethyst Level 1, Magical topaz Level 1, Magical obsidian Level 1, Magical sapphire Level 1
    magicGem(gems.EMERALD, 1), magicGem(gems.RUBY, 1), magicGem(gems.AMETHYST, 1), magicGem(gems.TOPAZ, 1), magicGem(gems.OBSIDIAN, 1), magicGem(gems.SAPPHIRE, 1)
}
treasureContents[11] = {

{1052,1}, --dwarven stormhammer
{1437,1}, --assassin's armour of darkness
{2363,1}, --nightplate
{2400,1}, --state armour
{2439,1}, --cloud shield
{2654,1}, --magical broadsword
{2656,1}, --fire broadsword
{2662,1}, --magical dwarven axe
{2671,1}, --magical dagger
{2727,1}, --fire hunter's bow
{2739,1}, --drow bow
{2742,1}, --red fire dagger
{2777,1}, --drow blade
{2640,1}, --large fire-waraxe
{1051,1}, --partisan of light
{1530,1}, --master's staff
{2626,1}, --magical waraxe
{3035,1}, --drow sword

    -- Magical emerald Level 2, Magical ruby Level 2, Magical amethyst Level 2, Magical topaz Level 2, Magical obsidian Level 2, Magical sapphire Level 2
    magicGem(gems.EMERALD, 2), magicGem(gems.RUBY, 2), magicGem(gems.AMETHYST, 2), magicGem(gems.TOPAZ, 2), magicGem(gems.OBSIDIAN, 2), magicGem(gems.SAPPHIRE, 2)
}

--- Get the amount of copper coins that is supposed to be in the treasure.
-- @param level the level of the treasure
-- @return the minimal amount and the maximal amount of money in the treasure
function M.getMoneyInTreasure(level)
    local sqrLevel = level * level
    return 500 * sqrLevel, 1500 * sqrLevel
end

-- Postprocessing
-- For the other scripts the lists need to have default formats to ensure that they work properly.
-- Also the postprocessing can be used in order to verify the contents of the list.
local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

-- Check the set treasure locations for valid content.
if not _isTable(treasureLocations) then
    error("List of treasure locations is required to contain a table.")
end
do
    local totalArea = 0
    for _, location in pairs(treasureLocations) do
        if not _isTable(location) then
            error("Entry of the treasure location table does not contain a table.")
        end

        local xRange, yRange, zRange
        if _isTable(location.x) and _isNumber(location.x.from) and _isNumber(location.x.to) then
            if location.x.from <= location.x.to then
                xRange = {location.x.from, location.x.to}
            else
                error("The lower bound of a range must not be greater than the upper bound.")
            end
        elseif _isNumber(location.x) then
            xRange = {location.x, location.x}
        end

        if _isTable(location.y) and _isNumber(location.y.from) and _isNumber(location.y.to) then
            if location.y.from <= location.y.to then
                yRange = {location.y.from, location.y.to}
            else
                error("The lower bound of a range must not be greater than the upper bound.")
            end
        elseif _isNumber(location.y) then
            yRange = {location.y, location.y}
        end

        if _isTable(location.z) and _isNumber(location.z.from) and _isNumber(location.z.to) then
            if location.z.from <= location.z.to then
                zRange = {location.z.from, location.z.to}
            else
                error("The lower bound of a range must not be greater than the upper bound.")
            end
        elseif _isNumber(location.z) then
            zRange = {location.z, location.z}
        end

        local area = (xRange[2] - xRange[1] + 1) * (yRange[2] - yRange[1] + 1) * (zRange[2] - zRange[1] + 1)

        location.x = xRange
        location.y = yRange
        location.z = zRange
        location.area = area

        totalArea = totalArea + area
    end

    for _, location in pairs(treasureLocations) do
        location.chance = location.area / totalArea
    end
end
-- Expose the checked list
M.treasureLocations = treasureLocations

if not _isTable(treasureTiles) then
    error("The list of treasure tiles is expected to contain a list of tile IDs.")
end
for _, id in pairs(treasureTiles) do
    if not _isNumber(id) then
        error("The list of valid tiles for treasures contains something that is not a number.")
    end
end
-- Expose the checked list
M.treasureTiles = treasureTiles

-- Checking guardian monsters for treasures level 1 to 9
if not _isTable(guardianMonsters) then
    error("List of guardian monsters is required to be a table.")
end
for i = 1, 9 do
    if not _isTable(guardianMonsters[i]) then
        error(string.format("List of guardian monsters for level %d is missing.", i))
    end

    if #(guardianMonsters[i]) == 0 then
        error(string.format("The list of guardian monsters for level %d is empty.", i))
    end

    for _, monsterId in pairs(guardianMonsters[i]) do
        if not _isNumber(monsterId) then
            error(string.format("The list of guardian monsters for level %d contains something but monster IDs: %d",
                i, monsterId))
        end
    end
end
-- Expose the checked list
M.guardianMonsters = guardianMonsters

-- Checking treasure contents for treasures level 1 to 11 (treasures of each level may contain items two levels up.)
-- This also alters the contents of each item entry. Once the post processing is done the items
if not _isTable(treasureContents) then
    error("List of treasure contents is required to be a table.")
end
for i = 1, 11 do
    if not _isTable(treasureContents[i]) then
        error(string.format("List of treasure contents for level %d is missing.", i))
    end

    local count = #(treasureContents[i])
    if count == 0 then
        error(string.format("The list of treasure contents for level %d is empty.", i))
    end

    for j = 1, count do
        local entry = treasureContents[i][j]
        if _isNumber(entry) then
            treasureContents[i][j] = {itemId = entry, amount = 1, data = {}}
        elseif _isTable(entry) then
            local id
            local amount = 1
            local data = {}
            if _isNumber(entry[1]) then
                id = entry[1]
            else
                error(string.format("Item entry %d for treasure contents of level %d contains no valid item id", j, i))
            end
            if entry[2] ~= nil then
                if _isNumber(entry[2]) then
                    amount = entry[2]
                else
                    error(string.format("Item entry %d for treasure contents of level %d contains no valid item id",
                        j, i))
                end
            end
            if entry[3] ~= nil then
                if _isTable(entry[3]) then
                    data = entry[3]
                else
                    error(string.format("Item entry %d for treasure contents of level %d contains something" ..
                            "illegal for the data value.", j, i))
                end
            end
            treasureContents[i][j] = {itemId = id, amount = amount, data = data}
        end
    end
end
-- Expose the checked list
M.treasureContents = treasureContents

return M