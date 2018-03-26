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

local casting = crafts.Craft:new{
                    craftEN = "Casting",
                    craftDE = "Gieﬂen",
                    handTool = 2751,
                    leadSkill = Character.mining,
                    sfx = 7,
                    sfxDuration = 80,
                  }

casting:addTool(3869) -- bloomery
casting:addTool(3870) -- bloomery

local catId = casting:addCategory("Ingots", "Barren")

-- Iron Ingot
local product = casting:addProduct(catId, 2535, 1)
product:addIngredient(22) -- iron ore
product:addIngredient(21) -- coal

-- Copper Ingot
local product = casting:addProduct(catId, 2550, 1)
product:addIngredient(2536) -- copper ore
product:addIngredient(21) -- coal

-- Silver Ingot
local product = casting:addProduct(catId, 104, 1)
product:addIngredient(1062) -- silver ore
product:addIngredient(21) -- coal

-- Gold Ingot
local product = casting:addProduct(catId, 236, 1)
product:addIngredient(234) -- gold nugget
product:addIngredient(21) -- coal

-- Merinium Ingot
local product = casting:addProduct(catId, 2571, 1)
product:addIngredient(2534) -- merinium ore
product:addIngredient(21) -- coal

M.casting = casting
return M
