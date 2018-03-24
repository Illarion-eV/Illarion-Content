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

local candledipping = crafts.Craft:new{
                    craftEN = "Candle dipping",
                    craftDE = "Kerzenziehen",
                    handTool = 429,
                    leadSkill = Character.husbandry,
                    sfx = 7,
                    sfxDuration = 80,
                  }

candledipping:addTool(428) -- chandler's table

local catId = candledipping:addCategory("Candles", "Kerzen")

-- Candles
local product = candledipping:addProduct(catId, 43, 1)
product:addIngredient(431 , 1) -- wax

M.candledipping = candledipping
return M
