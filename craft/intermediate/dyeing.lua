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
local dyemaking = require("craft.intermediate.dyemaking")

local M = {}

local dyeing = crafts.Craft:new{
                    craftEN = "Dyeing",
                    craftDE = "F�rben",
                    handTool = 2781,
                    leadSkill = Character.tanningAndWeaving,
                    sfx = 10,
                    sfxDuration = 27,
                    fallbackCraft = dyemaking.dyemaking
                  }

dyeing:addTool(1226) -- dye barrel

local catId = dyeing:addCategory("Cloths", "Stoffe")

-- White cloth
local product = dyeing:addProduct(catId, 178, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2683) -- white dye

-- Red cloth
product = dyeing:addProduct(catId, 174, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2681) -- red dye

-- Green cloth
product = dyeing:addProduct(catId, 54, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2679) -- green dye

-- Black cloth
product = dyeing:addProduct(catId, 175, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2678) -- black dye

-- Yellow cloth
product = dyeing:addProduct(catId, 177, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2682) -- yellow dye

-- Blue cloth
product = dyeing:addProduct(catId, 179, 5)
product:addIngredient(176, 5) -- grey cloth
product:addIngredient(2680) -- blue dye

M.dyeing = dyeing
return M
