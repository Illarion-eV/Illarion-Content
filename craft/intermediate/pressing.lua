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
                    intermediate = true
                  }

pressing:addTool(44) -- press

local catId = pressing:addCategory("Pressing", "Pressen")

local product = pressing:addProduct(catId, Item.lampOil, 1)
product:addIngredient(Item.blackThistle , 1) -- black thistle
product:addIngredient(Item.oilBottle) -- empty oil bottle

product = pressing:addProduct(catId, Item.wax, 1)
product:addIngredient(Item.honeycomb, 2)

product = pressing:addProduct(catId, Item.beeHoney, 1)
product:addIngredient(Item.honeycomb, 1)
product:addIngredient(Item.emptyHoneyJar)

product = pressing:addProduct(catId, Item.firewaspHoney, 1)
product:addIngredient(Item.firewaspHoneycomb, 1)
product:addIngredient(Item.emptyHoneyJar)

M.pressing = pressing
return M
