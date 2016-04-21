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

local roasting = Craft {
    name = {english = "Roasting", german = "Braten"},
    handTool = "pan",
    staticTool = "smokeOvenOne",
    --staticTool = "smokeOvenTwo",
    skill = "husbandry",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Food", german = "Essen"},
Product {item = "ham", Ingredient {item = "pork", amount = 1}},
Product {item = "smokedFish", Ingredient {item = "roseFish", amount = 1}},
Product {item = "smokedFish", Ingredient {item = "salmon", amount = 1}},
Product {item = "smokedFish", Ingredient {item = "horseMackerel", amount = 1}},
Product {item = "smokedFish", Ingredient {item = "trout", amount = 1}},
Product {item = "smokedChicken", Ingredient {item = "chickenMeat", amount = 1}},
Product {item = "smokedRabbit", Ingredient {item = "rabbitMeat", amount = 1}},
Product {item = "grilledLamb", Ingredient {item = "lambMeat", amount = 1}},
Product {item = "grilledVenison", Ingredient {item = "deerMeat", amount = 1}},
Product {item = "grilledSteak", Ingredient {item = "rawSteak", amount = 1}}
}
}

return roasting