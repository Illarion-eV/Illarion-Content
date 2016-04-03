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

local carpentry = Craft {
    name = {english = "Carpentry", german = "Schreinern"},
    handTool = "carvingTools",
    staticTool = "workbenchOne",
    --staticTool = "workbenchTwo",
    skill = "carpentry",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 14, sfxDuration = 1.7,

ProductGroup {name = {english = "Arrows and bolts", german = "Pfeile und Bolzen"},
Product {item = "arrow", Ingredient {item = "bough", amount = 2}},
Product {item = "crossbowBolt", Ingredient {item = "bough", amount = 2}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "windArrows", Ingredient {item = "bough", amount = 2}, Ingredient {item = "goldIngot", amount = 1}}
},

ProductGroup {name = {english = "Blunt weapons", german = "Stumpfe Waffen"},
Product {item = "woodenSword", Ingredient {item = "cherryWoodBoards", amount = 2}, Ingredient {item = "swordHandle", amount = 1}},
Product {item = "woodenDagger", Ingredient {item = "cherryWoodBoards", amount = 2}, Ingredient {item = "daggerHandle", amount = 1}},
Product {item = "club", Ingredient {item = "cherryWoodBoards", amount = 1}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "mace", Ingredient {item = "cherryWoodBoards", amount = 1}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 2}},
Product {item = "nailClub", Ingredient {item = "cherryWoodBoards", amount = 2}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 2}},
Product {item = "battleFlail", Ingredient {item = "cherryWoodBoards", amount = 3}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 3}},
Product {item = "maul", Ingredient {item = "cherryWoodBoards", amount = 3}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "warFlail", Ingredient {item = "cherryWoodBoards", amount = 3}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "battleHammer", Ingredient {item = "cherryWoodBoards", amount = 3}, Ingredient {item = "hammerHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "warhammer", Ingredient {item = "cherryWoodBoards", amount = 7}, Ingredient {item = "hammerHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "heavyHammer", Ingredient {item = "cherryWoodBoards", amount = 4}, Ingredient {item = "hammerHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "ironIngot", amount = 2}},
Product {item = "spikedMace", Ingredient {item = "cherryWoodBoards", amount = 4}, Ingredient {item = "maceHandle", amount = 1}, Ingredient {item = "heartwood", amount = 3}, Ingredient {item = "ironIngot", amount = 2}},
Product {item = "dwarvenHammer", Ingredient {item = "cherryWoodBoards", amount = 5}, Ingredient {item = "hammerHandle", amount = 1}, Ingredient {item = "heartwood", amount = 3}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "dwarvenStormhammer", Ingredient {item = "cherryWoodBoards", amount = 5}, Ingredient {item = "hammerHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureAir", amount = 1}}
},

ProductGroup {name = {english = "Bows", german = "Bögen"},
Product {item = "shortBow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "ridersBow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "serinjahridersBow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "huntingBow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "longBow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "crossbow", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "elvenShortbow", Ingredient {item = "naldorWoodBoards", amount = 4}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 3}},
Product {item = "ebonyWoodBow", Ingredient {item = "naldorWoodBoards", amount = 4}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 4}},
Product {item = "elvenCompositeLongbow", Ingredient {item = "naldorWoodBoards", amount = 5}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 5}},
Product {item = "fireHuntersBow", Ingredient {item = "naldorWoodBoards", amount = 5}, Ingredient {item = "thread", amount = 2}, Ingredient {item = "heartwood", amount = 3}, Ingredient {item = "pureFire", amount = 1}}
},

ProductGroup {name = {english = "Handles", german = "Griffe"},
Product {item = "axeHandle", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "daggerHandle", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "maceHandle", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "staffHandle", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "swordHandle", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "smallHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "hammerHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "sawHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "scytheHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "shovelHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "sickleHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "bigSwordHandle", Ingredient {item = "appleWoodBoards", amount = 2}},
Product {item = "largeOrnamentedHandle", Ingredient {item = "appleWoodBoards", amount = 3}},
Product {item = "largeHandle", Ingredient {item = "appleWoodBoards", amount = 3}},
Product {item = "morningStarHandle", Ingredient {item = "appleWoodBoards", amount = 3}},
Product {item = "longStaffHandle", Ingredient {item = "appleWoodBoards", amount = 3}}
},

ProductGroup {name = {english = "Music", german = "Instrumente"},
Product {item = "flute", Ingredient {item = "naldorWoodBoards", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "panpipe", Ingredient {item = "naldorWoodBoards", amount = 2}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "drum", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "lute", Ingredient {item = "naldorWoodBoards", amount = 3}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "harp", Ingredient {item = "naldorWoodBoards", amount = 4}, Ingredient {item = "heartwood", amount = 4}}
},

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "woodenCup", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "torch", Ingredient {item = "appleWoodBoards", amount = 1}},
Product {item = "pinsAndCotters", Ingredient {item = "appleWoodBoards", amount = 1}, Ingredient {item = "pins", amount = 1}},
Product {item = "comb", Ingredient {item = "appleWoodBoards", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "pipe", Ingredient {item = "appleWoodBoards", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "diceCup", Ingredient {item = "appleWoodBoards", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "trapSet", Ingredient {item = "appleWoodBoards", amount = 3}, Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "heartwood", amount = 1}}
},

ProductGroup {name = {english = "Shields", german = "Schilde"},
Product {item = "smallWoodenShield", Ingredient {item = "coniferWoodBoards", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "woodenShield", Ingredient {item = "coniferWoodBoards", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "lightShield", Ingredient {item = "coniferWoodBoards", amount = 3}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "redWardensShield", Ingredient {item = "coniferWoodBoards", amount = 3}, Ingredient {item = "ironPlate", amount = 2}},
Product {item = "metalShield", Ingredient {item = "coniferWoodBoards", amount = 4}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "knightShield", Ingredient {item = "coniferWoodBoards", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "roundMetalShield", Ingredient {item = "coniferWoodBoards", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "redSteelShield", Ingredient {item = "coniferWoodBoards", amount = 5}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "legionnairesTowerShield", Ingredient {item = "coniferWoodBoards", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "heraldicShield", Ingredient {item = "coniferWoodBoards", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 3}},
Product {item = "steelTowerShield", Ingredient {item = "coniferWoodBoards", amount = 6}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 3}},
Product {item = "ornateTowerShield", Ingredient {item = "coniferWoodBoards", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 4}},
Product {item = "shieldOfTheSky", Ingredient {item = "coniferWoodBoards", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureAir", amount = 1}},
Product {item = "mosaicShield", Ingredient {item = "coniferWoodBoards", amount = 7}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureSpirit", amount = 1}},
Product {item = "cloudShield", Ingredient {item = "coniferWoodBoards", amount = 8}, Ingredient {item = "ironPlate", amount = 2}, Ingredient {item = "heartwood", amount = 3}, Ingredient {item = "pureAir", amount = 1}}
},

ProductGroup {name = {english = "Spears", german = "Speere"},
Product {item = "simpleSpear", Ingredient {item = "appleWoodBoards", amount = 2}, Ingredient {item = "longStaffHandle", amount = 1}},
Product {item = "snakeSpear", Ingredient {item = "appleWoodBoards", amount = 3}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "glaive", Ingredient {item = "appleWoodBoards", amount = 4}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "viperSpear", Ingredient {item = "appleWoodBoards", amount = 4}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "ranseur", Ingredient {item = "appleWoodBoards", amount = 4}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "voulge", Ingredient {item = "appleWoodBoards", amount = 5}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "halberd", Ingredient {item = "appleWoodBoards", amount = 6}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "ironIngot", amount = 1}},
Product {item = "partisan", Ingredient {item = "appleWoodBoards", amount = 7}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}},
Product {item = "divineVoulge", Ingredient {item = "appleWoodBoards", amount = 8}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}},
Product {item = "twinbladeRanseur", Ingredient {item = "appleWoodBoards", amount = 8}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "shadowRanseur", Ingredient {item = "appleWoodBoards", amount = 9}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureEarth", amount = 1}},
Product {item = "partisanOfLight", Ingredient {item = "appleWoodBoards", amount = 10}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureSpirit", amount = 1}}
},

ProductGroup {name = {english = "Staffs", german = "Stäbe"},
Product {item = "walkingStick", Ingredient {item = "cherryWoodBoards", amount = 3}, Ingredient {item = "staffHandle", amount = 1}},
Product {item = "skullStaff", Ingredient {item = "cherryWoodBoards", amount = 4}, Ingredient {item = "staffHandle", amount = 1}},
Product {item = "clericsStaff", Ingredient {item = "cherryWoodBoards", amount = 4}, Ingredient {item = "staffHandle", amount = 1}},
Product {item = "novicesStaff", Ingredient {item = "cherryWoodBoards", amount = 5}, Ingredient {item = "staffHandle", amount = 1}},
Product {item = "simpleMagesStaff", Ingredient {item = "cherryWoodBoards", amount = 4}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "adeptssStaff", Ingredient {item = "cherryWoodBoards", amount = 5}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "magesStaff", Ingredient {item = "cherryWoodBoards", amount = 6}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 1}},
Product {item = "elvenMagesStaff", Ingredient {item = "cherryWoodBoards", amount = 8}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 3}},
Product {item = "battleStaff", Ingredient {item = "cherryWoodBoards", amount = 8}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 3}, Ingredient {item = "pureEarth", amount = 1}},
Product {item = "ornateMagesStaff", Ingredient {item = "cherryWoodBoards", amount = 9}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 4}, Ingredient {item = "pureSpirit", amount = 1}},
Product {item = "mastersStaff", Ingredient {item = "cherryWoodBoards", amount = 10}, Ingredient {item = "staffHandle", amount = 1}, Ingredient {item = "heartwood", amount = 4}, Ingredient {item = "pureEarth", amount = 1}}
},

ProductGroup {name = {english = "Tableware", german = "Geschirr"},
Product {item = "plate", Ingredient {item = "coniferWoodBoards", amount = 2}},
Product {item = "soupBowl", Ingredient {item = "coniferWoodBoards", amount = 2}},
Product {item = "woodenPlate", Ingredient {item = "coniferWoodBoards", amount = 2}}
},

ProductGroup {name = {english = "Throwing weapons", german = "Wurfwaffen"},
Product {item = "javelin", Ingredient {item = "appleWoodBoards", amount = 1}, Ingredient {item = "longStaffHandle", amount = 1}}
},

ProductGroup {name = {english = "Tools", german = "Werkzeuge"},
Product {item = "fishingRod", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "longStaffHandle", amount = 1}, Ingredient {item = "thread", amount = 1}},
Product {item = "rollingPin", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "peel", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "cookingSpoon", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "flail", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "longStaffHandle", amount = 1}},
Product {item = "candleMould", Ingredient {item = "coniferWoodBoards", amount = 4}},
Product {item = "brickMould", Ingredient {item = "coniferWoodBoards", amount = 4}},
Product {item = "dyeingRod", Ingredient {item = "coniferWoodBoards", amount = 2}, Ingredient {item = "staffHandle", amount = 1}},
Product {item = "bucket", Ingredient {item = "coniferWoodBoards", amount = 4}},
Product {item = "woodenShovel", Ingredient {item = "coniferWoodBoards", amount = 1}, Ingredient {item = "smallHandle", amount = 1}}
},

ProductGroup {name = {english = "Wands", german = "Zauberstäbe"},
Product {item = "wand", Ingredient {item = "naldorWoodBoards", amount = 7}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}},
Product {item = "wandOfEarth", Ingredient {item = "naldorWoodBoards", amount = 9}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureEarth", amount = 1}},
Product {item = "wandOfFire", Ingredient {item = "naldorWoodBoards", amount = 9}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureFire", amount = 1}},
Product {item = "wandOfWater", Ingredient {item = "naldorWoodBoards", amount = 9}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureWater", amount = 1}},
Product {item = "wandOfAir", Ingredient {item = "naldorWoodBoards", amount = 9}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureAir", amount = 1}},
Product {item = "wandOfSpirit", Ingredient {item = "naldorWoodBoards", amount = 9}, Ingredient {item = "largeOrnamentedHandle", amount = 1}, Ingredient {item = "heartwood", amount = 2}, Ingredient {item = "pureSpirit", amount = 1}}
}
}
return carpentry