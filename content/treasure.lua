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
local gems = require("item.gems")
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
M.msgTreasureLevelTooHigh:addMessage("Du bist nicht erfahren genug in der Bergarbeit um diesen Schatz auszugraben.",
    "You are not skilled enough in mining to dig out the treasure.")

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
    -- Ammo: arrow, bolt, throwing star, wind arrows, poisoned arrow, stone, throwing axe, throwing spear,
    {64, 100}, {237, 100}, {294, 20}, {322, 50}, {549, 50}, {1266, 100}, {2645, 20}, {293, 20},
    -- Ore/Gems: coal, iron ore, copper ore, merinium ore, silver ore, gold nuggets, raw amethysts, raw rubies,
    {21, 10}, {22, 10}, {2536, 10}, 2534, {1062, 5}, {234, 5}, {251, 5}, {255, 5},
    -- Ingots: copper ingot, iron ingot, glass ingot, silver ingot,
    {2550, 5}, {2535, 5}, {41, 5}, {104, 5},
    -- Cloth: raw leather, leather, fur, green cloth, red cloth, black cloth, grey cloth, yellow cloth, white cloth, blue cloth, (yellow cloth, green cloth, )
    {69, 10}, {2547, 10}, {2586, 10}, {54, 5}, {174, 5}, {175, 5}, {176, 5}, {177, 5}, {178, 5}, {179, 5}, -- 2577, 2579,
    -- Wood: cherry boards, naldor boards, conifer boards, apple boards, conifer wood, cherry wood, naldor wood, applewood,
    {545, 10}, {546, 10}, {2543, 10}, {2716, 10}, {3, 10}, {543, 10}, {544, 10}, {2560, 10},
    -- Misc: pins and cotters, pins, unfired bricks, stone block,
    {2717, 10}, {2738, 10}, {736, 10}, {733, 10},
    -- Trash: clay, thread, bough, ball of wool, wool, quartz sand, wax, branch, potash, horn, coarse sand, raw stone, honeycomb,
    26, 50, 56, 168, 170, 316, 431, 2786, 314, 333, 726, 735, 2529,
}
treasureContents[2] = {
    -- Ore/Gems: raw obsidian, raw sapphire, raw smaragd, raw topaz, ruby, amethyst,
    {252, 5}, {253, 5}, {256, 5}, {257, 5}, {46, 5}, {197, 5},
    -- Ingots: gold ingot, merinium ingot, bricks, (metal pieces, iron plate, )
    {236, 5}, 2571, {2588, 10}, --{2696, 10}, {2537, 10},
    -- Usables: parchment, soup bowl, plate, candles, small empty bottle, empty bottle, large empty bottle,
    {2745, 10}, {2935, 10}, {2952, 10}, {43, 10}, {1317, 10}, {164, 10}, {2498, 10},
    -- Misc: amulet, iron goblet, golden goblet, clay mug, wodden sword, plate, copper goblet, goblet, glass mug, plate, glass, clay mug, clay cup, wooden cup, wine glass,
    222, 223, 224, 2183, 445, 1001, 1840, 1858, 1908, 2031, 2055, 2183, 2184, 2185, 2457,
    -- Handles: axehandle, large ornated handle, dagger handle, hammer handle, large handle, mace handle, morning star handle, saw handle, scythe handle, shovel handle, sickle handle, staff handle, long staff handle, sword handle, big sword handle, (small handle, )
    {2525, 10}, {2527, 10}, {2530, 10}, {2541, 10}, {2544, 10}, {2548, 10}, {2549, 10}, {2561, 10}, {2566, 10}, {2567, 10}, {2570, 10}, {2572, 10}, {2573, 10}, {2584, 10}, {2585, 10} --, 2528,
}
treasureContents[3] = {
    -- Ore/Gems: raw diamonds, obsidian, sapphire, emerald, topaz, ruby powder, amethyst powder,
    {254, 5}, {283, 5}, {284, 5}, {45, 5}, {198, 5}, {447, 5}, {450, 5},
    -- Jewellery: ruby amulet, amethyst amulet, golden ring,
    67, 79, 235,
    -- Usables: lamp oil, torch, quill, (lamp oil, )
    {390, 10}, {391, 10}, {463, 10}, --{469, 10},
    -- Items: candlestick, handcuffs, candlestick, beer mug, cutlery, comb, pipe,
    399, 466, 1862, 1909, 2647, 2719, 2744,
    -- Consumables: bottle of elven wine, bottle of rum, cabbage stew,
    1318, 1319, 2278,
    -- Clothes: leather bag, thieve's gloves, blue hat with feather, yellow hat with feather, grey hat with feather, green hat with feather, red hat with feather, hat, cloth gloves,
    97, 384, 828, 829, 830, 831, 832, 356, 2295,
    -- Clothes:leather shoes, black trousers, green trousers, red trousers, yellow trousers, blue trousers, blue trousers, yellow trousers, grey trousers, green trousers, red trousers, black trousers, white trousers,
    369, 34, 183, 459, 460, 461, 821, 822, 823, 824, 825, 826, 827,
    -- Sheilds/Armour:small wooden shield, wooden shield, light metal shield, chain helmet, round steel hat,
    2445, 17, 18, 324, 2290,
    -- Weapons: club, simple dagger, skull staff, poisoned halfling axe, poisoned simple dagger, halfling axe
    2664, 27, 39, 2635, 2668, 2711
}
treasureContents[4] = {
    -- Ore/Gems: diamond,
    {285, 5},
    -- Tools: scissors, saw, hammer, shovel, needle, bucket, mortar, fishing rod, hatchet, rolling pin, peel, finesmithing hammer, sickle,  cooking spoon, flail, scythe, glass blow pipe, wooden shovel,
    6, 9, 23, 24, 47, 51, 58, 72, 74, 118, 121, 122, 126, 227, 258, 271, 311, 312,
    -- Tools: candle mould, brick mould, chisel, tongs, plane, razor blade, crucible-pincers, carving tools rope, pick-axe, dying rod,
    429, 734, 737, 2140, 2715,  2746, 2751, 2752, 2760, 2763, 2781,
    -- Misc: wicker basket, flute, panpipe, drum, oil lamp, mirror, lantern, ( lit oil lamp, )
    799, 90, 532, 533, 92, 336, 393, --397,
    -- Sheilds/Armour:horned helmet,  steel boots, short leather legs, round metal shield,
    7, 326, 367, 186,
    -- Weapons: executioner's axe, poisened executioner's axe, serinjah-sword, poisoned serinjah-sword, shortsword, sling, cleric's staff, short bow, mace,
    2723, 2725, 1, 2694, 78, 89, 40, 65, 230,
    -- Unusable Tools: lock picks, cauldron, pan, nail board, rasp, carpenter hammer, mould,
    -- 739, 1008, 2495, 2659, 2697, 2709, 2710,
}
treasureContents[5] = {
    -- Ore/Gems: sapphire powder, obsidian powder, emerald powder, topaz powder, diamond powder,
    {446, 5}, {449, 5}, {448, 5}, {451, 5}, {452, 5},
    -- Jewellery: sapphire amulet, obsidian amulet, emerald amulet, ruby ring, topaz amulet, amethyst ring, obsidian ring, sapphire ring,
    71, 82, 62, 68, 83, 277, 278, 279,
    -- Sheilds/Armour:steel cap, steel gloves, large metal shield, leather boots, leather gloves, short hardwood greaves, gynkese mercenary's helmet, knight shield, orc helmet, steel hat,
    202, 325, 19, 53, 48, 2194, 2302, 20, 16, 187,
    -- Weapons: battle axe, dagger, poisened dagger,  orc axe
    2946, 189, 2672, 2642,
    -- clothes: grey coat, lute, blue wizard hat, red wizard hat, blue dress, blue dress, yellow dress, grey dress, green dress, red dress, black dress, white dress, black blue dress, black yellow dress, black yellow dress, black green dress, black red dress, black white dress, blue white skirt, yellow white skirt, grey white skirt, green white skirt, red white skirt, black white skirt, blue green heraldic dress, blue red heraldic dress, yellow blue heraldic dress, yellow green heraldic dress, red yellow heraldic dress, grey heraldic dress, black red heraldic dress, white heraldic dress, blue coat, black coat,
    196, 335, 357, 358, 385, 800, 801, 802, 803, 804, 805, 806, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 2380, 2384,
}
treasureContents[6] = {
    -- Shields/Armour: leather legs, albarian steel gloves, salkamarian steel boots, cursed shield, short iron greaves, leather scale armour, hardwood greaves, serinjah helmet,
    366, 530, 699, 917, 2117, 363, 2193, 2444,
    -- Weapons: simple mage's staff, serinjah-rider's bow, morning star, sabre, hunting bow, longaxe, ornate dagger, gilded dagger, silvered dagger, coppered dagger, merinium-plated dagger, poisoned ornate dagger,  scimitar
    57, 2646, 2737, 25, 2714, 88, 190, 297, 389, 398, 444, 2689, 2757,
    -- Clothes: red shirt, blue shirt, black shirt, green shirt, yellow shirt, blue doublet, yellow doublet, grey doublet, green doublet, red doublet, black doublet, white doublet, blue tunic, yellow tunic, grey tunic, green tunic, red tunic, black tunic, white tunic,
    180, 181, 182, 457, 458, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820,
    -- Clothes: green robe, blue robe, black robe, yellow robe, harp, yellow priest robe, colourful wizard hat, expensive wizard hat, red mage robe, black cult robe, brown priest robe, grey priest robe, red priest robe, black priest robe, white priest robe,
    55, 193, 194, 195, 332, 368, 370, 371, 2377, 2378, 2416, 2418, 2419, 2420, 2421,
}
treasureContents[7] = {
    -- Jewellery: smaragd ring, topaz ring, diamond ring, diadem,
    281, 282, 280, 465,
    --Sheilds/Armour:red steel shield, studded leather gloves, fur boots, chain shirt, half leather armour, dwarfen metal gloves, albarian soldier's helmet, legionaire's tower shield, pot helmet, plate armour, heraldic shield, dwarven state armour,
    2388, 526, 697, 101, 365, 529, 2287, 2448, 94, 4, 95, 2390,
    -- Weapons: halberd, mage's staff, bastard sword, poisened broadsword, broadsword, fire-hunters bow, red dagger, magical poisonbow, waraxe, morning star, mage's staff, long bow
    77, 76, 204, 2655, 2658, 2727, 2740, 2780, 383, 231, 323, 2708,
    -- Clothes: novice mage robe,  mage robe,
    547, 548,
    -- Elements: pure air, pure earth, pure fire, pure water, pure spirit
    2551, 2552, 2553, 2554, 3607
}
treasureContents[8] = {
    -- Sheilds/Armour:albarian steel boots, short fur trousers, drow helmet, storm cap, steel tower shield, light hunting armour, albarian steelgloves, heavy steel greaves, steel plate,
    771, 2114, 2303, 2441, 96, 364, 530, 2172, 2364,
    -- Weapons: gilded longsword, coppered longsword, silvered longsword, merinium-plated longsword, elven mage's staff, rapier, longsword, poisoned longsword, gilded battle axe, coppered battle axe, ornate mage's staff, silvered battle axe, merinium-plated battle axe, light battleaxe, two-handed sword, elvensword
    84, 85, 98, 123, 209, 2675, 2701, 2705, 124, 192, 1044, 229, 296, 2629, 2731, 2778,
    -- Clothes: archmage robe,
    558
}
treasureContents[9] = {
    -- Jewellery: crown,
    225,
    --Sheilds/Armour:visored helmet, serinjah leather boots, serinjah leather gloves, ornate tower shield, short chain pants, flame helmet, elven silversteel armour, black visored helmet, full leatherarmour, Shield of the Sky, albarian steel plate, cloud shield, knight boots, brass greaves
    184, 698, 527, 916, 2112, 2286, 2403, 185, 362, 2284, 2369, 2439, 770, 2113,
    -- Weapons: large waraxe, battle staff, dwarven axe, elven composite longbow, war hammer, snake sword, elven rainbowsword, double axe, poisoned longaxe,
    188, 207, 2660, 2718, 226, 2788, 2775, 205, 2636
}
treasureContents[10] = {
    -- Jewellery: charm of the icebird,
    334,
    -- Sheilds/Armour:knight gloves, lizard armour, iron greaves, chain pants, Lor-Angur guardian's armour, light breastplate, dwarvenplate, salkamaerian armour, mercenary armour, elven state armour,
    531, 696, 2116, 2111, 2360, 2407, 2395, 2389, 2359, 2400,
    -- Weapons: drow blade, drow sword, malachin dagger, elven shortbow, magical icebow, red fire dagger, fire broadsword, fire longsword, fire waraxe, large fire-waraxe, magical dagger, magical serinjah-sword, magical broadsword, magical longsword,
    2777, 3035, 91, 2685, 2742, 2656, 206, 2627, 2640, 2671, 2693, 2654, 2704,
    -- Wands: earthwand, wand of fire, wand of water, wand of air,
    2782, 2783, 2784, 2785,
    -- Magical emerald Level 1, Magical ruby Level 1, Magical amethyst Level 1, Magical topaz Level 1, Magical obsidian Level 1, Magical sapphire Level 1
    magicGem(gems.EMERALD, 1), magicGem(gems.RUBY, 1), magicGem(gems.AMETHYST, 1), magicGem(gems.TOPAZ, 1), magicGem(gems.OBSIDIAN, 1), magicGem(gems.SAPPHIRE, 1)
}
treasureContents[11] = {
    -- Jewellery: ring of the archmage,
    2559,
    -- Sheilds/Armour:nightplate, salkamaerian officer's armour, light elven armour, drow armour, shadowplate, albarian noble's armour, heavy plate armour,
    2363, 2365, 2399, 2402, 2357, 2367, 2393,
    -- Weapons: magical waraxe, magical dwarven axe,
    2626, 2662,
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