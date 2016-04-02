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

local brewing = Craft {
    name = {english = "Brewing", german = "Brauen"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "brewing",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 10, sfxDuration = 1.7,

ProductGroup {name = {english = "Brewing", german = "Getränke"},
Product {item = "bottleOfCider", Ingredient {item = "largeEmptyBottle", amount = 1}, Ingredient {item = "apple", amount = 6}},
Product {item = "bottleOfWine", Ingredient {item = "largeEmptyBottle", amount = 1}, Ingredient {item = "grapes", amount = 5}},
Product {item = "bottleOfMead", Ingredient {item = "largeEmptyBottle", amount = 1}, Ingredient {item = "honeycomb", amount = 1}},
Product {item = "bottleOfBeer", Ingredient {item = "largeEmptyBottle", amount = 1}, Ingredient {item = "hop", amount = 2}, Ingredient {item = "grain", amount = 1}},
Product {item = "bottleOfBananaJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "banana", amount = 3}, Ingredient {item = "sugarcane", amount = 1}},
Product {item = "bottleOfFirNeedleTea", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "firTreeSprout", amount = 3}, Ingredient {item = "sugarcane", amount = 1}},
Product {item = "bottleOfVirginsWeedTea", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "virginsWeed", amount = 3}, Ingredient {item = "sugarcane", amount = 1}},
Product {item = "bottleOfGrapeJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "grapes", amount = 3}, Ingredient {item = "sugarcane", amount = 2}},
Product {item = "bottleOfCabbageJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "cabbage", amount = 3}, Ingredient {item = "sugarcane", amount = 1}},
Product {item = "bottleOfCarrotJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "carrots", amount = 3}, Ingredient {item = "sugarcane", amount = 1}},
Product {item = "bottleOfRum", Ingredient {item = "emptyRumBottle", amount = 1}, Ingredient {item = "sugarcane", amount = 3}},
Product {item = "bottleOfBlackberryJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "blackberry", amount = 5}, Ingredient {item = "sugarcane", amount = 2}},
Product {item = "bottleOfGreenTea", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "rottenTreeBark", amount = 3}, Ingredient {item = "sugarcane", amount = 2}, Ingredient {item = "tangerine", amount = 2}},
Product {item = "bottleOfTangerineJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "tangerine", amount = 5}, Ingredient {item = "sugarcane", amount = 2}},
Product {item = "bottleOfStrawberryJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "strawberry", amount = 5}, Ingredient {item = "sugarcane", amount = 2}},
Product {item = "bottleOfDruidsTea", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "firnisBlossom", amount = 3}, Ingredient {item = "sugarcane", amount = 1}, Ingredient {item = "footLeaf", amount = 2}, Ingredient {item = "heathFlower", amount = 3}},
Product {item = "bottleOfOrangeJuice", Ingredient {item = "emptyJuiceBottle", amount = 1}, Ingredient {item = "orange", amount = 5}, Ingredient {item = "sugarcane", amount = 3}},
Product {item = "bottleOfBearSlayer", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "honeycomb", amount = 1}, Ingredient {item = "toadstool", amount = 1}, Ingredient {item = "apple", amount = 1}},
Product {item = "bottleOfBerryBooze", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "berries", amount = 4}, Ingredient {item = "blackberry", amount = 3}},
Product {item = "bottleOfStoneFace", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "grapes", amount = 3}, Ingredient {item = "apple", amount = 2}, Ingredient {item = "sugarcane", amount = 2}},
Product {item = "bottleOfAbsinthe", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "sugarcane", amount = 1}, Ingredient {item = "heathFlower", amount = 3}, Ingredient {item = "sandberry", amount = 3}},
Product {item = "bottleOfOrangeSchnapps", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "orange", amount = 3}, Ingredient {item = "sugarcane", amount = 3}},
Product {item = "bottleOfCherrySchnapps", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "cherries", amount = 5}, Ingredient {item = "sugarcane", amount = 3}},
Product {item = "bottleOfMulledWine", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "grapes", amount = 5}, Ingredient {item = "sugarcane", amount = 3}},
Product {item = "bottleOfElvenWine", Ingredient {item = "emptyLiquorBottle", amount = 1}, Ingredient {item = "banana", amount = 5}, Ingredient {item = "sugarcane", amount = 1}, Ingredient {item = "nuts", amount = 3}}
}
}
return brewing