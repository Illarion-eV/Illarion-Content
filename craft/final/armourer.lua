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
local crafts = require("craft.base.crafts")

local M = {}

local armourer = crafts.Craft:new{
                      craftEN = "Armourer",
                      craftDE = "Rüstschmied",
                      handTool = 2709,
                      leadSkill = Character.armourer,
                      sfx = 8,
                      sfxDuration = 27,
                    }

armourer:addTool(172) -- anvil

local product
local catId

catId = armourer:addCategory("Chain boots", "Kettenstiefel")

-- simple jackboots
product = armourer:addProduct(catId, 1507, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- jackboots
product = armourer:addProduct(catId, 1508, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- robust jackboots
product = armourer:addProduct(catId, 1057, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- guardian's boots
product = armourer:addProduct(catId, 1056, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- silversteel boots
product = armourer:addProduct(catId, 1058, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2547, 1) -- leather
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- coppered guardian's boots
product = armourer:addProduct(catId, 1509, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2547, 1) -- leather
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(46, 1) -- ruby

-- ornate jackboots
product = armourer:addProduct(catId, 1054, 1)
product:addIngredient(2535, 4) -- thread
product:addIngredient(2547, 1) -- leather
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(283, 1) -- obsidian

-- silvered guardian's boots
product = armourer:addProduct(catId, 1510, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 1) -- copper ingot

-- gilded guardian's boots
product = armourer:addProduct(catId, 1511, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(236, 1) -- gold ingot

-- salkamaerian steel shoes
product = armourer:addProduct(catId, 699, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 1) -- gold ingot

-- master's steel shoes
product = armourer:addProduct(catId, 1512, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2552, 1) -- pure earth

catId = armourer:addCategory("Chain gloves", "Kettenhandschuhe")

-- simple chain gloves
product = armourer:addProduct(catId, 1460, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(176, 1) -- grey cloth

-- chain gloves
product = armourer:addProduct(catId, 1461, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(176, 1) -- grey cloth

-- reinforced chain gloves
product = armourer:addProduct(catId, 1462, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(176, 1) -- grey cloth

-- coppered chain gloves
product = armourer:addProduct(catId, 1463, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(2550, 1) -- copper ingot

-- silvered chain gloves
product = armourer:addProduct(catId, 1464, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- salkamaerian chain gloves
product = armourer:addProduct(catId, 528, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- gilded chain gloves
product = armourer:addProduct(catId, 1465, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(284, 1) -- sapphire

-- guard's chain gloves
product = armourer:addProduct(catId, 1466, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 1) -- copper ingot

-- gladiator's chain gloves
product = armourer:addProduct(catId, 1467, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 1) -- silver ingot

-- merinium plated chain gloves
product = armourer:addProduct(catId, 1468, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 1) -- gold ingot

-- templar's chain gloves
product = armourer:addProduct(catId, 1469, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2554, 1) -- pure water

catId = armourer:addCategory("Chain greaves", "Kettenhosen")

-- simple short scale greaves
product = armourer:addProduct(catId, 1485, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- short scale greaves
product = armourer:addProduct(catId, 2194, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- reinforced short scale greaves
product = armourer:addProduct(catId, 1486, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- simple scale greaves
product = armourer:addProduct(catId, 1487, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- scale greaves
product = armourer:addProduct(catId, 2193, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- reinforced scale greaves
product = armourer:addProduct(catId, 1488, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- simple chain trousers
product = armourer:addProduct(catId, 1489, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2547, 2) -- leather
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 1) -- sapphire

-- short chain trousers
product = armourer:addProduct(catId, 2112, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2547, 3) -- leather
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 2) -- copper ingot

-- reinforced chain trousers
product = armourer:addProduct(catId, 1490, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2547, 3) -- leather
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 2) -- silver ingot

-- chain pants
product = armourer:addProduct(catId, 2111, 1)
product:addIngredient(2535, 9) -- iron ingot
product:addIngredient(2547, 3) -- leather
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 2) -- gold ingot

-- holy chain pants
product = armourer:addProduct(catId, 1491, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2547, 3) -- leather
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2554, 1) -- pure water

catId = armourer:addCategory("Chain helmets", "Kettenhelme")

-- chain helmet
product = armourer:addProduct(catId, 324, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(176, 1) -- grey cloth

-- orc helmet
product = armourer:addProduct(catId, 16, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(176, 1) -- grey cloth

-- coppered chain helmet
product = armourer:addProduct(catId, 1425, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(2550, 1) -- copper ingot

-- serinjah helmet
product = armourer:addProduct(catId, 2444, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(2550, 1) -- copper ingot

-- silvered chain helmet
product = armourer:addProduct(catId, 1426, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- storm cap
product = armourer:addProduct(catId, 2441, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- gilded chain helmet
product = armourer:addProduct(catId, 1427, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(284, 1) -- sapphire

-- gynkese mercenary's helmet
product = armourer:addProduct(catId, 2302, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 2) -- copper ingot

-- chain helmet of darkness
product = armourer:addProduct(catId, 1428, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 2) -- silver ingot

-- salkamaerian paladin's helmet
product = armourer:addProduct(catId, 2291, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(176, 2) -- grey cloth
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 2) -- gold ingot

-- flame helmet
product = armourer:addProduct(catId, 2286, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(176, 3) -- grey cloth
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2553, 1) -- pure fire

catId = armourer:addCategory("Chain mails", "Kettenhemden")

-- chain mail
product = armourer:addProduct(catId, 101, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2547, 1) -- leather

-- mercenary armour
product = armourer:addProduct(catId, 2359, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2547, 2) -- leather

-- guardian's armour
product = armourer:addProduct(catId, 2360, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2547, 2) -- leather

-- scale armour
product = armourer:addProduct(catId, 1095, 1)
product:addIngredient(2535, 9) -- iron ingot
product:addIngredient(2547, 3) -- leather

-- silversteel armour
product = armourer:addProduct(catId, 2403, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2547, 3) -- leather
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- coppered scale armour
product = armourer:addProduct(catId, 1438, 1)
product:addIngredient(2535, 12) -- iron ingot
product:addIngredient(2547, 4) -- leather
product:addIngredient(2550, 4) -- copper ingot
product:addIngredient(46, 1) -- ruby

-- lizard armour
product = armourer:addProduct(catId, 696, 1)
product:addIngredient(2535, 13) -- iron ingot
product:addIngredient(2547, 4) -- leather
product:addIngredient(2550, 4) -- copper ingot
product:addIngredient(284, 1) -- sapphire

-- silvered scale armour
product = armourer:addProduct(catId, 1439, 1)
product:addIngredient(2535, 14) -- iron ingot
product:addIngredient(2547, 5) -- leather
product:addIngredient(104, 5) -- silver ingot
product:addIngredient(284, 1) -- sapphire
product:addIngredient(2550, 4) -- copper ingot

-- salkamaerian armour
product = armourer:addProduct(catId, 2389, 1)
product:addIngredient(2535, 15) -- iron ingot
product:addIngredient(2547, 6) -- leather
product:addIngredient(236, 6) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 4) -- copper ingot

-- gilded scale armour
product = armourer:addProduct(catId, 1440, 1)
product:addIngredient(2535, 17) -- iron ingot
product:addIngredient(2547, 6) -- leather
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(236, 4) -- gold ingot

-- salkamaerian officer's armour
product = armourer:addProduct(catId, 2365, 1)
product:addIngredient(2535, 18) -- iron ingot
product:addIngredient(2547, 6) -- leather
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 4) -- gold ingot

-- state armour
product = armourer:addProduct(catId, 2400, 1)
product:addIngredient(2535, 20) -- iron ingot
product:addIngredient(2547, 7) -- leather
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(3607, 1) -- pure spirit

catId = armourer:addCategory("Plate boots", "Panzerstiefel")

-- iron boots
product = armourer:addProduct(catId, 1520, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- simple steel boots
product = armourer:addProduct(catId, 1513, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- steel boots
product = armourer:addProduct(catId, 326, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced steel boots
product = armourer:addProduct(catId, 1514, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- coppered steel boots
product = armourer:addProduct(catId, 1515, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- dwarven boots
product = armourer:addProduct(catId, 1055, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(46, 1) -- ruby

-- silvered steel boots
product = armourer:addProduct(catId, 1516, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- albarian steel boots
product = armourer:addProduct(catId, 771, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(284, 1) -- sapphire

-- gilded steel boots
product = armourer:addProduct(catId, 1517, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 1) -- copper ingot

-- paladin's steel boots
product = armourer:addProduct(catId, 1518, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 1) -- silver ingot

-- knight boots
product = armourer:addProduct(catId, 770, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 1) -- gold ingot

-- knight boots of swiftness
product = armourer:addProduct(catId, 1519, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2551, 1) -- pure air

catId = armourer:addCategory("Plate gloves", "Panzerhandschuhe")

-- simple steel gloves
product = armourer:addProduct(catId, 1470, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- steel gloves
product = armourer:addProduct(catId, 325, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced steel gloves
product = armourer:addProduct(catId, 1471, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- coppered steel gloves
product = armourer:addProduct(catId, 1472, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(2550, 1) -- copper ingot

-- silvered steel gloves
product = armourer:addProduct(catId, 1473, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- dwarven metal gloves
product = armourer:addProduct(catId, 529, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- gilded steel gloves
product = armourer:addProduct(catId, 1474, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(46, 1) -- ruby

-- squire's gloves
product = armourer:addProduct(catId, 1475, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(284, 1) -- sapphire

-- albarian steel gloves
product = armourer:addProduct(catId, 530, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 1) -- copper ingot

-- knight gloves
product = armourer:addProduct(catId, 531, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 1) -- silver ingot

-- merinium plated steel gloves
product = armourer:addProduct(catId, 1476, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 1) -- gold ingot

-- grand master's gloves
product = armourer:addProduct(catId, 1477, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2552, 1) -- pure earth

catId = armourer:addCategory("Plate greaves", "Panzerhosen")

-- simple short iron greaves
product = armourer:addProduct(catId, 1492, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- short iron greaves
product = armourer:addProduct(catId, 2117, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced short iron greaves
product = armourer:addProduct(catId, 1493, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- simple iron greaves
product = armourer:addProduct(catId, 1494, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- iron greaves
product = armourer:addProduct(catId, 2116, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- reinforced iron greaves
product = armourer:addProduct(catId, 1495, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- simple steel greaves
product = armourer:addProduct(catId, 1496, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 1) -- sapphire

-- steel greaves
product = armourer:addProduct(catId, 2172, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 2) -- copper ingot

-- reinforced steel greaves
product = armourer:addProduct(catId, 1497, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 2) -- silver ingot

-- knight's steel greaves
product = armourer:addProduct(catId, 1498, 1)
product:addIngredient(2535, 9) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 2) -- gold ingot

-- steel greaves of eternal night
product = armourer:addProduct(catId, 1499, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2552, 1) -- pure earth

catId = armourer:addCategory("Plate helmets", "Panzerhelme")

-- steel cap
product = armourer:addProduct(catId, 202, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced steel cap
product = armourer:addProduct(catId, 1429, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- steel hat
product = armourer:addProduct(catId, 187, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced steel hat
product = armourer:addProduct(catId, 1430, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- round steel hat
product = armourer:addProduct(catId, 2290, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- pot helmet
product = armourer:addProduct(catId, 94, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- reinforced pot helmet
product = armourer:addProduct(catId, 1431, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 1) -- sapphire

-- albarian mercenary's helmet
product = armourer:addProduct(catId, 1432, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 2) -- copper ingot

-- albarian soldier's helmet
product = armourer:addProduct(catId, 2287, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 2) -- silver ingot

-- visored helmet
product = armourer:addProduct(catId, 184, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 2) -- gold ingot

-- visored helmet of darkness
product = armourer:addProduct(catId, 185, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2552, 1) -- pure earth

catId = armourer:addCategory("Plate armour", "Plattenpanzer")

-- plate armour
product = armourer:addProduct(catId, 4, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- reinforced plate armour
product = armourer:addProduct(catId, 1441, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2537, 2) -- iron plate

-- steel plate
product = armourer:addProduct(catId, 2364, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2537, 2) -- iron plate

-- coppered plate armour
product = armourer:addProduct(catId, 1443, 1)
product:addIngredient(2535, 9) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2550, 3) -- copper ingot

-- reinforced steel plate
product = armourer:addProduct(catId, 1442, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(2550, 3) -- copper ingot

-- silvered plate armour
product = armourer:addProduct(catId, 1444, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2537, 3) -- iron plate
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- dwarven plate
product = armourer:addProduct(catId, 2395, 1)
product:addIngredient(2535, 11) -- iron ingot
product:addIngredient(2537, 4) -- iron plate
product:addIngredient(104, 4) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- gilded plate armour
product = armourer:addProduct(catId, 1445, 1)
product:addIngredient(2535, 12) -- iron ingot
product:addIngredient(2537, 4) -- iron plate
product:addIngredient(236, 4) -- gold ingot
product:addIngredient(46, 1) -- ruby

-- albarian steel plate
product = armourer:addProduct(catId, 2369, 1)
product:addIngredient(2535, 14) -- iron ingot
product:addIngredient(2537, 5) -- iron plate
product:addIngredient(236, 5) -- gold ingot
product:addIngredient(284, 1) -- sapphire

-- dwarven state armour
product = armourer:addProduct(catId, 2390, 1)
product:addIngredient(2535, 14) -- iron ingot
product:addIngredient(2537, 5) -- iron plate
product:addIngredient(236, 5) -- gold ingot
product:addIngredient(283, 1) -- obsidian

-- albarian knight's armour
product = armourer:addProduct(catId, 1446, 1)
product:addIngredient(2535, 15) -- iron ingot
product:addIngredient(2537, 5) -- iron plate
product:addIngredient(236, 5) -- gold ingot
product:addIngredient(283, 1) -- obsidian
product:addIngredient(2550, 4) -- copper ingot

-- albarian noble's armour
product = armourer:addProduct(catId, 2367, 1)
product:addIngredient(2535, 17) -- iron ingot
product:addIngredient(2537, 6) -- iron plate
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(45, 1) -- emerald
product:addIngredient(104, 4) -- silver ingot

-- heavy plate armour
product = armourer:addProduct(catId, 2393, 1)
product:addIngredient(2535, 18) -- iron ingot
product:addIngredient(2537, 6) -- iron plate
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(198, 1) -- topaz
product:addIngredient(236, 4) -- gold ingot

-- nightplate
product = armourer:addProduct(catId, 2363, 1)
product:addIngredient(2535, 20) -- iron ingot
product:addIngredient(2537, 7) -- iron plate
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(2552, 1) -- pure earth

-- Dummy group for items that cannot be crafted but repaired
catId = armourer:addCategory("repair only", "nur reparieren")

-- drow helmet
product = armourer:addProduct(catId, 2303, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2537, 2) -- iron plate
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(104, 2) -- silver ingot

-- drow armour
product = armourer:addProduct(catId, 2402, 1)
product:addIngredient(2535, 18) -- iron ingot
product:addIngredient(2537, 6) -- iron plate
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(285, 1) -- diamond
product:addIngredient(236, 4) -- gold ingot

M.armourer = armourer
return M
