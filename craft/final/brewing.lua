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

local brewing = crafts.Craft:new{
                     craftEN = "Brewing",
                     craftDE = "Brauen",
                     handTool = 227,
                     leadSkill = Character.brewing,
                     sfx = 10,
                     sfxDuration = 15,
                   }

brewing:addTool(339) -- barrel
brewing:addTool(1410) -- barrel
brewing:addTool(1411) -- barrel

local product
local catId

catId = brewing:addCategory("Soft Liquors", "Leichter Alkohol")

-- bottle of cider
product = brewing:addProduct(catId, 2499, 1)
product:addIngredient(2498, 1) -- large empty bottle
product:addIngredient(15, 6) -- apple
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of wine
product = brewing:addProduct(catId, 2500, 1)
product:addIngredient(2498, 1) -- large empty bottle
product:addIngredient(388, 5) -- grapes
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of mead
product = brewing:addProduct(catId, 2497, 1)
product:addIngredient(2498, 1) -- large empty bottle
product:addIngredient(2529, 1) -- honeycomb
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of beer
product = brewing:addProduct(catId, 2501, 1)
product:addIngredient(2498, 1) -- large empty bottle
product:addIngredient(154, 2) -- hop
product:addIngredient(259, 1) -- grain
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

catId = brewing:addCategory("Juices", "Säfte")

-- bottle of banana juice
product = brewing:addProduct(catId, 785, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(80, 3) -- banana
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of grape juice
product = brewing:addProduct(catId, 791, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(388, 3) -- grapes
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of cabbage juice
product = brewing:addProduct(catId, 786, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(290, 3) -- cabbage
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of carrot juice
product = brewing:addProduct(catId, 788, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(2493, 3) -- carrots
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of blackberry juice
product = brewing:addProduct(catId, 783, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(147, 5) -- blackberry
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of tangerine juice
product = brewing:addProduct(catId, 784, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(199, 5) -- tangerine
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of strawberry juice
product = brewing:addProduct(catId, 789, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(151, 5) -- strawberry
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of orange juice
product = brewing:addProduct(catId, 3611, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(1207, 5) -- orange
product:addIngredient(778, 3) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

catId = brewing:addCategory("Teas", "Tee")

-- bottle of fir needle tea
product = brewing:addProduct(catId, 3720, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(149, 3) -- fir tree sprout
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of virgins weed tea
product = brewing:addProduct(catId, 787, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(144, 3) -- virgin's weed
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of green tea
product = brewing:addProduct(catId, 3721, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(157, 3) -- rotten tree bark
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(199, 2) -- tangerine
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of druids tea
product = brewing:addProduct(catId, 3722, 1)
product:addIngredient(790, 1) -- empty juice bottle
product:addIngredient(148, 3) -- firnis blossom
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(153, 2) -- foot leaf
product:addIngredient(145, 3) -- heath flower
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

catId = brewing:addCategory("Hard Liquors", "Stark alkoholische Getränke")

-- bottle of rum
product = brewing:addProduct(catId, 517, 1)
product:addIngredient(518, 1) -- empty rum bottle
product:addIngredient(778, 3) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of bear slayer
product = brewing:addProduct(catId, 1316, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(2529, 1) -- honeycomb
product:addIngredient(159, 1) -- toadstool
product:addIngredient(15, 1) -- apple
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of berry booze
product = brewing:addProduct(catId, 1315, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(81, 4) -- berries
product:addIngredient(147, 3) -- blackberry
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of stone face
product = brewing:addProduct(catId, 1320, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(388, 3) -- grapes
product:addIngredient(15, 2) -- apple
product:addIngredient(778, 2) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of absinthe
product = brewing:addProduct(catId, 1321, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(145, 3) -- heath flower
product:addIngredient(142, 3) -- sandberry
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of orange schnapps
product = brewing:addProduct(catId, 1322, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(1207, 3) -- orange
product:addIngredient(778, 3) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of cherry schnapps
product = brewing:addProduct(catId, 1319, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(302, 5) -- cherries
product:addIngredient(778, 3) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of mulled wine
product = brewing:addProduct(catId, 1323, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(388, 5) -- grapes
product:addIngredient(778, 3) -- sugarcane
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

-- bottle of elven wine
product = brewing:addProduct(catId, 1318, 1)
product:addIngredient(1317, 1) -- empty liquor bottle
product:addIngredient(80, 5) -- banana
product:addIngredient(778, 1) -- sugarcane
product:addIngredient(759, 3) -- nuts
product:addIngredient(52, 1) -- bucket of water
product:addRemnant(51, 1) -- bucket

M.brewing = brewing
return M
