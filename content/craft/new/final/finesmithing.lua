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

local finesmithing = Craft {
    name = {english = "Finesmithing", german = "GERMAN"},
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"}
    skill = "SKILL",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = ID, sfxDuration = TIME,

ProductGroup {name = {english = "Amulets", german = "Amulette"},
Product {item = "ironAmulet", Ingredient {item = "ironIngot", amount = 2}},
Product {item = "goldenAmulet", Ingredient {item = "goldIngot", amount = 1}},
Product {item = "silverAmulett", Ingredient {item = "silverIngot", amount = 1}},
Product {item = "copperAmulett", Ingredient {item = "copperIngot", amount = 1}},
Product {item = "copperAmethystAmulet", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "silverAmethystAmulet", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "goldenAmethystAmulet", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "copperRubyAmulet", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "silverRubyAmulet", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "goldenRubyAmulet", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "copperObsidianAmulet", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "silverObsidianAmulet", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "goldenObsidianAmulet", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "copperSapphireAmulet", Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}},
Product {item = "silverSapphireAmulet", Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "goldenSapphireAmulet", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "copperEmeraldAmulet", Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "silverEmeraldAmulet", Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "goldenEmeraldAmulet", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "emeraldPowder", amount = 1}},
Product {item = "copperTopazAmulet", Ingredient {item = "copperIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}},
Product {item = "silverTopazAmulet", Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "diamondPowder", amount = 1}},
Product {item = "goldenTopazAmulet", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "copperDiamondAmulet", Ingredient {item = "copperIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "silverDiamondAmulet", Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "charmOfTheIcebird", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureWater", amount = 1}},
Product {item = "goldenDiamondAmulet", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}}
}

ProductGroup {name = {english = "Crowns", german = "Kronen"},
Product {item = "diadem", Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 1}},
Product {item = "crown", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "emerald", amount = 1}},
Product {item = "queensCrown", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "topaz", amount = 1}},
Product {item = "kingssCrown", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "diamond", amount = 1}}
}

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "smallCandlestick", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "oilLamp", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "ruby", amount = 1}},
Product {item = "lantern", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "mirror", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "sapphire", amount = 1}, Ingredient {item = "meriniumIngot", amount = 2}}
}

ProductGroup {name = {english = "Rings", german = "Ringe"},
Product {item = "goldenRing", Ingredient {item = "goldIngot", amount = 1}},
Product {item = "copperRing", Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silverRing", Ingredient {item = "silverIngot", amount = 1}},
Product {item = "copperAmethystRing", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "silverAmethystRing", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "goldenAmethystRing", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "amethyst", amount = 1}},
Product {item = "copperRubyRing", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "silverRubyRing", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "goldenRubyRing", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "ruby", amount = 1}},
Product {item = "copperObsidianRing", Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "silverObsidianRing", Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "goldenObsidianRing", Ingredient {item = "goldIngot", amount = 1}, Ingredient {item = "obsidian", amount = 1}},
Product {item = "copperSapphireRing", Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}},
Product {item = "silverSapphireRing", Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "goldenSapphireRing", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "sapphire", amount = 2}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "copperEmeraldRing", Ingredient {item = "copperIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "obsidianPowder", amount = 1}},
Product {item = "silverEmeraldRing", Ingredient {item = "silverIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "goldenEmeraldRing", Ingredient {item = "goldIngot", amount = 2}, Ingredient {item = "emerald", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "emeraldPowder", amount = 1}},
Product {item = "copperTopazRing", Ingredient {item = "copperIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "silverIngot", amount = 1}, Ingredient {item = "topazPowder", amount = 1}},
Product {item = "silverTopazRing", Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "copperIngot", amount = 1}, Ingredient {item = "diamondPowder", amount = 1}},
Product {item = "goldenTopazRing", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "topaz", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "copperDiamondRing", Ingredient {item = "copperIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "silverDiamondRing", Ingredient {item = "silverIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 2}},
Product {item = "goldenDiamondRing", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}},
Product {item = "archmageRing", Ingredient {item = "goldIngot", amount = 3}, Ingredient {item = "diamond", amount = 2}, Ingredient {item = "meriniumIngot", amount = 1}, Ingredient {item = "pureSpirit", amount = 1}}
}

ProductGroup {name = {english = "Tableware", german = "Geschirr"},
Product {item = "ironGoblet", Ingredient {item = "ironIngot", amount = 1}},
Product {item = "copperGoblet", Ingredient {item = "copperIngot", amount = 1}},
Product {item = "greenPlate", Ingredient {item = "copperIngot", amount = 1}},
Product {item = "silverGoblet", Ingredient {item = "silverIngot", amount = 1}},
Product {item = "goldenGoblet", Ingredient {item = "goldIngot", amount = 1}},
Product {item = "cutlery", Ingredient {item = "copperIngot", amount = 3}}
}

ProductGroup {name = {english = "Tools", german = "Werkzeuge"},
Product {item = "glassBlowPipe", Ingredient {item = "copperIngot", amount = 3}}
}
}
return finesmithing