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

local sawing = crafts.Craft:new{
                    craftEN = "Sawing",
                    craftDE = "Sägen",
                    handTool = 9,
                    leadSkill = Character.woodcutting,
                    sfx = 11,
                    sfxDuration = 27,
                  }

sawing:addTool(1204) -- sawing trestle
sawing:addTool(1205) -- sawing trestle

local catId = sawing:addCategory("Boards", "Bretter")

-- Cherry wood board
local product = sawing:addProduct(catId, 545, 1)
product:addIngredient(543) -- cherry wood

-- Naldor wood board
local product = sawing:addProduct(catId, 546, 1)
product:addIngredient(544) -- naldor wood

-- Conifer wood board
local product = sawing:addProduct(catId, 2543, 1)
product:addIngredient(3) -- conifer wood

-- Apple wood board
local product = sawing:addProduct(catId, 2716, 1)
product:addIngredient(2560) -- apple wood

M.sawing = sawing
return M
