require("item.base.crafts")

module("content.craft.goldsmithing", package.seeall)

goldsmithing = item.base.crafts.Craft:new{
                      craftEN = "goldsmithing",
                      craftDE = "Goldschmieden",
                      handTool = 122,
                      leadSkill = Character.goldsmithing,
                      defaultFoodConsumption = 300,
                      sfx = 8,
                      sfxDuration = 15,
                    };
                    
goldsmithing:addTool(172) -- anvil
goldsmithing:addActiveTool(172, 13) -- anvil with glowing metal

--------------------------------------------------------------------------------------------

--if isTestserver() then
	local catId = goldsmithing:addCategory("miscellaneous", "Verschiedenes") -- Random Stuff

--Goblet
local product = goldsmithing:addProduct(catId, 1858, 0, 20, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Oil Lamp
product = goldsmithing:addProduct(catId, 92, 10, 30, 14, 28)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Glass blow pipe
product = goldsmithing:addProduct(catId, 311, 15, 35, 14, 28)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Candlestick
product = goldsmithing:addProduct(catId, 399, 20, 40, 18, 36)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 1001, 25, 45, 28, 56)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Copper Goblet
product = goldsmithing:addProduct(catId, 1840, 30, 50, 32, 64)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Gold Goblet
product = goldsmithing:addProduct(catId, 224, 30, 50, 54, 108)
product:addIngredient(104, 2) -- Silver Ingot: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 2031, 35, 55, 63, 126)
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Cutlery
product = goldsmithing:addProduct(catId, 2647, 40, 60, 69, 138)
product:addIngredient(104, 3) -- Silver Ingot: 3x1

catId = goldsmithing:addCategory("amulets", "Amulette") -- amulets

--Amulets
product = goldsmithing:addProduct(catId, 222, 20, 40, 20, 40)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Amethyst Amulet
product = goldsmithing:addProduct(catId, 79, 30, 50, 36, 72)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Amulet
product = goldsmithing:addProduct(catId, 67, 40, 60, 45, 90)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Amulet
product = goldsmithing:addProduct(catId, 82, 50, 70, 51, 102)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Amulet
product = goldsmithing:addProduct(catId, 71, 60, 80, 60, 120)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Amulet
product = goldsmithing:addProduct(catId, 62, 70, 90, 66, 132)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Amulet
product = goldsmithing:addProduct(catId, 83, 75, 95, 75, 150)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236,2) -- Gold Ingot: 1x2
product:addIngredient(198) -- Topas: 1x1

--Charm of the Icebird
product = goldsmithing:addProduct(catId, 334, 85, 100, 135, 270)
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(285, 2) -- Diamond: 2x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

catId = goldsmithing:addCategory("crowns", "Kronen") --Crowns

--Diadem
product = goldsmithing:addProduct(catId, 465, 50, 70, 68, 136)
product:addIngredient(104) -- Silver Ingot: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(284) -- Sapphire: 1x1

--Crown
product = goldsmithing:addProduct(catId, 225, 70, 90, 220, 440)
product:addIngredient(104, 3) -- Silver Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(284) -- Sapphire: 1x1
product:addIngredient(198) -- Topas: 1x1
product:addIngredient(285) -- Diamond: 1x1
product:addIngredient(2571) -- Merinium Ingot

catId = goldsmithing:addCategory("rings", "Ringe") --Rings

--Golden Ring
product = goldsmithing:addProduct(catId, 235, 5, 25, 12, 24)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Amethyst Ring
product = goldsmithing:addProduct(catId, 277, 15, 35, 27, 54)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Ring
product = goldsmithing:addProduct(catId, 68, 25, 45, 33, 66)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Ring
product = goldsmithing:addProduct(catId, 278, 35, 55, 42, 84)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Ring
product = goldsmithing:addProduct(catId, 279, 45, 65, 48, 96)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Ring
product = goldsmithing:addProduct(catId, 281, 55, 75, 57, 114)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Ring
product = goldsmithing:addProduct(catId, 282, 65, 85, 63, 126)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(198) -- Topas: 1x1

--Diamond Ring
product = goldsmithing:addProduct(catId, 280, 75, 95, 72, 144)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(285) -- Diamond: 1x1

--Ring of the Archmage
product = goldsmithing:addProduct(catId, 2559, 90, 100, 243, 486)
product:addIngredient(104, 2) -- Silver Ingot: 2x1
product:addIngredient(236, 3) -- Gold Ingot: 2x1
product:addIngredient(285) -- Diamond: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2554) -- Pure Water: 1x1 
product:addIngredient(2571) -- Merinium Ingot

catId = goldsmithing:addCategory("weapons", "Waffen")

-- merinium-plated longsword  
product = goldsmithing:addProduct(catId, 123, 99, 100, 178, 357, 1);
product:addIngredient(2585); -- Big Sword Handle

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(2551); -- Pure Air

product:addIngredient(452); -- Diamond Powder

product:addIngredient(451); -- Topaz Powder

product:addIngredient(46); -- Ruby

product:addIngredient(446); -- Sapphire

-- merinium-plated dagger     
product = goldsmithing:addProduct(catId, 444, 91, 100, 166, 333, 1);
product:addIngredient(2530); -- Dagger Handle

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(451); -- Topaz Powder

product:addIngredient(2552); -- Pure Earth

product:addIngredient(104); -- Silver Ingot

-- merinium-plated battle axe
product = goldsmithing:addProduct(catId, 296, 94, 100, 171, 342, 1);
product:addIngredient(2585); -- Big Sword Handle

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(2554); -- Pure Water

product:addIngredient(452); -- Diamond Powder

product:addIngredient(104); -- Silver Ingot

-- gilded longsword           
product = goldsmithing:addProduct(catId, 84, 84, 100, 156, 312, 1);
product:addIngredient(2585); -- Big Sword Handle

product:addIngredient(236, 4); -- Gold Ingot

product:addIngredient(446); -- Sapphire Powder

product:addIngredient(45); -- Emerald

-- gilded dagger              
product = goldsmithing:addProduct(catId, 297, 74, 94, 141, 282, 1);
product:addIngredient(2530); -- Dagger Handle

product:addIngredient(236, 4); -- Gold Ingot

-- coppered longsword         
product = goldsmithing:addProduct(catId, 85, 50, 70, 105, 210, 1);
product:addIngredient(2584); -- Sword Handle

product:addIngredient(2550, 6); -- Copper

--silvered dagger
product = goldsmithing:addProduct(catId, 389, 63, 83, 124, 249, 1);
product:addIngredient(2530); -- Dagger Handle

product:addIngredient(104, 5); -- Silver Ingot

-- silvered longsword         
product = goldsmithing:addProduct(catId, 98, 66, 86, 129, 258, 1);
product:addIngredient(2585); -- Big Sword Handle

product:addIngredient(104, 5); -- Silver Ingot

-- gilded battle axe          
product = goldsmithing:addProduct(catId, 124, 68, 88, 132, 264, 1);
product:addIngredient(2525); -- Axe Handle

product:addIngredient(236, 3); -- Gold Ingot

-- silvered battle axe        
product = goldsmithing:addProduct(catId, 229, 55, 75, 112, 225, 1);
product:addIngredient(2525); -- Axe Handle

product:addIngredient(104, 4); -- Silver Ingot

-- coppered battle axe        
product = goldsmithing:addProduct(catId, 192, 45, 65, 97, 195, 1);
product:addIngredient(2525); -- Axe Handle

product:addIngredient(2550, 5); -- Copper Ingot

--coppered dagger
product = goldsmithing:addProduct(catId, 398, 35, 55, 82, 165, 1);
product:addIngredient(2530); -- Dagger Handle

product:addIngredient(2550, 4); -- Copper Ingot



--[[else
	local catId = goldsmithing:addCategory("miscellaneous", "Verschiedenes") -- Random Stuff

--Goblet
local product = goldsmithing:addProduct(catId, 1858, 0, 20, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1

--Oil Lamp
product = goldsmithing:addProduct(catId, 92, 10, 30, 14, 28)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Glass blow pipe
product = goldsmithing:addProduct(catId, 311, 15, 35, 14, 28)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Candlestick
product = goldsmithing:addProduct(catId, 399, 20, 40, 18, 36)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 1001, 25, 45, 28, 56)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Copper Goblet
product = goldsmithing:addProduct(catId, 1840, 30, 50, 32, 64)
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Gold Goblet
product = goldsmithing:addProduct(catId, 224, 30, 50, 54, 108)
product:addIngredient(104, 2) -- Silver Ingot: 2x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Plate
product = goldsmithing:addProduct(catId, 2031, 35, 55, 63, 126)
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Cutlery
product = goldsmithing:addProduct(catId, 2647, 40, 60, 69, 138)
product:addIngredient(104, 3) -- Silver Ingot: 3x1

catId = goldsmithing:addCategory("amulets", "Amulette") -- amulets

--Amulets
product = goldsmithing:addProduct(catId, 222, 20, 40, 20, 40)
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

--Amethyst Amulet
product = goldsmithing:addProduct(catId, 79, 30, 50, 36, 72)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Amulet
product = goldsmithing:addProduct(catId, 67, 40, 60, 45, 90)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Amulet
product = goldsmithing:addProduct(catId, 82, 50, 70, 51, 102)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Amulet
product = goldsmithing:addProduct(catId, 71, 60, 80, 60, 120)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Amulet
product = goldsmithing:addProduct(catId, 62, 70, 90, 66, 132)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Amulet
product = goldsmithing:addProduct(catId, 83, 75, 95, 75, 150)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(198) -- Topas: 1x1

--Charm of the Icebird
product = goldsmithing:addProduct(catId, 334, 85, 100, 135, 270)
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(285, 2) -- Diamond: 2x1
product:addIngredient(2571) -- Merinium Ingot: 1x1

catId = goldsmithing:addCategory("crowns", "Kronen") --Crowns

--Diadem
product = goldsmithing:addProduct(catId, 465, 50, 70, 68, 136)
product:addIngredient(104) -- Silver Ingot: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1
product:addIngredient(284) -- Sapphire: 1x1

--Crown
product = goldsmithing:addProduct(catId, 225, 70, 90, 220, 440)
product:addIngredient(104, 3) -- Silver Ingot: 3x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1
product:addIngredient(284) -- Sapphire: 1x1
product:addIngredient(198) -- Topas: 1x1
product:addIngredient(285) -- Diamond: 1x1
product:addIngredient(2571) -- Merinium Ingot

catId = goldsmithing:addCategory("rings", "Ringe") --Rings

--Golden Ring
product = goldsmithing:addProduct(catId, 235, 5, 25, 12, 24)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1

--Amethyst Ring
product = goldsmithing:addProduct(catId, 277, 15, 35, 27, 54)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(197) -- Amethyst: 1x1

--Ruby Ring
product = goldsmithing:addProduct(catId, 68, 25, 45, 33, 66)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Obsidian Ring
product = goldsmithing:addProduct(catId, 278, 35, 55, 42, 84)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(283) -- Obsidian: 1x1

--Sapphire Ring
product = goldsmithing:addProduct(catId, 279, 45, 65, 48, 96)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(284) -- Sapphire: 1x1

--Emerald Ring
product = goldsmithing:addProduct(catId, 281, 55, 75, 57, 114)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(45) -- Emerald: 1x1

--Topas Ring
product = goldsmithing:addProduct(catId, 282, 65, 85, 63, 126)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(198) -- Topas: 1x1

--Diamond Ring
product = goldsmithing:addProduct(catId, 280, 75, 95, 72, 144)
product:addIngredient(2550) -- Copper Ingot: 1x1
product:addIngredient(236) -- Gold Ingot: 1x1
product:addIngredient(285) -- Diamond: 1x1

--Ring of the Archmage
product = goldsmithing:addProduct(catId, 2559, 90, 100, 243, 486)
product:addIngredient(104, 2) -- Silver Ingot: 2x1
product:addIngredient(236, 3) -- Gold Ingot: 2x1
product:addIngredient(285) -- Diamond: 1x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(2553) -- Pure Fire: 1x1
product:addIngredient(2554) -- Pure Water: 1x1 
product:addIngredient(2571) -- Merinium Ingot

catId = goldsmithing:addCategory("weapons", "Waffen")

--Gilded Longsword
product = goldsmithing:addProduct(catId, 84, 43, 63, 80, 160)
product:addIngredient(2701) -- Longsword: 1x1
product:addIngredient(236, 2) -- Gold Ingot: 2x1

--Coppered Longsword
product = goldsmithing:addProduct(catId, 85, 47, 67, 85, 170)
product:addIngredient(2701) -- Longsword: 1x1
product:addIngredient(2550, 2) -- Copper Ingot: 2x1

--Silvered Longsword
product = goldsmithing:addProduct(catId, 98, 51, 71, 90, 180)
product:addIngredient(2701) -- Longsword: 1x1
product:addIngredient(104, 2) -- Silver Ingot: 2x1

--Merinium Plated Longsword
product = goldsmithing:addProduct(catId, 123, 55, 75, 95, 190)
product:addIngredient(2701) -- Longsword: 1x1
product:addIngredient(2571, 2) -- Merinium Ingot: 2x1

--Gilded Battleaxe
product = goldsmithing:addProduct(catId, 124, 67, 87, 132, 264)
product:addIngredient(2629) -- light battleaxe: 1x1
product:addIngredient(236, 3) -- Gold Ingot: 3x1

--Coppered Battleaxe
product = goldsmithing:addProduct(catId, 192, 71, 91, 138, 276)
product:addIngredient(2629) -- light battleaxe: 1x1
product:addIngredient(2550, 3) -- Copper Ingot: 3x1

--Silvered Battleaxe
product = goldsmithing:addProduct(catId, 229, 75, 95, 144, 288)
product:addIngredient(2629) -- light battleaxe: 1x1
product:addIngredient(104, 3) -- Silver Ingot: 3x1

--Merinium Plated Battleaxe
product = goldsmithing:addProduct(catId, 296, 79, 99, 150, 300)
product:addIngredient(2629) -- light battleaxe: 1x1
product:addIngredient(2571, 3) -- Merinium Ingot: 3x1

--Gilded Dagger
product = goldsmithing:addProduct(catId, 297, 40, 60, 45, 90)
product:addIngredient(190) -- ornate dagger: 1x1
product:addIngredient(236, 1) -- Gold Ingot: 1x1

--Silvered Dagger
product = goldsmithing:addProduct(catId, 389, 48, 68, 51, 102)
product:addIngredient(190) -- ornate dagger: 1x1
product:addIngredient(104, 1) -- Silver Ingot: 1x1

--Coppered Dagger
product = goldsmithing:addProduct(catId, 398, 56, 76, 57, 114)
product:addIngredient(190) -- ornate dagger: 1x1
product:addIngredient(2550, 1) -- Copper Ingot: 1x1

--Merinium Plated Dagger
product = goldsmithing:addProduct(catId, 444, 64, 84, 63, 126)
product:addIngredient(190) -- ornate dagger: 1x1
product:addIngredient(2571, 1) -- Merinium Ingot: 1x1
end;
]]
