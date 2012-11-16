-- Holzarbeiten mit dem Hobel

-- UPDATE common SET com_script='item.id_2715_plane' WHERE com_itemid IN (2715);

require("item.general.wood")
require("item.base.crafts")

module("item.id_2715_plane", package.seeall)

function InitCraftingTool( )
    if not InitStartedOnce then
        InitStartedOnce = true;
        
        carpentry = item.base.crafts.Craft:new{
                              craftEN = "carpentry",
                              craftDE = "Schreinern",
                              leadSkill = Character.carpentry,
                              defaultFoodConsumption = 200,
                              sfx = 14,
                              sfxDuration = 17,
                            }
                            
        carpentry:addTool(724) -- workbench
        carpentry:addTool(725) -- workbench
        
        --------------------------------------------------------------------------------------------
        local catId = carpentry:AddCategory( 2715 ) -- Tools and Other Items
    
     --Slicer
local product = carpentry:addProduct(catId, 2715, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2535) -- Iron Ingot: 1x1

--Plate
product = carpentry:addProduct(catId, 2952, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Bowl
product = carpentry:addProduct(catId, 2935, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Wooden Cup
product = carpentry:addProduct(catId, 2185, 3, 23, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Comb
product = carpentry:addProduct(catId, 2719, 6, 26, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Cooking Spoon
product = carpentry:addProduct(catId, 227, 9, 29, 7, 14)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Nailboard
product = carpentry:addProduct(catId, 2659, 10, 30, 7, 14)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2738) -- Nails: 1x1

--Wooden Shovel
product = carpentry:addProduct(catId, 312, 12, 32, 8, 16)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Candle Mold
product = carpentry:addProduct(catId, 429, 15, 35, 9, 18)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Bucket
product = carpentry:addProduct(catId, 51, 18, 38, 9, 18)
product:addIngredient(2716, 3) -- Apple Wooden Boards: 3x1

--Peel
product = carpentry:addProduct(catId, 121, 21, 41, 10, 20)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

catId = carpentry:AddCategory( 2646 ) --bows

--Shortbow
product = carpentry:addProduct(catId, 65, 20, 40, 10, 20)
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(50, 2) -- Thread: 2x1

--Serinjah-Rider's Bow
product = carpentry:addProduct(catId, 2646, 30, 50, 12, 24)
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(50, 2) -- Thread: 2x1

--Hunting Bow
product = carpentry:addProduct(catId, 2714, 40, 60, 15, 30)
product:addIngredient(546, 4) -- Naldor Wooden Boards: 4x1
product:addIngredient(50, 2) -- Thread: 2x1

--Serinjah Firebow
product = carpentry:addProduct(catId, 2727, 50, 70, 17, 34)
product:addIngredient(546, 4) -- Naldor Wooden Boards: 4x1
product:addIngredient(50, 2) -- Thread: 2x1

--Ebony Wooden Bow
product = carpentry:addProduct(catId, 2780, 60, 80, 20, 40)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1

--Elven Composite Longbow
product = carpentry:addProduct(catId, 2718, 70, 90, 22, 44)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1

--Crossbow
product = carpentry:addProduct(catId, 70, 80, 100, 25, 50)
product:addIngredient(546, 6) -- Naldor Wooden Boards: 6x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Magical Elven Bow
product = carpentry:addProduct(catId, 2685, 90, 110, 27, 54)
product:addIngredient(546, 7) -- Naldor Wooden Boards: 7x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 2) -- Bluestone: 2x1

catId = carpentry:AddCategory( 90 ) --instruments

--Horn
product = carpentry:addProduct(catId, 333, 10, 20, 7, 14)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1

--Flute
product = carpentry:addProduct(catId, 90, 20, 30, 10, 20)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Panpipe
product = carpentry:addProduct(catId, 532, 30, 40, 10, 20)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Drum
product = carpentry:addProduct(catId, 533, 40, 50, 12, 24)
product:addIngredient(2543, 2) -- Conifer Wooden Boards: 2x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Lute
product = carpentry:addProduct(catId, 335, 50, 60, 15, 30)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(50, 2) -- Thread: 2x1

--Harp
product = carpentry:addProduct(catId, 332, 60, 70, 17, 34)
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(51, 3) -- Thread: 3x1

catId = carpentry:AddCategory( 18 ) --shields

--Small wooden Shield
product = carpentry:addProduct(catId, 2445, 10, 30, 7, 14)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1

--Wooden Shield
product = carpentry:addProduct(catId, 17, 17, 37, 9, 18)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1

--Light Metal shield
product = carpentry:addProduct(catId, 18, 24, 44, 11, 22)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Round Metal shield
product = carpentry:addProduct(catId, 186, 31, 51, 13, 26)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Metal shield
product = carpentry:addProduct(catId, 19, 38, 58, 14, 28)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Large Metal Shield
product = carpentry:addProduct(catId, 20, 45, 65, 16, 32)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Cursed Shield
product = carpentry:addProduct(catId, 917, 52, 72, 18, 36)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Red Steel Shield
product = carpentry:addProduct(catId, 2388, 59, 79, 20, 40)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Legionaire's Tower shield
product = carpentry:addProduct(catId, 2448, 66, 86, 21, 42)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Heraldic Shield
product = carpentry:addProduct(catId, 95, 73, 93, 23, 46)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Steel Tower shield
product = carpentry:addProduct(catId, 96, 80, 100, 25, 50)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 3) -- Iron Ingots: 3x1

--Ornate Tower Shield
product = carpentry:addProduct(catId, 916, 87, 107, 27, 54)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 3) -- Iron Ingots: 3x1

--Shield of the sky
product = carpentry:addProduct(catId, 2284, 90, 110, 27, 54)
product:addIngredient(2543, 7) -- Conifer Wooden Boards: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 3) -- Bluestone: 3x1

--Cloud Shield
product = carpentry:addProduct(catId, 2439, 100, 120, 30, 60)
product:addIngredient(2543, 7) -- Conifer Wooden Boards: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 5) -- Bluestone: 5x1

catId = carpentry:AddCategory( 2194 ) -- leggings

--Short Hardwood Greaves
product = carpentry:addProduct(catId, 2194, 30, 50, 12, 24)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1

--Hardwood Greaves
product = carpentry:addProduct(catId, 2193, 44, 64, 16, 32)
product:addIngredient(546, 7) -- Naldor Wooden Boards: 7x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1 
        
        InitDone = true;
    end
    return carpentry;
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)  -- DON'T EDIT THIS LINE!
    local carpentry = InitCraftingTool()
    carpentry:showDialog(User, SourceItem)
end
