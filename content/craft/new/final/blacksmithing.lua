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

local blacksmithing = Craft {
    name = {english = "Blacksmithing", german = "Schmieden"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "blacksmithing",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = ID, sfxDuration = TIME,

ProductGroup {name = {english = "Daggers", german = "Dolche"},
Product {item = "simpleDagger", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "daggerHandle", amount = 1}},
Product {item = "dagger", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "daggerHandle", amount = 1}},
Product {item = "sharpDagger", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "copperedDagger", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "ornateDagger", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "redDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "silveredDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "silverIngot", amount = 4}, Ingredient {item = "emeraldPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "gildedDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "ritualDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "rapier", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "MalachínDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "meriniumplatedDagger", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureAir", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalDagger", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "redFireDagger", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "daggerHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureFire", amount = 1}, Ingredient {item = "goldIngot", amount = 2}}
},

ProductGroup {name = {english = "One handed axes", german = "Einhändige Äxte"},
Product {item = "lightBattleAxe", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "halflingAxe", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "battleAxe", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "copperedBattleAxe", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "silveredBattleAxe", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "gildedBattleAxe", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "goldIngot", amount = 4}, Ingredient {item = "emeraldPowder", amount = 1}},
Product {item = "orcAxe", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "dwarvenAxe", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "meriniumplatedBattleAxe", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureAir", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalDwarvenAxe", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}}
},

ProductGroup {name = {english = "One handed swords", german = "Einhändige Schwerter"},
Product {item = "machete", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "swordHandle", amount = 1}},
Product {item = "sabre", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "swordHandle", amount = 1}},
Product {item = "shortSword", Ingredient {item = "ironIngot", amount = 3}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "serinjahSword", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "scimitar", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "longsword", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 4}, Ingredient {item = "sapphirePowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "copperedLongsword", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 4}, Ingredient {item = "emeraldPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "silveredLongsword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "broadsword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "elvenSword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "gildedLongsword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "elvenRainbowsword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "snakeSword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "meriniumplatedLongsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureAir", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "fireLongsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureFire", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalSerinjahsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalLongsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalBroadsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "fireBroadsword", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "swordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureFire", amount = 1}, Ingredient {item = "goldIngot", amount = 2}}
},

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "pins", Ingredient {item = "ironIngot", amount = 1}},
Product {item = "ironPlate", Ingredient {item = "ironIngot", amount = 2}},
Product {item = "lockpicks", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "handcuffs", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "ironPlate", amount = 2}}
},

ProductGroup {name = {english = "Throwing weapons", german = "Wurfwaffen"},
Product {item = "throwingAxe", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "throwingStar", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}}
},

ProductGroup {name = {english = "Tools", german = "Werkzeuge"},
Product {item = "scissors", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "saw", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "sawHandle", amount = 1}},
Product {item = "hammer", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "hammerHandle", amount = 1}},
Product {item = "shovel", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "shovelHandle", amount = 1}},
Product {item = "needle", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "hatchet", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "finesmithingHammer", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "hammerHandle", amount = 1}},
Product {item = "sickle", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "sickleHandle", amount = 1}},
Product {item = "scythe", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "scytheHandle", amount = 1}},
Product {item = "chisel", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "tongs", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "pan", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "rasp", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "armourersHammer", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "hammerHandle", amount = 1}},
Product {item = "mould", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "plane", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "razorBlade", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "cruciblePincers", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "carvingTools", Ingredient {item = "ironIngot", amount = 1}, Ingredient {item = "smallHandle", amount = 1}},
Product {item = "pickaxe", Ingredient {item = "ironIngot", amount = 2}, Ingredient {item = "axeHandle", amount = 1}}
},

ProductGroup {name = {english = "Two handed axes", german = "Zweihändige Äxte"},
Product {item = "executionersAxe", Ingredient {item = "ironIngot", amount = 4}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "longaxe", Ingredient {item = "ironIngot", amount = 5}, Ingredient {item = "axeHandle", amount = 1}},
Product {item = "waraxe", Ingredient {item = "ironIngot", amount = 8}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "goldIngot", amount = 4}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "largeWaraxe", Ingredient {item = "ironIngot", amount = 9}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "emeraldPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "cleaverAxe", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "topazPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "doubleAxe", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "fireWaraxe", Ingredient {item = "ironIngot", amount = 11}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}, Ingredient {item = "pureFire", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "largeFirewaraxe", Ingredient {item = "ironIngot", amount = 12}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "pureFire", amount = 1}, Ingredient {item = "goldIngot", amount = 2}},
Product {item = "magicalWaraxe", Ingredient {item = "ironIngot", amount = 12}, Ingredient {item = "axeHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 4}, Ingredient {item = "pureWater", amount = 1}, Ingredient {item = "goldIngot", amount = 2}}
},

ProductGroup {name = {english = "Two handed swords", german = "Zweihändige Schwerte"},
Product {item = "flamberge", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "bigSwordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "greatsword", Ingredient {item = "ironIngot", amount = 6}, Ingredient {item = "bigSwordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "claymore", Ingredient {item = "ironIngot", amount = 7}, Ingredient {item = "bigSwordHandle", amount = 1}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "twohandedSword", Ingredient {item = "ironIngot", amount = 10}, Ingredient {item = "bigSwordHandle", amount = 1}, Ingredient {item = "meriniumIngot", amount = 3}, Ingredient {item = "diamondPowder", amount = 1}, Ingredient {item = "goldIngot", amount = 2}}
}
}
return blacksmithing