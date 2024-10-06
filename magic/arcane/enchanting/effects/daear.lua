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

local shared = require("magic.arcane.enchanting.core.shared")
local globalvar = require("base.globalvar")

local M = {}

function M.saveResource(user, resourceLevel, amount, resourceAmount)

    if not resourceAmount then
        resourceAmount = amount
    end

    local chargesPerIngredientSaved = math.max(1, resourceLevel/10)

    local chargesRequired = chargesPerIngredientSaved*math.ceil(resourceAmount/5) --Requires at least 1 charge to be used, then 1 charge per 5 resources

    local chance = {min = 0.1, bonus = 0.4} -- up to 5-50% chance to replicate one resource in crafting and enchanting, based on amount of ingredients involved. This means 5 out of every 100 ingredients are saved on average.

    if amount < 10 then -- The chance is scaled based on amount of ingredients involved, up to a maximum of 10 ingredients. This way there isn't a large imbalance between crafts requiring 1 materials versus crafts requiring 10+
        chance.min = chance.min/10 * amount
        chance.bonus = chance.bonus/10 * amount
    end

    local success = shared.activateGlyph(user, "daear", chance, chargesRequired)

    if success then
        world:gfx( globalvar.gfxSPLASH, user.pos)
        return true
    end

    return false

end


return M
