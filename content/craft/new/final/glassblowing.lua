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

local glassblowing = Craft {
    name = {english = "Glass blowing", german = "Glasblasen"},
    handTool = "glassBlowPipe",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"},
    skill = "glassBlowing",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 7, sfxDuration = 1.7,

ProductGroup {name = {english = "Bottles", german = "Flaschen"},
Product {item = "emptyInkBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "largeEmptyBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyJuiceBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyRumBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "oilBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyLiquorBottle", Ingredient {item = "glassIngot", amount = 2}},
Product {item = "emptyPotion", Ingredient {item = "glassIngot", amount = 2}}
},

ProductGroup {name = {english = "Glasses", german = "Gläser"},
Product {item = "glassMug", Ingredient {item = "glassIngot", amount = 2}, Ingredient {item = "rubyPowder", amount = 1}},
Product {item = "glass", Ingredient {item = "glassIngot", amount = 2}, Ingredient {item = "sapphirePowder", amount = 1}},
Product {item = "wineGlass", Ingredient {item = "glassIngot", amount = 4}, Ingredient {item = "obsidianPowder", amount = 1}}
},

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "emptySalveJar", Ingredient {item = "glassIngot", amount = 10}, Ingredient {item = "topazPowder", amount = 1}}
}
}
return glassblowing
