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
require("item.base.crafts")

module("content.craft.smithing", package.seeall)

smithing = item.base.crafts.Craft:new{
                      craftEN = "blacksmithing",
                      craftDE = "Schmieden",
                      handTool = 23,
                      leadSkill = Character.smithing,
                      defaultFoodConsumption = 300,
                      sfx = 8,
                      sfxDuration = 27,
                    }

smithing:addTool(172); -- anvil
smithing:addActiveTool(172, 13); -- anvil with glowing metal



catId = smithing:addCategory("Tools", "Werkzeuge")

--Razor
product = smithing:addProduct(catId, 2746, 24, 44, 33, 66)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1


--Shovel
product = smithing:addProduct(catId, 24, 22, 42, 30, 60)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2567) -- Shovel Handle: 1x1


--Hatchet
product = smithing:addProduct(catId, 74, 20, 40, 30, 60)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Saw
product = smithing:addProduct(catId, 9, 18, 38, 27, 54)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2561) -- Saw Handle: 1x1


--Scyte
product = smithing:addProduct(catId, 271, 16, 36, 27, 54)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2566) -- Scythe Handle: 1x1


--Sickle
product = smithing:addProduct(catId, 126, 14, 34, 24, 48)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1

--Finesmithing hammer
product = smithing:addProduct(catId, 122, 12, 32, 24, 48)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Scissors
product = smithing:addProduct(catId, 6, 10, 30, 16, 32)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Needle
product = smithing:addProduct(catId, 47, 8, 28, 7, 14)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Tongs
product = smithing:addProduct(catId, 2140, 6, 26, 14, 28)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1


--Crucible-Princers
product = smithing:addProduct(catId, 2751, 4, 24, 12, 24)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1


--Chisel
product = smithing:addProduct(catId, 737, 2, 22, 12, 24)
product:addIngredient(2535, 2) -- iron Ingot: 2x1


--Hammer
product = smithing:addProduct(catId, 23, 0, 20, 10, 20)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Pickaxe
product = smithing:addProduct(catId, 2763, 0, 20, 15, 30)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2544) -- Large handle: 1x1

--Pins
product = smithing:addProduct(catId, 2738, 0, 20, 10, 20, 5)
product:addIngredient(2535) -- Iron Ingot: 1x1


catId = smithing:addCategory("Helmets", "Helme")

-- black visored helmet
product = smithing:addProduct(catId, 185, 98, 100, 177, 354, 1);
product:addIngredient(2535, 9); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(283); -- Obsidian
product:addIngredient(197); -- Amethyst
product:addIngredient(451); -- Topaz Powder

-- flame helmet
product = smithing:addProduct(catId, 2286, 95, 100, 172, 345, 1);
product:addIngredient(2535, 9); -- Iron Ingot
product:addIngredient(2550, 6); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2553); -- Pure Fire
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(104); -- Silver Ingot

-- visored helmet
product = smithing:addProduct(catId, 184, 94, 100, 171, 342, 1);
product:addIngredient(2535, 9); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(104); -- Silver Ingot
product:addIngredient(2547); -- Leather
product:addIngredient(197); -- Merinium Ingot

-- salkamaerian paladin's helmet
product = smithing:addProduct(catId, 2291, 92, 100, 168, 336, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2571); -- Merinium ingot
product:addIngredient(447); -- Ruby Powder
product:addIngredient(284); -- Sapphire

-- horned helmet
product = smithing:addProduct(catId, 7, 88, 100, 162, 324, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather
product:addIngredient(236); -- Gold Ingot

-- albarian soldier's helmet
product = smithing:addProduct(catId, 2287, 84, 100, 156, 312, 1);
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather
product:addIngredient(104); -- Silver Ingot

-- gynkese mercenarie's helmet
product = smithing:addProduct(catId, 2302, 70, 90, 135, 270, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(176, 2); -- Grey Cloth

-- round steel hat
product = smithing:addProduct(catId, 2290, 61, 81, 121, 243, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot

-- pot helmet
product = smithing:addProduct(catId, 94, 58, 78, 117, 234, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot

-- storm cap
product = smithing:addProduct(catId, 2441, 52, 72, 108, 216, 1);
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot

--Serinjah Helmet
product = smithing:addProduct(catId, 2444, 39, 59, 90, 180, 1)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2550, 2); -- Copper Ingot

-- orc helmet
product = smithing:addProduct(catId, 16, 34, 54, 81, 162, 1);
product:addIngredient(2535, 4); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot

-- steel hat
product = smithing:addProduct(catId, 187, 27, 47, 70, 141, 1);
product:addIngredient(2535, 3); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- steel cap
product = smithing:addProduct(catId, 202, 9, 29, 43, 87, 1);
product:addIngredient(2535,4); -- Iron Ingot

-- chain helmet
product = smithing:addProduct(catId, 324, 7, 27, 40, 81, 1);
product:addIngredient(2535,2); -- Iron Ingot

catId = smithing:addCategory("Armour", "Rüstungen")

-- nightplate
product = smithing:addProduct(catId, 2363, 99, 100, 178, 357, 1);
product:addIngredient(2535, 25); -- Iron Ingot
product:addIngredient(2550, 8); -- Copper Ingot
product:addIngredient(2552); -- Pure Earth
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(283); -- Obsidian
product:addIngredient(450); -- Amethyst Powder
product:addIngredient(284); -- Sapphire

-- elven state armour
product = smithing:addProduct(catId, 2400, 97, 100, 175, 351, 1);
product:addIngredient(2535, 20); -- Iron Ingot
product:addIngredient(2550, 8); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2552); -- Pure Earth
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(448); -- Emerald Powder
product:addIngredient(284); -- Sapphire
product:addIngredient(46); -- Ruby
product:addIngredient(104); -- Silver Ingot

-- salkamaerian officer's armour
product = smithing:addProduct(catId, 2365, 93, 100, 169, 339, 1);
product:addIngredient(2535, 20); -- Iron Ingot
product:addIngredient(2550, 8); -- Copper Ingot
product:addIngredient(236, 2); -- Gold Ingot
product:addIngredient(2547, 8); -- Leather
product:addIngredient(176, 8); -- Grey Cloth
product:addIngredient(198); -- Topaz
product:addIngredient(2571); -- Merinum Ingot
product:addIngredient(2552); -- Pure Earth

-- heavy plate armour
product = smithing:addProduct(catId, 2393, 90, 100, 165, 330, 1);
product:addIngredient(2535, 25); -- Iron Ingot
product:addIngredient(2550, 10); -- Copper Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2547, 9); -- Leather
product:addIngredient(176, 9); -- Grey Cloth
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2552); -- Pure Earth

-- albarian noble's armour
product = smithing:addProduct(catId, 2367, 86, 100, 159, 318, 1);
product:addIngredient(2535, 15); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2547, 5); -- Leather
product:addIngredient(176, 5); -- Grey Cloth
product:addIngredient(46); -- Ruby
product:addIngredient(198); -- Topaz

-- shadowplate
product = smithing:addProduct(catId, 2357, 82, 100, 153, 306, 1);
product:addIngredient(2535, 18); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(2547,7); -- Leather
product:addIngredient(176,7); -- Grey Cloth
product:addIngredient(449); -- Obsidian powder


-- salkamaerian armour
product = smithing:addProduct(catId, 2389, 72, 92, 138, 276, 1);
product:addIngredient(2535, 14); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2547, 7); -- Leather
product:addIngredient(176, 7); -- Grey Cloth

-- albarian steel plate
product = smithing:addProduct(catId, 2369, 68, 88, 132, 264, 1);
product:addIngredient(2535, 12); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(2547, 4); -- Leather
product:addIngredient(176, 4); -- Grey Cloth

-- dwarven state armour
product = smithing:addProduct(catId, 2390, 56, 76, 114, 228, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather
product:addIngredient(176, 2); -- Grey Cloth

-- lizard armour
product = smithing:addProduct(catId, 696, 52, 72, 108, 216, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather
product:addIngredient(176, 2); -- Grey Cloth

-- elven silversteel armour
product = smithing:addProduct(catId, 2403, 42, 62, 93, 186, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(2547, 2); -- Leather

-- light elven armour
product = smithing:addProduct(catId, 2399, 38, 58, 87, 174, 1);
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547); -- Leather

-- dwarvenplate
product = smithing:addProduct(catId, 2395, 36, 56, 84, 168, 1);
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547); -- Leather

-- light breastplate
product = smithing:addProduct(catId, 2407, 29, 49, 73, 147, 1);
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- steel plate
product = smithing:addProduct(catId, 2364, 26, 46, 69, 138, 1);
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- Lor-Angur guardian's armour
product = smithing:addProduct(catId, 2360, 25, 45, 67, 135, 1);
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- mercenary armour
product = smithing:addProduct(catId, 2359, 16, 36, 54, 108, 1);
product:addIngredient(2535, 5); -- Iron Ingot

-- plate armour
product = smithing:addProduct(catId, 4, 8, 28, 42, 84, 1);
product:addIngredient(2535,4); -- Iron Ingot

-- chain mail
product = smithing:addProduct(catId, 101, 6, 26, 39, 78, 1);
product:addIngredient(2535,4); -- Iron Ingot

catId = smithing:addCategory("Gloves", "Handschuhe")

-- knight gloves
product = smithing:addProduct(catId, 531, 93, 100, 169, 339, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2547, 3); -- Leather
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(46); -- Ruby

-- Salkamarian steel gloves
product = smithing:addProduct(catId, 528, 91, 100, 166, 333, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2547, 4); -- Leather
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(198); -- Topaz
product:addIngredient(104); -- Silver Ingot

-- Albarian steelgloves
product = smithing:addProduct(catId, 530, 75, 95, 142, 285, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather

-- dwarven metal gloves
product = smithing:addProduct(catId, 529, 46, 66, 99, 198, 1);
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547, 1); -- Leather

-- steel gloves
product = smithing:addProduct(catId, 325, 19, 39, 58, 117, 1);
product:addIngredient(2535, 3); -- Iron Ingot

catId = smithing:addCategory("Pants", "Hosen")

-- iron greaves
product = smithing:addProduct(catId, 2116, 93, 100, 169, 339, 1);
product:addIngredient(2535, 12); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2547, 5); -- Leather
product:addIngredient(2571); -- Mernium Ingot
product:addIngredient(2552); -- Pure Earth

-- chain pants
product = smithing:addProduct(catId, 2111, 90, 100, 165, 330, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(451); -- Topaz Powder
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2552); -- Pure Earth

-- short chain trousers
product = smithing:addProduct(catId, 2112, 64, 84, 126, 252, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot

-- steel greaves
product = smithing:addProduct(catId, 2172, 44, 64, 96, 192, 1);
product:addIngredient(2535, 5); -- Iron Ingot

product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547, 2); -- Leather

-- short iron greaves
product = smithing:addProduct(catId, 2117, 17, 37, 55, 111, 1);
product:addIngredient(2535, 4); -- Iron Ingot

catId = smithing:addCategory("Boots", "Schuhe")

-- knight boots
product = smithing:addProduct(catId, 770, 92, 100, 168, 336, 1);
product:addIngredient(2535, 9); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2547, 4); -- Leather
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(284); -- Sapphire

-- salkamarian steel boots
product = smithing:addProduct(catId, 699, 90, 100, 165, 330, 1);
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(104); -- Silver Ingot
product:addIngredient(2547, 4); -- Leather
product:addIngredient(2571); -- Mernium Ingot
product:addIngredient(45); -- Emerald

-- albarian steel boots
product = smithing:addProduct(catId, 771, 66, 86, 129, 258, 1);
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(2547, 3); -- Leather

-- elven silversteel boots
product = smithing:addProduct(catId, 1058, 40, 60, 85, 190, 1);
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(2547, 2); -- Leather

-- steel boots
product = smithing:addProduct(catId, 326, 28, 48, 72, 144, 1);
product:addIngredient(2535, 4); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

catId = smithing:addCategory("Slashing weapons", "Schnittwaffen")

-- magical dwarven axe
product = smithing:addProduct(catId, 2662, 99, 100, 177, 354, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(236, 2); -- Gold Ingot
product:addIngredient(2551); -- Pure Air
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(198); -- Topaz
product:addIngredient(446); -- Sapphire Powder

-- magical broadsword
product = smithing:addProduct(catId, 2654, 98, 100, 175, 351, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2551); -- Pure air
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(448); -- Emerald Powder
product:addIngredient(284); -- Sapphire

--fire broadsword
product = smithing:addProduct(catId, 2656, 97, 100, 175, 351, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2553); -- Pure Fire
product:addIngredient(2571, 2); -- Merninium ingot
product:addIngredient(451); -- Topaz Powder
product:addIngredient(46); -- Ruby
product:addIngredient(197); -- Amethyst

-- magical serinjah-sword
product = smithing:addProduct(catId, 2693, 94, 100, 171, 342, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2551); -- Pure Air
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(451); -- Topaz Powder
product:addIngredient(285); -- Diamond
product:addIngredient(46); -- Ruby

-- magical longsword
product = smithing:addProduct(catId, 2704, 93, 100, 169, 339, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2554); -- Pure Water
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(104); -- Silver Ingot

-- fire longsword
product = smithing:addProduct(catId, 206, 92, 100, 168, 336, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2553); -- Pure Fire
product:addIngredient(2571); -- Mernium Ingot
product:addIngredient(236); -- Gold Ingot

-- elven rainbowsword
product = smithing:addProduct(catId, 2775, 89, 100, 163, 327, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 4); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(46); -- Ruby
product:addIngredient(284); -- Sapphire

-- snake sword
product = smithing:addProduct(catId, 2788, 86, 100, 159, 318, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(197); -- Amethyst

-- dwarven axe
product = smithing:addProduct(catId, 2660, 80, 100, 150, 300, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(198); -- Topaz

-- broadsword
product = smithing:addProduct(catId, 2658, 73, 93, 139, 279, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(104); -- Silver Ingot

-- elvensword
product = smithing:addProduct(catId, 2778, 71, 91, 136, 273, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(104); -- Silver Ingot

-- scimitar
product = smithing:addProduct(catId, 2757, 54, 74, 111, 222, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot

-- longsword
product = smithing:addProduct(catId, 2701, 47, 67, 100, 201, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot

-- light battleaxe
product = smithing:addProduct(catId, 2629, 39, 59, 88, 177, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 5); -- Iron Ingot

-- orc axe
product = smithing:addProduct(catId, 2642, 30, 50, 75, 150, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 5); -- Iron Ingot

-- serinjah sword
product = smithing:addProduct(catId, 1, 22, 42, 63, 126, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535, 4); -- Iron Ingot

-- sabre
product = smithing:addProduct(catId, 25, 15, 35, 52, 105, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535, 3); -- Iron Ingot

-- halfling axe
product = smithing:addProduct(catId, 2711, 11, 31, 46, 93, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 3); -- Iron Ingot

-- short sword
product = smithing:addProduct(catId, 78, 5, 25, 37, 75, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535,2); -- Iron Ingot

-- battle axe
product = smithing:addProduct(catId, 2946, 0, 20, 30, 60, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535,2); -- Iron Ingot

catId = smithing:addCategory("Stabbing weapons", "Stichwaffen")

-- magical dagger
product = smithing:addProduct(catId, 2671, 99, 100, 178, 357, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2552); -- Pure water
product:addIngredient(446); -- Sapphire Powder
product:addIngredient(45); -- Emerald
product:addIngredient(198); -- Topaz

-- red fire dagger
product = smithing:addProduct(catId, 2742, 95, 100, 172, 345, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(104); -- Silver Ingot
product:addIngredient(447); -- Ruby Powder
product:addIngredient(2553); -- Pure Fire
product:addIngredient(2571); -- Merinium Ingot

-- Malachín dagger
product = smithing:addProduct(catId, 91, 90, 100, 165, 330, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(452); -- Diamond Powder
product:addIngredient(451); -- Topaz Powder
product:addIngredient(446); -- Sapphire Powder
product:addIngredient(46); -- Ruby
product:addIngredient(104); -- Silver Ingot

-- rapier
product = smithing:addProduct(catId, 2675, 85, 100, 157, 315, 1);
product:addIngredient(2585); -- Big Sword Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(104); -- Silver

-- red dagger
product = smithing:addProduct(catId, 2740, 84, 100, 156, 312, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 4); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(447); -- Ruby Powder

--ornate dagger
product = smithing:addProduct(catId, 190, 40, 60, 90, 180, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

--dagger
product = smithing:addProduct(catId, 189, 13, 33, 49, 99, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535, 3); -- Iron Ingot

-- simple dagger
product = smithing:addProduct(catId, 27, 0, 20, 30, 60, 1);
product:addIngredient(2530); -- Dagger Handle
product:addIngredient(2535,2); -- Iron Ingot

catId = smithing:addCategory("Two-hand weapons", "Zweihandwaffen")

-- magical waraxe
product = smithing:addProduct(catId, 2626, 97, 100, 175, 351, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(236, 2); -- Gold Ingot
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(2551); -- Pure Water
product:addIngredient(446); -- Sapphire Powder
product:addIngredient(45); -- Emerald

--Partisan of Light
product = smithing:addProduct(catId, 1051, 96, 100, 174, 348, 1);
product:addIngredient(2527); -- Large Ornamented Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2571, 2); -- Merinium Ingot
product:addIngredient(451); -- Topaz Powder
product:addIngredient(285); -- Diamond
product:addIngredient(46); -- Ruby
product:addIngredient(2551); -- Pure Air
product:addIngredient(104); -- Silver Ingot

-- large fire-waraxe
product = smithing:addProduct(catId, 2640, 95, 100, 172, 345, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2553); -- Pure Fire
product:addIngredient(447); -- Ruby Powder
product:addIngredient(198); -- Topaz
product:addIngredient(104); -- Silver Ingot

-- fire waraxe
product = smithing:addProduct(catId, 2627, 93, 100, 169, 339, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(236, 2); -- Gold Ingot
product:addIngredient(2553); -- Pure Fire
product:addIngredient(2571); -- Merinium Ingot

--Partisan
product = smithing:addProduct(catId, 1042, 91, 100, 166, 333, 1);
product:addIngredient(2527); -- Large Ornamented Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2554); -- Pure Water
product:addIngredient(104, 2); -- Silver Ingot
product:addIngredient(2571); -- Merinium Ingot

--Twinblade Shadow Ranseur
product = smithing:addProduct(catId, 1050, 87, 100, 160, 321, 1);
product:addIngredient(2527); -- Large Ornamented Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(197); -- Amethyst
product:addIngredient(449); -- Obsidian Powder
product:addIngredient(104, 2); -- Silver Ingot

-- double axe
product = smithing:addProduct(catId, 205, 83, 100, 154, 309, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 9); -- Iron Ingot
product:addIngredient(2550, 3); -- Copper Ingot
product:addIngredient(46); -- Ruby

-- two-handed sword
product = smithing:addProduct(catId, 2731, 81, 100, 151, 303, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(45); -- Emerald

--Twinblade Ranseur
product = smithing:addProduct(catId, 1039, 77, 97, 145, 291, 1);
product:addIngredient(2527); -- Large Ornamented Handle
product:addIngredient(2535, 8); -- Iron Ingot
product:addIngredient(2550, 5); -- Copper Ingot

-- halberd
product = smithing:addProduct(catId, 77, 62, 82, 123, 246, 1);
product:addIngredient(2527); -- Large Ornamented Handle
product:addIngredient(2535, 5); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot
product:addIngredient(104); -- Silver Ingot

-- large waraxe
product = smithing:addProduct(catId, 188, 60, 80, 120, 240, 1);
product:addIngredient(2544); -- Large Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 4); -- Copper Ingot

--Divine Voulge
product = smithing:addProduct(catId, 1053, 59, 79, 118, 237, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot
product:addIngredient(236); -- Gold Ingot
product:addIngredient(447); -- Ruby Powder

-- waraxe
product = smithing:addProduct(catId, 383, 55, 75, 112, 225, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 7); -- Iron Ingot
product:addIngredient(2550, 2); -- Copper Ingot

--Voulge
product = smithing:addProduct(catId, 1048, 45, 65, 97, 195, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 6); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- greatsword
product = smithing:addProduct(catId, 204, 37, 57, 85, 171, 1);
product:addIngredient(2584); -- Sword Handle
product:addIngredient(2535, 5); -- Iron Ingot

--Ranseur
product = smithing:addProduct(catId, 1040, 31, 51, 76, 153, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 5); -- Iron Ingot

--Glaive
product = smithing:addProduct(catId, 1047, 21, 41, 61, 123, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 4); -- Iron Ingot

--Viper Spear
product = smithing:addProduct(catId, 1049, 20, 40, 60, 120, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 4); -- Iron Ingot

-- longaxe
product = smithing:addProduct(catId, 88, 14, 34, 51, 102, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535, 3); -- Iron Ingot

--Snake Spear
product = smithing:addProduct(catId, 1038, 12, 32, 48, 96, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535, 3); -- Iron Ingot

-- executioner's axe
product = smithing:addProduct(catId, 2723, 4, 24, 36, 72, 1);
product:addIngredient(2525); -- Axe Handle
product:addIngredient(2535,2); -- Iron Ingot

--Simple Spear
product = smithing:addProduct(catId, 1046, 0, 20, 30, 60, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2535,2); -- Iron Ingot

catId = smithing:addCategory("Throwing weapons", "Wurfwaffen")

-- throwing star
product = smithing:addProduct(catId, 294, 70, 90, 135, 270, 25);
product:addIngredient(2535, 20); -- Iron Ingot
product:addIngredient(449, 2); -- Obsidian Powder

--OLD INGREDIENTS
--else
--[[	local catId = smithing:addCategory("tools", "Werkzeuge")

--Pins
local product = smithing:addProduct(catId, 2738, 0, 20, 5, 10, 5)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Hammer
product = smithing:addProduct(catId, 23, 0, 20, 10, 20)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Pickaxe
product = smithing:addProduct(catId, 2763, 0, 20, 15, 30)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2544) -- Large handle: 1x1

--Chisel
product = smithing:addProduct(catId, 737, 2, 22, 12, 24)
product:addIngredient(2535, 2) -- iron Ingot: 2x1

--Crucible-Princers
product = smithing:addProduct(catId, 2751, 4, 24, 12, 24)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Tongs
product = smithing:addProduct(catId, 2140, 6, 26, 14, 28)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Needle
product = smithing:addProduct(catId, 47, 8, 28, 7, 14)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Scissors
product = smithing:addProduct(catId, 6, 10, 30, 16, 32)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Finesmithing hammer
product = smithing:addProduct(catId, 122, 12, 32, 24, 48)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Sickle
product = smithing:addProduct(catId, 126, 14, 34, 24, 48)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1

--Scyte
product = smithing:addProduct(catId, 271, 16, 36, 27, 54)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2566) -- Scythe Handle: 1x1

--Saw
product = smithing:addProduct(catId, 9, 18, 38, 27, 54)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2561) -- Saw Handle: 1x1

--Hatchet
product = smithing:addProduct(catId, 74, 20, 40, 30, 60)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Shovel
product = smithing:addProduct(catId, 24, 22, 42, 30, 60)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2567) -- Shovel Handle: 1x1

--Razor
product = smithing:addProduct(catId, 2746, 24, 44, 33, 66)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1

catId = smithing:addCategory("helmets", "Helme")

--Horned Helm
product = smithing:addProduct(catId, 7, 13, 33, 24, 48)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Orc Helmet
product = smithing:addProduct(catId, 16, 26, 46, 55, 110)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1

--Serinjah Helm
product = smithing:addProduct(catId, 2444, 39, 59, 90, 180)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Storm cap
product = smithing:addProduct(catId, 2441, 52, 72, 180, 360)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176, 2) -- Grey Cloth: 2x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Chain helmet
product = smithing:addProduct(catId, 324, 0, 20, 20, 40)
product:addIngredient(2535, 4) -- iron Ingot: 4x1

--Gynkese Merc Helmet
product = smithing:addProduct(catId, 2302, 12, 32, 40, 80)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1

--Salkmaerian Paladin Helm
product = smithing:addProduct(catId, 2291, 25, 45, 66, 132)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Albarian Soldier's Helm
product = smithing:addProduct(catId, 2287, 38, 58, 98, 196)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Flame Helmet
product = smithing:addProduct(catId, 2286, 51, 71, 216, 432)
product:addIngredient(2535, 8) -- Iron Ingot: 8x1
product:addIngredient(176) -- Grey Cloth: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Round Steel Helmets
product = smithing:addProduct(catId, 2290, 0, 20, 15, 30)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Steel Cap
product = smithing:addProduct(catId, 202, 11, 31, 48, 96)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1

--Steel Hat
product = smithing:addProduct(catId, 187, 21, 41, 70, 140)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Pot Helmet
product = smithing:addProduct(catId, 94, 31, 51, 104, 208)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Visored Helm
product = smithing:addProduct(catId, 184, 41, 61, 135, 270)
product:addIngredient(2535, 8) -- Iron Ingot: 8x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Black Visored Helm
product = smithing:addProduct(catId, 185, 51, 71, 216, 432)
product:addIngredient(2535, 8) -- Iron Ingot: 8x1
product:addIngredient(176) -- Grey Cloth: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(2571) -- Merinium Ingot

catId = smithing:addCategory("armour", "Rüstungen")

--Light Blue Breastplate
product = smithing:addProduct(catId, 2407, 72, 92, 345, 690)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Light Mercenary Armour
product = smithing:addProduct(catId, 2359, 82, 100, 575, 1150)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Light Elven Armour
product = smithing:addProduct(catId, 2399, 90, 100, 675, 1350)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(2552) -- Pure Earth

--Chain Shirt
product = smithing:addProduct(catId, 101, 33, 53, 140, 280)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1

--Dwarven State armour
product = smithing:addProduct(catId, 2390, 43, 63, 192, 384)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 2) -- Grey Cloth: 2x1

--Elven Silversteel
product = smithing:addProduct(catId, 2403, 53, 73, 252, 504)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Lizard Armour
product = smithing:addProduct(catId, 696, 63, 83, 399, 798)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Salkmaerian Armour
product = smithing:addProduct(catId, 2389, 73, 93, 529, 1058)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Salkmaerian Officers Armour
product = smithing:addProduct(catId, 2365, 83, 100, 806, 1612)
product:addIngredient(2535, 17) -- Iron Ingot: 17x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Albarian Noble Armour
product = smithing:addProduct(catId, 2367, 90, 100, 1269, 2538)
product:addIngredient(2535, 20) -- Iron Ingot: 20x1
product:addIngredient(176, 6) -- Grey Cloth: 6x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(2547, 5) -- Leather: 5x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(198, 3) -- Topas: 3x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(2552) -- Pure Earth

--Plate Armour
product = smithing:addProduct(catId, 4, 31, 51, 208, 416)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2547) -- Leather: 1x1

--Steel Plate
product = smithing:addProduct(catId, 2364, 41, 61, 270, 540)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 6) -- Grey Cloth: 6x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Albarian Steel Plate
product = smithing:addProduct(catId, 2369, 51, 71, 450, 900)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 7) -- Grey Cloth: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Dwarvenplate
product = smithing:addProduct(catId, 2395, 61, 81, 600, 1200)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 8) -- Grey Cloth: 8x1
product:addIngredient(2547, 4) -- Leather: 4x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Nightplate
product = smithing:addProduct(catId, 2363, 71, 91, 828, 1656)
product:addIngredient(2535, 17) -- Iron Ingot: 17x1
product:addIngredient(176, 9) -- Grey Cloth: 9x1
product:addIngredient(2547, 5) -- Leather: 5x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1
product:addIngredient(2571) -- Merinium Ingot

--Shadowplate
product = smithing:addProduct(catId, 2357, 81, 100, 1175, 2350)
product:addIngredient(2535, 20) -- Iron Ingot: 20x1
product:addIngredient(176, 10) -- Grey Cloth: 10x1
product:addIngredient(2547, 5) -- Leather: 5x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(283, 5) -- Obsidian: 5x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Heavy Plate
product = smithing:addProduct(catId, 2393, 90, 100, 1350, 2700)
product:addIngredient(2535, 25) -- Iron Ingot: 25x1
product:addIngredient(176, 10) -- Grey Cloth: 10x1
product:addIngredient(2547, 7) -- Leather: 7x1
product:addIngredient(2550, 6) -- Copper Ingot: 6x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(2552) -- Pure Earth

--Lor-Angur Guardians
product = smithing:addProduct(catId, 2360, 50, 70, 459, 918)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(236) -- Gold: 1x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(284, 3) -- Sapphire: 3x1

--Magical Elven Armour
product = smithing:addProduct(catId, 2400, 70, 90, 836, 1672)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 7) -- Grey Cloth: 7x1
product:addIngredient(236, 3) -- Gold: 3x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(198, 3) -- Topas: 3x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

catId = smithing:addCategory("gloves", "Handschuhe")

--Steel Gloves
product = smithing:addProduct(catId, 325, 20, 40, 30, 60)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Salkmaerian steel gloves
product = smithing:addProduct(catId, 528, 30, 50, 36, 72)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Dwarven Metal Gloves
product = smithing:addProduct(catId, 529, 40, 60, 60, 120)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1

--Albarian Steel Gloves
product = smithing:addProduct(catId, 530, 50, 70, 102, 204)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2550, 2) -- Copper: 2x1

--Knight Gloves
product = smithing:addProduct(catId, 531, 60, 80, 160, 320)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2550, 3) -- Copper: 3x1

catId = smithing:addCategory("pants", "Hosen")

--Short Chain Pants
product = smithing:addProduct(catId, 2112, 57, 77, 190, 380)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1

--Chain Pants
product = smithing:addProduct(catId, 2111, 70, 90, 286, 572)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1

--Short Iron Greaves
product = smithing:addProduct(catId, 2117, 30, 50, 120, 240)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1

--Steel Greaves
product = smithing:addProduct(catId, 2172, 50, 70, 204, 408)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Iron Greaves
product = smithing:addProduct(catId, 2116, 70, 90, 374, 748)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(2547, 2) -- Leather: 2x1

catId = smithing:addCategory("boots", "Schuhe")

--Steel Boots
product = smithing:addProduct(catId, 326, 40, 60, 105, 210)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1

--Salkmaerian Steel Boots
product = smithing:addProduct(catId, 699, 50, 70, 187, 374)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2550) -- Copper: 1x1

--Albarian Steel Boots
product = smithing:addProduct(catId, 771, 60, 80, 240, 480)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2550, 2) -- Copper: 2x1

--Knight Boots
product = smithing:addProduct(catId, 770, 70, 90, 330, 660)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2550, 3) -- Copper: 3x1
product:addIngredient(2547, 2) -- Leather: 2x1

catId = smithing:addCategory("maces", "Morgensterne")

--Mace
product = smithing:addProduct(catId, 230, 18, 38, 27, 54)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2548) -- Mace Handle: 1x1

--Battle Flail
product = smithing:addProduct(catId, 231, 36, 56, 102, 204)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2549) -- Morning Star: 1x1

--War Flail
product = smithing:addProduct(catId, 2737, 48, 68, 112, 224)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(2549) -- Morning Star: 1x1

--Warhammer
product = smithing:addProduct(catId, 226, 72, 92, 253, 506)
product:addIngredient(2535, 9) -- Iron Ingot: 9x1
product:addIngredient(2544) -- Large Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1

catId = smithing:addCategory("slashing weapons", "Schnittwaffen")

--Barbarian Axe
product = smithing:addProduct(catId, 2711, 0, 20, 20, 40)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Short Sword
product = smithing:addProduct(catId, 78, 6, 26, 12, 24)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Serinjah Sword
product = smithing:addProduct(catId, 1, 9, 29, 21, 42)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Battleaxe
product = smithing:addProduct(catId, 2946, 15, 35, 36, 72)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Orc Axe
product = smithing:addProduct(catId, 2642, 19, 39, 40, 80)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Sabre
product = smithing:addProduct(catId, 25, 23, 43, 33, 66)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Scimitar
product = smithing:addProduct(catId, 2757, 27, 47, 36, 72)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Broadsword
product = smithing:addProduct(catId, 2658, 31, 51, 39, 78)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Longsword
product = smithing:addProduct(catId, 2701, 39, 59, 60, 120)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Heavy Battleaxe
product = smithing:addProduct(catId, 2629, 63, 83, 105, 210)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Elvensword
product = smithing:addProduct(catId, 2778, 82, 100, 175, 350)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(284) -- Sapphire: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Dwarven Axe
product = smithing:addProduct(catId, 2660, 85, 100, 208, 416)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- Axe Handle: 1x1
product:addIngredient(198) -- Topas: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Snakesword
product = smithing:addProduct(catId, 2788, 89, 100, 189, 378)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(197) -- Amethyst: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Elven rainbowsword
product = smithing:addProduct(catId, 2775, 89, 100, 216, 432)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(46) -- Ruby: 1x1
product:addIngredient(284) -- Sapphire: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Fire Broadsword
product = smithing:addProduct(catId, 2656, 92, 100, 224, 448)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Fire Longsword
product = smithing:addProduct(catId, 206, 94, 100, 252, 504)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Serinjah Sword
product = smithing:addProduct(catId, 2693, 96, 100, 232, 464)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Broadsword
product = smithing:addProduct(catId, 2654, 98, 100, 232, 464)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Longsword
product = smithing:addProduct(catId, 2704, 99, 100, 270, 540)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Dwarven Axe
product = smithing:addProduct(catId, 2662, 99, 100, 300, 600)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(2525) -- Axe Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium Ingot

catId = smithing:addCategory("stabbing weapons", "Stichwaffen")

--Simple Dagger
product = smithing:addProduct(catId, 27, 0, 20, 10, 20)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Dagger
product = smithing:addProduct(catId, 189, 16, 36, 18, 36)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Ornate Dagger
product = smithing:addProduct(catId, 190, 32, 52, 26, 52)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Red Dagger
product = smithing:addProduct(catId, 2740, 80, 100, 125, 250)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(2553) -- Pure Fire: 1x1

--Rapier
product = smithing:addProduct(catId, 2675, 88, 100, 162, 324)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(104) -- Silver Ingot

--Malachin Dagger
product = smithing:addProduct(catId, 91, 93, 100, 196, 392)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2571) -- Merinium: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

--Red Fire Dagger
product = smithing:addProduct(catId, 2742, 97, 100, 232, 464)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Dagger
product = smithing:addProduct(catId, 2671, 99, 100, 300, 600)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium: 1x1

catId = smithing:addCategory("two-hand weapons", "Zweihandwaffen")

--Executioner's Axe
product = smithing:addProduct(catId, 2723, 0, 20, 20, 40)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2573) -- Long Staff Handle: 1x1

--Longaxe
product = smithing:addProduct(catId, 88, 20, 40, 40, 80)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2544) -- Large Handle: 1x1

--Halberd
product = smithing:addProduct(catId, 77, 30, 50, 60, 120)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2573) -- Long Staff Handle: 1x1

--Bastard sword
product = smithing:addProduct(catId, 204, 40, 60, 75, 150)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Waraxe
product = smithing:addProduct(catId, 383, 50, 70, 85, 170)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Two-Handed Sword
product = smithing:addProduct(catId, 2731, 60, 80, 120, 240)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Large Waraxe
product = smithing:addProduct(catId, 188, 70, 90, 132, 264)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Double Axe
product = smithing:addProduct(catId, 205, 80, 100, 200, 400)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(2571) -- Merinium: 1x1

--Firewaraxe
product = smithing:addProduct(catId, 2627, 93, 100, 280, 560)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- Axe Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2571) -- Merinium: 1x1

--Fireaxe
product = smithing:addProduct(catId, 2640, 97, 100, 348, 696)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- Axe Handle: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2571) -- Merinium: 1x1

--Magical Waraxe
product = smithing:addProduct(catId, 2626, 99, 100, 420, 840)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2571) -- Merinium: 1x1

catId = smithing:addCategory("throwing weapons", "Wurfwaffen")

--Throwing Star
product = smithing:addProduct(catId, 294, 10, 30, 7, 14, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Throwing Axe
product = smithing:addProduct(catId, 2645, 20, 40, 10, 20, 5)
product:addIngredient(2535) -- Iron Ingot: 1x1

end;]]

--For unique item system, necessary
--[[if isTestserver() then
	catId = smithing:addCategory("Rare Items", "Rare Items")

	product = smithing:addProduct(catId, 189, 0, 40, 1, 1, 1,{RareWeapon="1",nameEn="Dagger of Whatever",nameDe="Hilfe der Kampf",descriptionEn="This is a dagger",descriptionDe="Stuff",rareness="2"})
	product:addIngredient(189,1,{RareWeapon="-1",nameEn="Broken Artifact"});
end]]
