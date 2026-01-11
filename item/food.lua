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

local M = {}

local common = require("base.common")
local furtunecookies = require("content.furtunecookies")
local alchemy = require("alchemy.base.alchemy")
local herbs = require("alchemy.base.herbs")
local specialeggs = require("content.specialeggs")
local ratCistern = require("content.ratCistern")
local onionball = require("npc.sepp_leaf")
local lookat = require("base.lookat")
local cookingRecipeCreation = require("craft.cookingRecipeCreation")

local foodRarityTexts = {
    {english = "uncommon", german = "außergewöhnlich gut", identifier = 2,
    foodDescription = {
        english = "An uncommonly well made dish. Sure to be more filling than its common counterparts.",
        german = "Ein außergewöhnlich gut gelungenes Gericht. Ein wahrer Schmauß, der besser sättigt als ein normales Gericht."}},
    {english = "rare", german = "exzellent", identifier = 3,
    foodDescription = {
        english = "A dish so well-made it's a rarity among dishes. Not only more filling than its lesser counterparts, but also somewhat beneficial to the longevity and strength of the boons of your good diet.",
        german = "Ein wahres Schlemmergericht. Wohlbekömmlich und eine kleine Wohltat für die Länge und Auswirkung deiner guten Ernährung."}},
    {english = "unique", german = "einzigartig gut", identifier = 4,
    foodDescription = {
        english = "A dish made by such refined culinary arts, you might even say it's unique. Not only more filling than its lesser counterparts, but also very beneficial to both the longevity and strength of the boons of your good diet.",
        german = "Eine kulinarisches Köstlichkeit, die ihres Gleichen sucht. Äußerst wohlbekömmlich und eine wahre Wohltat für die Länge und Auswirkung deiner guten Ernährung."}}
    }

local ingredientRarityTexts = {
    {english = "uncommon", german = "außergewöhnlich gut", identifier = 2,
    foodDescription = {
        english = "Uncommonly tasty, sure to make for even better tasting meals if used in cooking.",
        german = "Ungewöhnlich schmackhaft, und bei der Verwendung zum Kochen sorgt es mit Sicherheit für noch besser schmeckende Gerichte."}},
    {english = "rare", german = "exzellent", identifier = 3,
    foodDescription = {
        english = "Rarely pristine and sure to be tasty, any meal using this will certainly be elevated.",
        german = "Selten makellos und garantiert schmackhaft - jedes Gericht, in dem dies verwendet wird, wird ganz sicher aufgewertet."}},
    {english = "unique", german = "einzigartig gut", identifier = 4,
    foodDescription = {
        english = "Uniquely pristine and tasty, sure to make any meal it is used for taste all the better.",
        german = "Einzigartig makellos und schmackhaft - garantiert wird jedes Gericht, in dem es verwendet wird, dadurch noch besser schmecken."}}
    }

M.cookedFood = {
    --[[
        Listed ingredients are just for attribute, worth and level calculations if the item gets
        spawned in and for old relic dishes. They do not have to make perfect sense. They are
        mainly balanced around having similar monetary values as in the past.
    ]]
    -- Grilled/smoked
    [Item.ham] = {ingredients = {Item.pork}, intermediate = true, buffs = {{attribute="dexterity", value = 1}}},
    [Item.smokedFish] = {ingredients = {Item.trout}, intermediate = true, buffs = {{attribute="intelligence", value = 1}}},
    [Item.smokedSalmon] = {ingredients = {Item.salmon}, intermediate = true, buffs = {{attribute="essence", value = 1}}},
    [Item.smokedRosefish] = {ingredients = {Item.roseFish}, intermediate = true, buffs = {{attribute="perception", value = 1}}},
    [Item.smokedHorsemackerel] = {ingredients = {Item.horseMackerel}, intermediate = true, buffs = {{attribute="willpower", value = 1}}},
    [Item.smokedRabbit] = {ingredients = {Item.rabbitMeat}, intermediate = true, buffs = {{attribute="strength", value = 1}}},
    [Item.smokedChicken] = {ingredients = {Item.chickenMeat}, intermediate = true, buffs = {{attribute="constitution", value = 1}}},
    [Item.grilledSteak] = {ingredients = {Item.rawSteak}, intermediate = true, buffs = {{attribute="agility", value = 1}}},
    [Item.grilledLamb] = {ingredients = {Item.lambMeat}, intermediate = true, buffs = {{attribute="dexterity", value = 1}}},
    [Item.grilledVenison] = {ingredients = {Item.deerMeat}, intermediate = true, buffs = {{attribute="intelligence", value = 1}}},
    [Item.cookedShrimp] = {ingredients = {Item.shrimp}, intermediate = true, buffs = {{attribute="perception", value = 1}}},
    [Item.cookedCrab] = {ingredients = {Item.crab}, intermediate = true, buffs = {{attribute="willpower", value = 1}}},
    [Item.cookedLobster] = {ingredients = {Item.lobster}, intermediate = true, buffs = {{attribute="strength", value = 1}}},
    [Item.grilledOctopus] = {ingredients = {Item.octopus}, intermediate = true, buffs = {{attribute="constitution", value = 1}}},
    [Item.grilledFlounder] = {ingredients = {Item.flounder}, intermediate = true, buffs = {{attribute="agility", value = 1}}},
    [Item.grilledFox] = {ingredients = {Item.foxMeat}, intermediate = true, buffs = {{attribute="dexterity", value = 1}}},
    [Item.grilledWolf] = {ingredients = {Item.wolfMeat}, intermediate = true, buffs = {{attribute="intelligence", value = 1}}},
    [Item.grilledBear] = {ingredients = {Item.bearMeat}, intermediate = true, buffs = {{attribute="essence", value = 1}}},
    [Item.grilledRaptor] = {ingredients = {Item.raptorMeat}, intermediate = true, buffs = {{attribute="perception", value = 1}}},
    [Item.grilledDragon] = {ingredients = {Item.dragonMeat}, intermediate = true, buffs = {{attribute="willpower", value = 1}}},
    [Item.grilledRat] = {ingredients = {Item.ratMeat}, intermediate = true, buffs = {{attribute="strength", value = 1}}},


    -- Other intermediate ingredients
    [Item.plainDough] = {ingredients = {}, intermediate = true},
    [Item.cookieDough] = {ingredients = {Item.whiteEgg, Item.beeHoney, Item.bottleOfMilk}, intermediate = true},
    [Item.pastryDough] = {ingredients = {Item.pigeonEgg, Item.sugarcane, Item.bottleOfSheepMilk}, intermediate = true},
    [Item.spicyDough] = {ingredients = {Item.seagullEgg, Item.firewaspHoney, Item.bottleOfDeerMilk}, intermediate = true},
    [Item.sausage] = {ingredients = {Item.pork}, intermediate = true, buffs = {{attribute="agility", value = 1}}},
    [Item.cheese] = {ingredients = {Item.bottleOfMilk}, intermediate = true, buffs = {{attribute="perception", value = 1}}},
    [Item.bakedPotato] = {ingredients = {Item.potato}, intermediate = true, buffs = {{attribute="dexterity", value = 1}}},


    -- Baked goods
    [Item.breadRoll] = {ingredients = {Item.plainDough, Item.bottleOfMilk}, buffs = {{attribute="constitution", value = 1}}},
    [Item.cookies] = {ingredients = {Item.cookieDough, Item.beeHoney}, buffs = {{attribute="essence", value = 1}}},
    [Item.potatoBread] = {ingredients = {Item.plainDough, Item.bakedPotato}, buffs = {{attribute="strength", value = 1}}},
    [Item.sausageOnBread] = {ingredients = {Item.plainDough, Item.sausage, Item.sausage, Item.sausage}, buffs = {{attribute="constitution", value = 1}}},
    [Item.bananaBread] = {ingredients = {Item.banana, Item.plainDough, Item.pigeonEgg}, buffs = {{attribute="willpower", value = 1}, {attribute="intelligence", value = 1}}},
    [Item.blackberryMuffin] = {ingredients = {Item.pastryDough, Item.blackberry}, buffs = {{attribute="essence", value = 1}, {attribute="perception", value = 1}}},
    [Item.applePie] = {ingredients = {Item.pastryDough, Item.apple, Item.pear, Item.nuts}, buffs = {{attribute="willpower", value = 1}, {attribute="intelligence", value = 1}}},
    [Item.cherryCake] = {ingredients = {Item.pastryDough, Item.cherries, Item.beeHoney}, buffs = {{attribute="dexterity", value = 1}, {attribute="agility", value = 1}}},
    [Item.eggSaladSandwich] = {ingredients = {Item.plainDough, Item.pigeonEgg, Item.bottleOfMilk}, buffs = {{attribute="dexterity", value = 1}, {attribute="agility", value = 1}}},
    [Item.nutbread] = {ingredients = {Item.plainDough, Item.nuts, Item.pigeonEgg}, buffs = {{attribute="essence", value = 1}, {attribute="perception", value = 1}, {attribute="willpower", value = 1}, {attribute="intelligence", value = 1}}},
    [Item.strawberryCake] = {ingredients = {Item.pastryDough, Item.strawberry, Item.beeHoney}, buffs = {{attribute="dexterity", value = 1}, {attribute="agility", value = 1}}},
    [Item.custardPie] = {ingredients = {Item.pastryDough, Item.whiteEgg, Item.bottleOfMilk}, buffs = {{attribute="dexterity", value = 1}, {attribute="agility", value = 1}}},
    [Item.elderberryPie] = {ingredients = {Item.pastryDough, Item.redElder, Item.beeHoney}, buffs = {{attribute="willpower", value = 1}, {attribute="intelligence", value = 1}}},
    [Item.strawberryMedallion] = {ingredients = {Item.pastryDough, Item.strawberry}},
    [Item.blackberryMedallion] = {ingredients = {Item.pastryDough, Item.blackberry}},
    [Item.blueberryMedallion] = {ingredients = {Item.pastryDough, Item.blueberry}},
    [Item.raspberryMedallion] = {ingredients = {Item.pastryDough, Item.raspberry}},
    [Item.deerberryMedallion] = {ingredients = {Item.pastryDough, Item.deerberry}},
    [Item.elderberryMedallion] = {ingredients = {Item.pastryDough, Item.elderberry}},
    [Item.cloudberryMedallion] = {ingredients = {Item.pastryDough, Item.cloudberry}},


    -- Bowl dishes
    [Item.salad] = {ingredients = {Item.soupBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.soupBowl},
    [Item.saladClay] = {ingredients = {Item.clayBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.clayBowl},
    [Item.saladPorcelain] = {ingredients = {Item.ceramicBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.ceramicBowl},
    [Item.saladIron] = {ingredients = {Item.ironBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.ironBowl},
    [Item.saladCopper] = {ingredients = {Item.copperBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.copperBowl},
    [Item.saladSilver] = {ingredients = {Item.silverBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.silverBowl},
    [Item.saladGold] = {ingredients = {Item.goldBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.goldBowl},
    [Item.saladGlass] = {ingredients = {Item.glassBowl, Item.lettuce, Item.tomato, Item.cucumber}, leftOver = Item.glassBowl},

    [Item.fruitSalad] = {ingredients = {Item.soupBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.soupBowl},
    [Item.fruitSaladClay] = {ingredients = {Item.clayBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.clayBowl},
    [Item.fruitSaladPorcelain] = {ingredients = {Item.ceramicBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.ceramicBowl},
    [Item.fruitSaladIron] = {ingredients = {Item.ironBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.ironBowl},
    [Item.fruitSaladCopper] = {ingredients = {Item.copperBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.copperBowl},
    [Item.fruitSaladSilver] = {ingredients = {Item.silverBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.silverBowl},
    [Item.fruitSaladGold] = {ingredients = {Item.goldBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.goldBowl},
    [Item.fruitSaladGlass] = {ingredients = {Item.glassBowl, Item.pineapple, Item.mango, Item.apple}, leftOver = Item.glassBowl},

    [Item.mushroomSoup] = {ingredients = {Item.soupBowl, Item.champignon}, leftOver = Item.soupBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupClay] = {ingredients = {Item.clayBowl, Item.champignon}, leftOver = Item.clayBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.champignon}, leftOver = Item.ceramicBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupIron] = {ingredients = {Item.ironBowl, Item.champignon}, leftOver = Item.ironBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupCopper] = {ingredients = {Item.copperBowl, Item.champignon}, leftOver = Item.copperBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupSilver] = {ingredients = {Item.silverBowl, Item.champignon}, leftOver = Item.silverBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupGold] = {ingredients = {Item.goldBowl, Item.champignon}, leftOver = Item.goldBowl, buffs = {{attribute = "agility", value = 1}}},
    [Item.mushroomSoupGlass] = {ingredients = {Item.glassBowl, Item.champignon}, leftOver = Item.glassBowl, buffs = {{attribute = "agility", value = 1}}},

    [Item.onionSoup] = {ingredients = {Item.soupBowl, Item.onion}, leftOver = Item.soupBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupClay] = {ingredients = {Item.clayBowl, Item.onion}, leftOver = Item.clayBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.onion}, leftOver = Item.ceramicBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupIron] = {ingredients = {Item.ironBowl, Item.onion}, leftOver = Item.ironBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupCopper] = {ingredients = {Item.copperBowl, Item.onion}, leftOver = Item.copperBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupSilver] = {ingredients = {Item.silverBowl, Item.onion}, leftOver = Item.silverBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupGold] = {ingredients = {Item.goldBowl, Item.onion}, leftOver = Item.goldBowl, buffs = {{attribute = "intelligence", value = 1}}},
    [Item.onionSoupGlass] = {ingredients = {Item.glassBowl, Item.onion}, leftOver = Item.glassBowl, buffs = {{attribute = "intelligence", value = 1}}},

    [Item.cabbageStew] = {ingredients = {Item.soupBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.soupBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewClay] = {ingredients = {Item.clayBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.clayBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewPorcelain] = {ingredients = {Item.ceramicBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.ceramicBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewIron] = {ingredients = {Item.ironBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.ironBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewCopper] = {ingredients = {Item.copperBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.copperBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewSilver] = {ingredients = {Item.silverBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.silverBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewGold] = {ingredients = {Item.goldBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.goldBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.cabbageStewGlass] = {ingredients = {Item.glassBowl, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.glassBowl, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},

    [Item.mulligan] = {ingredients = {Item.soupBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.soupBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganClay] = {ingredients = {Item.clayBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.clayBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganPorcelain] = {ingredients = {Item.ceramicBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.ceramicBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganIron] = {ingredients = {Item.ironBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.ironBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganCopper] = {ingredients = {Item.copperBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.copperBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganSilver] = {ingredients = {Item.silverBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.silverBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganGold] = {ingredients = {Item.goldBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.goldBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.mulliganGlass] = {ingredients = {Item.glassBowl, Item.cabbage, Item.carrots, Item.onion}, leftOver = Item.glassBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},

    [Item.potatoSoup] = {ingredients = {Item.soupBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.soupBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupClay] = {ingredients = {Item.clayBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.clayBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.ceramicBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupIron] = {ingredients = {Item.ironBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.ironBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupCopper] = {ingredients = {Item.copperBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.copperBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupSilver] = {ingredients = {Item.silverBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.silverBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupGold] = {ingredients = {Item.goldBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.goldBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.potatoSoupGlass] = {ingredients = {Item.glassBowl, Item.potato, Item.bottleOfMilk}, leftOver = Item.glassBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},

    [Item.eggSalad] = {ingredients = {Item.soupBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.soupBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladClay] = {ingredients = {Item.clayBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.clayBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladPorcelain] = {ingredients = {Item.ceramicBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.ceramicBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladIron] = {ingredients = {Item.ironBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.ironBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladCopper] = {ingredients = {Item.copperBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.copperBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladSilver] = {ingredients = {Item.silverBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.silverBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladGold] = {ingredients = {Item.goldBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.goldBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggSaladGlass] = {ingredients = {Item.glassBowl, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.glassBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    [Item.fishSoup] = {ingredients = {Item.soupBowl, Item.trout, Item.cabbage, Item.onion, Item.cabbage}, leftOver = Item.soupBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupClay] = {ingredients = {Item.clayBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.clayBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.ceramicBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupIron] = {ingredients = {Item.ironBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.ironBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupCopper] = {ingredients = {Item.copperBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.copperBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupSilver] = {ingredients = {Item.silverBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.silverBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupGold] = {ingredients = {Item.goldBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.goldBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.fishSoupGlass] = {ingredients = {Item.glassBowl, Item.trout, Item.cabbage, Item.onion}, leftOver = Item.glassBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    [Item.mackerelSalad] = {ingredients = {Item.soupBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.soupBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladClay] = {ingredients = {Item.clayBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.clayBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladPorcelain] = {ingredients = {Item.ceramicBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.ceramicBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladIron] = {ingredients = {Item.ironBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.ironBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladCopper] = {ingredients = {Item.copperBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.copperBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladSilver] = {ingredients = {Item.silverBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.silverBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladGold] = {ingredients = {Item.goldBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.goldBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},
    [Item.mackerelSaladGlass] = {ingredients = {Item.glassBowl, Item.horseMackerel, Item.pigeonEgg, Item.bottleOfMilk}, leftOver = Item.glassBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "willpower", value = 1}}},

    [Item.beerSoup] = {ingredients = {Item.soupBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.soupBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupClay] = {ingredients = {Item.clayBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.clayBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.ceramicBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupIron] = {ingredients = {Item.ironBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.ironBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupCopper] = {ingredients = {Item.copperBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.copperBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupSilver] = {ingredients = {Item.silverBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.silverBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupGold] = {ingredients = {Item.goldBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.goldBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.beerSoupGlass] = {ingredients = {Item.glassBowl, Item.bottleOfBeer, Item.onion, Item.hop}, leftOver = Item.glassBowl, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},

    [Item.goulash] = {ingredients = {Item.soupBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.soupBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashClay] = {ingredients = {Item.clayBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.clayBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashPorcelain] = {ingredients = {Item.ceramicBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.ceramicBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashIron] = {ingredients = {Item.ironBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.ironBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashCopper] = {ingredients = {Item.copperBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.copperBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashSilver] = {ingredients = {Item.silverBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.silverBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashGold] = {ingredients = {Item.goldBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.goldBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},
    [Item.goulashGlass] = {ingredients = {Item.glassBowl, Item.deerMeat, Item.tomato, Item.carrots, Item.potato}, leftOver = Item.glassBowl, buffs = {{attribute = "strength", value = 1}, {attribute = "dexterity", value = 1}}},

    [Item.chickenSoup] = {ingredients = {Item.soupBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.soupBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupClay] = {ingredients = {Item.clayBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.clayBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupPorcelain] = {ingredients = {Item.ceramicBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.ceramicBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupIron] = {ingredients = {Item.ironBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.ironBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupCopper] = {ingredients = {Item.copperBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.copperBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupSilver] = {ingredients = {Item.silverBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.silverBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupGold] = {ingredients = {Item.goldBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.goldBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.chickenSoupGlass] = {ingredients = {Item.glassBowl, Item.chickenMeat, Item.pumpkin, Item.pumpkin, Item.pumpkin}, leftOver = Item.glassBowl, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},

    [Item.rosefishStew] = {ingredients = {Item.soupBowl, Item.roseFish, Item.potato, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.soupBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewClay] = {ingredients = {Item.clayBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.clayBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewPorcelain] = {ingredients = {Item.ceramicBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.ceramicBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewIron] = {ingredients = {Item.ironBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.ironBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewCopper] = {ingredients = {Item.copperBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.copperBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewSilver] = {ingredients = {Item.silverBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.silverBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewGold] = {ingredients = {Item.goldBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.goldBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    [Item.rosefishStewGlass] = {ingredients = {Item.glassBowl, Item.roseFish, Item.carrots, Item.cabbage, Item.cabbage, Item.cabbage}, leftOver = Item.glassBowl, buffs = {{attribute = "perception", value = 1}, {attribute = "agility", value = 1}}},
    --Plate dishes
    [Item.veggieHash] = {ingredients = {Item.woodenPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashClay] = {ingredients = {Item.clayPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashPorcelain] = {ingredients = {Item.ceramicPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashIron] = {ingredients = {Item.ironDishPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashCopper] = {ingredients = {Item.copperPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashSilver] = {ingredients = {Item.silverPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashGold] = {ingredients = {Item.goldPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "essence", value = 1}}},
    [Item.veggieHashGlass] = {ingredients = {Item.glassPlate, Item.carrots, Item.potato, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "essence", value = 1}}},

    [Item.cabbageRoll] = {ingredients = {Item.woodenPlate, Item.cabbage, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollClay] = {ingredients = {Item.clayPlate, Item.cabbage, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollPorcelain] = {ingredients = {Item.ceramicPlate, Item.cabbage, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollIron] = {ingredients = {Item.ironDishPlate, Item.cabbage, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollCopper] = {ingredients = {Item.copperPlate, Item.cabbage, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollSilver] = {ingredients = {Item.silverPlate, Item.cabbage, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollGold] = {ingredients = {Item.goldPlate, Item.cabbage, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "perception", value = 1}}},
    [Item.cabbageRollGlass] = {ingredients = {Item.glassPlate, Item.cabbage, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "perception", value = 1}}},


    [Item.troutFilletDish] = {ingredients = {Item.woodenPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.woodenPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishClay] = {ingredients = {Item.clayPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.clayPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.ceramicPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishIron] = {ingredients = {Item.ironDishPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.ironDishPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishCopper] = {ingredients = {Item.copperPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.copperPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishSilver] = {ingredients = {Item.silverPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.silverPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishGold] = {ingredients = {Item.goldPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.goldPlate, buffs = {{attribute = "willpower", value = 1}}},
    [Item.troutFilletDishGlass] = {ingredients = {Item.glassPlate, Item.smokedFish, Item.carrots, Item.tomato}, leftOver = Item.glassPlate, buffs = {{attribute = "willpower", value = 1}}},

    [Item.salmonDish] = {ingredients = {Item.woodenPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.woodenPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishClay] = {ingredients = {Item.clayPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.clayPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.ceramicPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishIron] = {ingredients = {Item.ironDishPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.ironDishPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishCopper] = {ingredients = {Item.copperPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.copperPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishSilver] = {ingredients = {Item.silverPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.silverPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishGold] = {ingredients = {Item.goldPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.goldPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.salmonDishGlass] = {ingredients = {Item.glassPlate, Item.smokedSalmon, Item.potato, Item.cucumber}, leftOver = Item.glassPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    [Item.eggDish] = {ingredients = {Item.woodenPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.woodenPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishClay] = {ingredients = {Item.clayPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.clayPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.ceramicPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishIron] = {ingredients = {Item.ironDishPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.ironDishPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishCopper] = {ingredients = {Item.copperPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.copperPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishSilver] = {ingredients = {Item.silverPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.silverPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishGold] = {ingredients = {Item.goldPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.goldPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.eggDishGlass] = {ingredients = {Item.glassPlate, Item.pigeonEgg, Item.sausage, Item.tomato}, leftOver = Item.glassPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    [Item.meatDish] = {ingredients = {Item.woodenPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishClay] = {ingredients = {Item.clayPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishIron] = {ingredients = {Item.ironDishPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishCopper] = {ingredients = {Item.copperPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishSilver] = {ingredients = {Item.silverPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishGold] = {ingredients = {Item.goldPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},
    [Item.hamDishGlass] = {ingredients = {Item.glassPlate, Item.ham, Item.potato, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "dexterity", value = 1}, {attribute = "agility", value = 1}}},

    [Item.sausagesDish] = {ingredients = {Item.woodenPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishClay] = {ingredients = {Item.clayPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishIron] = {ingredients = {Item.ironDishPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishCopper] = {ingredients = {Item.copperPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishSilver] = {ingredients = {Item.silverPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishGold] = {ingredients = {Item.goldPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.sausagesDishGlass] = {ingredients = {Item.glassPlate, Item.sausage, Item.potato, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},

    [Item.steakDish] = {ingredients = {Item.woodenPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.woodenPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishClay] = {ingredients = {Item.clayPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.clayPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.ceramicPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishIron] = {ingredients = {Item.ironDishPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.ironDishPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishCopper] = {ingredients = {Item.copperPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.copperPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishSilver] = {ingredients = {Item.silverPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.silverPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishGold] = {ingredients = {Item.goldPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.goldPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.steakDishGlass] = {ingredients = {Item.glassPlate, Item.grilledSteak, Item.potato, Item.cucumber}, leftOver = Item.glassPlate, buffs = {{attribute = "willpower", value = 1}, {attribute = "intelligence", value = 1}}},

    [Item.rosefishDish] = {ingredients = {Item.woodenPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishClay] = {ingredients = {Item.clayPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishIron] = {ingredients = {Item.ironDishPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishCopper] = {ingredients = {Item.copperPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishSilver] = {ingredients = {Item.silverPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishGold] = {ingredients = {Item.goldPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},
    [Item.rosefishDishGlass] = {ingredients = {Item.glassPlate, Item.smokedRosefish, Item.potato, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "intelligence", value = 1}}},

    [Item.rabbitDish] = {ingredients = {Item.woodenPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishClay] = {ingredients = {Item.clayPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishIron] = {ingredients = {Item.ironDishPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishCopper] = {ingredients = {Item.copperPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishSilver] = {ingredients = {Item.silverPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishGold] = {ingredients = {Item.goldPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.rabbitDishGlass] = {ingredients = {Item.glassPlate, Item.smokedRabbit, Item.onion, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    [Item.chickenDish] = {ingredients = {Item.woodenPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.woodenPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishClay] = {ingredients = {Item.clayPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.clayPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.ceramicPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishIron] = {ingredients = {Item.ironDishPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.ironDishPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishCopper] = {ingredients = {Item.copperPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.copperPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishSilver] = {ingredients = {Item.silverPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.silverPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishGold] = {ingredients = {Item.goldPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.goldPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.chickenDishGlass] = {ingredients = {Item.glassPlate, Item.smokedChicken, Item.potato, Item.cabbage, Item.pumpkin}, leftOver = Item.glassPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},

    [Item.lambDish] = {ingredients = {Item.woodenPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.woodenPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishClay] = {ingredients = {Item.clayPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.clayPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.ceramicPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishIron] = {ingredients = {Item.ironDishPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.ironDishPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishCopper] = {ingredients = {Item.copperPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.copperPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishSilver] = {ingredients = {Item.silverPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.silverPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishGold] = {ingredients = {Item.goldPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.goldPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},
    [Item.lambDishGlass] = {ingredients = {Item.glassPlate, Item.grilledLamb, Item.onion, Item.bellpepper}, leftOver = Item.glassPlate, buffs = {{attribute = "essence", value = 1}, {attribute = "perception", value = 1}}},

    [Item.venisonDish] = {ingredients = {Item.woodenPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.woodenPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishClay] = {ingredients = {Item.clayPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.clayPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishPorcelain] = {ingredients = {Item.ceramicPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.ceramicPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishIron] = {ingredients = {Item.ironDishPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.ironDishPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishCopper] = {ingredients = {Item.copperPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.copperPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishSilver] = {ingredients = {Item.silverPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.silverPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishGold] = {ingredients = {Item.goldPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.goldPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},
    [Item.venisonDishGlass] = {ingredients = {Item.glassPlate, Item.grilledVenison, Item.tomato, Item.cabbage}, leftOver = Item.glassPlate, buffs = {{attribute = "strength", value = 1}, {attribute = "constitution", value = 1}}},

    }

function M.isFood(potentialFoodItemId)
    if M.cookedFood[potentialFoodItemId] then
        return true, true
    end

    if M.foragedFood[potentialFoodItemId] then
        return true, false
    end

    return false
end

-- constants for free food (everything uncooked); use only those
local valueSmall = 800
local valueMedium = 1200
local valueLarge = 3000

-- Processed resource (not free food as the gathered ingredient has been processed once via crafting, but not properly crafted food either as it remains an ingredient albeit edible)
M.foragedFood = {
    [Item.beeHoney] = {foodPoints = valueMedium, leftOver = Item.emptyHoneyJar},
    [Item.firewaspHoney] = {foodPoints = valueMedium, leftOver = Item.emptyHoneyJar},
    [Item.apple]   = {foodPoints = valueSmall},
    [Item.cherries]  = {foodPoints = valueSmall},
    [Item.peach]  = {foodPoints = valueSmall},
    [Item.pear]  = {foodPoints = valueSmall},
    [Item.tangerine]  = {foodPoints = valueSmall},
    [Item.banana]   = {foodPoints = valueSmall},
    [Item.plum]  = {foodPoints = valueMedium},
    [Item.nuts]  = {foodPoints = valueMedium},
    [Item.mango]  = {foodPoints = valueMedium},
    [Item.orange] = {foodPoints = valueLarge},
    [Item.grapes]  = {foodPoints = valueLarge},
    [Item.pineapple]  = {foodPoints = valueLarge},
    [Item.trout] = {foodPoints = valueMedium},
    [Item.swordfish] = {foodPoints = valueMedium},
    [Item.crab] = {foodPoints = valueMedium},
    [Item.lobster] = {foodPoints = valueMedium},
    [Item.foxMeat] = {foodPoints = valueMedium},
    [Item.wolfMeat] = {foodPoints = valueMedium},
    [Item.bearMeat] = {foodPoints = valueMedium},
    [Item.raptorMeat] = {foodPoints = valueMedium},
    [Item.dragonMeat] = {foodPoints = valueLarge},
    [Item.ratMeat] = {foodPoints = valueMedium},
    [Item.shrimp] = {foodPoints = valueMedium},
    [Item.octopus] = {foodPoints = valueMedium},
    [Item.eel] = {foodPoints = valueMedium},
    [Item.flounder] = {foodPoints = valueMedium},
    [Item.sandberry]  = {foodPoints = valueSmall},
    [Item.bulbspongeMushroom]  = {foodPoints = valueSmall, poisonPoints = 1000},
    [Item.toadstool]  = {foodPoints = valueSmall, poisonPoints = 1000},
    [Item.herdersMushroom]  = {foodPoints = valueSmall},
    [Item.tomato]  = {foodPoints = valueMedium},
    [Item.onion]  = {foodPoints = valueMedium},
    [Item.cabbage]  = {foodPoints = valueMedium},
    [Item.pork] = {foodPoints = valueMedium},
    [Item.salmon] = {foodPoints = valueMedium},
    [Item.deerMeat] = {foodPoints = valueMedium},
    [Item.rabbitMeat] = {foodPoints = valueMedium},
    [Item.whiteEgg] = {foodPoints = valueSmall},
    [Item.chickenMeat] = {foodPoints = valueMedium},
    [Item.horseMackerel] = {foodPoints = valueMedium},
    [Item.roseFish] = {foodPoints = valueMedium},
    [Item.carrots] = {foodPoints = valueMedium},
    [Item.lambMeat] = {foodPoints = valueMedium},
    [Item.rawSteak] = {foodPoints = valueMedium},
    [Item.potato] = {foodPoints = valueMedium},
    [Item.honeycomb] = {foodPoints = valueSmall},
    [Item.pigeonEgg] = {foodPoints = valueSmall},
    [Item.seagullEgg] = {foodPoints = valueMedium},
    [Item.firewaspHoneycomb] = {foodPoints = valueMedium},
    [Item.raptorEgg] = {foodPoints = valueMedium},
    [Item.spiderEgg] = {foodPoints = valueMedium},
    [Item.dragonEgg] = {foodPoints = valueLarge},
    [Item.pumpkin] = {foodPoints = valueLarge},
    [Item.bellpepper] = {foodPoints = valueMedium},
    [Item.corn] = {foodPoints = valueMedium},
    [Item.lettuce] = {foodPoints = valueSmall},
    [Item.cucumber] = {foodPoints = valueSmall},
    [Item.blueberry]  = {foodPoints = valueSmall},
    [Item.strawberry]  = {foodPoints = valueSmall},
    [Item.blackberry]  = {foodPoints = valueSmall},
    [Item.redElder]  = {foodPoints = valueSmall},
    [Item.champignon]  = {foodPoints = valueSmall},
    [Item.raspberry]  = {foodPoints = valueMedium},
    [Item.birthMushroom]  = {foodPoints = valueMedium},
    [Item.cloudberry]  = {foodPoints = valueMedium},
    [Item.redHead]  = {foodPoints = valueLarge},
    [Item.berries]   = {foodPoints = valueLarge},
    [Item.chanterelle]   = {foodPoints = valueLarge}
    }




local attributesGerman = {}
attributesGerman.strength     = "Stärke"
attributesGerman.constitution   = "Ausdauer"
attributesGerman.agility      = "Schnelligkeit"
attributesGerman.dexterity    = "Geschicklichkeit"
attributesGerman.intelligence = "Intelligenz"
attributesGerman.essence      = "Essenz"
attributesGerman.perception   = "Wahrnehmung"
attributesGerman.willpower    = "Willensstärke"

local function buffsAdding(user, sourceItem)

    local dishInfo
    local buffs

    if not common.IsNilOrEmpty(sourceItem:getData("ingredient1")) then
        dishInfo = cookingRecipeCreation.getDishInfo(sourceItem)
        buffs = dishInfo.attributes
    else --It is an old or spawned in item
        local ingredients = M.cookedFood[sourceItem.id].ingredients
        dishInfo = cookingRecipeCreation.getDishInfo(nil, ingredients)
        buffs = M.cookedFood[sourceItem.id].buffs
        -- To avoid upsetting players too much, we use custom buffs that impact the same attributes as the old dishes only slightly weaker
        if not buffs then
            buffs = dishInfo.attributes
        end
    end

    if not buffs then
        return
    end

    local rarity = sourceItem:getData("rareness")

    if not common.IsNilOrEmpty(rarity) then
        rarity = tonumber(rarity)
    else
        rarity = 0
    end

    local messageDe = "Durch das Essen erfährst du folgende Veränderungen: "
    local messageEn = "Because of the meal you experience following changes: "

    local foundEffect = user.effects:find(12)
    if foundEffect then
        user.effects:removeEffect(12)
        messageDe = "Die vorherige Nahrungswirkung wird ersetzt. " .. messageDe
        messageEn = "The former diet effect is replaced. " .. messageEn
    end

    local duration = cookingRecipeCreation.getDuration(dishInfo)

    if rarity >= 3 then
        duration = duration*(1 + (rarity-2)/10) -- 10,20% increase of duration based on rarity
    end

    local dietEffect = LongTimeEffect(12, duration)
    local addComma = false

    local rarityBuff = 0

    local numberOfBuffedStats = 0

    for _, value in pairs(buffs) do
        numberOfBuffedStats = numberOfBuffedStats+1
    end

    local attributes = {"strength", "agility", "essence", "dexterity", "perception", "willpower", "intelligence", "constitution"}

    local emptyBuffs = #attributes - #buffs

    for _, attrib in pairs(attributes) do
        local add = true
        for _, buff in pairs(buffs) do
            if buff.attribute == attrib then
                add = false
            end
        end

        if add then
            table.insert(buffs, {attribute = attrib, value = 0})
        end
    end

    for _, buff in pairs(buffs) do

        if buff.value > 0 then

            if rarityBuff < rarity-1 then
                local toAdd = 1
                if emptyBuffs > #attributes-(rarity-1) and buff.value == 1 then -- allow +3 out of a +1 if the dish has less attribs than rarity
                    toAdd = 2
                end

                buff.value = buff.value+ toAdd
                rarityBuff = rarityBuff + toAdd
            end

            if addComma then
                messageDe = messageDe .. ", "
                messageEn = messageEn .. ", "
            end

            messageDe = messageDe .. attributesGerman[buff.attribute] .. " +" .. buff.value
            messageEn = messageEn .. buff.attribute .. " +" .. buff.value
            addComma = true

            local oldValue = user:increaseAttrib(buff.attribute, 0)
            local newValue = user:increaseAttrib(buff.attribute, buff.value)

            dietEffect:addValue(buff.attribute, newValue - oldValue)
        end
    end

    if rarityBuff < rarity-1 then -- We still got more buffs to add, now assigning to random attribs since not enough were in the dish

        local buffToAdd = math.random(1, emptyBuffs)
        local count = 1

        for _, buff in pairs(buffs) do
            if buff.value == 0 then
                if count == buffToAdd then

                    local toAdd = rarity - rarityBuff - 1
                    buff.value = buff.value + toAdd

                    messageDe = messageDe .. ", " .. attributesGerman[buff.attribute] .. " +" .. buff.value
                    messageEn = messageEn .. ", " .. buff.attribute .. " +" .. buff.value

                    local oldValue = user:increaseAttrib(buff.attribute, 0)
                    local newValue = user:increaseAttrib(buff.attribute, buff.value)

                    dietEffect:addValue(buff.attribute, newValue - oldValue)
                    break
                else
                    count = count + 1
                end
            end
        end
    end

    user.effects:addEffect(dietEffect)
    user:inform(messageDe, messageEn)
end

local function leftOverCreation(user, leftOverId)
    if leftOverId then
        if math.random(1,20) == 1 then
            user:inform("Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.", Character.highPriority)
        else
            common.CreateItem(user, leftOverId, 1, 333, nil)
        end
    end
end

local function foodLevelInform(user, newFoodLevel, oldFoodLevel)
    local messageDe
    local messageEn

    if newFoodLevel == 60000 or newFoodLevel > 55000 and oldFoodLevel <= 55000 then
        messageDe = "Nur mit Mühe kriegst du noch etwas runter."
        messageEn = "You hardly manage to eat anything else."
    elseif newFoodLevel > 50000 and oldFoodLevel <= 50000 then
        messageDe = "Du bist sehr satt."
        messageEn = "You have had enough."
    elseif newFoodLevel > 40000 and oldFoodLevel <= 40000 then
        messageDe = "Du bist satt."
        messageEn = "You are stuffed."
    elseif newFoodLevel > 30000 and oldFoodLevel <= 30000 then
        messageDe = "Du fühlst dich noch etwas hungrig."
        messageEn = "You still feel a little hungry."
    elseif newFoodLevel > 20000 and oldFoodLevel <= 20000 then
        messageDe = "Du hast noch immer Hunger."
        messageEn = "You are still hungry."
    elseif newFoodLevel > 5000 and oldFoodLevel <= 5000 then
        messageDe = "Dein Magen schmerzt noch immer vor Hunger."
        messageEn = "Your stomach still hurts because of your hunger."
    end

    if messageDe and messageEn then
        user:inform(messageDe,messageEn, Character.mediumPriority)
    end
end

local function mapItem(user, sourceItem)
    if sourceItem.wear == 255 then
        if not ratCistern.checkCarrot(user,sourceItem) then
            user:inform("Das kannst du nicht essen.", "You can't eat that.", Character.highPriority)
        end
        return true
    end
end

local function alchemyCheck(user, sourceItem, ltstate)
    local plus, minus = alchemy.getPlantSubstance(sourceItem.id)
    local isPlant = plus or minus
    local cauldron = alchemy.GetCauldronInfront(user, sourceItem)
    if (cauldron ~= nil) and isPlant then
        herbs.UseItem(user, sourceItem, ltstate)
        return true
    end
    return false
end

local function specialEgg(user, sourceItem)
    if specialeggs.checkSpecialEgg(sourceItem, user) then
        return true
    end
    return false
end

local function holyGrapes(user, sourceItem)
    if sourceItem:getData("nameEn") == "Holy Grapes" then
        user:increaseAttrib("foodlevel", 2000)
        user:inform("Die Trauben haben einen vollen Geschmack und füllen deinen ganzen Mund mit ihrem süßlichen Saft. Köstlich! Doch sie umspielen nicht nur deine Geschmacksknospen, sondern auch deinen Geist. Du bist leicht angetrunken.","The grapes have a rich, sweet taste that lingers on your tongue as their flavourful juice fills your entire mouth. Delicious! However, they not only play with your taste buds but also with your mind. You feel slightly drunk.")
        world:erase(sourceItem, 1)
        return true
    end
end

local function thievesPoisonQuest(user, sourceItem)

    if sourceItem:getData("nameEn") == "Thieves Dinner" then
        if user:getQuestProgress(543) == 7 then
            if user:countItemAt("all", 1323) == 0 then
                user:inform("Du benötigst das Gift, um es unter das Essen zu mischen.", "You need the poison to tamper with the food.")
            else
                user:inform("Du hast den Inhalt des Fläschchens unbemerkt unter das Essen gemischt. Kehre zu Brigette zurück, um deine Belohnung abzuholen.", "You successfully sneak the contents of the vial Brigette gave you into the food, return to her for a reward.")
                user:setQuestProgress(543, 8)
                user:eraseItem(1323, 1)
            end
        end
        return true
    end

    return false
end

local function fortuneCookie(sourceItem, user)
    if sourceItem.id == 453 then
        if math.random(1, 100) == 1 then
            local deText, enText = furtunecookies.cookie()
            user:inform("Du findest ein Stück Papier in dem Keks: \""..deText.."\"", "You find a piece of paper inside the cookie: \""..enText.."\"")
        end
    end
end

local function customInform(sourceItem, user)
    local customInformEN = sourceItem:getData("customInformEN")
    local customInformDE = sourceItem:getData("customInformDE")
    if customInformEN ~= "" and customInformDE ~= "" then
        common.InformNLS( user, customInformDE, customInformEN)
    end
end

function M.MoveItemAfterMove( user, SourceItem, TargetItem )
    if onionball.moveOnion(user, SourceItem, TargetItem) then
        return false
    end
    return true
end

function M.UseItem(user, sourceItem, ltstate)
    if onionball.useOnion(user, sourceItem) then
        return
    end

    if holyGrapes(user, sourceItem) then
        return
    elseif specialEgg(user, sourceItem) then
        return
    elseif alchemyCheck(user, sourceItem, ltstate) then
        return
    elseif thievesPoisonQuest(user, sourceItem) then
        return
    elseif mapItem(user, sourceItem) then
        return

    end

    fortuneCookie(sourceItem, user)

    local oldFoodLevel = user:increaseAttrib("foodlevel", 0)

    local dishInfo

    if not common.IsNilOrEmpty(sourceItem:getData("ingredient1")) then
        dishInfo = cookingRecipeCreation.getDishInfo(sourceItem)
    elseif M.cookedFood[sourceItem.id] then
        local ingredients = M.cookedFood[sourceItem.id].ingredients
        dishInfo = cookingRecipeCreation.getDishInfo(nil, ingredients)
    end

    local foodIncrease

    if M.cookedFood[sourceItem.id] then
        foodIncrease = cookingRecipeCreation.getFoodIncrease(dishInfo)
    else
        foodIncrease = M.foragedFood[sourceItem.id].foodPoints
    end

    local rarity = sourceItem:getData("rareness")

    if rarity ~= "" then
        rarity = tonumber(rarity)
        foodIncrease = foodIncrease*(1 + (rarity-1)/10) --This results in a 10%, 20% and 30% food value increase for the uncommon, rare and unique food rarities
    end

    local newFoodLevel = user:increaseAttrib("foodlevel", foodIncrease)

    foodLevelInform(user, newFoodLevel, oldFoodLevel)

    if M.cookedFood[sourceItem.id] then
        buffsAdding(user, sourceItem)
    end

    customInform(sourceItem, user)

    world:erase(sourceItem, 1)

    local leftOver

    if M.cookedFood[sourceItem.id] then
        leftOver = M.cookedFood[sourceItem.id].leftOver
    else
        leftOver = M.foragedFood[sourceItem.id].leftOver
    end

    leftOverCreation(user, leftOver)
end

function M.LookAtItem(user, food)


    if M.cookedFood[food.id] and common.IsNilOrEmpty(food:getData("remainingValue")) and not M.cookedFood[food.id].intermediate then
        local dishInfo
        if not common.IsNilOrEmpty(food:getData("ingredient1")) then
            dishInfo = cookingRecipeCreation.getDishInfo(food)
        else
            local ingredients = M.cookedFood[food.id].ingredients
            dishInfo = cookingRecipeCreation.getDishInfo(nil, ingredients)
        end
        if dishInfo.worth and tonumber(dishInfo.worth) ~= 0 then
            food:setData("remainingValue", math.floor(dishInfo.worth/100)*100)
            world:changeItem(food)
        end
    end

    local baseLookat = lookat.GenerateLookAt(user, food, 0, nil, nil, nil, true)

    local descriptionEn
    local descriptionDe

    local rarity = tonumber(food:getData("rareness"))

    if common.IsNilOrEmpty(rarity) then
        rarity = 1
    end

    for _, description in pairs(foodRarityTexts) do
        if rarity == description.identifier and M.cookedFood[food.id] then
            descriptionEn = description.foodDescription.english
            descriptionDe = description.foodDescription.german
        end
    end

    for _, description in pairs(ingredientRarityTexts) do
        if rarity == description.identifier and not M.cookedFood[food.id] then
            descriptionEn = description.foodDescription.english
            descriptionDe = description.foodDescription.german
        end
    end

    if descriptionEn then
        if baseLookat.description ~= "" then
            baseLookat.description = baseLookat.description.."\n\n"
        end
        baseLookat.description = baseLookat.description..common.GetNLS(user, descriptionDe, descriptionEn)
    end

    return baseLookat

end

return M
