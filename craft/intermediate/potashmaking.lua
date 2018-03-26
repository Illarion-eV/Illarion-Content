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
local milling = require("craft.intermediate.milling")

local M = {}

local potashmaking = crafts.Craft:new{
                    craftEN = "Potash making",
                    craftDE = "Pottaschenproduktion",
                    handTool = 312,
                    leadSkill = Character.woodcutting,
                    sfx = 7,
                    sfxDuration = 27,
                    fallbackCraft = milling.milling
                  }

potashmaking:addTool(313) -- oven


local catId = potashmaking:addCategory("Potash from Cherry Wood", "Kirschholzasche")

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(543) -- cherry wood

local catId = potashmaking:addCategory("Potash from Naldor Wood", "Naldorholzasche")

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(544) -- naldor wood

local catId = potashmaking:addCategory("Potash from Conifer Wood", "Nadelholzasche")

-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(3) -- confier wood

local catId = potashmaking:addCategory("Potash from Apple Wood", "Apfelholzasche")
-- Potash
local product = potashmaking:addProduct(catId, 314, 1)
product:addIngredient(2560) -- apple wood

M.potashmaking = potashmaking
return M
