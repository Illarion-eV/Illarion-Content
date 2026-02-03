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
local kneading = require("craft.intermediate.doughmaking")

local M = {}

local baking = crafts.Craft:new{
                     craftEN = "Baking",
                     craftDE = "Backen",
                     handTool = Item.peel,
                     leadSkill = Character.cookingAndBaking,
                     sfx = 7,
                     sfxDuration = 80,
                     fallbackCraft = kneading.kneading,
                   }

baking:addTool( 119 ) -- baking oven
baking:addTool( 120 ) -- baking oven

local product
local catId

catId = baking:addCategory("Basic", "Grundlegend")

product = baking:addProduct(catId, Item.bakedPotato, 1)
product:addIngredient(Item.potato, 1) -- potato

M.baking = baking
return M
