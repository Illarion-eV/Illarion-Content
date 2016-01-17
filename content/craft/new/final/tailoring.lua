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

local tailoring = Craft {
    name = {english = "Tailoring", german = "Schneidern"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "tailoring",
    defaultFoodConsumption = NO_DEFAULT,
    --sfx = ID, sfxDuration = TIME,

ProductGroup {name = {english = "Boots", german = "Stiefel"},
Product {item = "simpleLeatherShoes", Ingredient {item = "thread", amount = 1}, Ingredient {item = "leather", amount = 1}},
Product {item = "leatherShoes", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "robustJackboots", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "robustLeatherShoes", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "simpleLeatherBoots", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}},
Product {item = "leatherBoots", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}},
Product {item = "robustLeatherBoots", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "ornateJackboots", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "simpleFurBoots", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "furBoots", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "robustFurBoots", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "serinjahLeatherBoots", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "leatherBootsOfTheWinds", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureAir", amount = 1}}
},

ProductGroup {name = {english = "Cloth gloves", german = "Stoffhandschuhe"},
Product {item = "greyClothGloves", Ingredient {item = "thread", amount = 1}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "whiteClothGloves", Ingredient {item = "thread", amount = 1}, Ingredient {item = "whiteCloth", amount = 1}},
Product {item = "greenClothGloves", Ingredient {item = "thread", amount = 1}, Ingredient {item = "greenCloth", amount = 2}},
Product {item = "blackClothGloves", Ingredient {item = "thread", amount = 1}, Ingredient {item = "blackCloth", amount = 2}},
Product {item = "redClothGloves", Ingredient {item = "thread", amount = 2}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "yellowClothGloves", Ingredient {item = "thread", amount = 2}, Ingredient {item = "yellowCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "blueClothGloves", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blueCloth", amount = 2}, Ingredient {item = "silk", amount = 1}}
},

ProductGroup {name = {english = "Doublets", german = "Wamse"},
Product {item = "greyDoublet", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greyCloth", amount = 2}},
Product {item = "whiteDoublet", Ingredient {item = "thread", amount = 3}, Ingredient {item = "whiteCloth", amount = 2}},
Product {item = "greenDoublet", Ingredient {item = "thread", amount = 4}, Ingredient {item = "greenCloth", amount = 3}},
Product {item = "blackDoublet", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blackCloth", amount = 3}},
Product {item = "redDoublet", Ingredient {item = "thread", amount = 5}, Ingredient {item = "redCloth", amount = 4}},
Product {item = "yellowDoublet", Ingredient {item = "thread", amount = 6}, Ingredient {item = "yellowCloth", amount = 5}, Ingredient {item = "topaz", amount = 1}},
Product {item = "blueDoublet", Ingredient {item = "thread", amount = 7}, Ingredient {item = "blueCloth", amount = 5}, Ingredient {item = "silk", amount = 1}}
},

ProductGroup {name = {english = "Dresses", german = "Kleider"},
Product {item = "greyDress", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greyCloth", amount = 2}},
Product {item = "whiteDress", Ingredient {item = "thread", amount = 3}, Ingredient {item = "whiteCloth", amount = 2}},
Product {item = "greenDress", Ingredient {item = "thread", amount = 4}, Ingredient {item = "greenCloth", amount = 3}},
Product {item = "lightBlueDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blueCloth", amount = 6}, Ingredient {item = "silk", amount = 1}},
Product {item = "blueDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blueCloth", amount = 6}, Ingredient {item = "silk", amount = 1}},
Product {item = "yellowDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "yellowCloth", amount = 6}, Ingredient {item = "silk", amount = 1}},
Product {item = "redDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "redCloth", amount = 6}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackBlueDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "blueCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackYellowDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackGreyDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackGreenDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "greenCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackRedDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "redCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blackWhiteDress", Ingredient {item = "thread", amount = 8}, Ingredient {item = "blackCloth", amount = 6}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blueGreenHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "blueCloth", amount = 7}, Ingredient {item = "greenCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "blueRedHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "blueCloth", amount = 7}, Ingredient {item = "redCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "yellowBlueHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "yellowCloth", amount = 7}, Ingredient {item = "blueCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "yellowGreenHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "yellowCloth", amount = 7}, Ingredient {item = "greenCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "redYellowHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "redCloth", amount = 7}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "greyHeraldicDress", Ingredient {item = "thread", amount = 10}, Ingredient {item = "greyCloth", amount = 8}, Ingredient {item = "silk", amount = 2}},
Product {item = "blackRedHeraldicDress", Ingredient {item = "thread", amount = 9}, Ingredient {item = "blackCloth", amount = 7}, Ingredient {item = "redCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "whiteHeraldicDress", Ingredient {item = "thread", amount = 10}, Ingredient {item = "whiteCloth", amount = 8}, Ingredient {item = "silk", amount = 2}}
},

ProductGroup {name = {english = "Greaves", german = "Beinkleider"},
Product {item = "simpleShortLeatherLeggings", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "shortLeatherLeggings", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}},
Product {item = "reinforcedShortLeatherLeggings", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}},
Product {item = "simpleLeatherLeggings", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}},
Product {item = "leatherLeggings", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "ironPlate", amount = 1}},
Product {item = "reinforcedLeatherLeggings", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "ironPlate", amount = 2}},
Product {item = "simpleShortFurTrousers", Ingredient {item = "thread", amount = 7}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "shortFurTrousers", Ingredient {item = "thread", amount = 8}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "reinforcedShortFurTrousers", Ingredient {item = "thread", amount = 8}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "furTrousers", Ingredient {item = "thread", amount = 9}, Ingredient {item = "leather", amount = 7}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "furTrousersOfDawn", Ingredient {item = "thread", amount = 10}, Ingredient {item = "leather", amount = 8}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureFire", amount = 1}}
},

ProductGroup {name = {english = "Hats", german = "Hüte"},
Product {item = "hat", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "greyHatWithFeather", Ingredient {item = "thread", amount = 1}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "feathers", amount = 1}},
Product {item = "whiteHatWithFeather", Ingredient {item = "thread", amount = 1}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "feathers", amount = 1}},
Product {item = "greenHatWithFeather", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greenCloth", amount = 2}, Ingredient {item = "feathers", amount = 1}},
Product {item = "redHatWithFeather", Ingredient {item = "thread", amount = 2}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "feathers", amount = 1}},
Product {item = "yellowHatWithFeather", Ingredient {item = "thread", amount = 2}, Ingredient {item = "yellowCloth", amount = 2}, Ingredient {item = "feathers", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "blueHatWithFeather", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blueCloth", amount = 2}, Ingredient {item = "feathers", amount = 1}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "redWizardHat", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "blueWizardHat", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blueCloth", amount = 2}, Ingredient {item = "silk", amount = 2}},
Product {item = "colourfulWizardHat", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "silk", amount = 2}},
Product {item = "witchHat", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "silk", amount = 2}},
Product {item = "fineWizardHat", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blueCloth", amount = 3}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}}
},

ProductGroup {name = {english = "Helmets", german = "Helme"},
Product {item = "simpleHornedHelmet", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "horn", amount = 2}},
Product {item = "hornedHelmet", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "horn", amount = 2}},
Product {item = "copperedHornedHelmet", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silveredHornedHelmet", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "silverIngot", amount = 1}},
Product {item = "gildedHornedHelmet", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "bullHornedHelmet", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "emerald", amount = 1}},
Product {item = "NorodajHornedHelmet", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "demonicHornedHelmet", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "meriniumPlatedHornedHelmet", Ingredient {item = "thread", amount = 7}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "meriniumIngot", amount = 1}},
Product {item = "dragonHornedHelmet", Ingredient {item = "thread", amount = 8}, Ingredient {item = "leather", amount = 6}, Ingredient {item = "horn", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureFire", amount = 1}}
},

ProductGroup {name = {english = "Leather gloves", german = "Lederhandschuhe"},
Product {item = "simpleLeatherGloves", Ingredient {item = "thread", amount = 1}, Ingredient {item = "leather", amount = 1}},
Product {item = "thiefsGloves", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "leatherGloves", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "reinforcedLeatherGloves", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}},
Product {item = "studdedLeatherGloves", Ingredient {item = "thread", amount = 3}, Ingredient {item = "leather", amount = 2}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "ironIngot", amount = 2}},
Product {item = "copperStuddedLeatherGloves", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "copperIngot", amount = 2}},
Product {item = "silverStuddedLeatherGloves", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silverIngot", amount = 3}},
Product {item = "goldStuddedLeatherGloves", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "goldIngot", amount = 1}},
Product {item = "serinjahLeatherGloves", Ingredient {item = "thread", amount = 5}, Ingredient {item = "leather", amount = 4}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "reinforcedSerinjahLeatherGloves", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "rangersGloves", Ingredient {item = "thread", amount = 7}, Ingredient {item = "leather", amount = 5}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureAir", amount = 1}}
},

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "leatherBag", Ingredient {item = "thread", amount = 2}, Ingredient {item = "leather", amount = 2}},
Product {item = "rope", Ingredient {item = "thread", amount = 10}},
Product {item = "sling", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}}
},

ProductGroup {name = {english = "Robes", german = "Roben"},
Product {item = "greyCoat", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greyCloth", amount = 2}},
Product {item = "greyPriestRobe", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greyCloth", amount = 2}},
Product {item = "whitePriestRobe", Ingredient {item = "thread", amount = 2}, Ingredient {item = "whiteCloth", amount = 2}},
Product {item = "greenRobe", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greenCloth", amount = 2}, Ingredient {item = "emerald", amount = 1}},
Product {item = "blackRobe", Ingredient {item = "thread", amount = 2}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "blackCultRobe", Ingredient {item = "thread", amount = 2}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "blackCoat", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "blackPriestRobe", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "noviceRobe", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "redPriestRobe", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "redMageRobe", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "yellowRobe", Ingredient {item = "thread", amount = 3}, Ingredient {item = "yellowCloth", amount = 2}, Ingredient {item = "silk", amount = 2}},
Product {item = "yellowPriestRobe", Ingredient {item = "thread", amount = 4}, Ingredient {item = "yellowCloth", amount = 3}, Ingredient {item = "silk", amount = 2}},
Product {item = "brownPriestRobe", Ingredient {item = "thread", amount = 4}, Ingredient {item = "yellowCloth", amount = 3}, Ingredient {item = "redCloth", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "blueRobe", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blueCloth", amount = 3}, Ingredient {item = "silk", amount = 2}},
Product {item = "blueCoat", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blueCloth", amount = 3}, Ingredient {item = "silk", amount = 3}},
Product {item = "mageRobe", Ingredient {item = "thread", amount = 5}, Ingredient {item = "redCloth", amount = 4}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 3}},
Product {item = "archmageRobe", Ingredient {item = "thread", amount = 5}, Ingredient {item = "redCloth", amount = 4}, Ingredient {item = "yellowCloth", amount = 1}, Ingredient {item = "silk", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}}
},

ProductGroup {name = {english = "Shirts", german = "Hemden"},
Product {item = "greenShirt", Ingredient {item = "thread", amount = 4}, Ingredient {item = "greenCloth", amount = 3}},
Product {item = "blackShirt", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blackCloth", amount = 3}},
Product {item = "redShirt", Ingredient {item = "thread", amount = 5}, Ingredient {item = "redCloth", amount = 4}},
Product {item = "yellowShirt", Ingredient {item = "thread", amount = 6}, Ingredient {item = "yellowCloth", amount = 5}, Ingredient {item = "topaz", amount = 1}},
Product {item = "blueShirt", Ingredient {item = "thread", amount = 7}, Ingredient {item = "blueCloth", amount = 5}, Ingredient {item = "silk", amount = 1}}
},

ProductGroup {name = {english = "Skirts", german = "Röcke"},
Product {item = "greyWhiteSkirt", Ingredient {item = "thread", amount = 1}, Ingredient {item = "greyCloth", amount = 1}, Ingredient {item = "whiteCloth", amount = 1}},
Product {item = "greenWhiteSkirt", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greenCloth", amount = 2}, Ingredient {item = "whiteCloth", amount = 1}},
Product {item = "blackWhiteSkirt", Ingredient {item = "thread", amount = 2}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "redWhiteSkirt", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "yellowWhiteSkirt", Ingredient {item = "thread", amount = 3}, Ingredient {item = "yellowCloth", amount = 2}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "blueWhiteSkirt", Ingredient {item = "thread", amount = 3}, Ingredient {item = "blueCloth", amount = 2}, Ingredient {item = "whiteCloth", amount = 1}, Ingredient {item = "silk", amount = 2}}
},

ProductGroup {name = {english = "Torso armour", german = "Rüstungen"},
Product {item = "paddedArmour", Ingredient {item = "thread", amount = 4}, Ingredient {item = "leather", amount = 3}},
Product {item = "leatherScaleArmour", Ingredient {item = "thread", amount = 6}, Ingredient {item = "leather", amount = 5}},
Product {item = "simpleRogueArmour", Ingredient {item = "thread", amount = 7}, Ingredient {item = "leather", amount = 5}},
Product {item = "lightRogueArmour", Ingredient {item = "thread", amount = 9}, Ingredient {item = "leather", amount = 7}},
Product {item = "halfLeatherArmour", Ingredient {item = "thread", amount = 10}, Ingredient {item = "leather", amount = 8}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "emerald", amount = 1}},
Product {item = "simpleHuntingArmour", Ingredient {item = "thread", amount = 12}, Ingredient {item = "leather", amount = 9}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "huntingArmour", Ingredient {item = "thread", amount = 14}, Ingredient {item = "leather", amount = 11}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 1}},
Product {item = "lightElvenArmour", Ingredient {item = "thread", amount = 14}, Ingredient {item = "leather", amount = 11}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "assassinsArmour", Ingredient {item = "thread", amount = 15}, Ingredient {item = "leather", amount = 11}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}},
Product {item = "reinforcedHuntingArmour", Ingredient {item = "thread", amount = 17}, Ingredient {item = "leather", amount = 13}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 3}},
Product {item = "fullLeatherArmour", Ingredient {item = "thread", amount = 18}, Ingredient {item = "leather", amount = 14}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 4}},
Product {item = "assassinsArmourOfDarkness", Ingredient {item = "thread", amount = 20}, Ingredient {item = "leather", amount = 15}, Ingredient {item = "fur", amount = 1}, Ingredient {item = "silk", amount = 2}, Ingredient {item = "pureEarth", amount = 1}}
},

ProductGroup {name = {english = "Trousers", german = "Hosen"},
Product {item = "greyTrousers", Ingredient {item = "thread", amount = 1}, Ingredient {item = "greyCloth", amount = 1}},
Product {item = "whiteTrousers", Ingredient {item = "thread", amount = 1}, Ingredient {item = "whiteCloth", amount = 1}},
Product {item = "shortGreenTrousers", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greenCloth", amount = 2}},
Product {item = "greenTrousers", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greenCloth", amount = 2}},
Product {item = "shortBlackTrousers", Ingredient {item = "thread", amount = 2}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "blackTrousers", Ingredient {item = "thread", amount = 2}, Ingredient {item = "blackCloth", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "shortRedTrousers", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "redTrousers", Ingredient {item = "thread", amount = 3}, Ingredient {item = "redCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "shortYellowTrousers", Ingredient {item = "thread", amount = 3}, Ingredient {item = "yellowCloth", amount = 2}, Ingredient {item = "silk", amount = 1}},
Product {item = "yellowTrousers", Ingredient {item = "thread", amount = 4}, Ingredient {item = "yellowCloth", amount = 3}, Ingredient {item = "silk", amount = 1}},
Product {item = "shortBlueTrousers", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blueCloth", amount = 3}, Ingredient {item = "silk", amount = 2}},
Product {item = "blueTrousers", Ingredient {item = "thread", amount = 5}, Ingredient {item = "blueCloth", amount = 4}, Ingredient {item = "silk", amount = 2}}
},

ProductGroup {name = {english = "Tunics", german = "Tuniken"},
Product {item = "greyTunic", Ingredient {item = "thread", amount = 2}, Ingredient {item = "greyCloth", amount = 2}},
Product {item = "whiteTunic", Ingredient {item = "thread", amount = 3}, Ingredient {item = "whiteCloth", amount = 2}},
Product {item = "greenTunic", Ingredient {item = "thread", amount = 4}, Ingredient {item = "greenCloth", amount = 3}},
Product {item = "blackTunic", Ingredient {item = "thread", amount = 4}, Ingredient {item = "blackCloth", amount = 3}},
Product {item = "redTunic", Ingredient {item = "thread", amount = 5}, Ingredient {item = "redCloth", amount = 4}},
Product {item = "yellowTunic", Ingredient {item = "thread", amount = 6}, Ingredient {item = "yellowCloth", amount = 5}, Ingredient {item = "topaz", amount = 1}},
Product {item = "blueTunic", Ingredient {item = "thread", amount = 7}, Ingredient {item = "blueCloth", amount = 5}, Ingredient {item = "silk", amount = 1}}
}
}

return tailoring