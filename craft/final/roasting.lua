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
local crafts = require("craft.base.crafts")

local M = {}

local roasting = crafts.Craft:new{
                    craftEN = "Roasting",
                    craftDE = "Braten",
                    handTool = 2495,
                    leadSkill = Character.cookingAndBaking,
                    sfx = 7,
                    sfxDuration = 27,
                  }

roasting:addTool(304) -- smoke oven
roasting:addTool(305) -- smoke oven
roasting:addTool(12) -- campfire
roasting:addTool(1387) -- grill
roasting:addTool(1388) -- grill
roasting:addTool(1389) -- grill
roasting:addTool(1390) -- grill

local product
local catId

catId = roasting:addCategory("Meat", "Fleisch")

-- Ham
product = roasting:addProduct(catId, 306, 1)
product:addIngredient(307) -- pork

-- Smoked chicken
product = roasting:addProduct(catId, 3709, 1)
product:addIngredient(1151) -- chicken meat

-- Smoked rabbit
product = roasting:addProduct(catId, 3710, 1)
product:addIngredient(553) -- rabbit meat

-- Grilled lamb
product = roasting:addProduct(catId, 3713, 1)
product:addIngredient(2934) -- lamb meat

-- Grilled Rat
product = roasting:addProduct(catId, Item.grilledRat, 1)
product:addIngredient(Item.ratMeat)

-- Grilled venison
product = roasting:addProduct(catId, 3714, 1)
product:addIngredient(552) -- deer meat

-- Grilled steak
product = roasting:addProduct(catId, 3606, 1)
product:addIngredient(2940) -- raw steak


product = roasting:addProduct(catId, Item.grilledFox, 1)
product:addIngredient(Item.foxMeat)

product = roasting:addProduct(catId, Item.grilledWolf, 1)
product:addIngredient(Item.wolfMeat)

product = roasting:addProduct(catId, Item.grilledBear, 1)
product:addIngredient(Item.bearMeat)

product = roasting:addProduct(catId, Item.grilledRaptor, 1)
product:addIngredient(Item.raptorMeat)

product = roasting:addProduct(catId, Item.grilledDragon, 1)
product:addIngredient(Item.dragonMeat)

catId = roasting:addCategory("Fish", "Fisch")

-- Smoked trout
product = roasting:addProduct(catId, 455, 1)
product:addIngredient(73) -- trout

-- Smoked salmon
product = roasting:addProduct(catId, 3916, 1)
product:addIngredient(355) -- salmon

product = roasting:addProduct(catId, Item.cookedShrimp, 1)
product:addIngredient(Item.shrimp)

product = roasting:addProduct(catId, Item.grilledFlounder, 1)
product:addIngredient(Item.flounder)


-- Smoked horse mackerel
product = roasting:addProduct(catId, 3914, 1)
product:addIngredient(1209) -- horse mackerel

-- Smoked rose fish
product = roasting:addProduct(catId, 3915, 1)
product:addIngredient(1210) -- rose fish

product = roasting:addProduct(catId, Item.cookedCrab, 1)
product:addIngredient(Item.crab)

product = roasting:addProduct(catId, Item.grilledOctopus, 1)
product:addIngredient(Item.octopus)

product = roasting:addProduct(catId, Item.cookedLobster, 1)
product:addIngredient(Item.lobster)

M.roasting = roasting
return M
