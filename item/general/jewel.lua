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

local lookat = require("base.lookat")
local checks = require("item.general.checks")
local oldGlyphs = require("magic.arcane.enchanting.core.handling_of_old_glyphed_jewellery")
local glyphEquip = require("magic.arcane.enchanting.core.handling_of_glyph_equipment")

local M = {}

-- Normal Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (225, 1840, 1858);

-- Priest Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (62,67,71,82,83,334,463,465);

-- Weapon Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN ();

function M.LookAtItem(user, jewellery)

    if oldGlyphs.checkIfOldGlyphedJewellery(jewellery) then
        oldGlyphs.convertOldGlyphedJewelleryToNew(jewellery)
    end

    return lookat.GenerateLookAt(user, jewellery, lookat.JEWELLERY)
end

function M.MoveItemBeforeMove(user, sourceItem, targetItem)

    if targetItem:getType() == 4 and (targetItem.itempos == Character.neck or targetItem.itempos == Character.finger_right_hand or targetItem.itempos == Character.finger_left_hand) then --inventory, not belt
        glyphEquip.saveTimeOfJewelleryEquipment(user, targetItem)
        checks.HaveABreak(user)
        return checks.checkLevel(user, sourceItem, targetItem)
    end

    return true
end

return M
