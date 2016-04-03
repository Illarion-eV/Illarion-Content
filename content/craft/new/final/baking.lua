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

local baking = Craft {
    name = {english = "Baking", german = "Backen"},
    handTool = "peel",
    staticTool = "bakingOvenOne",
    --staticTool = "bakingOvenTwo",
    skill = "baking",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Baking", german = "Backwaren"},
Product {item = "breadRoll", Ingredient {item = "flour", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "cookies", Ingredient {item = "flour", amount = 2}, Ingredient {item = "honeycomb", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "bakedPotato", Ingredient {item = "potato", amount = 3}, Ingredient {item = "cheese", amount = 1}},
Product {item = "bread", Ingredient {item = "flour", amount = 4}, Ingredient {item = "potato", amount = 3}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "sausageOnBread", Ingredient {item = "flour", amount = 4}, Ingredient {item = "sausage", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "bananaBread", Ingredient {item = "flour", amount = 3}, Ingredient {item = "bottleOfBananaJuice", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "emptyJuiceBottle", amount = 1}},
Product {item = "blackberryMuffin", Ingredient {item = "flour", amount = 3}, Ingredient {item = "honeycomb", amount = 2}, Ingredient {item = "blackberry", amount = 10}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "applePie", Ingredient {item = "flour", amount = 4}, Ingredient {item = "honeycomb", amount = 2}, Ingredient {item = "apple", amount = 15}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "cherryCake", Ingredient {item = "flour", amount = 4}, Ingredient {item = "honeycomb", amount = 3}, Ingredient {item = "cherries", amount = 15}, Ingredient {item = "nuts", amount = 5}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "eggSaladSandwich", Ingredient {item = "flour", amount = 1}, Ingredient {item = "eggSalad", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "soupBowl", amount = 1}},
Product {item = "strawberryCake", Ingredient {item = "flour", amount = 4}, Ingredient {item = "honeycomb", amount = 3}, Ingredient {item = "strawberry", amount = 20}, Ingredient {item = "whiteEgg", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "nutbread", Ingredient {item = "flour", amount = 4}, Ingredient {item = "honeycomb", amount = 3}, Ingredient {item = "nuts", amount = 20}, Ingredient {item = "whiteEgg", amount = 3}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "custardPie", Ingredient {item = "flour", amount = 2}, Ingredient {item = "whiteEgg", amount = 10}, Ingredient {item = "sugarcane", amount = 4}, Ingredient {item = "bottleOfMilk", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "largeEmptyBottle", amount = 1}},
Product {item = "elderberryPie", Ingredient {item = "flour", amount = 6}, Ingredient {item = "redElder", amount = 20}, Ingredient {item = "berries", amount = 5}, Ingredient {item = "orange", amount = 5}, Ingredient {item = "sugarcane", amount = 4}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}}
} 
}
return baking