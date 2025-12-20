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

M.itemIdBlueprint = Item.sealedPell

local function getLevel(itemId)

    local itemCommon = world:getItemStatsFromId(itemId)

    return itemCommon.Level
end

local function getName(itemId)

    local itemCommon = world:getItemStatsFromId(itemId)

    return {english = itemCommon.English, german = itemCommon.German}
end

--[[

    id: Used to identify and store whether someone knows the recipe.
    name: Used for the item description and informs.
    creator: If this is something invented by a player. Teaching system not yet implemented.
    craft: What craft does the item belong to.
    level: What is the level requirement to learn and craft this item.
    item: the item id of the crafted item you can make with this blueprint
    treasure: the type of map the blueprint can drop from; small, average, big or giant
    rareness: purely for aesthetics, the colour of the name of the scroll
    ingredients: What ingredients are necessary to craft the item
    tool: If it needs to be specified, the item id of the tool to use EG plane vs carving tools for carpentry
]]

M.blueprints = {
    {id = 1, name = {english = "fancy iron tray", german = "Verziertes Eisentablett"}, creator = "NA", craft = "finesmithing", --45
    level = getLevel(Item.fancyIronTray), item = Item.fancyIronTray, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.ironIngot, amount = 4},
        {id = Item.amethyst, amount = 3}
    }},

    {id = 2, name = {english = "fancy copper tray", german = "Verziertes Kupfertablett"}, creator = "NA", craft = "finesmithing", --50
    level = getLevel(Item.fancyCopperTray), item = Item.fancyCopperTray, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.copperIngot, amount = 3},
        {id = Item.obsidian, amount = 2},
        {id = Item.amethystPowder, amount = 1}
    }},

    {id = 3, name = {english = "fancy silver tray", german = "Verziertes Silbertablett"}, creator = "NA", craft = "finesmithing", --55
    level = getLevel(Item.fancySilverTray), item = Item.fancySilverTray, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.silverIngot, amount = 3},
        {id = Item.sapphire, amount = 2},
        {id = Item.rubyPowder, amount = 1}
    }},

    {id = 4, name = {english = "fancy gold tray", german = "Verziertes Goldtablett"}, creator = "NA", craft = "finesmithing",--60
    level = getLevel(Item.fancyGoldTray), item = Item.fancyGoldTray, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.goldIngot, amount = 2},
        {id = Item.emerald, amount = 2},
        {id = Item.obsidianPowder, amount = 1}
    }},

    {id = 5, name = {english = "blue-green stained glass tray", german = "Blau-grünes Bleiglastablett"}, creator = "NA", craft = "glassBlowing", --60
    level = getLevel(Item.stainedGlassTrayBlueGreen), item = Item.stainedGlassTrayBlueGreen, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.glassIngot, amount = 5},
        {id = Item.emeraldPowder, amount = 1},
        {id = Item.sapphirePowder, amount = 1}
    }},

    {id = 6, name = {english = "green-yellow stained glass tray", german = "Grün-gelbes Bleiglastablett"}, creator = "NA", craft = "glassBlowing", --80
    level = getLevel(Item.stainedGlassTrayGreenYellow), item = Item.stainedGlassTrayGreenYellow, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.glassIngot, amount = 10},
        {id = Item.emeraldPowder, amount = 1},
        {id = Item.topazPowder, amount = 1}
    }},

    {id = 7, name = {english = "red-black stained glass tray", german = "Rot-schwarzes Bleiglastablett"}, creator = "NA", craft = "glassBlowing", --40
    level = getLevel(Item.stainedGlassTrayRedBlack), item = Item.stainedGlassTrayRedBlack, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.glassIngot, amount = 1},
        {id = Item.rubyPowder, amount = 1},
        {id = Item.obsidianPowder, amount = 1}
    }},

    {id = 8, name = {english = "violet-red stained glass tray", german = "Violett-rotes Bleiglastablett"}, creator = "NA", craft = "glassBlowing", --20
    level = getLevel(Item.stainedGlassTrayVioletRed), item = Item.stainedGlassTrayVioletRed, treasure = "small", rareness = 1,
    ingredients = {
        {id = Item.glassIngot, amount = 1},
        {id = Item.ruby, amount = 1},
        {id = Item.amethyst, amount = 1}
    }},

    {id = 9, name = {english = "iron tray", german = "Eisentablett"}, creator = "NA", craft = "finesmithing", --35
    level = getLevel(Item.ironTraySouth), item = Item.ironTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.ironIngot, amount = 9}
    }},

    {id = 10, name = {english = "copper tray", german = "Kupfertablett"}, creator = "NA", craft = "finesmithing", --40
    level = getLevel(Item.copperTraySouth), item = Item.copperTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.copperIngot, amount = 5}
    }},

    {id = 11, name = {english = "silver tray", german = "Silbertablett"}, creator = "NA", craft = "finesmithing", --45
    level = getLevel(Item.silverTraySouth), item = Item.silverTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.silverIngot, amount = 5}
    }},

    {id = 12, name = {english = "gold tray", german = "Goldtablett"}, creator = "NA", craft = "finesmithing", --50
    level = getLevel(Item.goldTraySouth), item = Item.goldTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.goldIngot, amount = 6}
    }},

    {id = 13, name = {english = "naldor tray", german = "Naldortablett"}, creator = "NA", craft = "carpentry", --20
    level = getLevel(Item.naldorTraySouth), item = Item.naldorTraySouth, treasure = "small", rareness = 1,
    ingredients = {
        {id = Item.naldorWoodBoards, amount = 4},
        {id = Item.wax, amount = 2}
    }, tool = Item.plane},

    {id = 14, name = {english = "conifer tray", german = "Konifertablett"}, creator = "NA", craft = "carpentry", --40
    level = getLevel(Item.coniferTraySouth), item = Item.coniferTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.coniferWoodBoards, amount = 10},
        {id = Item.wax, amount = 5}
    }, tool = Item.plane},
    {id = 15, name = {english = "prismatic lens", german = "Prismatische Linse"}, creator = "NA", craft = "glassBlowing", --100
    level = getLevel(Item.prismaticLens), item = Item.prismaticLens, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.glassIngot, amount = 2},
        {id = Item.goldIngot, amount = 1},
        {id = Item.amethystPowder, amount = 1},
        {id = Item.rubyPowder, amount = 1},
        {id = Item.obsidianPowder, amount = 1},
        {id = Item.sapphirePowder, amount = 1},
        {id = Item.emeraldPowder, amount = 1},
        {id = Item.topazPowder, amount = 1},
        {id = Item.diamondPowder, amount = 1},
    }},
    {id = 16, name = {english = "cuprite ingot", german = "Cupritbarren"}, creator = "NA", craft = "mining", --100
    level = getLevel(Item.cupriteIngot), item = Item.cupriteIngot, treasure = "bigAndGiant", rareness = 4,
    ingredients = {
        {id = Item.cupriteOre, amount = 1},
        {id = Item.ironOre, amount = 1},
        {id = Item.coal, amount = 1}
    }, tool = Item.cruciblePincers},
    {id = 17, name = {english = "drow helmet", german = "Drowhelm"}, creator = "NA", craft = "armourer", --85
    level = getLevel(Item.drowHelmet), item = Item.drowHelmet, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.ironIngot, amount = 7},
        {id = Item.ironPlate, amount = 3},
        {id = Item.cupriteIngot, amount = 1},
        {id = Item.topaz, amount = 1},
        {id = Item.silverIngot, amount = 1},
    }},
    {id = 18, name = {english = "drow armour", german = "Drowrüstung"}, creator = "NA", craft = "armourer", --85
    level = getLevel(Item.drowArmour), item = Item.drowArmour, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.ironIngot, amount = 18},
        {id = Item.ironPlate, amount = 6},
        {id = Item.cupriteIngot, amount = 2},
        {id = Item.topaz, amount = 1},
        {id = Item.silverIngot, amount = 5},
    }},
        {id = 19, name = {english = "drow bow", german = "Drowbogen"}, creator = "NA", craft = "carpentry", --100
    level = getLevel(Item.drowBow), item = Item.drowBow, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.coniferWoodBoards, amount = 5},
        {id = Item.entrails, amount = 2},
        {id = Item.cupriteIngot, amount = 2},
        {id = Item.heartwood, amount = 1},
        {id = Item.pureAir, amount = 1},
    }, tool = Item.plane},
    {id = 20, name = {english = "drow blade", german = "Drow-Klinge"}, creator = "NA", craft = "blacksmithing", --100
    level = getLevel(Item.drowBlade), item = Item.drowBlade, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.ironIngot, amount = 7},
        {id = Item.swordHandle, amount = 1},
        {id = Item.cupriteIngot, amount = 2},
        {id = Item.meriniumIngot, amount = 1},
        {id = Item.pureEarth, amount = 1},
        {id = Item.goldIngot, amount = 2},
    }},
    {id = 21, name = {english = "drow sword", german = "Drowschwert"}, creator = "NA", craft = "blacksmithing", --100
    level = getLevel(Item.drowSword), item = Item.drowSword, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.ironIngot, amount = 12},
        {id = Item.bigSwordHandle, amount = 1},
        {id = Item.cupriteIngot, amount = 3},
        {id = Item.meriniumIngot, amount = 1},
        {id = Item.pureEarth, amount = 1},
        {id = Item.goldIngot, amount = 3},
    }},
    {id = 22, name = {english = "halberd of nature", german = "Hellebarde der Natur"}, creator = "NA", craft = "carpentry", --100
    level = getLevel(Item.halberdOfNature), item = Item.halberdOfNature, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.coniferWoodBoards, amount = 10},
        {id = Item.longStaffHandle, amount = 1},
        {id = Item.heartwood, amount = 2},
        {id = Item.cupriteIngot, amount = 2},
        {id = Item.pureEarth, amount = 1},
    }, tool = Item.carvingTools},
    {id = 23, name = {english = "fire mace", german = "Feuerstreitkolben"}, creator = "NA", craft = "carpentry", --100
    level = getLevel(Item.fireMace), item = Item.fireMace, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.naldorWoodBoards, amount = 7},
        {id = Item.maceHandle, amount = 1},
        {id = Item.heartwood, amount = 2},
        {id = Item.cupriteIngot, amount = 1},
        {id = Item.pureFire, amount = 1},
    }, tool = Item.carvingTools},
    {id = 24, name = getName(Item.duskcloth), creator = "NA", craft = "tanningAndWeaving", --70
    level = getLevel(Item.duskcloth), item = Item.duskcloth, treasure = "averageAndBig", rareness = 3,
    ingredients = {
        {id = Item.baleOfDuskwool, amount = 1}
    }, tool = Item.scissors},
    {id = 25, name = getName(Item.scoundrelshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.scoundrelshood), item = Item.scoundrelshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blackCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 26, name = getName(Item.fishermanshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.fishermanshood), item = Item.fishermanshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 27, name = getName(Item.scholarshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.scholarshood), item = Item.scholarshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 28, name = getName(Item.squireshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.squireshood), item = Item.squireshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 29, name = getName(Item.brawlershood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.brawlershood), item = Item.brawlershood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 30, name = getName(Item.tradershood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.tradershood), item = Item.tradershood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 31, name = getName(Item.skaldshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.skaldshood), item = Item.skaldshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 32, name = getName(Item.herbalistshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.herbalistshood), item = Item.herbalistshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 33, name = getName(Item.forestershood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.forestershood), item = Item.forestershood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 34, name = getName(Item.deserthood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.deserthood), item = Item.deserthood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 35, name = getName(Item.travellershood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.travellershood), item = Item.travellershood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 36, name = getName(Item.chemistshood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.chemistshood), item = Item.chemistshood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 3},
        {id = Item.redCloth, amount = 2},
        {id = Item.thread, amount = 6}}
    },
    {id = 37, name = getName(Item.seershood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.seershood), item = Item.seershood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 3},
        {id = Item.redCloth, amount = 2},
        {id = Item.thread, amount = 6}}
    },
    {id = 38, name = getName(Item.acolytehood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.acolytehood), item = Item.acolytehood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.whiteCloth, amount = 5},
        {id = Item.thread, amount = 6}}
    },
    {id = 39, name = getName(Item.fadedhood), creator = "NA", craft = "tailoring",
    level = getLevel(Item.fadedhood), item = Item.fadedhood, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greyCloth, amount = 5},
        {id = Item.thread, amount = 7}}
    },
    {id = 40, name = getName(Item.roguescloak), creator = "NA", craft = "tailoring",
    level = getLevel(Item.roguescloak), item = Item.roguescloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blackCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 41, name = getName(Item.seafarercloak), creator = "NA", craft = "tailoring",
    level = getLevel(Item.seafarercloak), item = Item.seafarercloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 42, name = getName(Item.sagecloak), creator = "NA", craft = "tailoring", level = getLevel(Item.sagecloak), item = Item.sagecloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 43, name = getName(Item.knightscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.knightscloak), item = Item.knightscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 44, name = getName(Item.gladiatorscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.gladiatorscloak), item = Item.gladiatorscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 45, name = getName(Item.merchantscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.merchantscloak), item = Item.merchantscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 46, name = getName(Item.bardscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.bardscloak), item = Item.bardscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 47, name = getName(Item.shepherdscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.shepherdscloak), item = Item.shepherdscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 48, name = getName(Item.rangercloak), creator = "NA", craft = "tailoring", level = getLevel(Item.rangercloak), item = Item.rangercloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 49, name = getName(Item.scorchedcloak), creator = "NA", craft = "tailoring", level = getLevel(Item.scorchedcloak), item = Item.scorchedcloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 50, name = getName(Item.wayfarerscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.wayfarerscloak), item = Item.wayfarerscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 5},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 51, name = getName(Item.distillerscloak), creator = "NA", craft = "tailoring", level = getLevel(Item.distillerscloak), item = Item.distillerscloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 3},
        {id = Item.redCloth, amount = 2},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 52, name = getName(Item.occultistcloak), creator = "NA", craft = "tailoring", level = getLevel(Item.occultistcloak), item = Item.occultistcloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 4},
        {id = Item.redCloth, amount = 3},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 53, name = getName(Item.paladincloak), creator = "NA", craft = "tailoring", level = getLevel(Item.paladincloak), item = Item.paladincloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.whiteCloth, amount = 7},
        {id = Item.thread, amount = 8},
        {id = Item.silk, amount = 1}}
    },
    {id = 54, name = getName(Item.dustedcloak), creator = "NA", craft = "tailoring", level = getLevel(Item.dustedcloak), item = Item.dustedcloak, treasure = "big", rareness = 3,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greyCloth, amount = 7},
        {id = Item.thread, amount = 9},
        {id = Item.silk, amount = 1}}
    },
    {id = 55, name = getName(Item.assassinsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.assassinsrobes), item = Item.assassinsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blackCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 56, name = getName(Item.privateersrobe), creator = "NA", craft = "tailoring", level = getLevel(Item.privateersrobe), item = Item.privateersrobe, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 57, name = getName(Item.docentsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.docentsrobes), item = Item.docentsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.blueCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 58, name = getName(Item.lordsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.lordsrobes), item = Item.lordsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 59, name = getName(Item.championsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.championsrobes), item = Item.championsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 60, name = getName(Item.magnatesrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.magnatesrobes), item = Item.magnatesrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 61, name = getName(Item.minstrelsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.minstrelsrobes), item = Item.minstrelsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 62, name = getName(Item.farmersrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.farmersrobes), item = Item.farmersrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 63, name = getName(Item.druidrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.druidrobes), item = Item.druidrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greenCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 64, name = getName(Item.dunestriderrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.dunestriderrobes), item = Item.dunestriderrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 65, name = getName(Item.adventurersrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.adventurersrobes), item = Item.adventurersrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.yellowCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 66, name = getName(Item.alchemistsrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.alchemistsrobes), item = Item.alchemistsrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 4},
        {id = Item.blueCloth, amount = 4},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 67, name = getName(Item.mysticrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.mysticrobes), item = Item.mysticrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.redCloth, amount = 4},
        {id = Item.blueCloth, amount = 4},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 68, name = getName(Item.clericrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.clericrobes), item = Item.clericrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.whiteCloth, amount = 8},
        {id = Item.thread, amount = 9},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 69, name = getName(Item.ashenrobes), creator = "NA", craft = "tailoring", level = getLevel(Item.ashenrobes), item = Item.ashenrobes, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.duskcloth, amount = 2},
        {id = Item.greyCloth, amount = 8},
        {id = Item.thread, amount = 10},
        {id = Item.pureSpirit, amount = 1}}
    },
    {id = 70, name = getName(Item.bottleOfFairyWine), creator = "NA", craft = "brewing", level = getLevel(Item.bottleOfFairyWine), item = Item.bottleOfFairyWine, treasure = "giant", rareness = 4,
    ingredients = {
        {id = Item.peach, amount = 6},
        {id = Item.sugarcane, amount = 2},
        {id = Item.fairyRingMushroom, amount = 1},
        {id = Item.waterBlossom, amount = 1},
        {id = Item.bucketOfWater, amount = 1}}
    }
}



return M
