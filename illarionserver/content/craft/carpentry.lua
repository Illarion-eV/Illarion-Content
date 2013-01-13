require("item.base.crafts")

module("content.craft.carpentry", package.seeall)

carpentry = item.base.crafts.Craft:new{
              craftEN = "carpentry",
              craftDE = "Schreinern",
              handTool = 2715,
              leadSkill = Character.carpentry,
              defaultFoodConsumption = 200,
              sfx = 14,
              sfxDuration = 17,
            }
            
carpentry:addTool(724) -- workbench
carpentry:addTool(725) -- workbench

--------------------------------------------------------------------------------------------
local catId = carpentry:addCategory("tools", "Werkzeuge") -- Tools and Other Items

--Slicer
local product = carpentry:addProduct(catId, 2715, 0, 20, 10, 20)
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
product = carpentry:addProduct(catId, 2659, 10, 30, 14, 28)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2738) -- Nails: 1x1

--Wooden Shovel
product = carpentry:addProduct(catId, 312, 12, 32, 16, 32)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Candle Mold
product = carpentry:addProduct(catId, 429, 15, 35, 18, 36)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Bucket
product = carpentry:addProduct(catId, 51, 18, 38, 27, 54)
product:addIngredient(2716, 3) -- Apple Wooden Boards: 3x1

--Peel
product = carpentry:addProduct(catId, 121, 21, 41, 20, 40)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

catId = carpentry:addCategory("bows", "Bögen") --bows

--Shortbow
product = carpentry:addProduct(catId, 65, 20, 40, 50, 100)
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(50, 2) -- Thread: 2x1

--Serinjah-Rider's Bow
product = carpentry:addProduct(catId, 2646, 30, 50, 60, 120)
product:addIngredient(546, 3) -- Naldor Wooden Boards: 3x1
product:addIngredient(50, 2) -- Thread: 2x1

--Hunting Bow
product = carpentry:addProduct(catId, 2714, 40, 60, 90, 180)
product:addIngredient(546, 4) -- Naldor Wooden Boards: 4x1
product:addIngredient(50, 2) -- Thread: 2x1

--Serinjah Firebow
product = carpentry:addProduct(catId, 2727, 50, 70, 102, 204)
product:addIngredient(546, 4) -- Naldor Wooden Boards: 4x1
product:addIngredient(50, 2) -- Thread: 2x1

--Ebony Wooden Bow
product = carpentry:addProduct(catId, 2780, 60, 80, 140, 280)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1

--Elven Composite Longbow
product = carpentry:addProduct(catId, 2718, 70, 90, 154, 308)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1

--Crossbow
product = carpentry:addProduct(catId, 70, 80, 100, 250, 500)
product:addIngredient(546, 6) -- Naldor Wooden Boards: 6x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Magical Elven Bow
product = carpentry:addProduct(catId, 2685, 90, 110, 324, 648)
product:addIngredient(546, 7) -- Naldor Wooden Boards: 7x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 2) -- Sapphire: 2x1

catId = carpentry:addCategory("instruments", "Instrumente") --instruments

--Horn
product = carpentry:addProduct(catId, 333, 10, 20, 14, 28)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1

--Flute
product = carpentry:addProduct(catId, 90, 20, 30, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Panpipe
product = carpentry:addProduct(catId, 532, 30, 40, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Drum
product = carpentry:addProduct(catId, 533, 40, 50, 48, 96)
product:addIngredient(2543, 2) -- Conifer Wooden Boards: 2x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Lute
product = carpentry:addProduct(catId, 335, 50, 60, 60, 120)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(50, 2) -- Thread: 2x1

--Harp
product = carpentry:addProduct(catId, 332, 60, 70, 136, 272)
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(50, 3) -- Thread: 3x1

catId = carpentry:addCategory("shields", "Schilde") --shields

--Small wooden Shield
product = carpentry:addProduct(catId, 2445, 10, 30, 28, 56)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1

--Wooden Shield
product = carpentry:addProduct(catId, 17, 17, 37, 36, 72)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1

--Light Metal shield
product = carpentry:addProduct(catId, 18, 24, 44, 55, 110)
product:addIngredient(2543, 3) -- Conifer Wooden Boards: 3x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Round Metal shield
product = carpentry:addProduct(catId, 186, 31, 51, 78, 156)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Metal shield
product = carpentry:addProduct(catId, 19, 38, 58, 84, 168)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547) -- Leather: 1x1
product:addIngredient(2535) -- Iron Ingots: 1x1

--Large Metal Shield
product = carpentry:addProduct(catId, 20, 45, 65, 128, 256)
product:addIngredient(2543, 4) -- Conifer Wooden Boards: 4x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Cursed Shield
product = carpentry:addProduct(catId, 917, 52, 72, 126, 252)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Red Steel Shield
product = carpentry:addProduct(catId, 2388, 59, 79, 180, 360)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1

--Legionaire's Tower shield
product = carpentry:addProduct(catId, 2448, 66, 86, 147, 294)
product:addIngredient(2543, 5) -- Conifer Wooden Boards: 5x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Heraldic Shield
product = carpentry:addProduct(catId, 95, 73, 93, 184, 368)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Steel Tower shield
product = carpentry:addProduct(catId, 96, 80, 100, 300, 600)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 3) -- Iron Ingots: 3x1

--Ornate Tower Shield
product = carpentry:addProduct(catId, 916, 87, 107, 324, 648)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 3) -- Iron Ingots: 3x1

--Shield of the sky
product = carpentry:addProduct(catId, 2284, 90, 110, 378, 756)
product:addIngredient(2543, 7) -- Conifer Wooden Boards: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 3) -- Sapphire: 3x1

--Cloud Shield
product = carpentry:addProduct(catId, 2439, 100, 120, 480, 960)
product:addIngredient(2543, 7) -- Conifer Wooden Boards: 7x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2551) -- Pure Air: 1x1
product:addIngredient(284, 5) -- Sapphire: 5x1

catId = carpentry:addCategory("greaves", "Beinschienen")

--Short Hardwood Greaves
product = carpentry:addProduct(catId, 2194, 30, 50, 96, 192)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1

--Hardwood Greaves
product = carpentry:addProduct(catId, 2193, 44, 64, 176, 352)
product:addIngredient(546, 7) -- Naldor Wooden Boards: 7x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1 
