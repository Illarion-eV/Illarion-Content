require("item.base.crafts")

module("content.craft.carving", package.seeall)

carving = item.base.crafts.Craft:new{
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
local catId = carving:addCategory("tools", "Werkzeuge") -- Tools and stuff

--Carving Tools
local product = carving:addProduct(catId, 2752, 0, 20, 10, 20)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2570) -- Sickle Handle: 1x1

--Pins and Cotters
product = carving:addProduct(catId, 2717, 0, 20, 10, 20, 5)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2738, 5) -- Pins: 1x5

--Pipe
product = carving:addProduct(catId, 2744, 4, 24, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Torch
product = carving:addProduct(catId, 391, 8, 28, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Rolling Pin
product = carving:addProduct(catId, 118, 12, 32, 16, 32)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Brick Mould
product = carving:addProduct(catId, 734, 16, 36, 18, 36)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Flail
product = carving:addProduct(catId, 258, 20, 40, 20, 40)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Dyeing Rod
product = carving:addProduct(catId, 2781, 24, 44, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Fishing rod
product = carving:addProduct(catId, 72, 28, 48, 24, 48)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(50) -- Thread: 1x1


catId = carving:addCategory("tool handles", "Werkzeuggriffe") -- Item handles

--Handle
product = carving:addProduct(catId, 2541, 3, 23, 6, 12)
product:addIngredient(56) -- Bough: 1x1

--Sickle Handle
product = carving:addProduct(catId, 2570, 6, 26, 6, 12)
product:addIngredient(56) -- bough: 1x1

--Scythe Handle
product = carving:addProduct(catId, 2566, 9, 29, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Shovel Handle
product = carving:addProduct(catId, 2567, 12, 32, 16, 32)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Saw Handle
product = carving:addProduct(catId, 2561, 15, 35, 18, 36)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Large Handle
product = carving:addProduct(catId, 2544, 18, 38, 9, 18)
product:addIngredient(56) -- Bough: 1x1

catId = carving:addCategory("weapon handles", "Waffengriffe") -- weapon handles

--Long Staff Handle
product = carving:addProduct(catId, 2573, 10, 50, 14, 28)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Axe Handle
product = carving:addProduct(catId, 2525, 23, 63, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Dagger Handle
product = carving:addProduct(catId, 2530, 26, 66, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Sword Handle
product = carving:addProduct(catId, 2584, 29, 69, 24, 48)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Mace Handle
product = carving:addProduct(catId, 2548, 32, 72, 26, 52)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Large Ornate handle
product = carving:addProduct(catId, 2527, 35, 75, 28, 56)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Morning Star Handle
product = carving:addProduct(catId, 2549, 40, 80, 30, 60)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

catId = carving:addCategory("weapons", "Waffen") --weapons

--Wooden Sword
product = carving:addProduct(catId, 445, 0, 20, 15, 30)
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Club
product = carving:addProduct(catId, 2664, 6, 26, 18, 36)
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2548) -- Mace Handle: 1x1

--Skull Staff
product = carving:addProduct(catId, 39, 12, 32, 32, 64)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Cleric's Staff
product = carving:addProduct(catId, 40, 24, 44, 44, 88)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Simple Mage Staff
product = carving:addProduct(catId, 57, 30, 50, 48, 96)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Mage's Staff
product = carving:addProduct(catId, 76, 42, 62, 75, 150)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Elven Mage's Staff
product = carving:addProduct(catId, 209, 54, 74, 90, 180)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Ornate Mage's Staff
product = carving:addProduct(catId, 208, 60, 80, 100, 200)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Battle Staff
product = carving:addProduct(catId, 207, 66, 86, 126, 252)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

catId = carving:addCategory("ammunition", "Munition") --ammunition and throwing stuff

--Throwing Spear
product = carving:addProduct(catId, 293, 30, 50, 24, 48, 10)
product:addIngredient(56, 2) -- Bough: 2x1

--Arrow
product = carving:addProduct(catId, 64, 10, 30, 7, 14, 10)
product:addIngredient(56) -- Bough: 1x1

--Bolt
product = carving:addProduct(catId, 237, 30, 50, 12, 24, 10)
product:addIngredient(56) -- Bough: 1x1

--Wind Arrows
product = carving:addProduct(catId, 322, 90, 110, 54, 108, 10)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

catId = carving:addCategory("wands", "Zauberstäbe") --Wands

--Wand
product = carving:addProduct(catId, 323, 40, 60, 75, 150)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Wand of Earth
product = carving:addProduct(catId, 2782, 60, 80, 180, 360)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(283, 3) -- Obsidian: 3x1
product:addIngredient(2552) -- Pure Earth: 1x1

--Wand of Fire
product = carving:addProduct(catId, 2783, 70, 90, 220, 440)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 4) -- Cherry Wooden Boards: 4x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Wand of Water
product = carving:addProduct(catId, 2784, 80, 100, 275, 550)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(2554) -- Pure Water: 1x1

--Wand of Wind
product = carving:addProduct(catId, 2785, 90, 110, 324, 648)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 6) -- Cherry Wooden Boards: 6x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(285, 3) -- Diamond: 3x1
product:addIngredient(2551) -- Pure Air: 1x1 
