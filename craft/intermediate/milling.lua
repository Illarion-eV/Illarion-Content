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

local milling = crafts.Craft:new{
                    craftEN = "Milling",
                    craftDE = "Mahlen",
                    handTool = 312,
                    leadSkill = Character.farming,
                    sfx = 16,
                    sfxDuration = 27,
                  }

milling:addTool(250) -- millstone

local catId = milling:addCategory("Flour", "Mehl")

-- Flour
local product = milling:addProduct(catId, 2, 1)
product:addIngredient(259 , 2) -- grain

M.milling = milling
return M
