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
local crafts = require("item.base.crafts")

module("content.craft.dyemaking", package.seeall)

dyemaking = crafts.Craft:new{
                    craftEN = "Dyemaking",
                    craftDE = "Farbenherstellung",
                    handTool = 58,
                    leadSkill = Character.tailoring,
                    defaultFoodConsumption = 100,
                  }

dyemaking:addTool(12) -- camp fire


local catId = dyemaking:addCategory("Dyes", "Farbstoffe")

--White Dye
local product = dyemaking:addProduct(catId, 2683, 0, 20, 20, 40)
product:addIngredient(161 , 3) -- herder's mushroom: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Red Dye
product = dyemaking:addProduct(catId, 2681, 0, 20, 20, 40)
product:addIngredient(302, 3) -- Cherries: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Green Dye
product = dyemaking:addProduct(catId, 2679, 5, 25, 24, 48)
product:addIngredient(290, 3) -- Cabbage: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Black Dye
product = dyemaking:addProduct(catId, 2678, 10, 30, 28, 56)
product:addIngredient(136, 3) -- Anger berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Yellow Dye
product = dyemaking:addProduct(catId, 2682, 15, 35, 36, 72)
product:addIngredient(135, 3) -- Yellow Weed: 3x1
product:addIngredient(52) -- Water bucket: 1x1

--Blue Dye
product = dyemaking:addProduct(catId, 2680, 20, 40, 40, 80)
product:addIngredient(753, 3) -- Blue Bird's Berry: 3x1
product:addIngredient(52) -- Water bucket: 1x1
