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
local spinning = require("craft.intermediate.spinning")

local M = {}

local weaving = crafts.Craft:new{
                    craftEN = "Weaving",
                    craftDE = "Weben",
                    handTool = 6,
                    leadSkill = Character.tanningAndWeaving,
                    fallbackCraft = spinning.spinning,
                  }

weaving:addTool(169) -- loom

local catId = weaving:addCategory("Clothes", "Stoffe")

-- Grey cloth
local product = weaving:addProduct(catId, 176, 1)
product:addIngredient(170) -- bale of wool

M.weaving = weaving
return M
