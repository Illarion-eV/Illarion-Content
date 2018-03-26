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

local dyemaking = crafts.Craft:new{
                    craftEN = "Dyemaking",
                    craftDE = "Farbenherstellung",
                    handTool = 58,
                    leadSkill = Character.tanningAndWeaving,
                    sfx = 10,
                    sfxDuration = 27,
                  }

dyemaking:addTool(1226) -- dye barrel

local catId = dyemaking:addCategory("Dyes", "Färbemittel")

-- White Dye
local product = dyemaking:addProduct(catId, 2683, 1)
product:addIngredient(161 , 2) -- herder's mushroom
product:addIngredient(52) -- Water bucket

-- Red Dye
product = dyemaking:addProduct(catId, 2681, 1)
product:addIngredient(302, 4) -- Cherries
product:addIngredient(52) -- Water bucket

-- Green Dye
product = dyemaking:addProduct(catId, 2679, 1)
product:addIngredient(290, 1) -- Cabbage
product:addIngredient(52) -- Water bucket

-- Black Dye
product = dyemaking:addProduct(catId, 2678, 1)
product:addIngredient(136, 2) -- Anger berry
product:addIngredient(52) -- Water bucket

-- Yellow Dye
product = dyemaking:addProduct(catId, 2682, 1)
product:addIngredient(135, 2) -- Yellow Weed
product:addIngredient(52) -- Water bucket

-- Blue Dye
product = dyemaking:addProduct(catId, 2680, 1)
product:addIngredient(753, 2) -- Blue Bird's Berry
product:addIngredient(52) -- Water bucket

M.dyemaking = dyemaking
return M
