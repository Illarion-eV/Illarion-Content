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

local pottery = crafts.Craft:new{
                          craftEN = "Pottery",
                          craftDE = "Töpfern",
                          handTool = 2140,
                          leadSkill = Character.pottery,
                          sfx = 7,
                          sfxDuration = 80,
                        }

pottery:addTool(1240) -- kiln
pottery:addTool(1241) -- kiln
pottery:addTool(1242) -- kiln
pottery:addTool(1243) -- kiln

local product
local catId

catId = pottery:addCategory("Pottery", "Töpfern")

product = pottery:addProduct(catId, Item.bricks, 1)
product:addIngredient(Item.clay, 2)

product = pottery:addProduct(catId, Item.clayPlate, 1)
product:addIngredient(Item.clay, 2)

product = pottery:addProduct(catId, Item.clayBowl, 1)
product:addIngredient(Item.clay, 2)

product = pottery:addProduct(catId, Item.shotGlass, 1)
product:addIngredient(Item.clay, 4)

product = pottery:addProduct(catId, Item.clayCup, 1)
product:addIngredient(Item.clay, 4)

product = pottery:addProduct(catId, Item.clayMug, 1)
product:addIngredient(Item.clay, 5)

product = pottery:addProduct(catId, Item.clayServingJug, 1)
product:addIngredient(Item.clay, 5)

product = pottery:addProduct(catId, Item.clayTeaCup, 1)
product:addIngredient(Item.clay, 6)

product = pottery:addProduct(catId, Item.clayTeapot, 1)
product:addIngredient(Item.clay, 8)

product = pottery:addProduct(catId, Item.mugWithLid, 1)
product:addIngredient(Item.clay, 8)

product = pottery:addProduct(catId, Item.ceramicPlate, 1)
product:addIngredient(Item.clay, 8)

product = pottery:addProduct(catId, Item.ceramicBowl, 1)
product:addIngredient(Item.clay, 8)

product = pottery:addProduct(catId, Item.ceramicShotGlass, 1)
product:addIngredient(Item.clay, 9)

product = pottery:addProduct(catId, Item.ceramicCup, 1)
product:addIngredient(Item.clay, 10)

product = pottery:addProduct(catId, Item.ceramicServingJug, 1)
product:addIngredient(Item.clay, 20)

product = pottery:addProduct(catId, Item.emptyAlchemyBomb, 2)
product:addIngredient(Item.clay, 10)
product:addIngredient(Item.emeraldPowder, 1)
product:addIngredient(Item.amethystPowder, 1)

product = pottery:addProduct(catId, Item.ceramicTeaCup, 1)
product:addIngredient(Item.clay, 10)
product:addIngredient(Item.topazPowder, 1)
product:addIngredient(Item.sapphirePowder, 1)

product = pottery:addProduct(catId, Item.ceramicTeapot, 1)
product:addIngredient(Item.clay, 20)
product:addIngredient(Item.topazPowder, 1)
product:addIngredient(Item.sapphirePowder, 1)

product = pottery:addProduct(catId, Item.vase, 1)
product:addIngredient(Item.clay, 12)
product:addIngredient(Item.diamondPowder, 2)
product:addIngredient(Item.rubyPowder, 1)

M.pottery = pottery
return M
