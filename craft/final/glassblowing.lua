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

local glassblowing = crafts.Craft:new{
                          craftEN = "Glass Blowing",
                          craftDE = "Glasblasen",
                          handTool = 311,
                          leadSkill = Character.glassBlowing,
                          sfx = 7,
                          sfxDuration = 80,
                        }

glassblowing:addTool(313) -- glass melting oven

local product
local catId

catId = glassblowing:addCategory("Bottles", "Flaschen")

-- large empty bottle
product = glassblowing:addProduct(catId, 2498, 1)
product:addIngredient(41, 1) -- glass ingot

-- empty juice bottle
product = glassblowing:addProduct(catId, 790, 1)
product:addIngredient(41, 1) -- glass ingot

-- empty rum bottle
product = glassblowing:addProduct(catId, 518, 1)
product:addIngredient(41, 1) -- glass ingot

-- oil bottle
product = glassblowing:addProduct(catId, 390, 1)
product:addIngredient(41, 2) -- glass ingot

-- empty liquor bottle
product = glassblowing:addProduct(catId, 1317, 1)
product:addIngredient(41, 2) -- glass ingot

-- empty ink bottle
product = glassblowing:addProduct(catId, 1117, 1)
product:addIngredient(41, 2) -- glass ingot

-- empty potion
product = glassblowing:addProduct(catId, 164, 1)
product:addIngredient(41, 3) -- glass ingot

catId = glassblowing:addCategory("Glasses", "Gläser")

-- glass
product = glassblowing:addProduct(catId, 2055, 1)
product:addIngredient(41, 2) -- glass ingot
product:addIngredient(446, 1) -- sapphire powder

-- wine glass
product = glassblowing:addProduct(catId, 2457, 1)
product:addIngredient(41, 4) -- glass ingot
product:addIngredient(449, 1) -- obsidian powder

-- glass mug
product = glassblowing:addProduct(catId, 1908, 1)
product:addIngredient(41, 4) -- glass ingot
product:addIngredient(448, 1) -- emerald powder

catId = glassblowing:addCategory("Other", "Sonstiges")

-- empty salve jar
product = glassblowing:addProduct(catId, 3642, 1)
product:addIngredient(41, 10) -- glass ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(450, 1) -- amethyst powder

M.glassblowing = glassblowing
return M
