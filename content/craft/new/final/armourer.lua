local Craft = require("base.crafting.Craft")
local ProductGroup = require("base.crafting.ProductGroup")
local Product = require("base.crafting.Product")
local Ingredient = require("base.crafting.Ingredient")

local armourer = Craft {
    name = {english = "Armourer", german = "GERMAN"}
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"}
    skill = "SKILL",
    defaultFoodConsumption = NO_DEFAULT,
    [sfx = ID,
    sfxDuration = TIME,]

ProductGroup {name = {english = "Chain boots", german = "Kettenstiefel"},
Product {item = "simpleJackboots", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "leather", amount = 1}},
Product {item = "jackboots", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "leather", amount = 1}},
Product {item = "guardiansBoots", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "leather", amount = 1}},
Product {item = "silversteelBoots", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "leather", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "copperedGuardiansBoots", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "leather", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "silveredGuardiansBoots", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "gildedGuardiansBoots", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 1}},
Product {item = "salkamaerianSteelShoes", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "mastersSteelShoes", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureEarth", amount = 1}}
}

ProductGroup {name = {english = "Chain gloves", german = "Kettenhandschuhe"},
Product {item = "simpleChainGloves", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "chainGloves", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "reinforcedChainGloves", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "copperedChainGloves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silveredChainGloves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "SalkamaerianChainGloves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "gildedChainGloves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "guardsChainGloves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "gladiatorsChainGloves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 1}},
Product {item = "meriniumPlatedChainGloves", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "templarsChainGloves", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureWater", amount = 1}}
}

ProductGroup {name = {english = "Chain greaves", german = "Kettenhosen"},
Product {item = "simpleShortScaleGreaves", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "leather", amount = 1}},
Product {item = "shortScaleGreaves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "leather", amount = 1}},
Product {item = "reinforcedShortScaleGreaves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "leather", amount = 1}},
Product {item = "simpleScaleGreaves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "leather", amount = 1}},
Product {item = "scaleGreaves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "reinforcedScaleGreaves", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "simpleChainTrousers", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "shortChainTrousers", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 2}},
Product {item = "reinforcedChainTrousers", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 2}},
Product {item = "chainPants", Ingredient {item = "ironIngot", amount = 9}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "holyChainPants", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureWater", amount = 1}}
}

ProductGroup {name = {english = "Chain helmets", german = "Kettenhelme"},
Product {item = "chainHelmet", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "orcHelmet", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "copperedChainHelmet", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "serinjahHelmet", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silveredChainHelmet", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "stormCap", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "gildedChainHelmet", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "gynkeseMercenarysHelmet", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 2}},
Product {item = "chainHelmetOfDarkness", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 2}},
Product {item = "salkamaerianPaladinsHelmet", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "greyCloth", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "flameHelmet", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "greyCloth", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureFire", amount = 1}}
}

ProductGroup {name = {english = "Chain torso armour", german = "Kettenhemden"},
Product {item = "chainMail", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "leather", amount = 1}},
Product {item = "mercenaryArmour", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "leather", amount = 2}},
Product {item = "guardiansArmour", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "leather", amount = 2}},
Product {item = "scaleArmour", Ingredient {item = "ironIngot", amount = 9}, Ingredient {item = "leather", amount = 3}},
Product {item = "silversteelArmour", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "copperedScaleArmour", Ingredient {item = "ironIngot", amount = 12}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "copperIngot", amount = 4}, Ingredient {item = "ruby", amount = 1}},
Product {item = "lizardArmour", Ingredient {item = "ironIngot", amount = 13}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "copperIngot", amount = 4}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "silveredScaleArmour", Ingredient {item = "ironIngot", amount = 14}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "silverIngot", amount = 5}, Ingredient {item = "sapphire", amount = 1}, Ingredient {item = "copperIngot", amount = 4}},
Product {item = "salkamaerianArmour", Ingredient {item = "ironIngot", amount = 15}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "goldIngot", amount = 6}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 4}},
Product {item = "gildedScaleArmour", Ingredient {item = "ironIngot", amount = 17}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 4}},
Product {item = "salkamaerianOfficersArmour", Ingredient {item = "ironIngot", amount = 18}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 4}},
Product {item = "stateArmour", Ingredient {item = "ironIngot", amount = 20}, Ingredient {item = "leather", amount = 7}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}}
}}

ProductGroup {name = {english = "Plate boots", german = "Plattenstiefel"},
Product {item = "ironBoots", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "simpleSteelBoots", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "steelBoots", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedSteelBoots", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "copperedSteelBoots", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "dwarvenBoots", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "silveredSteelBoots", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "albarianSteelBoots", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "gildedSteelBoots", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "paladinsSteelBoots", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 1}},
Product {item = "knightBoots", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "knightBootsOfSwiftness", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureAir", amount = 1}}
}

ProductGroup {name = {english = "Plate gloves", german = "Plattenhandschuhe"},
Product {item = "simpleSteelGloves", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "steelGloves", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedSteelGloves", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "copperedSteelGloves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silveredSteelGloves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "dwarvenMetalGloves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "gildedSteelGloves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "squiresGloves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "AlbarianSteelGloves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "knightGloves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 1}},
Product {item = "meriniumPlatedSteelGloves", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "grandMastersGloves", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureEarth", amount = 1}}
}

ProductGroup {name = {english = "Plate greaves", german = "Plattenhosen"},
Product {item = "simpleShortIronGreaves", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "shortIronGreaves", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedShortIronGreaves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "simpleIronGreaves", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "ironGreaves", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "reinforcedIronGreaves", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "simpleSteelGreaves", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "steelGreaves", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 2}},
Product {item = "reinforcedSteelGreaves", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 2}},
Product {item = "knightsSteelGreaves", Ingredient {item = "ironIngot", amount = 9}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "steelGreavesOfEternalNight", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureEarth", amount = 1}}
}

ProductGroup {name = {english = "Plate helmets", german = "Plattenhelme"},
Product {item = "steelCap", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedSteelCap", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "steelHat", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedSteelHat", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "roundSteelHat", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "potHelmet", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "reinforcedPotHelmet", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "albarianMercenarysHelmet", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 2}},
Product {item = "albarianSoldiersHelmet", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 2}},
Product {item = "visoredHelmet", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "visoredHelmetOfDarkness", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureEarth", amount = 1}}
}

ProductGroup {name = {english = "Plate torso armour", german = "Plattenrüstungen"},
Product {item = "plateArmour", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedPlateArmour", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "ironPlate", amount = 2}},
Product {item = "steelPlate", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "ironPlate", amount = 2}},
Product {item = "copperedPlateArmour", Ingredient {item = "ironIngot", amount = 9}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "copperIngot", amount = 3}},
Product {item = "reinforcedSteelPlate", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "copperIngot", amount = 3}},
Product {item = "silveredPlateArmour", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "ironPlate", amount = 3}, Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "dwarvenPlate", Ingredient {item = "ironIngot", amount = 11}, Ingredient {item = "ironPlate", amount = 4}, Ingredient {item = "silverIngot", amount = 4}, Ingredient {item = "ruby", amount = 1}},
Product {item = "gildedPlateArmour", Ingredient {item = "ironIngot", amount = 12}, Ingredient {item = "ironPlate", amount = 4}, Ingredient {item = "goldIngot", amount = 4}, Ingredient {item = "ruby", amount = 1}},
Product {item = "albarianSteelPlate", Ingredient {item = "ironIngot", amount = 14}, Ingredient {item = "ironPlate", amount = 5}, Ingredient {item = "goldIngot", amount = 5}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "dwarvenStateArmour", Ingredient {item = "ironIngot", amount = 14}, Ingredient {item = "ironPlate", amount = 5}, Ingredient {item = "goldIngot", amount = 5}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "albarianKnightsArmour", Ingredient {item = "ironIngot", amount = 15}, Ingredient {item = "ironPlate", amount = 5}, Ingredient {item = "goldIngot", amount = 5}, Ingredient {item = "obsidian", amount = 1}, Ingredient {item = "copperIngot", amount = 4}},
Product {item = "albarianNoblesArmour", Ingredient {item = "ironIngot", amount = 17}, Ingredient {item = "ironPlate", amount = 6}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "emerald", amount = 1}, Ingredient {item = "silverIngot", amount = 4}},
Product {item = "heavyPlateArmour", Ingredient {item = "ironIngot", amount = 18}, Ingredient {item = "ironPlate", amount = 6}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "topaz", amount = 1}, Ingredient {item = "goldIngot", amount = 4}},
Product {item = "nightplate", Ingredient {item = "ironIngot", amount = 20}, Ingredient {item = "ironPlate", amount = 7}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamond", amount = 1}, Ingredient {item = "pureEarth", amount = 1}}
}
}
return armourer