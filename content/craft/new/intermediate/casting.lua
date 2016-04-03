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

local casting = Craft {
    name = {english = "Casting", german = "Gieﬂen"},
    handTool = "cruciblePincers",
    staticTool = {inactive = "furnaceOneOff", active = "furnaceOneOn"},
    --staticTool = {inactive = "furnaceTwoOff", active = "furnaceTwoOn"},
    skill = "mining",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Ingots", german = "Barren"},
Product {item = "ironIngot", Ingredient {item = "ironOre", amount = 1}, Ingredient {item = "coal", amount = 1}},
Product {item = "copperIngot", Ingredient {item = "copperOre", amount = 1}, Ingredient {item = "coal", amount = 1}},
Product {item = "silverIngot", Ingredient {item = "silverOre", amount = 1}, Ingredient {item = "coal", amount = 1}},
Product {item = "goldIngot", Ingredient {item = "goldNuggets", amount = 1}, Ingredient {item = "coal", amount = 1}},
Product {item = "meriniumIngot", Ingredient {item = "meriniumOre", amount = 1}, Ingredient {item = "coal", amount = 1}}
}
}

return casting