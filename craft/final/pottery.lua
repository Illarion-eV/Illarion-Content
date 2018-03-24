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

-- bricks
product = pottery:addProduct(catId, 2588, 1)
product:addIngredient(26, 2) -- clay

-- mortar
product = pottery:addProduct(catId, 58, 1)
product:addIngredient(26, 8) -- clay

-- clay mug
product = pottery:addProduct(catId, 2183, 1)
product:addIngredient(26, 4) -- clay

-- clay cup
product = pottery:addProduct(catId, 2184, 1)
product:addIngredient(26, 8) -- clay

-- mug with lid
product = pottery:addProduct(catId, 310, 1)
product:addIngredient(26, 10) -- clay

-- empty alchemy bomb
product = pottery:addProduct(catId, 1223, 2)
product:addIngredient(26, 10) -- clay
product:addIngredient(451, 1) -- topaz powder

-- vase
product = pottery:addProduct(catId, 315, 1)
product:addIngredient(26, 12) -- clay
product:addIngredient(452, 2) -- diamond powder
product:addIngredient(447, 1) -- ruby powder

M.pottery = pottery
return M
