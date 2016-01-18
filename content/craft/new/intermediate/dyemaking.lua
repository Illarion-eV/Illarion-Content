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

local dyemaking = Craft {
    name = {english = "Dye making", german = "Färbemittelherstellung"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "tanningAndWeaving",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 10, sfxDuration = 1.7,

ProductGroup {name = {english = "Dye", german = "Färbemittel"},
Product {item = "blackDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "angerBerry", amount = 2}},
Product {item = "greenDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "cabbage", amount = 1}},
Product {item = "blueDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "blueBirdsberry", amount = 2}},
Product {item = "redDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "cherries", amount = 4}},
Product {item = "yellowDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "yellowWeed", amount = 2}},
Product {item = "whiteDye", Ingredient {item = "bucketOfWater", amount = 1}, Ingredient {item = "herdersMushroom", amount = 2}}
}
}

return dyemaking