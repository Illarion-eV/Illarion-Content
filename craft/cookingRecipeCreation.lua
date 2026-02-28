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

local recipe_creation = require("alchemy.base.recipe_creation")
local common = require("base.common")
local bottles = require("item.bottles")

local M = {}

local plates = {
    { id = Item.woodenPlate },
    { id = Item.ceramicPlate },
    { id = Item.clayPlate },
    { id = Item.copperPlate },
    { id = Item.goldPlate },
    { id = Item.ironDishPlate },
    { id = Item.silverPlate },
    { id = Item.glassPlate }
}

local bowls = {
    { id = Item.soupBowl },
    { id = Item.ceramicBowl },
    { id = Item.clayBowl },
    { id = Item.copperBowl },
    { id = Item.glassBowl },
    { id = Item.goldBowl },
    { id = Item.ironBowl },
    { id = Item.silverBowl }
}

local doughs = {
    { id = Item.plainDough },
    { id = Item.cookieDough, level = 20 },
    { id = Item.pastryDough, level = 40 },
    { id = Item.spicyDough, level = 70 }
}

local meat = {
    { id = Item.pork, attribute = "strength" },
    { id = Item.chickenMeat, level = 10, attribute = "agility"},
    { id = Item.rawSteak, level = 20, attribute = "constitution"  },
    { id = Item.lambMeat, level = 25, attribute = "constitution"  },
    { id = Item.ratMeat, level = 30, attribute = "strength"  },
    { id = Item.rabbitMeat, level = 40, attribute = "agility"  },
    { id = Item.deerMeat, level = 50, attribute = "constitution"  },
    { id = Item.foxMeat, level = 60, attribute = "agility"  },
    { id = Item.wolfMeat, level = 70, attribute = "strength"  },
    { id = Item.bearMeat, level = 80, attribute = "constitution"  },
    { id = Item.raptorMeat, level = 90, attribute = "agility"  },
    { id = Item.dragonMeat, level = 100, attribute = "strength"  }
}

local cookedMeat = {
    { id = Item.ham, attribute = "strength"},
    { id = Item.sausage, attribute = "strength"},
    { id = Item.smokedChicken, level = 10, attribute = "agility"},
    { id = Item.grilledSteak, level = 20, attribute = "constitution"},
    { id = Item.grilledLamb, level = 25, attribute = "constitution"},
    { id = Item.grilledRat, level = 30, attribute = "strength"},
    { id = Item.smokedRabbit, level = 40, attribute = "agility"},
    { id = Item.grilledVenison, level = 50, attribute = "constitution"},
    { id = Item.grilledFox, level = 60, attribute = "agility"},
    { id = Item.grilledWolf, level = 70, attribute = "strength"},
    { id = Item.grilledBear, level = 80, attribute = "constitution"},
    { id = Item.grilledRaptor, level = 90, attribute = "agility"},
    { id = Item.grilledDragon, level = 100, attribute = "strength"}
}

local fish = {
    { id = Item.trout, attribute = "intelligence"},
    { id = Item.salmon, level = 10, attribute = "essence" },
    { id = Item.shrimp, level = 20, amount = 3, attribute = "willpower" },
    { id = Item.flounder, level = 30, attribute = "essence" },
    { id = Item.horseMackerel, level = 40, attribute = "intelligence" },
    { id = Item.roseFish, level = 50, attribute = "willpower" },
    { id = Item.crab, level = 60, attribute = "essence" },
    { id = Item.eel, level = 70, attribute = "intelligence" },
    { id = Item.octopus, level = 80, attribute = "willpower" },
    { id = Item.swordfish, level = 90, attribute = "essence" },
    { id = Item.lobster, level = 100, attribute = "intelligence" }
}

local cookedFish = {
    { id = Item.smokedFish, attribute = "intelligence" },
    { id = Item.smokedSalmon, level = 10, attribute = "essence" },
    { id = Item.cookedShrimp, level = 20, amount = 3, attribute = "willpower" },
    { id = Item.grilledFlounder, level = 30, attribute = "essence" },
    { id = Item.smokedHorsemackerel, level = 40, attribute = "intelligence" },
    { id = Item.smokedRosefish, level = 50, attribute = "willpower" },
    { id = Item.cookedCrab, level = 60, attribute = "essence" },
    { id = Item.grilledOctopus, level = 80, attribute = "willpower" },
    { id = Item.cookedLobster, level = 100, attribute = "intelligence" }
}

local eggs = {
    { id = Item.whiteEgg, level = 10, amount = 3, attribute = "constitution" },
    { id = Item.pigeonEgg, level = 40, amount = 3, attribute = "strength"},
    { id = Item.seagullEgg, level = 60, amount = 2, attribute = "constitution" },
    { id = Item.raptorEgg, level = 80, attribute = "strength" },
    { id = Item.spiderEgg, level = 90, attribute = "strength"},
    { id = Item.dragonEgg, level = 100, attribute = "constitution"}
}

local milk = {

    { id = Item.bottleOfMilk, level = 20, attribute = "strength" },
    { id = Item.bottleOfSheepMilk, level = 30, attribute = "constitution"  },
    { id = Item.bottleOfDeerMilk, level = 50, attribute = "strength" },

}

local honey = {
    { id = Item.beeHoney, attribute = "agility" },
    { id = Item.firewaspHoney, level = 70, attribute = "agility" }
}

local cheese = {
    { id = Item.cheese, amount = 1, attribute = "strength", level = 25}
}

local mushrooms = {
    { id = Item.champignon, amount = 3, attribute = "essence"},
    { id = Item.birthMushroom, amount = 2, attribute = "perception" },
    { id = Item.redHead, amount = 2, attribute = "essence" },
    { id = Item.chanterelle, attribute = "perception" }
}

local berries = {
    { id = Item.blueberry, amount = 3, attribute = "dexterity" },
    { id = Item.strawberry, amount = 3, attribute = "perception" },
    { id = Item.blackberry, amount = 3, attribute = "dexterity" },
    { id = Item.redElder, amount = 2, attribute = "perception" },
    { id = Item.raspberry, amount = 2, attribute = "dexterity" },
    { id = Item.cloudberry, amount = 2, attribute = "perception" },
    { id = Item.berries, attribute = "dexterity" },
}

local fruit = {
    { id = Item.apple, amount = 5, attribute = "strength" },
    { id = Item.cherries, amount = 5, attribute = "strength" },
    { id = Item.grapes, attribute = "strength", level = 50 },
    { id = Item.nuts, amount = 3, attribute = "strength", level = 30 },
    { id = Item.peach, amount = 5, attribute = "strength" },
    { id = Item.pear, amount = 5, attribute = "intelligence" },
    { id = Item.plum, amount = 3, attribute = "strength", level = 30 },
    { id = Item.orange, attribute = "intelligence", level = 50 },
    { id = Item.tangerine, amount = 5, attribute = "intelligence" },
    { id = Item.banana, amount = 5, attribute = "intelligence" },
    { id = Item.mango, amount = 3, attribute = "intelligence", level = 30 },
    { id = Item.pineapple, attribute = "intelligence", level = 50 }
}

local vegetables = {
    { id = Item.tomato, level = 10, amount = 3, attribute = "agility" },
    { id = Item.cucumber, level = 20, attribute = "dexterity" },
    { id = Item.lettuce, level = 25, attribute = "perception" },
    { id = Item.hop, level = 30, attribute = "agility" },
    { id = Item.onion, level = 40, amount = 3, attribute = "dexterity" },
    { id = Item.carrots, level = 50, amount = 2, attribute = "perception" },
    { id = Item.potato, level = 60, amount = 2, attribute = "agility" },
    { id = Item.bakedPotato, level = 60, amount = 2, attribute = "agility" },
    { id = Item.cabbage, level = 65, attribute = "dexterity" },
    { id = Item.corn, level = 70, attribute = "perception" },
    { id = Item.bellpepper, level = 90, attribute = "agility" },
    { id = Item.pumpkin, level = 100, attribute = "dexterity" }
}

local alcohol = {
    { id = Item.bottleOfBeer, attribute = "willpower" },
    { id = Item.bottleOfWine, attribute = "willpower" },
    { id = Item.bottleOfRum, attribute = "willpower" },
    { id = Item.bottleOfElvenWine, attribute = "willpower" },
    { id = Item.bottleOfFairyWine, attribute = "willpower" },
}

local other = {
    { id = Item.grain, amount = 5, attribute = "willpower" },
    { id = Item.sugarcane, level = 80, attribute = "willpower" },
    { id = Item.tobacco, level = 85, attribute = "willpower" }
}

local validPrimaryLists = {
    plate = {vegetables, cookedMeat, cookedFish, eggs},
    bowl = {vegetables, fruit, meat, fish, eggs, berries, mushrooms, alcohol},
    dough = {
        [Item.pastryDough] = {fruit, berries, milk, meat, fish, vegetables, eggs},
        [Item.plainDough] = {fruit, berries, mushrooms, vegetables, cookedMeat, milk, eggs},
        [Item.cookieDough] = {berries, fruit, honey, alcohol},
        [Item.spicyDough] = {fruit, berries, mushrooms, vegetables, cookedMeat, eggs},
    }
}

local validSecondaryLists = {
    plate = {vegetables, eggs, berries, mushrooms, fruit, other, honey, alcohol, cheese},
    bowl = {vegetables, eggs, berries, mushrooms, fruit, other, honey, alcohol, cheese},
    dough = {
        [Item.pastryDough] = {fruit, berries, milk, meat, fish, vegetables, other, alcohol, cheese, eggs},
        [Item.plainDough] = {fruit, berries, milk, mushrooms, vegetables, other, alcohol, cheese, honey, eggs},
        [Item.cookieDough] = {berries, fruit, honey, alcohol, cheese},
        [Item.spicyDough] = {fruit, berries, mushrooms, vegetables, other, alcohol, cheese, eggs},
    }
}

local allIngredientLists = {
    { name = {english = "meat",         german = "Fleisch"},         list = meat },
    { name = {english = "cooked meat",  german = "gekochtes Fleisch"}, list = cookedMeat },
    { name = {english = "fish",         german = "Fisch"},          list = fish },
    { name = {english = "cooked fish",  german = "gekochter Fisch"}, list = cookedFish },
    { name = {english = "eggs",         german = "Eier"},           list = eggs },
    { name = {english = "milk",         german = "Milch"},          list = milk },
    { name = {english = "honey",        german = "Honig"},          list = honey },
    { name = {english = "mushrooms",    german = "Pilze"},          list = mushrooms },
    { name = {english = "berries",      german = "Beeren"},         list = berries },
    { name = {english = "fruit",        german = "Obst"},           list = fruit },
    { name = {english = "vegetables",   german = "Gemüse"},         list = vegetables },
    { name = {english = "alcohol",      german = "Alkohol"},        list = alcohol },
    { name = {english = "other",        german = "Sonstiges"},      list = other },
    { name = {english = "cheese",        german = "Käse"},      list = cheese },
    { name = {english = "plates",        german = "Teller"},      list = plates },
    { name = {english = "bowls",        german = "Schüssel"},      list = bowls },
    { name = {english = "doughs",        german = "Teig"},      list = doughs }
}

local dishes = {
    plate = {
        eggs ={
            { id = Item.woodenPlate, graphic = Item.eggDish },
            { id = Item.ceramicPlate, graphic = Item.eggDishPorcelain },
            { id = Item.clayPlate, graphic = Item.eggDishClay },
            { id = Item.copperPlate, graphic = Item.eggDishCopper },
            { id = Item.goldPlate, graphic = Item.eggDishGold },
            { id = Item.ironDishPlate, graphic = Item.eggDishIron },
            { id = Item.silverPlate, graphic = Item.eggDishSilver },
            { id = Item.glassPlate, graphic = Item.eggDishGlass }
        },
        [Item.cabbage] = {
            { id = Item.woodenPlate, graphic = Item.cabbageRoll },
            { id = Item.ceramicPlate, graphic = Item.cabbageRollPorcelain },
            { id = Item.clayPlate, graphic = Item.cabbageRollClay },
            { id = Item.copperPlate, graphic = Item.cabbageRollCopper },
            { id = Item.goldPlate, graphic = Item.cabbageRollGold },
            { id = Item.ironDishPlate, graphic = Item.cabbageRollIron },
            { id = Item.silverPlate, graphic = Item.cabbageRollSilver },
            { id = Item.glassPlate, graphic = Item.cabbageRollGlass }
        },
        [Item.smokedChicken] = {
            { id = Item.woodenPlate, graphic = Item.chickenDish },
            { id = Item.ceramicPlate, graphic = Item.chickenDishPorcelain },
            { id = Item.clayPlate, graphic = Item.chickenDishClay },
            { id = Item.copperPlate, graphic = Item.chickenDishCopper },
            { id = Item.goldPlate, graphic = Item.chickenDishGold },
            { id = Item.ironDishPlate, graphic = Item.chickenDishIron },
            { id = Item.silverPlate, graphic = Item.chickenDishSilver },
            { id = Item.glassPlate, graphic = Item.chickenDishGlass }
        },
        [Item.grilledVenison] = {
            { id = Item.woodenPlate, graphic = Item.venisonDish },
            { id = Item.ceramicPlate, graphic = Item.venisonDishPorcelain },
            { id = Item.clayPlate, graphic = Item.venisonDishClay },
            { id = Item.copperPlate, graphic = Item.venisonDishCopper },
            { id = Item.goldPlate, graphic = Item.venisonDishGold },
            { id = Item.ironDishPlate, graphic = Item.venisonDishIron },
            { id = Item.silverPlate, graphic = Item.venisonDishSilver },
            { id = Item.glassPlate, graphic = Item.venisonDishGlass }
        },
        [Item.smokedRabbit] = {
            { id = Item.woodenPlate, graphic = Item.rabbitDish },
            { id = Item.ceramicPlate, graphic = Item.rabbitDishPorcelain },
            { id = Item.clayPlate, graphic = Item.rabbitDishClay },
            { id = Item.copperPlate, graphic = Item.rabbitDishCopper },
            { id = Item.goldPlate, graphic = Item.rabbitDishGold },
            { id = Item.ironDishPlate, graphic = Item.rabbitDishIron },
            { id = Item.silverPlate, graphic = Item.rabbitDishSilver },
            { id = Item.glassPlate, graphic = Item.rabbitDishGlass }
        },
        [Item.grilledSteak] = {
            { id = Item.woodenPlate, graphic = Item.steakDish },
            { id = Item.ceramicPlate, graphic = Item.steakDishPorcelain },
            { id = Item.clayPlate, graphic = Item.steakDishClay },
            { id = Item.copperPlate, graphic = Item.steakDishCopper },
            { id = Item.goldPlate, graphic = Item.steakDishGold },
            { id = Item.ironDishPlate, graphic = Item.steakDishIron },
            { id = Item.silverPlate, graphic = Item.steakDishSilver },
            { id = Item.glassPlate, graphic = Item.steakDishGlass }
        },
        [Item.smokedSalmon] = {
            { id = Item.woodenPlate, graphic = Item.salmonDish },
            { id = Item.ceramicPlate, graphic = Item.salmonDishPorcelain },
            { id = Item.clayPlate, graphic = Item.salmonDishClay },
            { id = Item.copperPlate, graphic = Item.salmonDishCopper },
            { id = Item.goldPlate, graphic = Item.salmonDishGold },
            { id = Item.ironDishPlate, graphic = Item.salmonDishIron },
            { id = Item.silverPlate, graphic = Item.salmonDishSilver },
            { id = Item.glassPlate, graphic = Item.salmonDishGlass }
        },
        [Item.grilledLamb] = {
            { id = Item.woodenPlate, graphic = Item.lambDish },
            { id = Item.ceramicPlate, graphic = Item.lambDishPorcelain },
            { id = Item.clayPlate, graphic = Item.lambDishClay },
            { id = Item.copperPlate, graphic = Item.lambDishCopper },
            { id = Item.goldPlate, graphic = Item.lambDishGold },
            { id = Item.ironDishPlate, graphic = Item.lambDishIron },
            { id = Item.silverPlate, graphic = Item.lambDishSilver },
            { id = Item.glassPlate, graphic = Item.lambDishGlass }
        },
        [Item.ham] = {
            { id = Item.woodenPlate, graphic = Item.meatDish },
            { id = Item.ceramicPlate, graphic = Item.hamDishPorcelain },
            { id = Item.clayPlate, graphic = Item.hamDishClay },
            { id = Item.copperPlate, graphic = Item.hamDishCopper },
            { id = Item.goldPlate, graphic = Item.hamDishGold },
            { id = Item.ironDishPlate, graphic = Item.hamDishIron },
            { id = Item.silverPlate, graphic = Item.hamDishSilver },
            { id = Item.glassPlate, graphic = Item.hamDishGlass }
        },
        [Item.smokedRosefish] = {
            { id = Item.woodenPlate, graphic = Item.rosefishDish },
            { id = Item.ceramicPlate, graphic = Item.rosefishDishPorcelain },
            { id = Item.clayPlate, graphic = Item.rosefishDishClay },
            { id = Item.copperPlate, graphic = Item.rosefishDishCopper },
            { id = Item.goldPlate, graphic = Item.rosefishDishGold },
            { id = Item.ironDishPlate, graphic = Item.rosefishDishIron },
            { id = Item.silverPlate, graphic = Item.rosefishDishSilver },
            { id = Item.glassPlate, graphic = Item.rosefishDishGlass }
        },
        [Item.sausage] = {
            { id = Item.woodenPlate, graphic = Item.sausagesDish },
            { id = Item.ceramicPlate, graphic = Item.sausagesDishPorcelain },
            { id = Item.clayPlate, graphic = Item.sausagesDishClay },
            { id = Item.copperPlate, graphic = Item.sausagesDishCopper },
            { id = Item.goldPlate, graphic = Item.sausagesDishGold },
            { id = Item.ironDishPlate, graphic = Item.sausagesDishIron },
            { id = Item.silverPlate, graphic = Item.sausagesDishSilver },
            { id = Item.glassPlate, graphic = Item.sausagesDishGlass }
        },
        [Item.smokedFish] = {
            { id = Item.woodenPlate, graphic = Item.troutFilletDish },
            { id = Item.ceramicPlate, graphic = Item.troutFilletDishPorcelain },
            { id = Item.clayPlate, graphic = Item.troutFilletDishClay },
            { id = Item.copperPlate, graphic = Item.troutFilletDishCopper },
            { id = Item.goldPlate, graphic = Item.troutFilletDishGold },
            { id = Item.ironDishPlate, graphic = Item.troutFilletDishIron },
            { id = Item.silverPlate, graphic = Item.troutFilletDishSilver },
            { id = Item.glassPlate, graphic = Item.troutFilletDishGlass }
        },
        ["cooked fish"] = {
            { id = Item.woodenPlate, graphic = Item.troutFilletDish },
            { id = Item.ceramicPlate, graphic = Item.troutFilletDishPorcelain },
            { id = Item.clayPlate, graphic = Item.troutFilletDishClay },
            { id = Item.copperPlate, graphic = Item.troutFilletDishCopper },
            { id = Item.goldPlate, graphic = Item.troutFilletDishGold },
            { id = Item.ironDishPlate, graphic = Item.troutFilletDishIron },
            { id = Item.silverPlate, graphic = Item.troutFilletDishSilver },
            { id = Item.glassPlate, graphic = Item.troutFilletDishGlass }
        },
        ["cooked meat"] = {
            { id = Item.woodenPlate, graphic = Item.meatDish },
            { id = Item.ceramicPlate, graphic = Item.hamDishPorcelain },
            { id = Item.clayPlate, graphic = Item.hamDishClay },
            { id = Item.copperPlate, graphic = Item.hamDishCopper },
            { id = Item.goldPlate, graphic = Item.hamDishGold },
            { id = Item.ironDishPlate, graphic = Item.hamDishIron },
            { id = Item.silverPlate, graphic = Item.hamDishSilver },
            { id = Item.glassPlate, graphic = Item.hamDishGlass }
        },
        vegetables = {
            { id = Item.woodenPlate, graphic = Item.veggieHash },
            { id = Item.ceramicPlate, graphic = Item.veggieHashPorcelain },
            { id = Item.clayPlate, graphic = Item.veggieHashClay },
            { id = Item.copperPlate, graphic = Item.veggieHashCopper },
            { id = Item.goldPlate, graphic = Item.veggieHashGold },
            { id = Item.ironDishPlate, graphic = Item.veggieHashIron },
            { id = Item.silverPlate, graphic = Item.veggieHashSilver },
            { id = Item.glassPlate, graphic = Item.veggieHashGlass }
        },
    },
    bowl = {
        eggs = {
            { id = Item.soupBowl, graphic = Item.eggSalad },
            { id = Item.ceramicBowl, graphic = Item.eggSaladPorcelain },
            { id = Item.clayBowl, graphic = Item.eggSaladClay },
            { id = Item.copperBowl, graphic = Item.eggSaladCopper },
            { id = Item.goldBowl, graphic = Item.eggSaladGold },
            { id = Item.ironBowl, graphic = Item.eggSaladIron },
            { id = Item.silverBowl, graphic = Item.eggSaladSilver },
            { id = Item.glassBowl, graphic = Item.eggSaladGlass }
        },
        mushrooms = {
            { id = Item.soupBowl, graphic = Item.mushroomSoup },
            { id = Item.ceramicBowl, graphic = Item.mushroomSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.mushroomSoupClay },
            { id = Item.copperBowl, graphic = Item.mushroomSoupCopper },
            { id = Item.goldBowl, graphic = Item.mushroomSoupGold },
            { id = Item.ironBowl, graphic = Item.mushroomSoupIron },
            { id = Item.silverBowl, graphic = Item.mushroomSoupSilver },
            { id = Item.glassBowl, graphic = Item.mushroomSoupGlass }
        },
        vegetables = {
            { id = Item.soupBowl, graphic = Item.mulligan },
            { id = Item.ceramicBowl, graphic = Item.mulliganPorcelain },
            { id = Item.clayBowl, graphic = Item.mulliganClay },
            { id = Item.copperBowl, graphic = Item.mulliganCopper },
            { id = Item.goldBowl, graphic = Item.mulliganGold },
            { id = Item.ironBowl, graphic = Item.mulliganIron },
            { id = Item.silverBowl, graphic = Item.mulliganSilver },
            { id = Item.glassBowl, graphic = Item.mulliganGlass }
        },
        berries = {
            { id = Item.soupBowl, graphic = Item.fruitSalad },
            { id = Item.ceramicBowl, graphic = Item.fruitSaladPorcelain },
            { id = Item.clayBowl, graphic = Item.fruitSaladClay },
            { id = Item.copperBowl, graphic = Item.fruitSaladCopper },
            { id = Item.goldBowl, graphic = Item.fruitSaladGold },
            { id = Item.ironBowl, graphic = Item.fruitSaladIron },
            { id = Item.silverBowl, graphic = Item.fruitSaladSilver },
            { id = Item.glassBowl, graphic = Item.fruitSaladGlass }
        },
        fruit = {
            { id = Item.soupBowl, graphic = Item.fruitSalad },
            { id = Item.ceramicBowl, graphic = Item.fruitSaladPorcelain },
            { id = Item.clayBowl, graphic = Item.fruitSaladClay },
            { id = Item.copperBowl, graphic = Item.fruitSaladCopper },
            { id = Item.goldBowl, graphic = Item.fruitSaladGold },
            { id = Item.ironBowl, graphic = Item.fruitSaladIron },
            { id = Item.silverBowl, graphic = Item.fruitSaladSilver },
            { id = Item.glassBowl, graphic = Item.fruitSaladGlass }
        },
        alcohol = {
            { id = Item.soupBowl, graphic = Item.beerSoup },
            { id = Item.ceramicBowl, graphic = Item.beerSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.beerSoupClay },
            { id = Item.copperBowl, graphic = Item.beerSoupCopper },
            { id = Item.goldBowl, graphic = Item.beerSoupGold },
            { id = Item.ironBowl, graphic = Item.beerSoupIron },
            { id = Item.silverBowl, graphic = Item.beerSoupSilver },
            { id = Item.glassBowl, graphic = Item.beerSoupGlass }
        },
        fish = {
            { id = Item.soupBowl, graphic = Item.fishSoup },
            { id = Item.ceramicBowl, graphic = Item.fishSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.fishSoupClay },
            { id = Item.copperBowl, graphic = Item.fishSoupCopper },
            { id = Item.goldBowl, graphic = Item.fishSoupGold },
            { id = Item.ironBowl, graphic = Item.fishSoupIron },
            { id = Item.silverBowl, graphic = Item.fishSoupSilver },
            { id = Item.glassBowl, graphic = Item.fishSoupGlass }
        },
        meat = {
            { id = Item.soupBowl, graphic = Item.goulash },
            { id = Item.ceramicBowl, graphic = Item.goulashPorcelain },
            { id = Item.clayBowl, graphic = Item.goulashClay },
            { id = Item.copperBowl, graphic = Item.goulashCopper },
            { id = Item.goldBowl, graphic = Item.goulashGold },
            { id = Item.ironBowl, graphic = Item.goulashIron },
            { id = Item.silverBowl, graphic = Item.goulashSilver },
            { id = Item.glassBowl, graphic = Item.goulashGlass }
        },
        [Item.potato] = {
            { id = Item.soupBowl, graphic = Item.potatoSoup },
            { id = Item.ceramicBowl, graphic = Item.potatoSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.potatoSoupClay },
            { id = Item.copperBowl, graphic = Item.potatoSoupCopper },
            { id = Item.goldBowl, graphic = Item.potatoSoupGold },
            { id = Item.ironBowl, graphic = Item.potatoSoupIron },
            { id = Item.silverBowl, graphic = Item.potatoSoupSilver },
            { id = Item.glassBowl, graphic = Item.potatoSoupGlass }
        },
        [Item.onion] = {
            { id = Item.soupBowl, graphic = Item.onionSoup },
            { id = Item.ceramicBowl, graphic = Item.onionSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.onionSoupClay },
            { id = Item.copperBowl, graphic = Item.onionSoupCopper },
            { id = Item.goldBowl, graphic = Item.onionSoupGold },
            { id = Item.ironBowl, graphic = Item.onionSoupIron },
            { id = Item.silverBowl, graphic = Item.onionSoupSilver },
            { id = Item.glassBowl, graphic = Item.onionSoupGlass }
        },
        [Item.roseFish] = {
            { id = Item.soupBowl, graphic = Item.rosefishStew },
            { id = Item.ceramicBowl, graphic = Item.rosefishStewPorcelain },
            { id = Item.clayBowl, graphic = Item.rosefishStewClay },
            { id = Item.copperBowl, graphic = Item.rosefishStewCopper },
            { id = Item.goldBowl, graphic = Item.rosefishStewGold },
            { id = Item.ironBowl, graphic = Item.rosefishStewIron },
            { id = Item.silverBowl, graphic = Item.rosefishStewSilver },
            { id = Item.glassBowl, graphic = Item.rosefishStewGlass }
        },
        [Item.horseMackerel] = {
            { id = Item.soupBowl, graphic = Item.mackerelSalad },
            { id = Item.ceramicBowl, graphic = Item.mackerelSaladPorcelain },
            { id = Item.clayBowl, graphic = Item.mackerelSaladClay },
            { id = Item.copperBowl, graphic = Item.mackerelSaladCopper },
            { id = Item.goldBowl, graphic = Item.mackerelSaladGold },
            { id = Item.ironBowl, graphic = Item.mackerelSaladIron },
            { id = Item.silverBowl, graphic = Item.mackerelSaladSilver },
            { id = Item.glassBowl, graphic = Item.mackerelSaladGlass }
        },
        [Item.chickenMeat] = {
            { id = Item.soupBowl, graphic = Item.chickenSoup },
            { id = Item.ceramicBowl, graphic = Item.chickenSoupPorcelain },
            { id = Item.clayBowl, graphic = Item.chickenSoupClay },
            { id = Item.copperBowl, graphic = Item.chickenSoupCopper },
            { id = Item.goldBowl, graphic = Item.chickenSoupGold },
            { id = Item.ironBowl, graphic = Item.chickenSoupIron },
            { id = Item.silverBowl, graphic = Item.chickenSoupSilver },
            { id = Item.glassBowl, graphic = Item.chickenSoupGlass }
        },
        [Item.cabbage] = {
            { id = Item.soupBowl, graphic = Item.cabbageStew },
            { id = Item.ceramicBowl, graphic = Item.cabbageStewPorcelain },
            { id = Item.clayBowl, graphic = Item.cabbageStewClay },
            { id = Item.copperBowl, graphic = Item.cabbageStewCopper },
            { id = Item.goldBowl, graphic = Item.cabbageStewGold },
            { id = Item.ironBowl, graphic = Item.cabbageStewIron },
            { id = Item.silverBowl, graphic = Item.cabbageStewSilver },
            { id = Item.glassBowl, graphic = Item.cabbageStewGlass }
        },
        [Item.lettuce] = {
            { id = Item.soupBowl, graphic = Item.salad },
            { id = Item.ceramicBowl, graphic = Item.saladPorcelain },
            { id = Item.clayBowl, graphic = Item.saladClay },
            { id = Item.copperBowl, graphic = Item.saladCopper },
            { id = Item.goldBowl, graphic = Item.saladGold },
            { id = Item.ironBowl, graphic = Item.saladIron },
            { id = Item.silverBowl, graphic = Item.saladSilver },
            { id = Item.glassBowl, graphic = Item.saladGlass }
        },
    },
    dough = {

        [Item.apple] = {
            { id = Item.pastryDough, graphic = Item.applePie},
            { id = Item.plainDough, graphic = Item.bananaBread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.bananaBread}
        },
        [Item.blackberry] = {
            { id = Item.pastryDough, graphic = Item.blackberryMedallion, amount = 2, secondary = {ids = milk , graphic = Item.blackberryMuffin, amount = 2}},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.strawberry] = {
            { id = Item.pastryDough, graphic = Item.strawberryMedallion, amount = 2, secondary = {ids = eggs , graphic = Item.strawberryCake}},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.cloudberry] = {
            { id = Item.pastryDough, graphic = Item.cloudberryMedallion, amount = 2},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.blueberry] = {
            { id = Item.pastryDough, graphic = Item.blueberryMedallion, amount = 2},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.raspberry] = {
            { id = Item.pastryDough, graphic = Item.raspberryMedallion, amount = 2},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.berries] = {
            { id = Item.pastryDough, graphic = Item.deerberryMedallion, amount = 2},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        [Item.redElder] = {
            { id = Item.pastryDough, graphic = Item.deerberryMedallion, amount = 2, secondary = {ids = milk, graphic = Item.elderberryPie}},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        eggs = {
            { id = Item.pastryDough, graphic = Item.custardPie},
            { id = Item.plainDough, graphic = Item.eggSaladSandwich},
            { id = Item.spicyDough, graphic = Item.eggSaladSandwich}
        },
        fruit = {
            { id = Item.pastryDough, graphic = Item.cherryCake},
            { id = Item.plainDough, graphic = Item.bananaBread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.bananaBread}
        },
        [Item.nuts] = {
            { id = Item.pastryDough, graphic = Item.elderberryPie},
            { id = Item.plainDough, graphic = Item.nutbread},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5},
            { id = Item.spicyDough, graphic = Item.nutbread}
        },
        milk = {
            { id = Item.pastryDough, graphic = Item.custardPie},
            { id = Item.plainDough, graphic = Item.breadRoll, amount = 3}
        },
        meat = {
            { id = Item.pastryDough, graphic = Item.custardPie}

        },
        ["cooked meat"] = {
            { id = Item.plainDough, graphic = Item.eggSaladSandwich},
            { id = Item.spicyDough, graphic = Item.eggSaladSandwich}
        },
        [Item.sausage] = {
            { id = Item.pastryDough, graphic = Item.custardPie},
            { id = Item.plainDough, graphic = Item.sausageOnBread},
            { id = Item.spicyDough, graphic = Item.sausageOnBread}
        },
        fish = {
            { id = Item.pastryDough, graphic = Item.custardPie}
        },
        vegetables = {
            { id = Item.pastryDough, graphic = Item.custardPie},
            { id = Item.plainDough, graphic = Item.eggSaladSandwich},
            { id = Item.spicyDough, graphic = Item.eggSaladSandwich}
        },
        mushrooms = {
            { id = Item.plainDough, graphic = Item.potatoBread},
            { id = Item.spicyDough, graphic = Item.potatoBread},
        },
        honey = {
            { id = Item.plainDough, graphic = Item.breadRoll, amount = 2},
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5}
        },
        alcohol = {
            { id = Item.cookieDough, graphic = Item.cookies, amount = 5}
        }
    },
}

local function isPlateOrBowl(ingredientId)

    for _, plate in pairs(plates) do
        if plate.id == ingredientId then
            return true
        end
    end

    for _, bowl in pairs(bowls) do
        if bowl.id == ingredientId then
            return true, true
        end
    end

    return false
end

function M.getDuration(dishInfo)

    local maxDifficulty = 100
    local minCraftedBuffDuration = 1800 -- 1/10 seconds
    local maxCraftedBuffDuration = 12000 -- 1/10 seconds
    local difference = maxCraftedBuffDuration - minCraftedBuffDuration
    local duration = math.ceil(minCraftedBuffDuration + difference*(dishInfo.level/maxDifficulty))
    local plateBowlImpact = 1
    local minVal = 200

    for _, ingredient in pairs(dishInfo.ingredients) do
        if isPlateOrBowl(ingredient) then
            local commonItem =  world:getItemStatsFromId(ingredient)
            local worth = commonItem.Worth
            plateBowlImpact = 0.8 + worth/minVal/50 -- 0.02 per 2 silver worth of plate bowl, they go from 2 silver to 40 silver value
        end
    end

    duration = math.floor(duration/dishInfo.dishAmount)

    return duration*plateBowlImpact

end

function M.getFoodIncrease(dishInfo)

    local minCraftedFoodvalue = 6000
    local foodPointsPerCopper = 2

    local foodIncrease = minCraftedFoodvalue + dishInfo.worth*foodPointsPerCopper
    --Scaled by value instead of level as in the past, thus ensuring higher level and higher amounts of ingredients will be more filling as is logical

    foodIncrease = math.floor(foodIncrease/dishInfo.dishAmount)

    return foodIncrease

end

local function isBerry(main)

    for _, berry in pairs(berries) do
        if main == berry.id then
            return true
        end
    end

    return false

end

local function isFruit(main)

    for _, theFruit in pairs(fruit) do
        if main == theFruit.id then
            return true
        end
    end

    return false

end

local function isSoup(data)

    if data.type ~= "bowl" then
        return false
    end

    local main = data.mainIngredient

    if isBerry(main) or isFruit(main) or main == Item.lettuce then --fresh salads don't need liquid to boil in
        return false
    end

    return true

end

local function isMilk(ingredient)

    for _, theMilk in pairs(milk) do
        if ingredient == theMilk.id then
            return true
        end
    end

    return false

end

local function hasNoMilk(data)

    for i = 1, 4 do
        if isMilk(data["ingredient"..i]) then
            return false
        end
    end

    return true

end

local function isDough(ingredient)

    for _, dough in pairs(doughs) do
        if dough.id == ingredient then
            return true
        end
    end
end

local function getDishWorthLevel(ingredients)

    local worth = 0

    local level = 0

    local plateBowlDoughValue = 0

    local remnantDeduction = 0

    for _, selectedIngredient in pairs(ingredients) do
        for _, list in pairs(allIngredientLists) do
            for _, ingredient in pairs(list.list) do
                if selectedIngredient == ingredient.id then
                    local commonItem =  world:getItemStatsFromId(tonumber(ingredient.id))
                    local amount = 1
                    if ingredient.amount then
                        amount = ingredient.amount
                    end

                    worth = worth + commonItem.Worth*amount

                    for _, bottle in pairs(bottles.bottles) do -- Since bottles conveniently already have the remnants listed, we just add that to the list using the existing one
                        if bottle.full[1] == ingredient.id then
                            local commonBottle =  world:getItemStatsFromId(tonumber(bottle.empty[1]))
                            remnantDeduction = remnantDeduction + commonBottle.Worth
                        end
                    end

                    if ingredient.id == Item.beeHoney or ingredient.id == Item.firewaspHoney then
                        local commonJar = world:getItemStatsFromId(Item.emptyHoneyJar)
                        remnantDeduction = remnantDeduction + commonJar.Worth
                    end

                    local newLevel = commonItem.Level

                    if isPlateOrBowl(ingredient.id) or isDough(ingredient.id) then
                        plateBowlDoughValue = commonItem.Worth
                    end

                    if ingredient.level then
                        newLevel = ingredient.level
                    end

                    if newLevel > level and not isPlateOrBowl(ingredient.id) then
                        level = newLevel
                    end
                end
            end
        end
    end

    local levelImpact = 1.5

    local increasePerLevel = 0.015

    levelImpact = levelImpact + increasePerLevel*level

    worth = ((worth-plateBowlDoughValue-remnantDeduction)*levelImpact) + plateBowlDoughValue

    return worth, level

end

M.getDishWorthLevel = getDishWorthLevel

local function getDishIngredients(dish)

    local ingredients = {}

    for i = 1, 7 do
        local ingredient = dish:getData("ingredient"..i)

        if not common.IsNilOrEmpty(ingredient) then
            table.insert(ingredients, tonumber(ingredient))
        end
    end

    return ingredients
end

M.getDishIngredients = getDishIngredients

local function getDishAttributes(ingredients)

    local attributes = {"strength", "agility", "essence", "dexterity", "perception", "willpower", "intelligence", "constitution"}
    local attribList = {}

    --Attributes are halved if not the primary ingredient. That means the maximum is +2 from main plus +1 +1 +1 +1 from sides
    -- Or in the case of dough, an additional + 1 but thats where the max cap comes into play
    --if not dough type dish then skip the plate/bowl step by referencing that list
    -- max cap amount of attributes based on dish max level ingredient and average level of ingredients, maybe main + secondary divided by 2

    for _, theIngredient in pairs(ingredients) do
        for _, list in pairs(allIngredientLists) do
            for _, ingredient in pairs(list.list) do
                if ingredient.attribute and ingredient.id == theIngredient then

                    local level = world:getItemStatsFromId(ingredient.id).Level

                    if ingredient.level then
                        level = ingredient.level
                    end

                    if not attribList[ingredient.attribute] then
                        attribList[ingredient.attribute] = 0
                    end

                    local attribBonus = 0.5

                    if level >= 30 then
                        attribBonus = 1
                    end

                    if level >= 50 then
                        attribBonus = 1.5
                    end

                    if level >= 70 then
                        attribBonus = 2
                    end

                    attribList[ingredient.attribute] = attribList[ingredient.attribute] + attribBonus
                end
            end
        end
    end

    local retAttribs = {}

    local _, dishLevel = getDishWorthLevel(ingredients)

    local attributeCap = 1

    local attributeAmount = 1

    attributeAmount = attributeAmount + math.floor(dishLevel/20)

    local ingredientAttribAmount = 0

    for _, attrib in pairs(attributes) do
        if attribList[attrib] then
            ingredientAttribAmount = ingredientAttribAmount + attribList[attrib]
        end
    end

    ingredientAttribAmount = math.max(1, math.floor(ingredientAttribAmount))

    if attributeAmount > ingredientAttribAmount then
        attributeAmount = ingredientAttribAmount
    end

    if dishLevel >= 50 then
        attributeCap = 2
    end

    local addedSoFar = 0

    for i = 1, attributeAmount do
        local toAdd = {}
        for _, attrib in pairs(attributes) do --We find the highest value one to add first

            if not attribList[attrib] then
                attribList[attrib] = 0
            end

            if not toAdd.name then
                toAdd.name = attrib
                toAdd.value = attribList[attrib]
            elseif toAdd.value < attribList[attrib] then
                toAdd.name = attrib
                toAdd.value = attribList[attrib]
            end
        end

        if i > 1 and toAdd.value == 0 then
            break
        end

        toAdd.value = math.max(1, math.floor(toAdd.value)) -- We round it up to 1 if it is 0.5

        local leftToAdd = attributeAmount-addedSoFar -- How many attribs can we still add

        toAdd.value = math.min(attributeCap, toAdd.value) -- keep it under the cap for the dish level

        attribList[toAdd.name] = -math.huge -- we dont want the same attribute selected again
        local theValue = math.min(leftToAdd, toAdd.value) --Either add the value of what remains to add
        addedSoFar = addedSoFar+theValue

        table.insert(retAttribs, {attribute = toAdd.name, value = theValue})

        if addedSoFar == attributeAmount then
            break
        end
    end

    return retAttribs
end

local function graphicExceptions(parchment, dishGraphic)
    -- remember to account for book view not having the parchment to draw from
    --Some specific ingredient combos might give a different graphic, sometimes based on dishGraphic like tomatoes turning fishSoup red
end

local function getCategoryOfIngredient(ingredientId)

    for _, list in pairs(allIngredientLists) do
        for _, ingredient in pairs(list.list) do
            if ingredientId == ingredient.id then
                return list.name.english
            end
        end
    end

    return false
end

local function isInList(list, id)

    if not list or not id then
        return false
    end

    for _, listEntry in pairs(list) do
        if list.id == id then
            return true
        end
    end

    return false
end

local function getDishGraphic(parchment, theType, mainIngredient, base, secondIngredient)

    if parchment then
        theType = parchment:getData("type")
        mainIngredient = parchment:getData("ingredient2")
        base = parchment:getData("ingredient1")
        secondIngredient = parchment:getData("ingredient3")
    end

    if common.IsNilOrEmpty(theType) or common.IsNilOrEmpty(mainIngredient) or common.IsNilOrEmpty(base) then
        return 0, 1
    end

    local categoryName = getCategoryOfIngredient(tonumber(mainIngredient))

    if not categoryName then
        return 0, 1
    end

    local dishList = dishes[theType]

    if dishList[tonumber(mainIngredient)] then
        dishList = dishList[tonumber(mainIngredient)]
    elseif dishList[categoryName] then
        dishList = dishList[categoryName]
    else
        return 0, 1
    end

    local retVal = 0
    local retAmount = 1

    for _, dish in pairs(dishList) do
        if dish.id == tonumber(base) then
            if dish.secondary and tonumber(secondIngredient) and ((dish.secondary.id and dish.secondary.id == tonumber(secondIngredient)) or isInList(dish.secondary.ids, tonumber(secondIngredient))) then
                retVal = dish.secondary.graphic
                if dish.secondary.amount then
                    retAmount = dish.secondary.amount
                end
            else
                retVal = dish.graphic
                if dish.amount then
                    retAmount = dish.amount
                end
            end
        end
    end

    local exception = graphicExceptions(parchment, retVal)

    if exception then
        retVal = exception
    end

    return retVal, retAmount
end

M.getDishGraphic = getDishGraphic

function M.getDishInfo(dish, ingredients)

    if not ingredients then
        ingredients = getDishIngredients(dish)
    end

    local worth, level = getDishWorthLevel(ingredients)

    local attributes = getDishAttributes(ingredients)

    local theType = "dough"

    local isPlateBowl, isBowl = isPlateOrBowl(ingredients[1])

    if isPlateBowl then
        theType = "plate"
    end

    if isBowl then
        theType = "bowl"
    end

    local dishGraphic, dishAmount = getDishGraphic(false, theType, ingredients[2], ingredients[1], ingredients[3])

    worth = math.floor(worth/dishAmount)

    return {worth = worth, level = level, attributes = attributes, ingredients = ingredients, dishGraphic = dishGraphic, dishAmount = dishAmount, type = theType, mainIngredient = ingredients[2], base = ingredients[1]}

end

function M.isRecipe(parchment)

    if not common.IsNilOrEmpty(parchment:getData("cookingRecipe")) then
        return true
    end

    return false
end

local function getAmount(ingredientId)

    for _, list in pairs(allIngredientLists) do
        for _, ingredient in pairs(list.list) do
            if ingredientId == ingredient.id then

                local amount = 1

                if ingredient.amount then
                    amount = ingredient.amount
                end

                return amount
            end
        end
    end

    return 1
end

function M.getIngredientAmount(ingredient)
    return getAmount(ingredient)
end

function M.showRecipe(user, parchment)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        M.showRecipe(user, parchment)

    end

    local english = "Holding this recipe in your hand, you can use a cooking spoon to create the dish at an oven using the ingredients listed below the preview."
    local german = "Wenn Sie dieses Rezept in der Hand halten, können Sie einen Kochlöffel verwenden, um das Gericht im Ofen mit den unten in der Vorschau aufgeführten Zutaten zuzubereiten."

    if parchment:getData("type") == "dough" then
        english = "Holding this recipe in your hand, you can use a peel to create the dish at a baking oven using the ingredients listed below the preview."
        german = "Wenn Sie dieses Rezept in der Hand halten, können Sie ein Backblech verwenden, um das Gericht im Backofen mit den unten in der Vorschau aufgeführten Zutaten zuzubereiten."
    end


    local text = common.GetNLS(user, german, english)

    local dialog = SelectionDialog(common.GetNLS(user,"Rezeptübersicht","Recipe overview") , text.." "..common.GetNLS(user, "Das Rezept kann auch in ein Buch gelegt werden, um ein Kochbuch zu erstellen, in dem Sie mehrere Rezepte sammeln können.", "The recipe can also be put in a book, to create a recipe book where you can collect several recipes.") , callback)

    local dishGraphic = getDishGraphic(parchment)

    local dishName = parchment:getData("name")

    dialog:addOption(dishGraphic, dishName)

    for i = 1, 7 do
        local ingredient = parchment:getData("ingredient"..i)

        if not common.IsNilOrEmpty(ingredient) then
            local amount = getAmount(tonumber(ingredient))
            local commonItem = world:getItemStatsFromId(tonumber(ingredient))
            dialog:addOption(tonumber(ingredient), common.GetNLS(user,commonItem.German,commonItem.English).." x "..amount)
        end
    end

    user:requestSelectionDialog(dialog)

end

local function isValidList(list, data, secondary)

    local validList = validPrimaryLists[data.type]

    if secondary then
        validList = validSecondaryLists[data.type]
    end

    if data.type == "dough" then
        validList = validList[data.base]
    end


    for _, selectedList in pairs(validList) do
        if selectedList == list then
            return true
        end
    end

    return false
end

local function getParchment(user)

    local parchment = recipe_creation.GetParchmentQuill(user)
    parchment = recipe_creation.IsParchmentOK(user,parchment)

    return parchment

end

local function saveRecipe(user, data)

    local parchment = getParchment(user)

    if not parchment then return end

    parchment:setData("type", tostring(data.type))

    parchment:setData("cookingRecipe", "true")

    parchment:setData("ingredient1", tostring(data.base))
    parchment:setData("ingredient2", tostring(data.mainIngredient))

    local lastIngredientNumber = 2

    for i = 1, 4 do
        if data.secondaryIngredients["ingredient"..i] then
            lastIngredientNumber = lastIngredientNumber + 1
            local index = i + 2
            parchment:setData("ingredient"..index, data.secondaryIngredients["ingredient"..i])
        end
    end

    if isSoup(data) and hasNoMilk(data) then
        parchment:setData("ingredient"..lastIngredientNumber+1, tostring(Item.bucketOfWater))
    end

    parchment:setData("name", data.name)

    parchment:setData("craftedBy", user.name)

    world:changeItem(parchment)

    user:inform("Du hast das Kochrezept fertiggestellt.", "You finish writing the cooking recipe.")
end

local function setName(user, data)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            data.name = input
            saveRecipe(user, data)
        end
    end

    local dialog = InputDialog(common.GetNLS(user, "Rezepterstellung","Recipe creation"), common.GetNLS(user, "Geben Sie einen Namen für das Rezept ein.", "Enter a name for the recipe."), false, 255, callback)

    user:requestInputDialog(dialog)

end

local function selectSecondaryIngredients(user, data, list)

    local currentIngredients = {}

    local baseItem = world:getItemStatsFromId(data.base)
    local mainIngredient = world:getItemStatsFromId(data.mainIngredient)

    currentIngredients.english = ""..baseItem.English..", "..mainIngredient.English
    currentIngredients.german = ""..baseItem.German..", "..mainIngredient.German

    for i = 1, 4 do
        if not data.secondaryIngredients then
            break
        end
        local ingredient = data.secondaryIngredients["ingredient"..i]
        if ingredient then
            local commonItem = world:getItemStatsFromId(ingredient)
            currentIngredients.english = currentIngredients.english..", "..commonItem.English
            currentIngredients.german = currentIngredients.german..", "..commonItem.German
        end
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for index, object in pairs(list) do

            if selected == index then

                if not data.secondaryIngredients then
                    data.secondaryIngredients = {}
                end

                for i = 1, 4 do
                    if i < 4 and not data.secondaryIngredients["ingredient"..i] then
                        data.secondaryIngredients["ingredient"..i] = object.id
                        M.selectIngredientCategory(user, data, true)
                        break
                    end

                    if i == 4 then
                        data.secondaryIngredients["ingredient"..i] = object.id
                        setName(user, data)
                    end
                end
            end
        end
        if selected == #list+1 then
            M.selectIngredientCategory(user, data, true)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation") , common.GetNLS(user,"Wähle eine zusätzliche Zutat für dein Rezept, du kannst insgesamt bis zu 6 haben.\nAktuelle Zutaten:\n"..currentIngredients.german,"Select an additional ingredient for your recipe, you can have up to 6 total.\n Current ingredients:\n"..currentIngredients.english) , callback)

    for _, object in ipairs(list) do
        local commonItem = world:getItemStatsFromId(object.id)
        local level = object.level
        if not level then
            level = commonItem.Level
        end
        dialog:addOption(object.id, common.GetNLS(user,commonItem.German.."(Lvl. "..level..")",commonItem.English.."(Lvl. "..level..")"))
    end

    dialog:addOption(0, common.GetNLS(user, "Zurück zur Kategorieauswahl", "Back to category selection"))

    user:requestSelectionDialog(dialog)

end

local function selectMainIngredient(user, data, list)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for index, object in pairs(list) do
            if selected == index then
                data.mainIngredient = object.id
                M.selectIngredientCategory(user, data, true)
            end
        end

        if selected == #list+1 then
            M.selectIngredientCategory(user, data)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation") , common.GetNLS(user,"Wählen Sie die Hauptzutat Ihres Rezepts.","Select the main ingredient of your recipe.") , callback)

    for _, object in ipairs(list) do
        local commonItem = world:getItemStatsFromId(object.id)
        local level = object.level
        if not level then
            level = commonItem.Level
        end
        dialog:addOption(object.id, common.GetNLS(user,commonItem.German.."(Lvl. "..level..")",commonItem.English.."(Lvl. "..level..")"))
    end

    dialog:addOption(0, common.GetNLS(user, "Zurück zur Kategorieauswahl", "Back to category selection"))

    user:requestSelectionDialog(dialog)
end

function M.selectIngredientCategory(user, data, secondary)

    local validIngredientsList = {}

    for _, ingredientList in pairs(allIngredientLists) do
        if isValidList(ingredientList.list, data, secondary) then
            table.insert(validIngredientsList, ingredientList)
        end
    end

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        if secondary and data.secondaryIngredients and selected == 1 then
            setName(user, data)
        else



            for index, object in pairs(validIngredientsList) do

                if secondary and data.secondaryIngredients then
                    index = index + 1
                end

                if selected == index then

                    if not secondary then
                        selectMainIngredient(user, data, object.list)
                    else
                        selectSecondaryIngredients(user, data, object.list)
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation") , common.GetNLS(user,"Wählen Sie eine Zutatenkategorie aus.","Select an ingredient category.") , callback)

    if secondary and data.secondaryIngredients then
        dialog:addOption(Item.quill, common.GetNLS(user, "Rezept fertigstellen", "Finish recipe"))
    end

    for _, object in ipairs(validIngredientsList) do
        dialog:addOption(object.list[1].id, common.GetNLS(user, object.name.german, object.name.english))
    end

    user:requestSelectionDialog(dialog)

end

local function selectType(user, theType)

    local list

    if theType == "plate" then
        list = plates
    elseif theType == "bowl" then
        list = bowls
    elseif theType == "dough" then
        list = doughs
    end

    if not list then
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for index, object in pairs(list) do
            if selected == index then
                M.selectIngredientCategory(user, {type = theType, base = object.id})
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation") , common.GetNLS(user,"Wählen Sie die Basis Ihres Rezepts.","Select the base of your recipe.") , callback)

    for _, object in ipairs(list) do
        local commonItem = world:getItemStatsFromId(object.id)
        local addedText = ""

        local level = object.level
        if not level then
            level = commonItem.Level
        end

        if theType == "dough" then
            addedText = "(Lvl. "..level..")"
        end

        dialog:addOption(object.id, common.GetNLS(user,commonItem.German..addedText,commonItem.English..addedText))
    end

    user:requestSelectionDialog(dialog)
end

local parchmentSelectionStatus = {}

local function addToCookBook(user, parchment)

    local book = common.checkIfBookInHand(user, false, true)

    if not book then
        return
    end

    if common.IsNilOrEmpty(book:getData("cookBook")) then
        book:setData("cookBook", "true")
    end

    local string = ""

    string = string.."cookingRecipe"..","..parchment:getData("cookingRecipe")

    string = string..",".."type"..","..parchment:getData("type")

    string = string..",".."name"..","..parchment:getData("name")

    string = string..",".."craftedBy"..","..parchment:getData("craftedBy")

    for i = 1, 7 do
        local ingredient = parchment:getData("ingredient"..i)
        if not common.IsNilOrEmpty(ingredient) then
            string = string..",".."ingredient"..i..","..ingredient
        end
    end

    for i= 1, 100 do
        if common.IsNilOrEmpty(book:getData("recipe"..i)) then
            book:setData("recipe"..i, string)
            break
        elseif i == 100 then
            user:inform("Dieses Buch hat keinen Platz mehr für Rezepte.","This book has no more space for recipes.")
            return
        end
    end

    world:changeItem(book)
    world:erase(parchment, 1)
end

function M.selectParchment(user, parchment)

    if parchment.wear == 255 then
        return false
    end

    if not parchmentSelectionStatus[user.id] then
        return false
    end

    parchmentSelectionStatus[user.id] = false

    local isCookingRecipe = parchment:getData("cookingRecipe")

    if not common.IsNilOrEmpty(isCookingRecipe) then
        addToCookBook(user, parchment)
    end

    return true
end

function M.createCookingRecipe(user)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        if selected < 4 then
            local parchment = recipe_creation.GetParchmentQuill(user)
            parchment = recipe_creation.IsParchmentOK(user,parchment)
            if not parchment then
                return
            end

            if selected == 1 then
                selectType(user, "plate")
            elseif selected == 2 then
                selectType(user, "bowl")
            elseif selected == 3 then
                selectType(user, "dough")
            end
        end

        if selected == 4 then
            parchmentSelectionStatus[user.id] = true
            user:inform("Halte ein leeres oder ein Kulinarisches Rezeptbuch mit weniger als 100 Rezepten in der Hand und doppelklicke anschließend auf ein Kochrezept, um es in das Buch einzufügen.", "Hold an empty book or a culinary recipe book with less than 100 recipes in your hand, then double click a cooking recipe to place it into the book.")
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezepterstellung","Recipe creation") , common.GetNLS(user,"Wählen Sie die Art des Rezepts aus, das erstellt werden soll.","Select the type of recipe to write.") , callback)
    dialog:addOption(0, common.GetNLS(user,"Tellergericht","Plate dish"))
    dialog:addOption(0, common.GetNLS(user,"Schüsselgericht","Bowl dish"))
    dialog:addOption(0, common.GetNLS(user,"Ofengericht","Baked dish"))
    dialog:addOption(0, common.GetNLS(user,"Rezept ins Buch","Place a recipe in a book"))
    user:requestSelectionDialog(dialog)
end

local function convertToTableOfData(string)

    local retTable = {}
    local parts = {}

    for part in string.gmatch(string, "([^,]+)") do
        table.insert(parts, part)
    end

    for i = 1, #parts, 2 do
        local dataKey = parts[i]
        local dataValue = parts[i + 1]
        if dataKey and dataValue then
            retTable[dataKey] = dataValue
        end
    end

    return retTable
end

local function getRecipeDataFromBook(book, index)

    local string = book:getData("recipe"..index)

    local data = convertToTableOfData(string)

    local ingredients = {}

    for i = 1, 7 do
        local ingredient = data["ingredient"..i]
        if ingredient then
            table.insert(ingredients, tonumber(ingredient))
        end
    end

    return data.type, tonumber(data.ingredient1), tonumber(data.ingredient2), data.name, ingredients, data.craftedBy

end

M.getRecipeDataFromBook = getRecipeDataFromBook

function M.showBookRecipe(user, book, index)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        M.showBookRecipe(user, book)

    end

    local theType, base, mainIngredient, dishName, ingredients = getRecipeDataFromBook(book, index)

    local english = "Holding this recipe book in your hand, you can use a cooking spoon to create the dish at an oven using the ingredients listed below the preview."
    local german = "Wenn Sie dieses Rezeptbuch in der Hand halten, können Sie einen Kochlöffel verwenden, um das Gericht im Ofen mit den unten in der Vorschau aufgeführten Zutaten zuzubereiten."

    if theType == "dough" then
        english = "Holding this recipe book in your hand, you can use a peel to create the dish at a baking oven using the ingredients listed below the preview."
        german = "Wenn Sie dieses Rezeptbuch in der Hand halten, können Sie ein Backblech verwenden, um das Gericht im Backofen mit den unten in der Vorschau aufgeführten Zutaten zuzubereiten."
    end


    local text = common.GetNLS(user, german, english)

    local dialog = SelectionDialog(common.GetNLS(user,"Rezeptübersicht","Recipe overview") , text , callback)

    local dishGraphic = getDishGraphic(false, theType, mainIngredient, base, ingredients[3])

    dialog:addOption(dishGraphic, dishName)

    for _, ingredient in pairs(ingredients) do
        local amount = getAmount(tonumber(ingredient))
        local commonItem = world:getItemStatsFromId(tonumber(ingredient))
        dialog:addOption(tonumber(ingredient), common.GetNLS(user,commonItem.German,commonItem.English).." x "..amount)
    end

    user:requestSelectionDialog(dialog)

end

local function removeARecipePage(user, book)

    local index

    for i = 1, 100 do
        if not common.IsNilOrEmpty(book:getData("recipe"..i)) then
            index = i
        end
    end

    if not index then
        return
    end

    local theType, _, _, dishName, ingredients, craftedBy = getRecipeDataFromBook(book, index)

    local data = {}

    data.type = theType

    data.cookingRecipe = "true"

    for i, ingredient in pairs(ingredients) do
        data["ingredient"..i] = ingredient
    end

    data.name = dishName

    data.craftedBy = craftedBy

    user:createItem(Item.parchment, 1, 333, data)

    if index == 1 then
        book:setData("cookBook", "")
    end

    book:setData("recipe"..index, "")
    world:changeItem(book)

    user:inform("Letztes Rezept aus dem Buch abrufen.", "You retrieve the last recipe from the book.")

end


function M.viewCookBook(user, book, page)

    if not page then
        page = 0
    end

    local timeStamp = world:getTime("unix")

    book:setData("timeStamp", tostring(timeStamp)) --to prevent dupes we timestamp the book to find it again later

    world:changeItem(book)

    local firstRecipeOfNextPage = (page+1)*10+1

    local nextPageExists = not common.IsNilOrEmpty(book:getData("recipe"..firstRecipeOfNextPage))

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        book = common.GetItemInInventory(user, book.id, {{"timeStamp", tostring(timeStamp)}})

        if not book then return end

        local previousOptions = 1

        if nextPageExists then
            previousOptions = 2
        end

        if page and page > 0 then
            previousOptions = 3
        end

        if selected == 1 then
            removeARecipePage(user, book)
        elseif ((selected == 2 and previousOptions == 2) or (selected == 3 and previousOptions == 3)) and nextPageExists then
            M.viewCookBook(user, book, page+1)
        elseif (selected == 2 and previousOptions == 3 and nextPageExists) or (selected == 2 and previousOptions == 2) then
            M.viewCookBook(user, book, page-1)
        else

            for i = 1, 10 do
                if selected == i+previousOptions then
                    M.showBookRecipe(user, book, page*10+i)
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Rezeptübersicht","Recipe overview") , common.GetNLS(user, "Wenn du dieses Buch in der Hand hältst und den richtigen Koch- oder Backofen benutzt, kannst du die unten aufgeführten Rezepte kochen oder backen.", "By holding this book in your hand while using the correct cooking or baking oven, you can cook or bake the recipes listed below.") , callback)

    dialog:addOption(228, common.GetNLS(user, "Letztes Rezept entfernen","Remove last recipe"))

    if page and page > 0 then
        dialog:addOption(Item.parchment, common.GetNLS(user, "Vorherige Seite", "Previous Page"))
    end

    if nextPageExists then
        dialog:addOption(Item.parchment, common.GetNLS(user, "Nächste Seite","Next Page"))
    end




    for i = page*10+1, page*10+10 do --Up to 10 recipes shown per page
        if not common.IsNilOrEmpty(book:getData("recipe"..i)) then
            local theType, base, mainIngredient, dishName, ingredients = getRecipeDataFromBook(book, i)
            local dishGraphic = getDishGraphic(false, theType, mainIngredient, base, ingredients[3])
            dialog:addOption(dishGraphic, dishName)
        end
    end

    user:requestSelectionDialog(dialog)
end

return M
