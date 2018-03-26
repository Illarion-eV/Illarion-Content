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

local glassmelting = crafts.Craft:new{
                    craftEN = "Glass melting",
                    craftDE = "Glasschmelzen",
                    handTool = 2710,
                    leadSkill = Character.digging,
                    sfx = 7,
                    sfxDuration = 27,
                  }

glassmelting:addTool(313) -- glass melting oven

local catId = glassmelting:addCategory("Glass", "Glas")

-- Glass ingot
local product = glassmelting:addProduct(catId, 41, 1)
product:addIngredient(316) -- quartz sand
product:addIngredient(314) -- potash

M.glassmelting = glassmelting
return M
