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

local kneading = crafts.Craft:new{
                    craftEN = "Dough kneading",
                    craftDE = "Teigkneten",
                    handTool = Item.rollingPin,
                    leadSkill = Character.cookingAndBaking,
                    intermediate = true
                  }

kneading:addTool( 119 ) -- baking oven
kneading:addTool( 120 ) -- baking oven

local catId = kneading:addCategory("Dough", "Teig")

local product = kneading:addProduct(catId, Item.plainDough, 1)
product:addIngredient(Item.flour, 1)
product:addIngredient(Item.bucketOfWater, 1)

product = kneading:addProduct(catId, Item.cookieDough, 1)
product:addIngredient(Item.flour, 1)
product:addIngredient(Item.whiteEgg, 1)
product:addIngredient(Item.beeHoney, 1)
product:addIngredient(Item.bottleOfMilk, 1)

product = kneading:addProduct(catId, Item.pastryDough, 1)
product:addIngredient(Item.flour, 1)
product:addIngredient(Item.pigeonEgg, 1)
product:addIngredient(Item.sugarcane, 1)
product:addIngredient(Item.bottleOfSheepMilk, 1)

product = kneading:addProduct(catId, Item.spicyDough, 1)
product:addIngredient(Item.flour, 1)
product:addIngredient(Item.seagullEgg, 1)
product:addIngredient(Item.firewaspHoney, 1)
product:addIngredient(Item.bottleOfDeerMilk, 1)


M.kneading = kneading
return M
