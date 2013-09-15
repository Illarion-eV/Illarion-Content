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

--if isTestserver() then
	local catId = carpentry:addCategory("Tools", "Werkzeuge") -- Tools and Other Items

--Peel
product = carpentry:addProduct(catId, 121, 21, 41, 20, 40)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Bucket
product = carpentry:addProduct(catId, 51, 18, 38, 27, 54)
product:addIngredient(2716, 3) -- Apple Wooden Boards: 3x1

--Candle Mold
product = carpentry:addProduct(catId, 429, 15, 35, 18, 36)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Wooden Shovel
product = carpentry:addProduct(catId, 312, 12, 32, 16, 32)
product:addIngredient(2716, 2) -- Apple Wooden Boards: 2x1

--Nailboard
product = carpentry:addProduct(catId, 2659, 10, 30, 14, 28)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2738) -- Nails: 1x1

--Cooking Spoon
product = carpentry:addProduct(catId, 227, 9, 29, 7, 14)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Comb
product = carpentry:addProduct(catId, 2719, 6, 26, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Slicer
local product = carpentry:addProduct(catId, 2715, 0, 20, 10, 20)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2535) -- Iron Ingot: 1x1

catId = carpentry:addCategory("Tableware", "Tischgeschirr") --tableware

--Wooden Cup
product = carpentry:addProduct(catId, 2185, 3, 23, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Plate
product = carpentry:addProduct(catId, 2952, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Bowl
product = carpentry:addProduct(catId, 2935, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

catId = carpentry:addCategory("Bows", "Bögen") --bows

--Crossbow
product = carpentry:addProduct(catId, 70, 99, 100, 250, 500)
product:addIngredient(546, 6) -- Naldor Wooden Boards: 6x1
product:addIngredient(2717, 2) -- pins and cotters 2x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2535) -- Iron Ingots: 1x1
product:addIngredient(283, 2) -- Blackstone
product:addIngredient(2571) -- Merinium Ingot 2x1
product:addIngredient(2552); -- Pure Earthx1

--Elven Composite Longbow
product = carpentry:addProduct(catId, 2718, 90, 100, 154, 308)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(50, 2) -- Thread: 2x1
product:addIngredient(2571,2); -- Merinium Ingot 2x1
product:addIngredient(448, 2); -- Emerald Powder
product:addIngredient(284); -- Sapphire
product:addIngredient(2551) -- Pure Air: 1x1


-- elven shortbow             
product = carpentry:addProduct(catId, 2685, 80, 100, 150, 300, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(545, 2); -- Cherry Wood Boards

product:addIngredient(2716, 1); -- Deciduous Wood Board

product:addIngredient(50, 2); -- Thread

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(448, 2); -- Emerald Powder

product:addIngredient(284); -- Sapphire

product:addIngredient(197); -- Amethyst

-- ebony wood bow             
product = carpentry:addProduct(catId, 2780, 70, 90, 135, 270, 1);
product:addIngredient(546, 4); -- Naldor Wood Board

product:addIngredient(545, 3); -- Cherry Wood Boards

product:addIngredient(50, 3); -- Thread

product:addIngredient(45, 2); -- Emerald


-- long bow                   
product = carpentry:addProduct(catId, 2708, 68, 88, 132, 264, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(2716, 3); -- Deciduous Wood Boards

product:addIngredient(50, 4); -- Thread

product:addIngredient(283, 1); -- Blackstone

-- fire hunter's bow          
product = carpentry:addProduct(catId, 2727, 58, 78, 117, 234, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards

product:addIngredient(545, 1); -- Cherry Wood Boards

product:addIngredient(50, 2); -- Thread

product:addIngredient(447); -- Ruby Powder

-- hunting bow                
product = carpentry:addProduct(catId, 2714, 40, 60, 90, 180, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(2716, 2); -- Deciduous Wood Boards

product:addIngredient(50, 2); -- Thread

-- serinjah-rider's bow       
product = carpentry:addProduct(catId, 2646, 30, 50, 75, 150, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(545, 1); -- Cherry Wood Boards

product:addIngredient(50, 2); -- Thread

-- short bow                  
product = carpentry:addProduct(catId, 65, 10, 30, 45, 90, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(50, 2); -- Thread


catId = carpentry:addCategory("Instruments", "Instrumente") --instruments

--Harp
product = carpentry:addProduct(catId, 332, 60, 70, 136, 272)
product:addIngredient(545, 5) -- Cherry Wooden Boards: 5x1
product:addIngredient(50, 3) -- Thread: 3x1

--Lute
product = carpentry:addProduct(catId, 335, 50, 60, 60, 120)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1
product:addIngredient(50, 2) -- Thread: 2x1

--Drum
product = carpentry:addProduct(catId, 533, 40, 50, 48, 96)
product:addIngredient(2543, 2) -- Conifer Wooden Boards: 2x1
product:addIngredient(2547, 2) -- Leather: 2x1

--Panpipe
product = carpentry:addProduct(catId, 532, 30, 40, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Flute
product = carpentry:addProduct(catId, 90, 20, 30, 30, 60)
product:addIngredient(545, 3) -- Cherry Wooden Boards: 3x1

--Horn
product = carpentry:addProduct(catId, 333, 10, 20, 14, 28)
product:addIngredient(545, 2) -- Cherry Wooden Boards: 2x1

catId = carpentry:addCategory("Shields", "Schilde") --shields


--Mosaic shield
product = carpentry:addProduct(catId, 2447, 100, 100, 500, 756)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(2553) -- Pure fire
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2571,2) -- Merinium Ingot 2x1


--Cloud Shield
product = carpentry:addProduct(catId, 2439, 99, 100, 480, 960)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2554) -- Pure Water: 1x1
product:addIngredient(285, 5) -- Diamond: 5x1
product:addIngredient(2571,2) -- Merinium Ingot 2x1

-- shield of the sky          
product = carpentry:addProduct(catId, 2284, 96, 100, 174, 348, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards

product:addIngredient(2716, 3); -- Deciduous Wood Boards

product:addIngredient(2547, 3); -- Leather

product:addIngredient(2535, 1); -- Iron Ingot

product:addIngredient(2571, 2); -- Merinium Ingot

product:addIngredient(45); -- Pure Air

product:addIngredient(104); -- Emerald

-- ornate tower shield        
product = carpentry:addProduct(catId, 916, 94, 100, 171, 342, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards

product:addIngredient(2716, 4); -- Deciduous Wood Boards

product:addIngredient(2547, 3); -- Leather

product:addIngredient(2535, 2); -- Iron Ingot

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(2552); -- Pure earth

-- steel tower shield         
product = carpentry:addProduct(catId, 96, 91, 100, 166, 333, 1);
product:addIngredient(2543, 6); -- Conifer Wooden Boards

product:addIngredient(545, 4); -- Cherry Wood Boards

product:addIngredient(2547, 3); -- Leather

product:addIngredient(2535, 2); -- Iron Ingot

product:addIngredient(2571); -- Merinium Ingot

product:addIngredient(2554); -- Pure Water

-- heraldic shield            
product = carpentry:addProduct(catId, 95, 87, 100, 160, 321, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards

product:addIngredient(545, 3); -- Cherry Wood Boards

product:addIngredient(2716, 1); -- Deciduous Wood Boards

product:addIngredient(2547, 2); -- Leather

product:addIngredient(2535, 3); -- Iron Ingot

product:addIngredient(284); -- Sapphire

-- legionnaire's tower shield
product = carpentry:addProduct(catId, 2448, 82, 100, 153, 306, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards

product:addIngredient(545, 3); -- Cherry Wood Boards

product:addIngredient(2716, 1); -- Deciduous Wood Boards

product:addIngredient(2547, 2); -- Leather

product:addIngredient(2535, 2); -- Iron Ingot

product:addIngredient(198); -- Topaz


-- red steel shield           
product = carpentry:addProduct(catId, 2388, 76, 96, 144, 288, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards

product:addIngredient(2716, 2); -- Deciduous Wood Boards

product:addIngredient(2547, 2); -- Leather

product:addIngredient(2535, 2); -- Iron Ingot

-- round metal shield         
product = carpentry:addProduct(catId, 186, 62, 82, 123, 246, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards

product:addIngredient(545, 2); -- Cherry Wood Boards

product:addIngredient(2547, 2); -- Leather

product:addIngredient(2535, 1); -- Iron Ingot

-- knight shield              
product = carpentry:addProduct(catId, 20, 54, 74, 111, 222, 1);
product:addIngredient(2543, 5); -- Conifer Wooden Boards

product:addIngredient(2716, 2); -- Deciduous Wood Boards

product:addIngredient(2547, 1); -- Leather

product:addIngredient(2535, 1); -- Iron Ingot

-- metal shield               
product = carpentry:addProduct(catId, 19, 45, 65, 97, 195, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards

product:addIngredient(2716, 1); -- Deciduous Wood Boards

product:addIngredient(2547, 1); -- Leather

product:addIngredient(2535, 2); -- Iron Ingot

-- cursed shield              
product = carpentry:addProduct(catId, 917, 35, 55, 82, 165, 1);
product:addIngredient(2543, 4); -- Conifer Wooden Boards

product:addIngredient(2547, 1); -- Leather

product:addIngredient(2535, 1); -- Iron Ingot

-- light shield               
product = carpentry:addProduct(catId, 18, 20, 40, 60, 120, 1);
product:addIngredient(2543, 3); -- Conifer Wood Boards

product:addIngredient(2547, 1); -- Leather

product:addIngredient(2535, 1); -- Iron

-- wooden shield              
product = carpentry:addProduct(catId, 17, 15, 35, 52, 105, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards

product:addIngredient(545, 1); -- Cherry Wood Boards

product:addIngredient(2547, 1); -- Leather

-- small wooden shield        
product = carpentry:addProduct(catId, 2445, 0, 20, 30, 60, 1);
product:addIngredient(2543, 3); -- Conifer Wooden Boards



catId = carpentry:addCategory("Greaves", "Beinschienen")

-- hardwood greaves              
product = carpentry:addProduct(catId, 2193, 36, 56, 84, 168, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(545, 3); -- Cherry Wood Boards

product:addIngredient(176, 2); -- Grey Cloth

-- short hardwood greaves        
product = carpentry:addProduct(catId, 2194, 16, 36, 54, 108, 1);
product:addIngredient(546, 3); -- Naldor Wood Boards

product:addIngredient(176, 1); -- Grey Cloth


--[[else
	local catId = carpentry:addCategory("tools", "Werkzeuge") -- Tools and Other Items

--Slicer
local product = carpentry:addProduct(catId, 2715, 0, 20, 10, 20)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1
product:addIngredient(2535) -- Iron Ingot: 1x1

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

catId = carpentry:addCategory("tableware", "Tischgeschirr") --tableware

--Plate
product = carpentry:addProduct(catId, 2952, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Bowl
product = carpentry:addProduct(catId, 2935, 0, 20, 5, 10)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

--Wooden Cup
product = carpentry:addProduct(catId, 2185, 3, 23, 6, 12)
product:addIngredient(2716) -- Apple Wooden Boards: 1x1

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
product:addIngredient(2553) -- Pure fire

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
product:addIngredient(2535) -- Iron Ingots: 1x1
product:addIngredient(2571) -- Merinium Ingot

--Magical Elven Bow
product = carpentry:addProduct(catId, 2685, 90, 100, 324, 648)
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
product = carpentry:addProduct(catId, 95, 73, 93, 207, 414)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 2) -- Leather: 2x1
product:addIngredient(2571) -- Merinium Ingot

--Steel Tower shield
product = carpentry:addProduct(catId, 96, 80, 100, 325, 650)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(2571) -- Merinium Ingot

--Ornate Tower Shield
product = carpentry:addProduct(catId, 916, 85, 100, 351, 702)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2535, 2) -- Iron Ingots: 2x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(2571) -- Merinium Ingot

--Mosaic shield
product = carpentry:addProduct(catId, 2447, 87, 100, 378, 756)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(104) -- Silver Ingot
product:addIngredient(46, 3) -- Ruby: 3x1
product:addIngredient(2571) -- Merinium Ingot

--Shield of the sky
product = carpentry:addProduct(catId, 2284, 90, 100, 392, 784)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2554) -- Pure Water: 1x1
product:addIngredient(284, 3) -- Sapphire: 3x1
product:addIngredient(2571) -- Merinium Ingot

--Cloud Shield
product = carpentry:addProduct(catId, 2439, 99, 100, 480, 960)
product:addIngredient(2543, 6) -- Conifer Wooden Boards: 6x1
product:addIngredient(2547, 3) -- Leather: 3x1
product:addIngredient(2554) -- Pure Water: 1x1
product:addIngredient(285, 5) -- Diamond: 5x1
product:addIngredient(2571) -- Merinium Ingot

catId = carpentry:addCategory("greaves", "Beinschienen")

--Short Hardwood Greaves
product = carpentry:addProduct(catId, 2194, 30, 50, 96, 192)
product:addIngredient(546, 5) -- Naldor Wooden Boards: 5x1
product:addIngredient(176, 3) -- Grey Cloth: 3x1

--Hardwood Greaves
product = carpentry:addProduct(catId, 2193, 44, 64, 176, 352)
product:addIngredient(546, 7) -- Naldor Wooden Boards: 7x1
product:addIngredient(176, 4) -- Grey Cloth: 4x1 

end;

]]