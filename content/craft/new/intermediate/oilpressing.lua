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

local oilpressing = Craft {
    name = {english = "Oil pressing", german = "Ölpressen"},
    handTool = "bucket",
    staticTool = "press",
    skill = "husbandry",
    defaultFoodConsumption = NO_DEFAULT,
    sfx = 10, sfxDuration = 1.7,

ProductGroup {name = {english = "Oil", german = "Öl"},
Product {item = "lampOil", Ingredient {item = "blackThistle", amount = 2}, Ingredient {item = "oilBottle", amount = 1}}
}
}

return oilpressing