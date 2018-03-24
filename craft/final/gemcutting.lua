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
local pottery = require("craft.final.pottery")

local M = {}

local gemcutting = crafts.Craft:new{
                          craftEN = "Gemcutting",
                          craftDE = "Edelsteinschleifen",
                          handTool = 2140,
                          leadSkill = Character.gemcutting,
                          fallbackCraft = pottery.pottery,
                          sfx = 16,
                          sfxDuration = 27,
                        }

gemcutting:addTool(270)  -- cutting stone

local product
local catId

catId = gemcutting:addCategory("Gems", "Edelsteine")

-- amethyst
product = gemcutting:addProduct(catId, 197, 1)
product:addIngredient(251, 1) -- raw amethyst

-- ruby
product = gemcutting:addProduct(catId, 46, 1)
product:addIngredient(255, 1) -- raw ruby

-- sapphire
product = gemcutting:addProduct(catId, 284, 1)
product:addIngredient(253, 1) -- raw sapphire

-- obsidian
product = gemcutting:addProduct(catId, 283, 1)
product:addIngredient(252, 1) -- raw obsidian

-- emerald
product = gemcutting:addProduct(catId, 45, 1)
product:addIngredient(256, 1) -- raw emerald

-- topaz
product = gemcutting:addProduct(catId, 198, 1)
product:addIngredient(257, 1) -- raw topaz

-- diamond
product = gemcutting:addProduct(catId, 285, 1)
product:addIngredient(254, 1) -- raw diamond

catId = gemcutting:addCategory("Gem powder", "Edelsteinstaub")

-- amethyst powder
product = gemcutting:addProduct(catId, 450, 1)
product:addIngredient(197, 1) -- amethyst

-- ruby powder
product = gemcutting:addProduct(catId, 447, 1)
product:addIngredient(46, 1) -- ruby

-- sapphire powder
product = gemcutting:addProduct(catId, 446, 1)
product:addIngredient(284, 1) -- sapphire

-- obsidian powder
product = gemcutting:addProduct(catId, 449, 1)
product:addIngredient(283, 1) -- obsidian

-- emerald powder
product = gemcutting:addProduct(catId, 448, 1)
product:addIngredient(45, 1) -- emerald

-- topaz powder
product = gemcutting:addProduct(catId, 451, 1)
product:addIngredient(198, 1) -- topaz

-- diamond powder
product = gemcutting:addProduct(catId, 452, 1)
product:addIngredient(285, 1) -- diamond

M.gemcutting = gemcutting
return M
