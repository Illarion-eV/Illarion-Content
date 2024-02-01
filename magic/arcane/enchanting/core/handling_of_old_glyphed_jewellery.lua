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

local common = require("base.common")
local shared = require("magic.arcane.enchanting.core.shared")

local M = {}

function M.checkIfOldGlyphedJewellery(jewellery)

    if common.IsNilOrEmpty(jewellery:getData("glyphQuality")) and (not common.IsNilOrEmpty(jewellery:getData("glyphEffNo")) or not common.IsNilOrEmpty(jewellery:getData("glyphEffNoMax"))) then
        return true
    end

    return false

end

function M.convertOldGlyphedJewelleryToNew(jewellery)

    local charges = shared.getAmountOfCharges(jewellery, jewellery)
    local glyphQuality = common.getItemQuality(jewellery)

    jewellery:setData("glyphCharges", charges)
    jewellery:setData("glyphQuality", glyphQuality)
    jewellery:setData("glyphEffNo", "")
    jewellery:setData("glyphEffNoMax", "")
    jewellery:setData("glyphEffNoMin", "")
    world:changeItem(jewellery)

end


return M
