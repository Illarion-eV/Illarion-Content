-- Working with carving tools

-- UPDATE common SET com_script='item.id_2752_carvingtools' WHERE com_itemid IN (2752);

require("item.general.metal")
require("item.base.crafts")

module("item.id_2752_carvingtools", package.seeall)

-- Holzarbeiten mit dem Schnitzmesser
function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;

        carpentery = item.base.crafts.Craft:new{
                              craftEN = "carpentry",
                              craftDE = "Schreinern",
                              leadSkill = Character.carpentry,
                              defaultFoodConsumption = 200,
                              sfx = 14,
                              sfxDuration = 17,
                            };

        carpentery:addTool(724) -- workbench
        carpentery:addTool(725) -- workbench

        --------------------------------------------------------------------------------------------
        local catId = carpentery:addCategory("tools", "Werkzeuge") -- Tools and stuff

       --Carving Tools
local product = carpentery:addProduct(catId, 2752, 0, 20, 5, 10)
product:addIngredient(2535) -- Iron Ingot: 1x1
product:addIngredient(2570) -- Sickle Handle: 1x1

--Pins and Cotters
product = carpentery:addProduct(catId, 2717, 0, 20, 5, 10, 5)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2738, 5) -- Pins: 1x5

--Pipe
product = carpentery:addProduct(catId, 2744, 4, 24, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Torch
product = carpentery:addProduct(catId, 391, 8, 28, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Rolling Pin
product = carpentery:addProduct(catId, 118, 12, 32, 8, 16)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Brick Mould
product = carpentery:addProduct(catId, 734, 16, 36, 9, 18)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Flail
product = carpentery:addProduct(catId, 258, 20, 40, 10, 20)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Dyeing Rod
product = carpentery:addProduct(catId, 2781, 24, 44, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Fishing rod
product = carpentery:addProduct(catId, 72, 28, 48, 12, 24)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(50) -- Thread: 1x1


catId = carpentery:addCategory("tool handles", "Werkzeuggriffe") -- Item handles

--Handle
product = carpentery:addProduct(catId, 2541, 3, 23, 6, 12)
product:addIngredient(56) -- Bough: 1x1

--Sickle Handle
product = carpentery:addProduct(catId, 2570, 6, 26, 6, 12)
product:addIngredient(56) -- bough: 1x1

--Scythe Handle
product = carpentery:addProduct(catId, 2566, 9, 29, 7, 14)
product:addIngredient(56) -- Bough: 1x1

--Shovel Handle
product = carpentery:addProduct(catId, 2567, 12, 32, 8, 16)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Saw Handle
product = carpentery:addProduct(catId, 2561, 15, 35, 9, 18)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Large Handle
product = carpentery:addProduct(catId, 2544, 18, 38, 9, 18)
product:addIngredient(56) -- Bough: 1x1

catId = carpentery:addCategory("weapon handles", "Waffengriffe") -- weapon handles

--Long Staff Handle
product = carpentery:addProduct(catId, 2573, 10, 50, 7, 14)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Axe Handle
product = carpentery:addProduct(catId, 2525, 23, 63, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Dagger Handle
product = carpentery:addProduct(catId, 2530, 26, 66, 11, 22)
product:addIngredient(56) -- Bough: 1x1

--Sword Handle
product = carpentery:addProduct(catId, 2584, 29, 69, 12, 24)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Mace Handle
product = carpentery:addProduct(catId, 2548, 32, 72, 13, 26)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Large Ornate handle
product = carpentery:addProduct(catId, 2527, 35, 75, 14, 28)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

--Morning Star Handle
product = carpentery:addProduct(catId, 2549, 40, 80, 15, 30)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2543) -- Conifer Wooden Boards: 1x1

catId = carpentery:addCategory("weapons", "Waffen") --weapons

--Wooden Sword
product = carpentery:addProduct(catId, 445, 0, 20, 5, 10)
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2584) -- Sword Handle: 1x1

--Club
product = carpentery:addProduct(catId, 2664, 6, 26, 6, 12)
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2548) -- Mace Handle: 1x1

--Skull Staff
product = carpentery:addProduct(catId, 39, 12, 32, 8, 16)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Cleric's Staff
product = carpentery:addProduct(catId, 40, 24, 44, 11, 22)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Simple Mage Staff
product = carpentery:addProduct(catId, 57, 30, 50, 12, 24)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Mage's Staff
product = carpentery:addProduct(catId, 76, 42, 62, 15, 30)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Elven Mage's Staff
product = carpentery:addProduct(catId, 209, 54, 74, 18, 36)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Ornate Mage's Staff
product = carpentery:addProduct(catId, 208, 60, 80, 20, 40)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(2573) -- Large Staff Handle: 1x1

--Battle Staff
product = carpentery:addProduct(catId, 207, 66, 86, 21, 42)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(546, 2) -- Naldor Wooden Boards: 2x1
product:addIngredient(2573) -- Large Staff Handle: 1x1
product:addIngredient(2535, 2) -- Iron Ingot: 2x1

catId = carpentery:addCategory("ammunition", "Munition") --ammunition and throwing stuff

--Throwing Spear
product = carpentery:addProduct(catId, 293, 30, 50, 12, 24, 10)
product:addIngredient(56, 2) -- Bough: 2x1

--Arrow
product = carpentery:addProduct(catId, 64, 10, 30, 7, 14, 10)
product:addIngredient(56) -- Bough: 1x1

--Bolt
product = carpentery:addProduct(catId, 237, 30, 50, 12, 24, 10)
product:addIngredient(56) -- Bough: 1x1

--Wind Arrows
product = carpentery:addProduct(catId, 322, 90, 110, 27, 54, 10)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(2551) -- Pure Air: 1x1

catId = carpentery:addCategory("wands", "Zauberstäbe") --Wands

--Wand
product = carpentery:addProduct(catId, 323, 40, 60, 15, 30)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46) -- Ruby: 1x1

--Wand of Earth
product = carpentery:addProduct(catId, 2782, 60, 80, 20, 40)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(283, 3) -- Obsidian: 3x1
product:addIngredient(2552) -- Pure Earth: 1x1

--Wand of Fire
product = carpentery:addProduct(catId, 2783, 70, 90, 22, 44)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 4) -- Cherry Wooden Boards: 4x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2553) -- Pure Fire: 1x1

--Wand of Water
product = carpentery:addProduct(catId, 2784, 80, 100, 25, 50)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(2554) -- Pure Water: 1x1

--Wand of Wind
product = carpentery:addProduct(catId, 2785, 90, 110, 27, 54)
product:addIngredient(56) -- Bough: 1x1
product:addIngredient(545, 6) -- Cherry Wooden Boards: 6x1
product:addIngredient(2527) -- Large Ornated Staff Handle: 1x1
product:addIngredient(285, 3) -- Diamond: 3x1
product:addIngredient(2551) -- Pure Air: 1x1 

        InitDone = true;
    end
    return carpentery;
end



function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)  -- DON'T EDIT THIS LINE!
    local carpentry = InitCraftingTool()
    carpentry:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end

