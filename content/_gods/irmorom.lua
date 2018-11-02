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

local class = require('base.class')
local baseyounger = require("content._gods.baseyounger")
local common = require('base.common')

local M = {}

M.Irmorom = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Irmorom:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Irmorom"
    self.nameEn = "Irmorom"
    self.descriptionDe = "der Gott des Handels und des Handwerks"
    self.descriptionEn = "God of trade and craftsmanship"
    self.devotionItems = {
        {id = 2535, number = 1}, -- iron ingot
        {id = 23, number = 1}, -- hammer
        {id = 101, number = 1}, -- chain mail
    }
    local ids = common.setFromList({ -- set of item IDs
        -- ## From craft\final\armourer.lua ##
        -- category: Chain boots
        1507, -- simple jackboots
        1508, -- jackboots
        1057, -- robust jackboots
        1056, -- guardian's boots
        1058, -- silversteel boots
        1509, -- coppered guardian's boots
        1054, -- ornate jackboots
        1510, -- silvered guardian's boots
        1511, -- gilded guardian's boots
        699, -- salkamaerian steel shoes
        1512, -- master's steel shoes
        -- category: Chain gloves
        1460, -- simple chain gloves
        1461, -- chain gloves
        1462, -- reinforced chain gloves
        1463, -- coppered chain gloves
        1464, -- silvered chain gloves
        528, -- salkamaerian chain gloves
        1465, -- gilded chain gloves
        1466, -- guard's chain gloves
        1467, -- gladiator's chain gloves
        1468, -- merinium plated chain gloves
        1469, -- templar's chain gloves
        -- category: Chain greaves
        1485, -- simple short scale greaves
        2194, -- short scale greaves
        1486, -- reinforced short scale greaves
        1487, -- simple scale greaves
        2193, -- scale greaves
        1488, -- reinforced scale greaves
        1489, -- simple chain trousers
        2112, -- short chain trousers
        1490, -- reinforced chain trousers
        2111, -- chain pants
        1491, -- holy chain pants
        -- category: Chain helmets
        324, -- chain helmet
        16, -- orc helmet
        1425, -- coppered chain helmet
        2444, -- serinjah helmet
        1426, -- silvered chain helmet
        2441, -- storm cap
        1427, -- gilded chain helmet
        2302, -- gynkese mercenary's helmet
        1428, -- chain helmet of darkness
        2291, -- salkamaerian paladin's helmet
        2286, -- flame helmet
        -- category: Chain mails
        101, -- chain mail
        2359, -- mercenary armour
        2360, -- guardian's armour
        1095, -- scale armour
        2403, -- silversteel armour
        1438, -- coppered scale armour
        696, -- lizard armour
        1439, -- silvered scale armour
        2389, -- salkamaerian armour
        1440, -- gilded scale armour
        2365, -- salkamaerian officer's armour
        2400, -- state armour
        -- category: Plate boots
        1520, -- iron boots
        1513, -- simple steel boots
        326, -- steel boots
        1514, -- reinforced steel boots
        1515, -- coppered steel boots
        1055, -- dwarven boots
        1516, -- silvered steel boots
        771, -- albarian steel boots
        1517, -- gilded steel boots
        1518, -- paladin's steel boots
        770, -- knight boots
        1519, -- knight boots of swiftness
        -- category: Plate gloves
        1470, -- simple steel gloves
        325, -- steel gloves
        1471, -- reinforced steel gloves
        1472, -- coppered steel gloves
        1473, -- silvered steel gloves
        529, -- dwarven metal gloves
        1474, -- gilded steel gloves
        1475, -- squire's gloves
        530, -- albarian steel gloves
        531, -- knight gloves
        1476, -- merinium plated steel gloves
        1477, -- grand master's gloves
        -- category: Plate greaves
        1492, -- simple short iron greaves
        2117, -- short iron greaves
        1493, -- reinforced short iron greaves
        1494, -- simple iron greaves
        2116, -- iron greaves
        1495, -- reinforced iron greaves
        1496, -- simple steel greaves
        2172, -- steel greaves
        1497, -- reinforced steel greaves
        1498, -- knight's steel greaves
        1499, -- steel greaves of eternal night
        -- category: Plate helmets
        202, -- steel cap
        1429, -- reinforced steel cap
        187, -- steel hat
        1430, -- reinforced steel hat
        2290, -- round steel hat
        94, -- pot helmet
        1431, -- reinforced pot helmet
        1432, -- albarian mercenary's helmet
        2287, -- albarian soldier's helmet
        184, -- visored helmet
        185, -- visored helmet of darkness
        -- category: Plate armour
        4, -- plate armour
        1441, -- reinforced plate armour
        2364, -- steel plate
        1443, -- coppered plate armour
        1442, -- reinforced steel plate
        1444, -- silvered plate armour
        2395, -- dwarven plate
        1445, -- gilded plate armour
        2369, -- albarian steel plate
        2390, -- dwarven state armour
        1446, -- albarian knight's armour
        2367, -- albarian noble's armour
        2393, -- heavy plate armour
        2363, -- nightplate
        -- category: repair only
--        2303, -- drow helmet
--        2402, -- drow armour
        -- ## From craft\final\blacksmithing.lua ##
        -- category: Daggers
        27, -- simple dagger
        189, -- dagger
        1524, -- sharp dagger
        398, -- coppered dagger
        190, -- ornate dagger
        2740, -- red dagger
        389, -- silvered dagger
        297, -- gilded dagger
        2672, -- ritual dagger
        2675, -- rapier
        91, -- Malachín dagger
        444, -- merinium-plated dagger
        2671, -- magical dagger
        2742, -- red fire dagger
        -- category: One handed axes
        2629, -- light battle axe
        2711, -- halfling axe
        2946, -- battle axe
        192, -- coppered battle axe
        229, -- silvered battle axe
        124, -- gilded battle axe
        2642, -- orc axe
        2660, -- dwarven axe
        296, -- merinium-plated battle axe
        2662, -- magical dwarven axe
        -- category: One handed swords
        2776, -- machete
        25, -- sabre
        78, -- short sword
        1, -- serinjah sword
        2757, -- scimitar
        2701, -- longsword
        85, -- coppered longsword
        98, -- silvered longsword
        2658, -- broadsword
        2778, -- elven sword
        84, -- gilded longsword
        2775, -- elven rainbowsword
        2788, -- snake sword
        123, -- merinium-plated longsword
        206, -- fire longsword
        2693, -- magical serinjah-sword
        2704, -- magical longsword
        2654, -- magical broadsword
        2656, -- fire broadsword
        -- category: Other
        2738, -- pins
        2537, -- iron plate
        739, -- lockpicks
        466, -- handcuffs
        -- category: Throwing weapons
        2645, -- throwing axe
        294, -- throwing star
        -- category: Tools
        6, -- scissors
        9, -- saw
        23, -- hammer
        24, -- shovel
        47, -- needle
        74, -- hatchet
        122, -- finesmithing hammer
        126, -- sickle
        271, -- scythe
        737, -- chisel
        2140, -- tongs
        2495, -- pan
        2697, -- rasp
        2709, -- armourer's hammer
        2710, -- mould
        2715, -- plane
        2746, -- razor blade
        2751, -- crucible-pincers
        2752, -- carving tools
        2763, -- pick-axe
        -- category: Two handed axes
        2723, -- executioner's axe
        88, -- longaxe
        383, -- waraxe
        188, -- large waraxe
        1527, -- cleaver axe
        205, -- double axe
        2627, -- fire waraxe
        2640, -- large fire-waraxe
        2626, -- magical waraxe
        -- category: Two handed swords
        1525, -- flamberge
        204, -- greatsword
        1526, -- claymore
        2731, -- two-handed sword
        -- category: repair only
--        2777, -- drow blade
--        3035, -- drow sword
        -- ## From craft\final\carving.lua ##
        -- category: Arrows and bolts
        64, -- arrow
        237, -- crossbow bolt
        322, -- wind arrows
        -- category: Blunt weapons
        2664, -- club
        230, -- mace
        1521, -- nail club
        231, -- battle flail
        1522, -- maul
        2737, -- war flail
        1044, -- battle hammer
        226, -- warhammer
        1523, -- heavy hammer
        1041, -- spiked mace
        1043, -- dwarven hammer
        1052, -- dwarven stormhammer
        -- category: Handles
        2525, -- axe handle
        2530, -- dagger handle
        2548, -- mace handle
        2572, -- staff handle
        2584, -- sword handle
        2528, -- small handle
        2541, -- hammer handle
        2561, -- saw handle
        2566, -- scythe handle
        2567, -- shovel handle
        2570, -- sickle handle
        2585, -- big sword handle
        2527, -- large ornamented handle
        2544, -- large handle
        2549, -- morning star handle
        2573, -- long staff handle
        -- category: Other
        391, -- torch
        2717, -- pins and cotters
        2719, -- comb
        2744, -- pipe
        1059, -- dice cup
        374, -- trap set
        -- category: Spears
        1046, -- simple spear
        1038, -- snake spear
        1047, -- glaive
        1049, -- viper spear
        1040, -- ranseur
        1048, -- voulge
        77, -- halberd
        1042, -- partisan
        1053, -- divine voulge
        1039, -- twinblade ranseur
        1050, -- shadow ranseur
        1051, -- partisan of light
        -- category: Staffs
        1090, -- walking stick
        39, -- skull staff
        40, -- cleric's staff
        1528, -- novice's staff
        57, -- simple mage's staff
        1529, -- adepts's staff
        76, -- mage's staff
        209, -- elven mage's staff
        207, -- battle staff
        208, -- ornate mage's staff
        1530, -- master's staff
        -- category: Throwing weapons
        293, -- javelin
        -- category: Tools
        72, -- fishing rod
        118, -- rolling pin
        121, -- peel
        227, -- cooking spoon
        258, -- flail
        429, -- candle mould
        734, -- brick mould
        2031, -- collection pan
        2781, -- dyeing rod
        51, -- bucket
        312, -- wooden shovel
        -- category: Wands
        323, -- wand
        2782, -- wand of earth
        2783, -- wand of fire
        2784, -- wand of water
        2785, -- wand of air
        3608, -- wand of spirit
        -- ## From craft\final\finesmithing.lua ##
        -- category: Amulets
        222, -- iron amulet
        3535, -- golden amulet
        3554, -- silver amulet
        3558, -- copper amulet
        3526, -- copper amethyst amulet
        3528, -- silver amethyst amulet
        79, -- golden amethyst amulet
        3539, -- copper ruby amulet
        3541, -- silver ruby amulet
        67, -- golden ruby amulet
        3536, -- copper obsidian amulet
        3538, -- silver obsidian amulet
        82, -- golden obsidian amulet
        3559, -- copper sapphire amulet
        3543, -- silver sapphire amulet
        71, -- golden sapphire amulet
        3546, -- copper emerald amulet
        3548, -- silver emerald amulet
        62, -- golden emerald amulet
        3549, -- copper topaz amulet
        3551, -- silver topaz amulet
        83, -- golden topaz amulet
        3530, -- copper diamond amulet
        3532, -- silver diamond amulet
        334, -- charm of the icebird
        3534, -- golden diamond amulet
        -- category: Crowns
        465, -- diadem
        225, -- crown
        3556, -- queen's crown
        3557, -- kings's crown
        -- category: Other
        399, -- small candlestick
        92, -- oil lamp
        393, -- lantern
        336, -- mirror
        -- category: Rings
        235, -- golden ring
        3553, -- copper ring
        3555, -- silver ring
        3527, -- copper amethyst ring
        3529, -- silver amethyst ring
        277, -- golden amethyst ring
        3540, -- copper ruby ring
        3560, -- silver ruby ring
        68, -- golden ruby ring
        3537, -- copper obsidian ring
        3561, -- silver obsidian ring
        278, -- golden obsidian ring
        3542, -- copper sapphire ring
        3544, -- silver sapphire ring
        279, -- golden sapphire ring
        3547, -- copper emerald ring
        3545, -- silver emerald ring
        281, -- golden emerald ring
        3550, -- copper topaz ring
        3552, -- silver topaz ring
        282, -- golden topaz ring
        3531, -- copper diamond ring
        3533, -- silver diamond ring
        280, -- golden diamond ring
        2559, -- archmage ring
        -- category: Tableware
        223, -- iron goblet
        1840, -- copper goblet
        1001, -- green plate
        1858, -- silver goblet
        224, -- golden goblet
        2647, -- cutlery
        -- category: Tools
        311, -- glass blow pipe
        -- ## From craft\final\planing.lua ##
        -- category: Bows
        65, -- short bow
        1531, -- rider's bow
        2646, -- serinjah-rider's bow
        2714, -- hunting bow
        2708, -- long bow
        70, -- crossbow
        2685, -- elven shortbow
        2780, -- ebony wood bow
        2718, -- elven composite longbow
        2727, -- fire hunter's bow
        -- category: Music instruments
        90, -- flute
        532, -- panpipe
        533, -- drum
        335, -- lute
        332, -- harp
        -- category: Shields
        2445, -- small wooden shield
        17, -- wooden shield
        18, -- light shield
        917, -- red warden's shield
        19, -- metal shield
        20, -- knight shield
        186, -- round metal shield
        2388, -- red steel shield
        2448, -- legionnaire's tower shield
        95, -- heraldic shield
        96, -- steel tower shield
        916, -- ornate tower shield
        2284, -- shield of the sky
        2447, -- mosaic shield
        2439, -- cloud shield
        -- category: Tableware
        2185, -- wooden cup
        2935, -- soup bowl
        2952, -- wooden plate
        -- category: Training weapons
        445, -- wooden sword
        1045, -- wooden dagger
        -- category: repair only
--        2739, -- drow bow
        -- ## From craft\final\tailoring.lua ##
        -- category: Boots
        1500, -- simple leather shoes
        369, -- leather shoes
        1501, -- robust leather shoes
        1502, -- simple leather boots
        53, -- leather boots
        1503, -- robust leather boots
        1504, -- simple fur boots
        697, -- fur boots
        1505, -- robust fur boots
        698, -- serinjah leather boots
        1506, -- leather boots of the winds
        -- category: Cloth gloves
        1447, -- grey cloth gloves
        2295, -- white cloth gloves
        1448, -- green cloth gloves
        1449, -- black cloth gloves
        1450, -- red cloth gloves
        1451, -- yellow cloth gloves
        1452, -- blue cloth gloves
        -- category: Doublets
        809, -- grey doublet
        813, -- white doublet
        810, -- green doublet
        812, -- black doublet
        811, -- red doublet
        808, -- yellow doublet
        807, -- blue doublet
        -- category: Dresses
        802, -- grey dress
        806, -- white dress
        803, -- green dress
        385, -- light blue dress
        800, -- blue dress
        801, -- yellow dress
        804, -- red dress
        805, -- black dress
        833, -- black blue dress
        834, -- black yellow dress
        835, -- black grey dress
        836, -- black green dress
        837, -- black red dress
        838, -- black white dress
        845, -- blue green heraldic dress
        846, -- blue red heraldic dress
        847, -- yellow blue heraldic dress
        848, -- yellow green heraldic dress
        849, -- red yellow heraldic dress
        850, -- grey heraldic dress
        851, -- black red heraldic dress
        852, -- white heraldic dress
        -- category: Greaves
        1478, -- simple short leather leggings
        367, -- short leather leggings
        1479, -- reinforced short leather leggings
        1480, -- simple leather leggings
        366, -- leather leggings
        1481, -- reinforced leather leggings
        1482, -- simple short fur trousers
        2114, -- short fur trousers
        1483, -- reinforced short fur trousers
        2113, -- fur trousers
        1484, -- fur trousers of dawn
        -- category: Hats
        356, -- hat
        830, -- grey hat with feather
        1415, -- white hat with feather
        831, -- green hat with feather
        832, -- red hat with feather
        829, -- yellow hat with feather
        828, -- blue hat with feather
        358, -- red wizard hat
        357, -- blue wizard hat
        3868, -- yellow wizard hat
        370, -- colourful wizard hat
        3708, -- witch hat
        371, -- fine wizard hat
        -- category: Helmets
        1416, -- simple horned helmet
        7, -- horned helmet
        1417, -- coppered horned helmet
        1418, -- silvered horned helmet
        1419, -- gilded horned helmet
        1420, -- bull horned helmet
        1421, -- Norodaj horned helmet
        1422, -- demonic horned helmet
        1423, -- merinium plated horned helmet
        1424, -- dragon horned helmet
        -- category: Leather gloves
        1453, -- simple leather gloves
        384, -- thief's gloves
        48, -- leather gloves
        1454, -- reinforced leather gloves
        526, -- studded leather gloves
        1455, -- copper studded leather gloves
        1456, -- silver studded leather gloves
        1457, -- gold studded leather gloves
        527, -- serinjah leather gloves
        1458, -- reinforced serinjah leather gloves
        1459, -- ranger's gloves
        -- category: Other
        89, -- sling
        97, -- leather bag
        2760, -- rope
        -- category: Robes
        196, -- grey coat
        2418, -- grey priest robe
        2421, -- white priest robe
        55, -- green robe
        194, -- black robe
        2378, -- black cult robe
        2384, -- black coat
        2420, -- black priest robe
        547, -- novice robe
        2419, -- red priest robe
        2377, -- red mage robe
        195, -- yellow robe
        368, -- yellow priest robe
        2416, -- brown priest robe
        193, -- blue robe
        2380, -- blue coat
        548, -- mage robe
        558, -- archmage robe
        -- category: Shirts
        457, -- green shirt
        182, -- black shirt
        180, -- red shirt
        458, -- yellow shirt
        181, -- blue shirt
        -- category: Skirts
        841, -- grey white skirt
        842, -- green white skirt
        844, -- black white skirt
        843, -- red white skirt
        840, -- yellow white skirt
        839, -- blue white skirt
        -- category: Torso armour
        1433, -- padded armour
        363, -- leather scale armour
        1434, -- simple rogue armour
        2407, -- light rogue armour
        365, -- half leather armour
        1435, -- simple hunting armour
        1436, -- hunting armour
        2399, -- light elven armour
        2357, -- assassin's armour
        364, -- reinforced hunting armour
        362, -- full leather armour
        1437, -- assassin's armour of darkness
        -- category: Trousers
        823, -- grey trousers
        827, -- white trousers
        183, -- short green trousers
        824, -- green trousers
        34, -- short black trousers
        826, -- black trousers
        459, -- short red trousers
        825, -- red trousers
        460, -- short yellow trousers
        822, -- yellow trousers
        461, -- short blue trousers
        821, -- blue trousers
        -- category: Tunics
        816, -- grey tunic
        820, -- white tunic
        817, -- green tunic
        819, -- black tunic
        818, -- red tunic
        815, -- yellow tunic
        814, -- blue tunic
    })
self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = ids,
            minimal_quality = 9, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 90, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 5, -- float -- the monetary value gets multiplied by this
        },
        {
            id_set = ids,
            minimal_quality = 8, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 90, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 0.1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M