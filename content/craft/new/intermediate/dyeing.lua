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

local dyeing = Craft {
    name = {english = "Dyeing", german = "Färben"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "tanningAndWeaving",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 10, sfxDuration = 1.7,

ProductGroup {name = {english = "Clothes", german = "Stoffe"},
Product {item = "greenCloth", Ingredient {item = "greenDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}},
Product {item = "redCloth", Ingredient {item = "redDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}},
Product {item = "blackCloth", Ingredient {item = "blackDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}},
Product {item = "greyCloth", Ingredient {item = "baleOfWool", amount = 1}},
Product {item = "yellowCloth", Ingredient {item = "yellowDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}},
Product {item = "whiteCloth", Ingredient {item = "whiteDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}},
Product {item = "blueCloth", Ingredient {item = "blueDye", amount = 1}, Ingredient {item = "greyCloth", amount = 5}, Remnant {item = "bucket", amount = 1}}
}
}

return dyeing