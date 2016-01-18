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

local cooking = Craft {
    name = {english = "Cooking", german = "Kochen"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "cookingAndBaking",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Dishes", german = "Gerichte"},
Product {item = "sausage", Ingredient {item = "entrails", amount = 1}, Ingredient {item = "pork", amount = 1}},
Product {item = "cheese", Ingredient {item = "bottleOfMilk", amount = 1},Remnant {item = "largeEmptyBottle", amount = 1}},
Product {item = "grilledLamb", Ingredient {item = "lambMeat", amount = 1}},
Product {item = "grilledSteak", Ingredient {item = "rawSteak", amount = 1}},
Product {item = "grilledVenison", Ingredient {item = "deerMeat", amount = 1}},
Product {item = "veggieHash", Ingredient {item = "plate", amount = 1}, Ingredient {item = "potato", amount = 1}, Ingredient {item = "onion", amount = 1}, Ingredient {item = "carrots", amount = 1}},
Product {item = "mysteryMeat", Ingredient {item = "plate", amount = 1}, Ingredient {item = "potato", amount = 1}, Ingredient {item = "onion", amount = 1}, Ingredient {item = "carrots", amount = 1}},
Product {item = "troutFilletDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "trout", amount = 1}, Ingredient {item = "cabbage", amount = 1}, Ingredient {item = "tomato", amount = 1}},
Product {item = "salmonDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "salmon", amount = 1}, Ingredient {item = "onion", amount = 1}, Ingredient {item = "tomato", amount = 1}},
Product {item = "eggDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "sausage", amount = 1}, Ingredient {item = "whiteEgg", amount = 2}},
Product {item = "meatDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "ham", amount = 1}, Ingredient {item = "onion", amount = 1}, Ingredient {item = "carrots", amount = 1}},
Product {item = "eggSalad", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "whiteEgg", amount = 5}, Ingredient {item = "onion", amount = 1}, Ingredient {item = "cheese", amount = 1}},
Product {item = "sausagesDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "sausage", amount = 2}, Ingredient {item = "cabbage", amount = 2}, Ingredient {item = "carrots", amount = 2}},
Product {item = "steakDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "grilledSteak", amount = 2}, Ingredient {item = "tomato", amount = 2}, Ingredient {item = "onion", amount = 2}},
Product {item = "rabbitDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "smokedRabbit", amount = 3}, Ingredient {item = "cabbage", amount = 3}, Ingredient {item = "carrots", amount = 3}},
Product {item = "lambDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "grilledLamb", amount = 1}, Ingredient {item = "tomato", amount = 2}, Ingredient {item = "carrots", amount = 2}, Ingredient {item = "onion", amount = 2}},
Product {item = "venisonDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "grilledVenison", amount = 2}, Ingredient {item = "berries", amount = 5}, Ingredient {item = "carrots", amount = 3}, Ingredient {item = "cabbage", amount = 3}},
Product {item = "chickenDish", Ingredient {item = "plate", amount = 1}, Ingredient {item = "smokedChicken", amount = 1}, Ingredient {item = "cabbage", amount = 2}, Ingredient {item = "carrots", amount = 2}, Ingredient {item = "bottleOfRum", amount = 1},Remnant {item = "emptyRumBottle", amount = 1}}
},

ProductGroup {name = {english = "Soups", german = "Suppen"},
Product {item = "mushroomSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "champignon", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "onionSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "onion", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "cabbageStew", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "cabbage", amount = 7}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "mulligan", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "onion", amount = 2}, Ingredient {item = "tomato", amount = 2}, Ingredient {item = "carrots", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "potatoSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "potato", amount = 4}, Ingredient {item = "onion", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1}},
Product {item = "fishSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "bottleOfMilk", amount = 1}, Ingredient {item = "horseMackerel", amount = 2}, Ingredient {item = "salmon", amount = 2}, Ingredient {item = "carrots", amount = 3}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "largeEmptyBottle", amount = 1}},
Product {item = "beerSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "bottleOfBeer", amount = 1}, Ingredient {item = "potato", amount = 2}, Ingredient {item = "onion", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "largeEmptyBottle", amount = 1}},
Product {item = "goulash", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "bottleOfWine", amount = 1}, Ingredient {item = "deerMeat", amount = 2}, Ingredient {item = "carrots", amount = 2}, Ingredient {item = "tomato", amount = 2}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "largeEmptyBottle", amount = 1}},
Product {item = "chickenSoup", Ingredient {item = "soupBowl", amount = 1}, Ingredient {item = "chickenMeat", amount = 1}, Ingredient {item = "onion", amount = 2}, Ingredient {item = "flour", amount = 1}, Ingredient {item = "bottleOfCarrotJuice", amount = 1}, Ingredient {item = "bucketOfWater", amount = 1},Remnant {item = "bucket", amount = 1},Remnant {item = "emptyJuiceBottle", amount = 1}}
}
}
return cooking