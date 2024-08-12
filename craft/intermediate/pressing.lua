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

local pressing = crafts.Craft:new{
                    craftEN = "Pressing",
                    craftDE = "Pressen",
                    handTool = 2031,
                    leadSkill = Character.husbandry,
                    sfx = 10,
                    sfxDuration = 27,
                  }

pressing:addTool(44) -- press

local catId = pressing:addCategory("Lamp oil", "Lampen�l")

-- Lamp oil
local product = pressing:addProduct(catId, 469, 1)
product:addIngredient(141 , 2) -- black thistle
product:addIngredient(390) -- empty oil bottle

catId = pressing:addCategory("Wax", "Wachs")

-- Wax
product = pressing:addProduct(catId, 431, 1)
product:addIngredient(Item.honeycomb, 2)

catId = pressing:addCategory("Honey", "Honig")

product = pressing:addProduct(catId, Item.beeHoney, 1)
product:addIngredient(Item.honeycomb, 1)
product:addIngredient(Item.emptyHoneyJar)

product = pressing:addProduct(catId, Item.firewaspHoney, 1)
product:addIngredient(Item.firewaspHoneycomb, 1)
product:addIngredient(Item.emptyHoneyJar)

M.pressing = pressing
return M
