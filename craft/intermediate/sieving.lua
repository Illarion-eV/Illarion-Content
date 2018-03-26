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
local potashmaking = require("craft.intermediate.potashmaking")

local M = {}

local sieving = crafts.Craft:new{
                    craftEN = "Sieving",
                    craftDE = "Sieben",
                    handTool = 312,
                    leadSkill = Character.digging,
                    sfx = 16,
                    sfxDuration = 27,
                    fallbackCraft = potashmaking.potashmaking,
                  }

sieving:addTool(727) -- sieve

local catId = sieving:addCategory("Sand", "Sand")

-- Quartz sand
local product = sieving:addProduct(catId, 316, 1)
product:addIngredient(726) -- coarse sand

M.sieving = sieving
return M
