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

local tanning = crafts.Craft:new{
                    craftEN = "Tanning",
                    craftDE = "Gerben",
                    handTool = 2746,
                    leadSkill = Character.tanningAndWeaving,
                    sfx = 16,
                    sfxDuration = 27,
                  }

tanning:addTool(468) -- stretcher
tanning:addTool(2052) -- stretcher

local catId = tanning:addCategory("Leather", "Leder")

--White Dye
local product = tanning:addProduct(catId, 2547, 1)
product:addIngredient(69) -- raw leather

M.tanning = tanning
return M
