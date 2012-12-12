require("item.base.crafts")

module("content.craft.smithing", package.seeall)

smithing = item.base.crafts.Craft:new{
                      craftEN = "blacksmithing",
                      craftDE = "Schmieden",
                      handTool = 23,
                      leadSkill = Character.smithing,
                      defaultFoodConsumption = 300,
                      sfx = 8,
                      sfxDuration = 15,
                    }

smithing:addTool(172); -- anvil
smithing:addActiveTool(172, 13); -- anvil with glowing metal

local catId = smithing:addCategory("tools", "Werkzeuge")
		
--Pins
local product = smithing:addProduct(catId, 2738, 0, 20, 50, 100, 5) -- testing crafting times
product:addIngredient(2535) -- Iron Ingot: 1x1

--Hammer
product = smithing:addProduct(catId, 23, 0, 20, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Pickaxe
product = smithing:addProduct(catId, 2763, 0, 20, 5, 10)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2544) -- Large handle: 1x1

--Chisel
product = smithing:addProduct(catId, 737, 2, 22, 6, 12)
product:addIngredient(2535, 2) -- iron Ingot: 2x1

--Crucible-Princers
product = smithing:addProduct(catId, 2751, 4, 24, 6, 12)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Tongs
product = smithing:addProduct(catId, 2140, 6, 26, 7, 14)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Needle
product = smithing:addProduct(catId, 47, 8, 28, 7, 14)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Scissors
product = smithing:addProduct(catId, 6, 10, 30, 8, 16)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Finesmithing
product = smithing:addProduct(catId, 122, 12, 32, 8, 16)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2541) -- Hammer Handle: 1x1

--Sickle
product = smithing:addProduct(catId, 126, 14, 34, 8, 16)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1

--Scyte
product = smithing:addProduct(catId, 271, 16, 36, 9, 18)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2566) -- Scythe Handle: 1x1

--Saw
product = smithing:addProduct(catId, 9, 18, 38, 9, 18)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2561) -- Saw Handle: 1x1

--Hatchet
product = smithing:addProduct(catId, 74, 20, 40, 10, 20)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Shovel
product = smithing:addProduct(catId, 24, 22, 42, 10, 20)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2567) -- Shovel Handle: 1x1

--Razor
product = smithing:addProduct(catId, 2746, 24, 44, 11, 22)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2570) -- Sickle Handle: 1x1

catId = smithing:addCategory("helmets", "Helme")

--Horned Helm
product = smithing:addProduct(catId, 7, 13, 33, 8, 16)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Orc Helmet
product = smithing:addProduct(catId, 16, 26, 46, 11, 22)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1

--Serinjah Helm
product = smithing:addProduct(catId, 2444, 39, 59, 15, 30)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Storm cap
product = smithing:addProduct(catId, 2441, 52, 72, 18, 36)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176, 2) -- Grey Cloth: 2x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Chain helmet
product = smithing:addProduct(catId, 324, 0, 20, 5, 10)
product:addIngredient(2535, 4) -- iron Ingot: 4x1

--Gynkese Merc Helmet
product = smithing:addProduct(catId, 2302, 12, 32, 8, 16)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1

--Salkmaerian Paladin Helm
product = smithing:addProduct(catId, 2291, 25, 45, 11, 22)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Albarian Soldier's Helm
product = smithing:addProduct(catId, 2287, 38, 58, 14, 28)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Flame Helmet
product = smithing:addProduct(catId, 2286, 51, 71, 18, 36)
product:addIngredient(2535, 8) -- Iron Ingot: 8x1
product:addIngredient(176) -- Grey Cloth: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Round Steel Helmets
product = smithing:addProduct(catId, 2290, 0, 20, 5, 10)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Steel Cap
product = smithing:addProduct(catId, 202, 11, 31, 8, 16)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1

--Steel Hat
product = smithing:addProduct(catId, 187, 21, 41, 10, 20)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Pot Helmet
product = smithing:addProduct(catId, 94, 31, 51, 13, 26)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Visored Helm
product = smithing:addProduct(catId, 184, 41, 61, 15, 30)
product:addIngredient(2535, 8) -- Iron Ingot: 8x1
product:addIngredient(176) -- Grey Cloth: 1x1

--Black Visored Helm
product = smithing:addProduct(catId, 185, 51, 71, 18, 36)
product:addIngredient(2535, 9) -- Iron Ingot: 9x1
product:addIngredient(176) -- Grey Cloth: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

catId = smithing:addCategory("armour", "Rüstungen")

--Light Blue Breastplate
product = smithing:addProduct(catId, 2407, 72, 92, 23, 46)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Light Mercenary Armour
product = smithing:addProduct(catId, 2359, 82, 102, 25, 50)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Light Elven Armour
product = smithing:addProduct(catId, 2399, 90, 110, 27, 54)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2554) -- Pure Water

--Chain Shirt
product = smithing:addProduct(catId, 101, 33, 53, 13, 26)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1

--Dwarven State armour
product = smithing:addProduct(catId, 2390, 43, 63, 16, 32)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176, 2) -- Grey Cloth: 2x1

--Elven Silversteel
product = smithing:addProduct(catId, 2403, 53, 73, 18, 36)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Lizard Armour
product = smithing:addProduct(catId, 696, 63, 83, 21, 42)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Salkmaerian Armour
product = smithing:addProduct(catId, 2389, 73, 93, 23, 46)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Salkmaerian Officers Armour
product = smithing:addProduct(catId, 2365, 83, 103, 26, 52)
product:addIngredient(2535, 17) -- Iron Ingot: 17x1
product:addIngredient(176, 6) -- Grey Cloth: 6x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Albarian Noble Armour
product = smithing:addProduct(catId, 2367, 90, 110, 27, 54)
product:addIngredient(2535, 20) -- Iron Ingot: 20x1
product:addIngredient(176, 7) -- Grey Cloth: 7x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(2547, 5) -- Leather: 5x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(198, 3) -- Topas: 3x1

--Plate Armour
product = smithing:addProduct(catId, 4, 31, 51, 13, 26)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(2547) -- Leather: 1x1

--Steel Plate
product = smithing:addProduct(catId, 2364, 41, 61, 15, 30)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(176, 6) -- Grey Cloth: 6x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Albarian Steel Plate
product = smithing:addProduct(catId, 2369, 51, 71, 18, 36)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 7) -- Grey Cloth: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Dwarvenplate
product = smithing:addProduct(catId, 2395, 61, 81, 20, 40)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 8) -- Grey Cloth: 8x1
product:addIngredient(2547, 4) -- Leather: 4x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Nightplate
product = smithing:addProduct(catId, 2363, 71, 91, 23, 46)
product:addIngredient(2535, 17) -- Iron Ingot: 17x1
product:addIngredient(176, 9) -- Grey Cloth: 9x1
product:addIngredient(2547, 5) -- Leather: 5x1
product:addIngredient(2550, 4) -- Copper Ingot: 4x1

--Shadowplate
product = smithing:addProduct(catId, 2357, 81, 101, 25, 50)
product:addIngredient(2535, 20) -- Iron Ingot: 20x1
product:addIngredient(176, 10) -- Grey Cloth: 10x1
product:addIngredient(2547, 6) -- Leather: 6x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(283, 5) -- Obsidian: 5x1

--Heavy Plate
product = smithing:addProduct(catId, 2393, 90, 110, 27, 54)
product:addIngredient(2535, 25) -- Iron Ingot: 25x1
product:addIngredient(176, 10) -- Grey Cloth: 10x1
product:addIngredient(2547, 7) -- Leather: 7x1
product:addIngredient(2550, 7) -- Copper Ingot: 7x1
product:addIngredient(2571) -- Merinium Ingot

--Lor-Angur Guardians
product = smithing:addProduct(catId, 2360, 50, 70, 17, 34)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1
product:addIngredient(236) -- Gold: 1x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(284, 3) -- Sapphire: 3x1

--Magical Elven Armour
product = smithing:addProduct(catId, 2400, 70, 90, 22, 44)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(176, 7) -- Grey Cloth: 7x1
product:addIngredient(236, 3) -- Gold: 3x1
product:addIngredient(2550, 5) -- Copper Ingot: 5x1
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(198, 3) -- Topas: 3x1

catId = smithing:addCategory("gloves", "Handschuhe")

--Steel Gloves
product = smithing:addProduct(catId, 325, 20, 40, 10, 20)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Salkmaerian steel gloves
product = smithing:addProduct(catId, 528, 30, 50, 12, 24)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1

--Dwarven Metal Gloves
product = smithing:addProduct(catId, 529, 40, 60, 15, 30)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1

--Albarian Steel Gloves
product = smithing:addProduct(catId, 530, 50, 70, 17, 34)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2550, 2) -- Copper: 2x1

--Knight Gloves
product = smithing:addProduct(catId, 531, 60, 80, 20, 40)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2550, 3) -- Copper: 3x1

catId = smithing:addCategory("pants", "Hosen")

--Short Chain Pants
product = smithing:addProduct(catId, 2112, 57, 77, 19, 38)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1

--Chain Pants
product = smithing:addProduct(catId, 2111, 70, 90, 22, 44)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1

--Short Iron Greaves
product = smithing:addProduct(catId, 2117, 30, 50, 12, 24)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1

--Steel Greaves
product = smithing:addProduct(catId, 2172, 50, 70, 17, 34)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Iron Greaves
product = smithing:addProduct(catId, 2116, 70, 90, 22, 44)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(176, 5) -- Grey Cloth: 5x1

catId = smithing:addCategory("boots", "Schuhe")

--Steel Boots
product = smithing:addProduct(catId, 326, 40, 60, 15, 30)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1

--Salkmaerian Steel Boots
product = smithing:addProduct(catId, 699, 50, 70, 17, 34)
product:addIngredient(2535, 10) -- Iron Ingot: 10x1
product:addIngredient(2550) -- Copper: 1x1

--Albarian Steel Boots
product = smithing:addProduct(catId, 771, 60, 80, 20, 40)
product:addIngredient(2535, 13) -- Iron Ingot: 13x1
product:addIngredient(2550, 2) -- Copper: 2x1

--Knight Boots
product = smithing:addProduct(catId, 770, 70, 90, 22, 44)
product:addIngredient(2535, 15) -- Iron Ingot: 15x1
product:addIngredient(2550, 3) -- Copper: 3x1
product:addIngredient(2547, 2) -- Leather: 2x1

catId = smithing:addCategory("maces", "Morgensterne")

--Mace
product = smithing:addProduct(catId, 230, 18, 38, 9, 18)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2548) -- Mace Handle: 1x1

--Battle Flail
product = smithing:addProduct(catId, 231, 36, 56, 14, 28)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2549) -- Morning Star: 1x1

--War Flail
product = smithing:addProduct(catId, 2737, 48, 68, 17, 34)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(2549) -- Morning Star: 1x1

--Warhammer
product = smithing:addProduct(catId, 226, 72, 92, 23, 46)
product:addIngredient(2535, 9) -- Iron Ingot: 9x1
product:addIngredient(2544) -- Large Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1

catId = smithing:addCategory("slashing weapons", "Schnittwaffen")

--Barbarian Axe
product = smithing:addProduct(catId, 2711, 0, 20, 5, 10)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Short Sword
product = smithing:addProduct(catId, 78, 6, 26, 6, 12)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Serinjah Sword
product = smithing:addProduct(catId, 1, 9, 29, 7, 14)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Battleaxe
product = smithing:addProduct(catId, 2946, 15, 35, 9, 18)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Orc Axe
product = smithing:addProduct(catId, 2642, 19, 39, 10, 20)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Sabre
product = smithing:addProduct(catId, 25, 23, 43, 11, 22)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Scimitar
product = smithing:addProduct(catId, 2757, 27, 47, 12, 24)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Broadsword
product = smithing:addProduct(catId, 2658, 31, 51, 13, 26)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Longsword
product = smithing:addProduct(catId, 2701, 39, 59, 15, 30)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Gilded Longsword
product = smithing:addProduct(catId, 84, 43, 63, 16, 32)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Coppered Longsword
product = smithing:addProduct(catId, 85, 47, 67, 17, 34)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Silvered Longsword
product = smithing:addProduct(catId, 98, 51, 71, 18, 36)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(104) -- Silver Ingot: 1x1

--Merinium Plated Longsword
product = smithing:addProduct(catId, 123, 55, 75, 19, 38)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

--Heavy Battleaxe
product = smithing:addProduct(catId, 2629, 63, 83, 21, 42)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Gilded Battleaxe
product = smithing:addProduct(catId, 124, 67, 87, 22, 44)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Coppered Battleaxe
product = smithing:addProduct(catId, 192, 71, 91, 23, 46)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Silvered Battleaxe
product = smithing:addProduct(catId, 229, 75, 95, 24, 48)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(104) -- Silver Ingot: 1x1

--Merinium Plated Battleaxe
product = smithing:addProduct(catId, 296, 79, 99, 25, 50)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

--Elvensword
product = smithing:addProduct(catId, 2778, 82, 102, 25, 50)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Dwarven Axe
product = smithing:addProduct(catId, 2660, 85, 105, 26, 52)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(198) -- Topas: 1x1

--Snakesword
product = smithing:addProduct(catId, 2788, 89, 109, 27, 54)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- SwordHandle: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Elven rainbowsword
product = smithing:addProduct(catId, 2775, 89, 109, 27, 54)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(46) -- Ruby: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Fire Broadsword
product = smithing:addProduct(catId, 2656, 92, 112, 28, 56)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Fire Longsword
product = smithing:addProduct(catId, 206, 94, 114, 28, 56)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Magical Serinjah Sword
product = smithing:addProduct(catId, 2693, 96, 116, 29, 58)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

--Magical Broadsword
product = smithing:addProduct(catId, 2654, 98, 118, 29, 58)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

--Magical Longsword
product = smithing:addProduct(catId, 2704, 99, 119, 30, 60)
product:addIngredient(2535, 6) -- Iron Ingot: 6x1
product:addIngredient(2584) -- Sword Handle: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

--Magical Dwarven Axe
product = smithing:addProduct(catId, 2662, 100, 120, 30, 60)
product:addIngredient(2535, 7) -- Iron Ingot: 7x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

catId = smithing:addCategory("stabbing weapons", "Stichwaffen")

--Simple Dagger
product = smithing:addProduct(catId, 27, 0, 20, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Dagger
product = smithing:addProduct(catId, 189, 16, 36, 9, 18)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Ornate Dagger
product = smithing:addProduct(catId, 190, 32, 52, 13, 26)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Gilded Dagger
product = smithing:addProduct(catId, 297, 40, 60, 15, 30)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Silvered Dagger
product = smithing:addProduct(catId, 389, 48, 68, 17, 34)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(104) -- Silver Ingot: 1x1

--Copped Dagger
product = smithing:addProduct(catId, 398, 56, 76, 19, 38)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1

--Merinium Plated Dagger
product = smithing:addProduct(catId, 444, 64, 84, 21, 42)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

--Red Dagger
product = smithing:addProduct(catId, 2740, 80, 100, 25, 50)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1
product:addIngredient(2530) -- Dagger Handle: 1x1

--Rapier
product = smithing:addProduct(catId, 2675, 88, 108, 27, 54)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Malachin Dagger
product = smithing:addProduct(catId, 91, 93, 113, 28, 56)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2751) -- Merinium: 1x1

--Red Fire Dagger
product = smithing:addProduct(catId, 2742, 97, 117, 29, 58)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Magical Dagger
product = smithing:addProduct(catId, 2671, 100, 120, 30, 60)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2530) -- Dagger Handle: 1x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(2751) -- Merinium: 1x1

catId = smithing:addCategory("two-hand weapons", "Zweihandwaffen")

--Executioner's Axe
product = smithing:addProduct(catId, 2723, 0, 20, 5, 10)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2573) -- Long Staff Handle: 1x1

--Longaxe
product = smithing:addProduct(catId, 88, 20, 40, 10, 20)
product:addIngredient(2535, 3) -- Iron Ingot: 3x1
product:addIngredient(2544) -- Large Handle: 1x1

--Halberd
product = smithing:addProduct(catId, 77, 30, 50, 12, 24)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2573) -- Long Staff Handle: 1x1

--Bastard sword
product = smithing:addProduct(catId, 204, 40, 60, 15, 30)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Waraxe
product = smithing:addProduct(catId, 383, 50, 70, 17, 34)
product:addIngredient(2535, 4) -- Iron Ingot: 4x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Two-Handed Sword
product = smithing:addProduct(catId, 2731, 60, 80, 20, 40)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Large Waraxe
product = smithing:addProduct(catId, 188, 70, 90, 22, 44)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Double Axe
product = smithing:addProduct(catId, 205, 80, 100, 25, 50)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1

--Firewaraxe
product = smithing:addProduct(catId, 2627, 93, 113, 28, 56)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Fireaxe
product = smithing:addProduct(catId, 2640, 97, 117, 29, 58)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Magical Waraxe
product = smithing:addProduct(catId, 2626, 100, 120, 30, 60)
product:addIngredient(2535, 5) -- Iron Ingot: 5x1
product:addIngredient(2525) -- AxeHandle: 1x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(2751) -- Merinium: 1x1

catId = smithing:addCategory("throwing weapons", "Wurfwaffen")

--Throwing Star
product = smithing:addProduct(catId, 294, 10, 30, 7, 14, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Throwing Axe
product = smithing:addProduct(catId, 2645, 20, 40, 10, 20, 5)
product:addIngredient(2535) -- Iron Ingot: 1x1 
