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
local crafts = require("craft.base.crafts")
local gems = require("base.gems")

local M = {}

local magicgemming = crafts.Craft:new{
    craftEN = "Magic Blacksmith",
    craftDE = "Magieschmied",
    npcCraft = true,
    lookAtFilter = gems.lookAtFilter,
}

local categoryId = {}
categoryId[gems.EMERALD] = magicgemming:addCategory("Emerald", "Smaragd")
categoryId[gems.RUBY] = magicgemming:addCategory("Ruby", "Rubin")
categoryId[gems.OBSIDIAN] = magicgemming:addCategory("Obsidian", "Obsidian")
categoryId[gems.SAPPHIRE] = magicgemming:addCategory("Sapphire", "Saphir")
categoryId[gems.AMETHYST] = magicgemming:addCategory("Amethyst", "Amethyst")
categoryId[gems.TOPAZ] = magicgemming:addCategory("Topaz", "Topas")

for gem = 1, 7 do
    local catId = categoryId[gem]
    if catId then
        for level = 2, 10 do
            local product = magicgemming:addProduct(catId, gems.gemItemId[gem], 1, {gemLevel = level})
            product:addIngredient(gems.gemItemId[gem], 3, {gemLevel = level - 1})
        end
    end
end

M.magicgemming = magicgemming
return M
