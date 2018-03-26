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

local threshing = crafts.Craft:new{
                    craftEN = "Threshing",
                    craftDE = "Dreschen",
                    handTool = 258,
                    leadSkill = Character.farming,
                    sfx = 41,
                    sfxDuration = 10,
                  }

threshing:addTool(3879) -- threshing floor

local catId = threshing:addCategory("Grain", "Getreide")

-- Grain
local product = threshing:addProduct(catId, 259, 2)
product:addIngredient(249) -- bundle of grain

M.threshing = threshing
return M
