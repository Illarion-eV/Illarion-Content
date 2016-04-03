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

local sawing = Craft {
    name = {english = "Sawing", german = "Sägen"},
    handTool = "saw",
    staticTool = "sawingTrestleOne",
    --staticTool = "sawingTrestleTwo",
    skill = "lumberjacking",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 11, sfxDuration = 1.7,

ProductGroup {name = {english = "Boards", german = "Bretter"},
Product {item = "cherryWoodBoards", Ingredient {item = "cherryWood", amount = 1}},
Product {item = "naldorWoodBoards", Ingredient {item = "naldorWood", amount = 1}},
Product {item = "coniferWoodBoards", Ingredient {item = "coniferWood", amount = 1}},
Product {item = "appleWoodBoards", Ingredient {item = "applewood", amount = 1}}
}
}

return sawing