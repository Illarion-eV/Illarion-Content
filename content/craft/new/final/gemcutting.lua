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

local gemcutting = Craft {
    name = {english = "Gem cutting", german = "Edelsteinschleifen"},
    handTool = "tongs",
    staticTool = "gemGrinder",
    skill = "gemcutting",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 16, sfxDuration = 1.7,
    
ProductGroup {name = {english = "Gems", german = "Edelsteine"},
Product {item = "ruby", Ingredient {item = "rawRuby", amount = 1}},
Product {item = "amethyst", Ingredient {item = "rawAmethyst", amount = 1}},
Product {item = "obsidian", Ingredient {item = "rawObsidian", amount = 1}},
Product {item = "sapphire", Ingredient {item = "rawSapphire", amount = 1}},
Product {item = "emerald", Ingredient {item = "rawEmerald", amount = 1}},
Product {item = "topaz", Ingredient {item = "rawTopaz", amount = 1}},
Product {item = "diamond", Ingredient {item = "rawDiamond", amount = 1}}
},

ProductGroup {name = {english = "Gem powder", german = "Edelsteinstaub"},
Product {item = "rubyPowder", Ingredient {item = "ruby", amount = 2}},
Product {item = "amethystPowder", Ingredient {item = "amethyst", amount = 2}},
Product {item = "sapphirePowder", Ingredient {item = "sapphire", amount = 2}},
Product {item = "obsidianPowder", Ingredient {item = "obsidian", amount = 2}},
Product {item = "emeraldPowder", Ingredient {item = "emerald", amount = 2}},
Product {item = "topazPowder", Ingredient {item = "topaz", amount = 2}},
Product {item = "diamondPowder", Ingredient {item = "diamond", amount = 2}}
}
}

return gemcutting