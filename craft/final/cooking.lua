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
local brewing = require("craft.final.brewing")

local M = {}

local cooking = crafts.Craft:new{
                     craftEN = "Cooking",
                     craftDE = "Kochen",
                     handTool = 227,
                     leadSkill = Character.cookingAndBaking,
                     sfx = 7,
                     sfxDuration = 80,
                     fallbackCraft = brewing.brewing,
                   }


cooking:addTool(3581) -- kettle w/fire
cooking:addTool(1386) -- oven graphic with kettle and fire

local product
local catId

catId = cooking:addCategory("Plate recipes", "Tellergerichte")

-- sausage
product = cooking:addProduct(catId, 3051, 2)
product:addIngredient(63, 1) -- entrails
product:addIngredient(307, 1) -- pork

-- cheese
product = cooking:addProduct(catId, 3573, 1)
product:addIngredient(2502, 1) -- bottle of milk

-- cabbage roll
product = cooking:addProduct(catId, 3715, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(307, 2) -- pork
product:addIngredient(290, 1) -- cabbage

-- veggie hash
product = cooking:addProduct(catId, 3716, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3567, 1) -- potato
product:addIngredient(201, 1) -- onion
product:addIngredient(2493, 1) -- carrots

-- trout fillet dish
product = cooking:addProduct(catId, 2459, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(73, 2) -- trout
product:addIngredient(290, 1) -- cabbage
product:addIngredient(200, 3) -- tomato

-- salmon dish
product = cooking:addProduct(catId, 556, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(355, 3) -- salmon
product:addIngredient(201, 2) -- onion
product:addIngredient(200, 5) -- tomato

-- egg dish
product = cooking:addProduct(catId, 1154, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3051, 3) -- sausage
product:addIngredient(1150, 5) -- white egg

-- meat dish
product = cooking:addProduct(catId, 2277, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(306, 2) -- ham
product:addIngredient(201, 2) -- onion
product:addIngredient(2493, 1) -- carrots

-- sausages dish
product = cooking:addProduct(catId, 2922, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3051, 2) -- sausage
product:addIngredient(290, 1) -- cabbage
product:addIngredient(2493, 1) -- carrots

-- steak dish
product = cooking:addProduct(catId, 557, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3606, 1) -- grilled steak
product:addIngredient(200, 5) -- tomato
product:addIngredient(201, 2) -- onion

-- rabbit dish
product = cooking:addProduct(catId, 555, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3710, 1) -- smoked rabbit
product:addIngredient(290, 1) -- cabbage
product:addIngredient(2493, 2) -- carrots
product:addIngredient(200, 3) -- tomato

-- lamb dish
product = cooking:addProduct(catId, 559, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3713, 1) -- grilled lamb
product:addIngredient(200, 5) -- tomato
product:addIngredient(2493, 2) -- carrots
product:addIngredient(201, 2) -- onion

-- venison dish
product = cooking:addProduct(catId, 554, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3714, 1) -- grilled venison
product:addIngredient(81, 5) -- berries
product:addIngredient(2493, 2) -- carrots
product:addIngredient(290, 1) -- cabbage

-- chicken dish
product = cooking:addProduct(catId, 1155, 1)
product:addIngredient(2952, 1) -- plate
product:addIngredient(3709, 3) -- smoked chicken
product:addIngredient(290, 1) -- cabbage
product:addIngredient(2493, 2) -- carrots
product:addIngredient(517, 1) -- bottle of rum

product = cooking:addProduct(catId, Item.rosefishDish, 1)
product:addIngredient(Item.woodenPlate, 1)
product:addIngredient(Item.smokedRosefish, 1)
product:addIngredient(Item.carrots, 2)
product:addIngredient(Item.tomato, 5)
product:addIngredient(Item.cabbage, 1)
product:addIngredient(Item.bottleOfBearSlayer, 1)

catId = cooking:addCategory("Bowl recipes", "Schüsselgerichte")

-- mushroom soup
product = cooking:addProduct(catId, 2456, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(163, 10) -- champignon
product:addIngredient(52, 1) -- bucket of water

-- onion soup
product = cooking:addProduct(catId, 2923, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(201, 3) -- onion
product:addIngredient(52, 1) -- bucket of water

-- cabbage stew
product = cooking:addProduct(catId, 2278, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(290, 4) -- cabbage
product:addIngredient(52, 1) -- bucket of water

-- mulligan
product = cooking:addProduct(catId, 2276, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(201, 2) -- onion
product:addIngredient(200, 5) -- tomato
product:addIngredient(2493, 2) -- carrots
product:addIngredient(52, 1) -- bucket of water

-- potato soup
product = cooking:addProduct(catId, 3569, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(3567, 3) -- potato
product:addIngredient(201, 2) -- onion
product:addIngredient(52, 1) -- bucket of water

-- egg salad
product = cooking:addProduct(catId, 3570, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(1150, 10) -- white egg
product:addIngredient(201, 2) -- onion
product:addIngredient(2493, 2) -- carrots

-- fish soup
product = cooking:addProduct(catId, 3572, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(2502, 1) -- bottle of milk
product:addIngredient(1209, 2) -- horse mackerel
product:addIngredient(355, 2) -- salmon
product:addIngredient(2493, 2) -- carrots
product:addIngredient(3567, 1) -- potato
product:addIngredient(52, 1) -- bucket of water

-- beer soup
product = cooking:addProduct(catId, 3712, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(3567, 1) -- potato
product:addIngredient(201, 2) -- onion
product:addIngredient(154, 2) -- hops
product:addIngredient(2502, 1) -- bottle of milk
product:addIngredient(3573, 2) -- cheese

product = cooking:addProduct(catId, Item.mackerelSalad, 1)
product:addIngredient(Item.soupBowl, 1)
product:addIngredient(Item.smokedHorsemackerel, 2)
product:addIngredient(Item.bottleOfMilk, 1)
product:addIngredient(Item.potato, 1)
product:addIngredient(Item.onion, 1)
product:addIngredient(Item.flour, 1)
product:addIngredient(Item.cabbage, 1)

-- goulash
product = cooking:addProduct(catId, 3711, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(552, 3) -- deer meat
product:addIngredient(2493, 2) -- carrots
product:addIngredient(200, 5) -- tomato
product:addIngredient(201, 2) -- onion
product:addIngredient(52, 1) -- bucket of water

-- chicken soup
product = cooking:addProduct(catId, 1152, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(1151, 2) -- chicken meat
product:addIngredient(201, 2) -- onion
product:addIngredient(2, 2) -- flour
product:addIngredient(788, 1) -- bottle of carrot juice
product:addIngredient(52, 1) -- bucket of water

product = cooking:addProduct(catId, Item.rosefishStew, 1)
product:addIngredient(Item.soupBowl, 1)
product:addIngredient(Item.roseFish, 1)
product:addIngredient(Item.tomato, 5)
product:addIngredient(Item.onion, 2)
product:addIngredient(Item.potato, 1)
product:addIngredient(Item.bottleOfBerryBooze, 1)
product:addIngredient(Item.bucketOfWater, 1)

M.cooking = cooking
return M
