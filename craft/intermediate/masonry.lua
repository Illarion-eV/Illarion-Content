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

local masonry = crafts.Craft:new{
                    craftEN = "Masonry",
                    craftDE = "Steinmetzkunst",
                    handTool = 737,
                    leadSkill = Character.mining,
                    sfx = 8,
                    sfxDuration = 27,
                  }

masonry:addTool(3830) -- stone working table
masonry:addTool(3831) -- stone working table

local catId = masonry:addCategory("Stones", "Steine")

-- Stone block
local product = masonry:addProduct(catId, 733, 1)
product:addIngredient(735) -- raw stone

-- Stone
local product = masonry:addProduct(catId, 1266, 10)
product:addIngredient(733) -- stone block

M.masonry = masonry
return M
