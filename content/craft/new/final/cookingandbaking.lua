local Craft = require("base.crafting.Craft")
local ProductGroup = require("base.crafting.ProductGroup")
local Product = require("base.crafting.Product")
local Ingredient = require("base.crafting.Ingredient")

local cookingandbaking = Craft {
    name = {english = "Cooking and baking", german = "GERMAN"}
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"}
    skill = "SKILL",
    defaultFoodConsumption = NO_DEFAULT,
    [sfx = ID,
    sfxDuration = TIME,]

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
}

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
return cookingandbaking