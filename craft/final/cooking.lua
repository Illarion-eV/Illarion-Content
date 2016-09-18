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
local crafts = require("craft.crafts")
local brewing = require("craft.final.brewing")

module("craft.final.cooking", package.seeall)

cooking = crafts.Craft:new{
                     craftEN = "Cooking",
                     craftDE = "Kochen",
                     handTool = 227,
                     leadSkill = Character.cookingAndBaking,
                     sfx = 7,
                     sfxDuration = 80,
                     fallbackCraft = brewing.brewing,
                   };


cooking:addTool(3581) -- kettle w/fire

--------------------------------------------------------------------------------------------

local catId = cooking:addCategory("Dishes", "Gerichte")

-- sausage
product = cooking:addProduct(catId, 3051, 2)
product:addIngredient(63, 1) -- entrails
product:addIngredient(307, 1) -- pork

-- cheese
product = cooking:addProduct(catId, 3573, 1)
product:addIngredient(2502, 1) -- bottle of milk
product:addRemnant(2498, 1) -- large empty bottle

-- cabbage roll
product = cooking:addProduct(catId, 3715, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(307, 1) -- pork
product:addIngredient(290, 1) -- cabbage

-- veggie hash
product = cooking:addProduct(catId, 3716, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3567, 1) -- potato
product:addIngredient(201, 1) -- onion
product:addIngredient(2493, 1) -- carrots

-- trout fillet dish
product = cooking:addProduct(catId, 2459, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(73, 1) -- trout
product:addIngredient(290, 1) -- cabbage
product:addIngredient(200, 1) -- tomato

-- salmon dish
product = cooking:addProduct(catId, 556, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(355, 1) -- salmon
product:addIngredient(201, 1) -- onion
product:addIngredient(200, 1) -- tomato

-- egg dish
product = cooking:addProduct(catId, 1154, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3051, 1) -- sausage
product:addIngredient(1150, 2) -- white egg

-- meat dish
product = cooking:addProduct(catId, 2277, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(306, 1) -- ham
product:addIngredient(201, 1) -- onion
product:addIngredient(2493, 1) -- carrots

-- egg salad
product = cooking:addProduct(catId, 3570, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(1150, 5) -- white egg
product:addIngredient(201, 1) -- onion
product:addIngredient(3573, 1) -- cheese

-- sausages dish
product = cooking:addProduct(catId, 2922, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3051, 2) -- sausage
product:addIngredient(290, 2) -- cabbage
product:addIngredient(2493, 3) -- carrots

-- steak dish
product = cooking:addProduct(catId, 557, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3606, 2) -- grilled steak
product:addIngredient(200, 2) -- tomato
product:addIngredient(201, 2) -- onion

-- rabbit dish
product = cooking:addProduct(catId, 555, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3710, 2) -- smoked rabbit
product:addIngredient(290, 2) -- cabbage
product:addIngredient(2493, 3) -- carrots

-- lamb dish
product = cooking:addProduct(catId, 559, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3713, 2) -- grilled lamb
product:addIngredient(200, 2) -- tomato
product:addIngredient(2493, 3) -- carrots
product:addIngredient(201, 2) -- onion

-- venison dish
product = cooking:addProduct(catId, 554, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3714, 2) -- grilled venison
product:addIngredient(81, 5) -- berries
product:addIngredient(2493, 3) -- carrots
product:addIngredient(290, 3) -- cabbage

-- chicken dish
product = cooking:addProduct(catId, 1155, 1)
product:addIngredient(2031, 1) -- plate
product:addIngredient(3709, 2) -- smoked chicken
product:addIngredient(290, 2) -- cabbage
product:addIngredient(2493, 3) -- carrots
product:addIngredient(517, 1) -- bottle of rum
product:addRemnant(518, 1) -- empty rum bottle

local catId = cooking:addCategory("Soups", "Suppen")

-- mushroom soup
product = cooking:addProduct(catId, 2456, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(163, 2) -- champignon
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- onion soup
product = cooking:addProduct(catId, 2923, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(201, 2) -- onion
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- cabbage stew
product = cooking:addProduct(catId, 2278, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(290, 7) -- cabbage
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- mulligan
product = cooking:addProduct(catId, 2276, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(201, 2) -- onion
product:addIngredient(200, 2) -- tomato
product:addIngredient(2493, 2) -- carrots
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- potato soup
product = cooking:addProduct(catId, 3569, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(3567, 4) -- potato
product:addIngredient(201, 2) -- onion
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- fish soup
product = cooking:addProduct(catId, 3572, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(2502, 1) -- bottle of milk
product:addIngredient(1209, 2) -- horse mackerel
product:addIngredient(355, 2) -- salmon
product:addIngredient(2493, 3) -- carrots
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(2498,1) -- large empty bottle

-- beer soup
product = cooking:addProduct(catId, 3712, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(2501, 1) -- bottle of beer
product:addIngredient(3567, 2) -- potato
product:addIngredient(201, 2) -- onion
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(2498,1) -- large empty bottle

-- goulash
product = cooking:addProduct(catId, 3711, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(2500, 1) -- bottle of wine
product:addIngredient(552, 2) -- deer meat
product:addIngredient(2493, 2) -- carrots
product:addIngredient(200, 2) -- tomato
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(2498,1) -- large empty bottle

-- chicken soup
product = cooking:addProduct(catId, 1152, 1)
product:addIngredient(2935, 1) -- soup bowl
product:addIngredient(1151, 1) -- chicken meat
product:addIngredient(201, 2) -- onion
product:addIngredient(2, 1) -- flour
product:addIngredient(788, 1) -- bottle of carrot juice
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket
product:addRemnant(790,1) -- empty juice bottle
