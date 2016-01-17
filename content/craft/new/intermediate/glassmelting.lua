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
local Craft = require("base.crafting.Craft")
local ProductGroup = require("base.crafting.ProductGroup")
local Product = require("base.crafting.Product")
local Ingredient = require("base.crafting.Ingredient")

local glassmelting = Craft {
    name = {english = "Glass melting", german = "GERMAN"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "SKILL",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Glass ingots", german = "Glasbarren"},
Product {item = "glassIngot", Ingredient {item = "quartzSand", amount = 1}, Ingredient {item = "potash", amount = 1}}
}
}

return glassmelting