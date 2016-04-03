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

local pottery = Craft {
    name = {english = "Pottery", german = "Töpfern"},
    handTool = "tongs",
    staticTool = {inactive = "kilnOneOff", active = "kilnOneOn"},
    --staticTool = {inactive = "kilnTwoOff", active = "kilnTwoOn"},
    skill = "pottery",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Pottery", german = "Töpfern"},
Product {item = "bricks", Ingredient {item = "clay", amount = 2}},
Product {item = "mortar", Ingredient {item = "clay", amount = 2}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "clayMug", Ingredient {item = "clay", amount = 4}},
Product {item = "clayCup", Ingredient {item = "clay", amount = 2}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "mugWithLid", Ingredient {item = "clay", amount = 4}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "vase", Ingredient {item = "clay", amount = 10}, Ingredient {item = "emeraldPowder", amount = 1}}
}
}
return pottery