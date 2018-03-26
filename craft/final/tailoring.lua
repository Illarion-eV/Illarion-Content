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

local tailoring = crafts.Craft:new{
                      craftEN = "Tailoring",
                      craftDE = "Schneidern",
                      handTool = 47,
                      leadSkill = Character.tailoring,
                    }

tailoring:addTool(102) -- tailoring table
tailoring:addTool(103) -- tailoring table

local product
local catId

catId = tailoring:addCategory("Boots", "Stiefel")

-- simple leather shoes
product = tailoring:addProduct(catId, 1500, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(2547, 1) -- leather

-- leather shoes
product = tailoring:addProduct(catId, 369, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- robust leather shoes
product = tailoring:addProduct(catId, 1501, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- simple leather boots
product = tailoring:addProduct(catId, 1502, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather

-- leather boots
product = tailoring:addProduct(catId, 53, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(2586, 1) -- fur

-- robust leather boots
product = tailoring:addProduct(catId, 1503, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(283, 1) -- obsidian

-- simple fur boots
product = tailoring:addProduct(catId, 1504, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- fur boots
product = tailoring:addProduct(catId, 697, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- robust fur boots
product = tailoring:addProduct(catId, 1505, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- serinjah leather boots
product = tailoring:addProduct(catId, 698, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- leather boots of the winds
product = tailoring:addProduct(catId, 1506, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(2551, 1) -- pure air

catId = tailoring:addCategory("Cloth gloves", "Stoffhandschuhe")

-- grey cloth gloves
product = tailoring:addProduct(catId, 1447, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(176, 1) -- grey cloth

-- white cloth gloves
product = tailoring:addProduct(catId, 2295, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(178, 1) -- white cloth

-- green cloth gloves
product = tailoring:addProduct(catId, 1448, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(54, 2) -- green cloth

-- black cloth gloves
product = tailoring:addProduct(catId, 1449, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(175, 2) -- black cloth

-- red cloth gloves
product = tailoring:addProduct(catId, 1450, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(46, 1) -- ruby

-- yellow cloth gloves
product = tailoring:addProduct(catId, 1451, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- blue cloth gloves
product = tailoring:addProduct(catId, 1452, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(179, 2) -- blue cloth
product:addIngredient(3787, 1) -- silk

catId = tailoring:addCategory("Doublets", "Wamse")

-- grey doublet
product = tailoring:addProduct(catId, 809, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(176, 2) -- grey cloth

-- white doublet
product = tailoring:addProduct(catId, 813, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(178, 2) -- white cloth

-- green doublet
product = tailoring:addProduct(catId, 810, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(54, 3) -- green cloth

-- black doublet
product = tailoring:addProduct(catId, 812, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(175, 3) -- black cloth

-- red doublet
product = tailoring:addProduct(catId, 811, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(174, 4) -- red cloth

-- yellow doublet
product = tailoring:addProduct(catId, 808, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(177, 5) -- yellow cloth
product:addIngredient(198, 1) -- topaz

-- blue doublet
product = tailoring:addProduct(catId, 807, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(179, 5) -- blue cloth
product:addIngredient(3787, 1) -- silk

catId = tailoring:addCategory("Dresses", "Kleider")

-- grey dress
product = tailoring:addProduct(catId, 802, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(176, 2) -- grey cloth

-- white dress
product = tailoring:addProduct(catId, 806, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(178, 2) -- white cloth

-- green dress
product = tailoring:addProduct(catId, 803, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(54, 3) -- green cloth

-- light blue dress
product = tailoring:addProduct(catId, 385, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(179, 6) -- blue cloth
product:addIngredient(3787, 1) -- silk

-- blue dress
product = tailoring:addProduct(catId, 800, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(179, 6) -- blue cloth
product:addIngredient(3787, 1) -- silk

-- yellow dress
product = tailoring:addProduct(catId, 801, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(177, 6) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- red dress
product = tailoring:addProduct(catId, 804, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(174, 6) -- red cloth
product:addIngredient(3787, 1) -- silk

-- black dress
product = tailoring:addProduct(catId, 805, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(3787, 1) -- silk

-- black blue dress
product = tailoring:addProduct(catId, 833, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(179, 1) -- blue cloth
product:addIngredient(3787, 1) -- silk

-- black yellow dress
product = tailoring:addProduct(catId, 834, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- black grey dress
product = tailoring:addProduct(catId, 835, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(3787, 1) -- silk

-- black green dress
product = tailoring:addProduct(catId, 836, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(54, 1) -- green cloth
product:addIngredient(3787, 1) -- silk

-- black red dress
product = tailoring:addProduct(catId, 837, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(174, 1) -- red cloth
product:addIngredient(3787, 1) -- silk

-- black white dress
product = tailoring:addProduct(catId, 838, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(175, 6) -- black cloth
product:addIngredient(178, 1) -- white cloth
product:addIngredient(3787, 1) -- silk

-- blue green heraldic dress
product = tailoring:addProduct(catId, 845, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(179, 7) -- blue cloth
product:addIngredient(54, 1) -- green cloth
product:addIngredient(3787, 2) -- silk

-- blue red heraldic dress
product = tailoring:addProduct(catId, 846, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(179, 7) -- blue cloth
product:addIngredient(174, 1) -- red cloth
product:addIngredient(3787, 2) -- silk

-- yellow blue heraldic dress
product = tailoring:addProduct(catId, 847, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(177, 7) -- yellow cloth
product:addIngredient(179, 1) -- blue cloth
product:addIngredient(3787, 2) -- silk

-- yellow green heraldic dress
product = tailoring:addProduct(catId, 848, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(177, 7) -- yellow cloth
product:addIngredient(54, 1) -- green cloth
product:addIngredient(3787, 2) -- silk

-- red yellow heraldic dress
product = tailoring:addProduct(catId, 849, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(174, 7) -- red cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 2) -- silk

-- grey heraldic dress
product = tailoring:addProduct(catId, 850, 1)
product:addIngredient(50, 10) -- thread
product:addIngredient(176, 8) -- grey cloth
product:addIngredient(3787, 2) -- silk

-- black red heraldic dress
product = tailoring:addProduct(catId, 851, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(175, 7) -- black cloth
product:addIngredient(174, 1) -- red cloth
product:addIngredient(3787, 2) -- silk

-- white heraldic dress
product = tailoring:addProduct(catId, 852, 1)
product:addIngredient(50, 10) -- thread
product:addIngredient(178, 8) -- white cloth
product:addIngredient(3787, 2) -- silk

catId = tailoring:addCategory("Greaves", "Beinkleider")

-- simple short leather leggings
product = tailoring:addProduct(catId, 1478, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- short leather leggings
product = tailoring:addProduct(catId, 367, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather

-- reinforced short leather leggings
product = tailoring:addProduct(catId, 1479, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather

-- simple leather leggings
product = tailoring:addProduct(catId, 1480, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather

-- leather leggings
product = tailoring:addProduct(catId, 366, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(2537, 1) -- iron plate

-- reinforced leather leggings
product = tailoring:addProduct(catId, 1481, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(2537, 2) -- iron plate

-- simple short fur trousers
product = tailoring:addProduct(catId, 1482, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- short fur trousers
product = tailoring:addProduct(catId, 2114, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(2547, 6) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- reinforced short fur trousers
product = tailoring:addProduct(catId, 1483, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(2547, 6) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- fur trousers
product = tailoring:addProduct(catId, 2113, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(2547, 7) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- fur trousers of dawn
product = tailoring:addProduct(catId, 1484, 1)
product:addIngredient(50, 10) -- thread
product:addIngredient(2547, 8) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(2553, 1) -- pure fire

catId = tailoring:addCategory("Hats", "Hüte")

-- hat
product = tailoring:addProduct(catId, 356, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- grey hat with feather
product = tailoring:addProduct(catId, 830, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(2696, 1) -- feathers

-- white hat with feather
product = tailoring:addProduct(catId, 1415, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(178, 1) -- white cloth
product:addIngredient(2696, 1) -- feathers

-- green hat with feather
product = tailoring:addProduct(catId, 831, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(54, 2) -- green cloth
product:addIngredient(2696, 1) -- feathers

-- red hat with feather
product = tailoring:addProduct(catId, 832, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(2696, 1) -- feathers

-- yellow hat with feather
product = tailoring:addProduct(catId, 829, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(2696, 1) -- feathers
product:addIngredient(197, 1) -- amethyst

-- blue hat with feather
product = tailoring:addProduct(catId, 828, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(179, 2) -- blue cloth
product:addIngredient(2696, 1) -- feathers
product:addIngredient(284, 1) -- sapphire

-- red wizard hat
product = tailoring:addProduct(catId, 358, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(3787, 1) -- silk

-- blue wizard hat
product = tailoring:addProduct(catId, 357, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(179, 2) -- blue cloth
product:addIngredient(3787, 2) -- silk

-- yellow wizard hat
product = tailoring:addProduct(catId, 3868, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(3787, 2) -- silk

-- colourful wizard hat
product = tailoring:addProduct(catId, 370, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(3787, 2) -- silk

-- witch hat
product = tailoring:addProduct(catId, 3708, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(3787, 2) -- silk

-- fine wizard hat
product = tailoring:addProduct(catId, 371, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(179, 3) -- blue cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 1) -- silk
product:addIngredient(3607, 1) -- pure spirit

catId = tailoring:addCategory("Helmets", "Helme")

-- simple horned helmet
product = tailoring:addProduct(catId, 1416, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather
product:addIngredient(333, 2) -- horn

-- horned helmet
product = tailoring:addProduct(catId, 7, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather
product:addIngredient(333, 2) -- horn

-- coppered horned helmet
product = tailoring:addProduct(catId, 1417, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2550, 1) -- copper ingot

-- silvered horned helmet
product = tailoring:addProduct(catId, 1418, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(104, 1) -- silver ingot

-- gilded horned helmet
product = tailoring:addProduct(catId, 1419, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(236, 1) -- gold ingot

-- bull horned helmet
product = tailoring:addProduct(catId, 1420, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2586, 1) -- fur
product:addIngredient(45, 1) -- emerald

-- Norodaj horned helmet
product = tailoring:addProduct(catId, 1421, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- demonic horned helmet
product = tailoring:addProduct(catId, 1422, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- merinium plated horned helmet
product = tailoring:addProduct(catId, 1423, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(2571, 1) -- merinium ingot

-- dragon horned helmet
product = tailoring:addProduct(catId, 1424, 1)
product:addIngredient(50, 8) -- thread
product:addIngredient(2547, 6) -- leather
product:addIngredient(333, 2) -- horn
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(2553, 1) -- pure fire

catId = tailoring:addCategory("Leather gloves", "Lederhandschuhe")

-- simple leather gloves
product = tailoring:addProduct(catId, 1453, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(2547, 1) -- leather

-- thief's gloves
product = tailoring:addProduct(catId, 384, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- leather gloves
product = tailoring:addProduct(catId, 48, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- reinforced leather gloves
product = tailoring:addProduct(catId, 1454, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather

-- studded leather gloves
product = tailoring:addProduct(catId, 526, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(2547, 2) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(2535, 2) -- iron ingot

-- copper studded leather gloves
product = tailoring:addProduct(catId, 1455, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(2550, 2) -- copper ingot

-- silver studded leather gloves
product = tailoring:addProduct(catId, 1456, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(104, 3) -- silver ingot

-- gold studded leather gloves
product = tailoring:addProduct(catId, 1457, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(236, 1) -- gold ingot

-- serinjah leather gloves
product = tailoring:addProduct(catId, 527, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(2547, 4) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- reinforced serinjah leather gloves
product = tailoring:addProduct(catId, 1458, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- ranger's gloves
product = tailoring:addProduct(catId, 1459, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(2547, 5) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk
product:addIngredient(2551, 1) -- pure air

catId = tailoring:addCategory("Other", "Sonstiges")

-- sling
product = tailoring:addProduct(catId, 89, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather

-- leather bag
product = tailoring:addProduct(catId, 97, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(2547, 2) -- leather

-- rope
product = tailoring:addProduct(catId, 2760, 1)
product:addIngredient(50, 10) -- thread

catId = tailoring:addCategory("Robes", "Roben")

-- grey coat
product = tailoring:addProduct(catId, 196, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(176, 2) -- grey cloth

-- grey priest robe
product = tailoring:addProduct(catId, 2418, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(176, 2) -- grey cloth

-- white priest robe
product = tailoring:addProduct(catId, 2421, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(178, 2) -- white cloth

-- green robe
product = tailoring:addProduct(catId, 55, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(54, 2) -- green cloth
product:addIngredient(45, 1) -- emerald

-- black robe
product = tailoring:addProduct(catId, 194, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(283, 1) -- obsidian

-- black cult robe
product = tailoring:addProduct(catId, 2378, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(283, 1) -- obsidian

-- black coat
product = tailoring:addProduct(catId, 2384, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(283, 1) -- obsidian

-- black priest robe
product = tailoring:addProduct(catId, 2420, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(3787, 1) -- silk

-- novice robe
product = tailoring:addProduct(catId, 547, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- red priest robe
product = tailoring:addProduct(catId, 2419, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(3787, 1) -- silk

-- red mage robe
product = tailoring:addProduct(catId, 2377, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(3787, 1) -- silk

-- yellow robe
product = tailoring:addProduct(catId, 195, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(3787, 2) -- silk

-- yellow priest robe
product = tailoring:addProduct(catId, 368, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(177, 3) -- yellow cloth
product:addIngredient(3787, 2) -- silk

-- brown priest robe
product = tailoring:addProduct(catId, 2416, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(177, 3) -- yellow cloth
product:addIngredient(174, 1) -- red cloth
product:addIngredient(3787, 2) -- silk

-- blue robe
product = tailoring:addProduct(catId, 193, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(179, 3) -- blue cloth
product:addIngredient(3787, 2) -- silk

-- blue coat
product = tailoring:addProduct(catId, 2380, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(179, 3) -- blue cloth
product:addIngredient(3787, 3) -- silk

-- mage robe
product = tailoring:addProduct(catId, 548, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(174, 4) -- red cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 3) -- silk

-- archmage robe
product = tailoring:addProduct(catId, 558, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(174, 4) -- red cloth
product:addIngredient(177, 1) -- yellow cloth
product:addIngredient(3787, 1) -- silk
product:addIngredient(3607, 1) -- pure spirit

catId = tailoring:addCategory("Shirts", "Hemden")

-- green shirt
product = tailoring:addProduct(catId, 457, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(54, 3) -- green cloth

-- black shirt
product = tailoring:addProduct(catId, 182, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(175, 3) -- black cloth

-- red shirt
product = tailoring:addProduct(catId, 180, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(174, 4) -- red cloth

-- yellow shirt
product = tailoring:addProduct(catId, 458, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(177, 5) -- yellow cloth
product:addIngredient(198, 1) -- topaz

-- blue shirt
product = tailoring:addProduct(catId, 181, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(179, 5) -- blue cloth
product:addIngredient(3787, 1) -- silk

catId = tailoring:addCategory("Skirts", "Röcke")

-- grey white skirt
product = tailoring:addProduct(catId, 841, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(176, 1) -- grey cloth
product:addIngredient(178, 1) -- white cloth

-- green white skirt
product = tailoring:addProduct(catId, 842, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(54, 2) -- green cloth
product:addIngredient(178, 1) -- white cloth

-- black white skirt
product = tailoring:addProduct(catId, 844, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(178, 1) -- white cloth
product:addIngredient(283, 1) -- obsidian

-- red white skirt
product = tailoring:addProduct(catId, 843, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(178, 1) -- white cloth
product:addIngredient(3787, 1) -- silk

-- yellow white skirt
product = tailoring:addProduct(catId, 840, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(178, 1) -- white cloth
product:addIngredient(3787, 1) -- silk

-- blue white skirt
product = tailoring:addProduct(catId, 839, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(179, 2) -- blue cloth
product:addIngredient(178, 1) -- white cloth
product:addIngredient(3787, 2) -- silk

catId = tailoring:addCategory("Torso armour", "Rüstungen")

-- padded armour
product = tailoring:addProduct(catId, 1433, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(2547, 3) -- leather

-- leather scale armour
product = tailoring:addProduct(catId, 363, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(2547, 5) -- leather

-- simple rogue armour
product = tailoring:addProduct(catId, 1434, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(2547, 5) -- leather

-- light rogue armour
product = tailoring:addProduct(catId, 2407, 1)
product:addIngredient(50, 9) -- thread
product:addIngredient(2547, 7) -- leather

-- half leather armour
product = tailoring:addProduct(catId, 365, 1)
product:addIngredient(50, 10) -- thread
product:addIngredient(2547, 8) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(45, 1) -- emerald

-- simple hunting armour
product = tailoring:addProduct(catId, 1435, 1)
product:addIngredient(50, 12) -- thread
product:addIngredient(2547, 9) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- hunting armour
product = tailoring:addProduct(catId, 1436, 1)
product:addIngredient(50, 14) -- thread
product:addIngredient(2547, 11) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 1) -- silk

-- light elven armour
product = tailoring:addProduct(catId, 2399, 1)
product:addIngredient(50, 14) -- thread
product:addIngredient(2547, 11) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- assassin's armour
product = tailoring:addProduct(catId, 2357, 1)
product:addIngredient(50, 15) -- thread
product:addIngredient(2547, 11) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk

-- reinforced hunting armour
product = tailoring:addProduct(catId, 364, 1)
product:addIngredient(50, 17) -- thread
product:addIngredient(2547, 13) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 3) -- silk

-- full leather armour
product = tailoring:addProduct(catId, 362, 1)
product:addIngredient(50, 18) -- thread
product:addIngredient(2547, 14) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 4) -- silk

-- assassin's armour of darkness
product = tailoring:addProduct(catId, 1437, 1)
product:addIngredient(50, 20) -- thread
product:addIngredient(2547, 15) -- leather
product:addIngredient(2586, 1) -- fur
product:addIngredient(3787, 2) -- silk
product:addIngredient(2552, 1) -- pure earth

catId = tailoring:addCategory("Trousers", "Hosen")

-- grey trousers
product = tailoring:addProduct(catId, 823, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(176, 1) -- grey cloth

-- white trousers
product = tailoring:addProduct(catId, 827, 1)
product:addIngredient(50, 1) -- thread
product:addIngredient(178, 1) -- white cloth

-- short green trousers
product = tailoring:addProduct(catId, 183, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(54, 2) -- green cloth

-- green trousers
product = tailoring:addProduct(catId, 824, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(54, 2) -- green cloth

-- short black trousers
product = tailoring:addProduct(catId, 34, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(283, 1) -- obsidian

-- black trousers
product = tailoring:addProduct(catId, 826, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(175, 2) -- black cloth
product:addIngredient(283, 1) -- obsidian

-- short red trousers
product = tailoring:addProduct(catId, 459, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(46, 1) -- ruby

-- red trousers
product = tailoring:addProduct(catId, 825, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(174, 2) -- red cloth
product:addIngredient(3787, 1) -- silk

-- short yellow trousers
product = tailoring:addProduct(catId, 460, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(177, 2) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- yellow trousers
product = tailoring:addProduct(catId, 822, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(177, 3) -- yellow cloth
product:addIngredient(3787, 1) -- silk

-- short blue trousers
product = tailoring:addProduct(catId, 461, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(179, 3) -- blue cloth
product:addIngredient(3787, 2) -- silk

-- blue trousers
product = tailoring:addProduct(catId, 821, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(179, 4) -- blue cloth
product:addIngredient(3787, 2) -- silk

catId = tailoring:addCategory("Tunics", "Tuniken")

-- grey tunic
product = tailoring:addProduct(catId, 816, 1)
product:addIngredient(50, 2) -- thread
product:addIngredient(176, 2) -- grey cloth

-- white tunic
product = tailoring:addProduct(catId, 820, 1)
product:addIngredient(50, 3) -- thread
product:addIngredient(178, 2) -- white cloth

-- green tunic
product = tailoring:addProduct(catId, 817, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(54, 3) -- green cloth

-- black tunic
product = tailoring:addProduct(catId, 819, 1)
product:addIngredient(50, 4) -- thread
product:addIngredient(175, 3) -- black cloth

-- red tunic
product = tailoring:addProduct(catId, 818, 1)
product:addIngredient(50, 5) -- thread
product:addIngredient(174, 4) -- red cloth

-- yellow tunic
product = tailoring:addProduct(catId, 815, 1)
product:addIngredient(50, 6) -- thread
product:addIngredient(177, 5) -- yellow cloth
product:addIngredient(198, 1) -- topaz

-- blue tunic
product = tailoring:addProduct(catId, 814, 1)
product:addIngredient(50, 7) -- thread
product:addIngredient(179, 5) -- blue cloth
product:addIngredient(3787, 1) -- silk

M.tailoring = tailoring
return M
