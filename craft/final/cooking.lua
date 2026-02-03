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
                     handTool = Item.cookingSpoon,
                     leadSkill = Character.cookingAndBaking,
                     sfx = 7,
                     sfxDuration = 80,
                     fallbackCraft = brewing.brewing,
                   }


cooking:addTool(3581) -- kettle w/fire
cooking:addTool(1386) -- oven graphic with kettle and fire

local product
local catId

catId = cooking:addCategory("Basic", "Grundlegend")

product = cooking:addProduct(catId, Item.sausage, 2)
product:addIngredient(Item.entrails, 1) -- entrails
product:addIngredient(Item.pork, 1) -- pork

product = cooking:addProduct(catId, Item.cheese, 1)
product:addIngredient(Item.bottleOfMilk, 1)

M.cooking = cooking
return M
