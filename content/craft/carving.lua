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
local crafts = require("item.base.crafts")

module("content.craft.carving", package.seeall)

carving = crafts.Craft:new{
              craftEN = "carpentry",
              craftDE = "Schreinern",
              handTool = 2752,
              leadSkill = Character.carpentry,
              defaultFoodConsumption = 200,
              sfx = 14,
              sfxDuration = 17,
            };

carving:addTool(724) -- workbench
carving:addTool(725) -- workbench

--------------------------------------------------------------------------------------------

local catId = carving:addCategory("Tools", "Werkzeuge") -- Tools and stuff

--Fishing rod
local product = carving:addProduct(catId, 72, 28, 48, 24, 48)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(50) -- Thread: 1x1

--Dyeing Rod
product = carving:addProduct(catId, 2781, 24, 44, 11, 22)
product:addIngredient(56,3) -- Bough: 1x3

--Flail
product = carving:addProduct(catId, 258, 20, 40, 20, 40)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Brick Mould
product = carving:addProduct(catId, 734, 16, 36, 18, 36)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Rolling Pin
product = carving:addProduct(catId, 118, 12, 32, 16, 32)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Pipe
product = carving:addProduct(catId, 2744, 4, 24, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Torch
product = carving:addProduct(catId, 391, 8, 28, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Pins and Cotters
product = carving:addProduct(catId, 2717, 0, 20, 10, 20, 5)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2738, 5) -- Pins: 1x5

--Carving Tools
product = carving:addProduct(catId, 2752, 0, 20, 10, 20)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2570) -- Sickle Handle: 1x1


catId = carving:addCategory("Tool handles", "Werkzeuggriffe") -- Item handles

--Saw Handle
product = carving:addProduct(catId, 2561, 15, 35, 18, 36)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Shovel Handle
product = carving:addProduct(catId, 2567, 12, 32, 16, 32)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Scythe Handle
product = carving:addProduct(catId, 2566, 9, 29, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Sickle Handle
product = carving:addProduct(catId, 2570, 6, 26, 6, 12)
product:addIngredient(56) -- bough: 1x1

--Handle
product = carving:addProduct(catId, 2541, 3, 23, 6, 12)
product:addIngredient(56) -- Bough: 1x1


catId = carving:addCategory("Weapon handles", "Waffengriffe") -- weapon handles

--Morning star handle
product = carving:addProduct(catId, 2549, 58, 78, 117, 234, 1);
product:addIngredient(2786); -- Branch
product:addIngredient(2547); -- Leather
product:addIngredient(2535); -- Copper Ingot

--Large staff handle
product = carving:addProduct(catId, 2573, 56, 76, 114, 228, 1);
product:addIngredient(56); -- Bough
product:addIngredient(2547); -- Leather
product:addIngredient(2535); -- Iron Ingot

--large handle
product = carving:addProduct(catId, 2544, 54, 74, 111, 222, 1);
product:addIngredient(2786); -- Branch
product:addIngredient(2547); -- Leather
product:addIngredient(2535); -- Iron Ingot

--Big sword handle
product = carving:addProduct(catId, 2585, 52, 72, 108, 216, 1);
product:addIngredient(56); -- Bough
product:addIngredient(2547); -- Leather
product:addIngredient(2535); -- Iron Ingot

--large ornate handle
product = carving:addProduct(catId, 2527, 51, 71, 106, 213, 1);
product:addIngredient(56); -- Bough
product:addIngredient(2547); -- Leather
product:addIngredient(2535); -- Iron Ingot

--Dagger Handle
product = carving:addProduct(catId, 2530, 20, 40, 40, 80)
product:addIngredient(56) -- Bough: 1x1

--mace handle
product = carving:addProduct(catId, 2548, 6, 26, 39, 78, 1);
product:addIngredient(2786); -- Branch

--Axe handle
product = carving:addProduct(catId, 2525, 4, 24, 36, 72, 1);
product:addIngredient(2786); -- Branch

--Sword handle
product = carving:addProduct(catId, 2584, 2, 22, 33, 66, 1);
product:addIngredient(56); -- Bough

--Staff handle
product = carving:addProduct(catId, 2572, 0, 20, 30, 60, 1);
product:addIngredient(56); -- Bough


catId = carving:addCategory("Weapons", "Waffen") --weapons

--Dwarfen Stormhammer
product = carving:addProduct(catId, 1052, 99, 100, 199, 398, 1);
product:addIngredient(2786,2) -- Bough: 1x1
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1
product:addIngredient(452) -- diamond dust
product:addIngredient(284) -- sapphire
product:addIngredient(2571, 2) -- Merinium Ingot: 2x1
product:addIngredient(2551); -- Pure air 1x1

--Battle Staff
product = carving:addProduct(catId, 207, 99, 100, 175, 340);
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1
product:addIngredient(762) -- gold crak herb
product:addIngredient(2571, 2) -- Merinium Ingot: 2x1
product:addIngredient(3607); -- Pure Spiritx1

-- ornate mage's staff
product = carving:addProduct(catId, 208, 92, 100, 168, 336, 1);
product:addIngredient(2573); -- Large Staff Handle
product:addIngredient(56); -- Bough
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(545, 3); -- Cherry Wood Boards
product:addIngredient(2571); -- Merinium Ingot
product:addIngredient(2551); -- Pure Air

--Dwarfen Hammer
product = carving:addProduct(catId, 1043, 90, 100, 165, 330, 1);
product:addIngredient(2786,2) -- Bough: 2x1
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1
product:addIngredient(46) -- Ruby
product:addIngredient(2571) -- Merinium Ingot
product:addIngredient(2551); -- Pure air 1x1

--spiked mace
product = carving:addProduct(catId, 1041, 84, 100, 156, 312, 1);
product:addIngredient(2549); -- Morning Star Handle
product:addIngredient(546, 2); -- Naldor Wood Boards
product:addIngredient(2535, 3); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot
product:addIngredient(197); -- Amethyst

-- elven mage's staff
product = carving:addProduct(catId, 209, 73, 93, 139, 279, 1);
product:addIngredient(2573); -- Large Staff Handle
product:addIngredient(56); -- Bough
product:addIngredient(546, 2); -- Naldor Wood Boards
product:addIngredient(545, 2); -- Cherry Wood Boards

--battle hammer
product = carving:addProduct(catId, 1044, 66, 86, 129, 258, 1);
product:addIngredient(2549); -- Morning Star Handle
product:addIngredient(546, 1); -- Naldor Wood Boards
product:addIngredient(2786); -- Branch
product:addIngredient(2535, 1); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- warhammer
product = carving:addProduct(catId, 226, 64, 84, 126, 252, 1);
product:addIngredient(2549); -- Morning Star Handle
product:addIngredient(546, 2); -- Naldor Wood Boards
product:addIngredient(2786); -- Branch
product:addIngredient(2535, 3); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- mage's staff
product = carving:addProduct(catId, 76, 56, 76, 114, 228, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(546, 4); -- Naldor Wood Boards
product:addIngredient(545, 1); -- Cherry Wood Boards
product:addIngredient(284); -- Sapphire

-- war flail
product = carving:addProduct(catId, 2737, 52, 72, 108, 216, 1);
product:addIngredient(2548); -- Mace Handle
product:addIngredient(2535, 3); -- Iron Ingot
product:addIngredient(2550, 1); -- Copper Ingot

-- battle flail
product = carving:addProduct(catId, 231, 38, 58, 87, 174, 1);
product:addIngredient(2548); -- Mace Handle
product:addIngredient(56); -- Bough
product:addIngredient(2535, 3); -- Iron Ingot

-- simple mage's staff
product = carving:addProduct(catId, 57, 25, 45, 67, 135, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(46); -- Ruby

-- skull staff
product = carving:addProduct(catId, 39, 18, 38, 57, 114, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(546, 3); -- Naldor Wood Boards
product:addIngredient(2716, 1); -- Deciduous Wood Board

-- mace
product = carving:addProduct(catId, 230, 12, 32, 48, 96, 1);
product:addIngredient(2548); -- Mace Handle
product:addIngredient(56); -- Bough
product:addIngredient(2535, 2); -- Iron Ingot

-- walking stick
product = carving:addProduct(catId, 1090, 9, 28, 45, 85, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(56); -- Bough

-- cleric's staff
product = carving:addProduct(catId, 40, 5, 25, 37, 75, 1);
product:addIngredient(2572); -- Staff Handle
product:addIngredient(546, 3); -- Naldor Wood boards
product:addIngredient(56); -- Bough

-- wooden sword
product = carving:addProduct(catId, 445, 4, 24, 36, 72, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards
product:addIngredient(2786); -- Branch

--wooden dagger
product = carving:addProduct(catId, 1045, 2, 22, 33, 66, 1);
product:addIngredient(2543, 2); -- Conifer Wooden Boards
product:addIngredient(2786); -- Branch

-- Club
product = carving:addProduct(catId, 2664, 0, 20, 30, 60, 1);
product:addIngredient(56); -- Bough

catId = carving:addCategory("Ammunition", "Munition") --ammunition and throwing stuff

--Wind Arrows
product = carving:addProduct(catId, 322, 90, 100, 54, 108, 10)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

-- javelin
product = carving:addProduct(catId, 293, 60, 80, 120, 240, 10);
product:addIngredient(2527, 10); -- Large Ornamented handle
product:addIngredient(2535, 5); -- Iron Ingot

-- throwing axe
product = carving:addProduct(catId, 2645, 50, 70, 105, 210, 20);
product:addIngredient(56, 10); -- Bough
product:addIngredient(2535, 8); -- Iron Ingot

--Bolt
product = carving:addProduct(catId, 237, 30, 50, 12, 24, 10)
product:addIngredient(56) -- Bough: 1x1

--Arrow
product = carving:addProduct(catId, 64, 10, 30, 7, 14, 10)
product:addIngredient(56) -- Bough: 1x1

catId = carving:addCategory("Wands", "Zauberstäbe") --Wands

--Wand of spirit
product = carving:addProduct(catId, 3608, 95, 100, 324, 648)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 6) -- Cherry Wooden Boards: 6x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(198, 3) -- Topaz: 3x1
product:addIngredient(3607) -- Pure Spirit: 1x1

--Wand of air
product = carving:addProduct(catId, 2785, 90, 100, 324, 648)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 6) -- Cherry Wooden Boards: 6x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(285, 3) -- Diamond: 3x1
product:addIngredient(2551) -- Pure Air: 1x1

--Wand of Water
product = carving:addProduct(catId, 2784, 80, 100, 275, 550)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(2554) -- Pure Water: 1x1

--Wand of Fire
product = carving:addProduct(catId, 2783, 70, 90, 220, 440)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 4) -- Cherry Wooden Boards: 4x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Wand of Earth
product = carving:addProduct(catId, 2782, 60, 80, 180, 360)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(283, 3) -- Obsidian: 3x1
product:addIngredient(2552) -- Pure Earth: 1x1

--Wand
product = carving:addProduct(catId, 323, 40, 60, 75, 150)
product:addIngredient(56,2) -- Bough: 1x2
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46,2) -- Ruby: 1x2
