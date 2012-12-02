require("item.base.crafts")

module("content.craft.goldgoldsmithing", package.seeall)

goldsmithing = item.base.crafts.Craft:new{
                      craftEN = "goldgoldsmithing",
                      craftDE = "Goldschmieden",
                      leadSkill = Character.goldsmithing,
                      defaultFoodConsumption = 300,
                      sfx = 8,
                      sfxDuration = 15,
                    };
                    
goldsmithing:addTool(172) -- anvil
goldsmithing:addActiveTool(172, 13) -- anvil with glowing metal

--------------------------------------------------------------------------------------------
local catId = goldsmithing:addCategory("miscellaneous", "Verschiedenes") -- Random Stuff

--Goblet
local product = goldsmithing:addProduct(catId, 1858, 0, 40, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Oil Lamp
product = goldsmithing:addProduct(catId, 92, 9, 49, 7, 14)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Candlestick
product = goldsmithing:addProduct(catId, 399, 18, 58, 9, 18)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Lantern
product = goldsmithing:addProduct(catId, 393, 27, 67, 12, 24)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(41) -- Glass Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 1001, 36, 76, 14, 28)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Copper Goblet
product = goldsmithing:addProduct(catId, 1840, 45, 85, 16, 32)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Gold Goblet
product = goldsmithing:addProduct(catId, 224, 54, 94, 18, 36)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 2031, 63, 103, 21, 42)
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Cutlery
product = goldsmithing:addProduct(catId, 2647, 72, 112, 23, 46)
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Mirror
product = goldsmithing:addProduct(catId, 336, 81, 101, 25, 50)
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(41) -- Glass Ingot: 1x1

catId = goldsmithing:addCategory("amulets", "Amulette") -- amulets
--Amulets
product = goldsmithing:addProduct(catId, 222, 20, 40, 10, 20)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Amethyst Amulet
product = goldsmithing:addProduct(catId, 79, 30, 50, 12, 24)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Amulet
product = goldsmithing:addProduct(catId, 67, 40, 60, 15, 30)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Amulet
product = goldsmithing:addProduct(catId, 82, 50, 70, 17, 34)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Amulet
product = goldsmithing:addProduct(catId, 71, 60, 80, 20, 40)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Amulet
product = goldsmithing:addProduct(catId, 62, 70, 90, 22, 44)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Amulet
product = goldsmithing:addProduct(catId, 83, 80, 100, 25, 50)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(198) -- Topas: 1x1

--Charm of the Icebird
product = goldsmithing:addProduct(catId, 334, 90, 110, 27, 54)
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(285, 2) -- Diamond: 2x1
product:addIngredient(2571) -- Mernium Ingot: 1x1

catId = goldsmithing:addCategory("crowns", "Kronen") --Crowns

--Diadem
product = goldsmithing:addProduct(catId, 465, 50, 70, 17, 34)
product:addIngredient(2250) -- Copper Ingot: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(284) -- Sapphire: 1x1

--Crown
product = goldsmithing:addProduct(catId, 225, 70, 90, 22, 44)
product:addIngredient(2250, 3) -- Copper Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(284) -- Sapphire: 1x1
product:addIngredient(198) -- Topas: 1x1
product:addIngredient(285, 2) -- Diamond: 2x1

catId = goldsmithing:addCategory("rings", "Ringe") --Rings

--Golden Ring
product = goldsmithing:addProduct(catId, 235, 5, 25, 6, 12)
product:addIngredient(2250) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Amethyst Ring
product = goldsmithing:addProduct(catId, 277, 15, 35, 9, 18)
product:addIngredient(2250) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Ring
product = goldsmithing:addProduct(catId, 68, 25, 45, 11, 22)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Ring
product = goldsmithing:addProduct(catId, 278, 35, 55, 14, 28)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Ring
product = goldsmithing:addProduct(catId, 279, 45, 65, 16, 32)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Ring
product = goldsmithing:addProduct(catId, 281, 55, 75, 19, 38)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Ring
product = goldsmithing:addProduct(catId, 282, 65, 85, 21, 42)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(198) -- Topas: 1x1

--Diamond Ring
product = goldsmithing:addProduct(catId, 280, 75, 95, 24, 48)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(285) -- Diamond: 1x1

--Ring of the Archmage
product = goldsmithing:addProduct(catId, 2559, 90, 110, 27, 54)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(285) -- Diamond: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2554) -- Pure Water: 1x1 
