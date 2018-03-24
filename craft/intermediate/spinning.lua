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

local spinning = crafts.Craft:new{
                    craftEN = "Spinning",
                    craftDE = "Spinnen",
                    handTool = 6,
                    leadSkill = Character.tanningAndWeaving,
                  }

spinning:addTool(171) -- spinning wheel

local catId = spinning:addCategory("Thread", "Garn")

-- Thread
local product = spinning:addProduct(catId, 50, 1)
product:addIngredient(170) -- bale of wool

M.spinning = spinning
return M
