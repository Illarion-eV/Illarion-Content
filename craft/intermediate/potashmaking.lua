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

module("craft.intermediate.potashmaking", package.seeall)

potashmaking = crafts.Craft:new{
                    craftEN = "Potash making",
                    craftDE = "Pottaschenproduktion",
                    handTool = 312,
                    leadSkill = Character.lumberjacking,
                    sfx = 7,
                    sfxDuration = 27,
                  }

potashmaking:addTool(313) -- baking oven

local catId = potashmaking:addCategory("Potash", "Pottasche")

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(543) -- cherry wood

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(544) -- naldor wood

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(3) -- confier wood

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(2560) -- apple wood