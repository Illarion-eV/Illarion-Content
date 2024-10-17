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
local glyphTutorial = require("magic.arcane.enchanting.core.tutorial")
local globalvar = require("base.globalvar")

local M = {}

function M.getItemInHand(user, itemIds)
    if type(itemIds) ~= "table" then
        itemIds = {itemIds}
    end
    local leftTool = user:getItemAt(Character.left_tool)
    if M.isInList(leftTool.id, itemIds) then
        return leftTool
    end
    local rightTool = user:getItemAt(Character.right_tool)
    if M.isInList(rightTool.id, itemIds) then
        return rightTool
    end
    return nil
end


function M.addGlyphToItem(user, glyph, actionState)

    local compatibleJewelleryIds = shared.getCompatibleJewellery(glyph.id)

    local jewellery = common.getItemInHand(user, compatibleJewelleryIds)

    if not common.IsItemInHands(glyph) or jewellery == nil then
        user:inform(
            "Um eine Glyphe in ein Schmuckstück einzusetzen, musst du die Glyphe in der einen Hand und ein Schmuckstück, das der Art der Glyphe entspricht, in der anderen Hand halten.",
            "To socket a piece of jewellery with a glyph, you must hold the glyph in one hand and a piece of jewellery that matches the type of glyph in your other hand.")
        return
    end

    local remainingCharges = tonumber(jewellery:getData("glyphCharges"))

    if not common.IsNilOrEmpty(remainingCharges) and tonumber(remainingCharges) > 0 then
        user:inform("Dieses Schmuckstück hat bereits eine Glyphe.", "This piece of jewellery already has a glyph attached to it.")
        return
    end

    if actionState == Action.none then
        user:inform("Du beginnst, die Glyphe in das Schmuckstück einzusetzen.", "You begin the process of attaching the glyph to the piece of jewellery.")
        user:startAction(50, 21, 10, 0, 0)

    elseif actionState == Action.abort then
        user:inform("Du gibst den Versuch auf, die Glyphe in das Schmuckstück einzusetzen.", "You abort the process of attaching the glyph to the piece of jewellery.")
        return
    elseif actionState == Action.success then
        user:inform("Du hast die Glyphe erfolgreich in das Schmuckstück eingesetzt.", "You successfully attached the glyph to the piece of jewellery.")
        world:makeSound(globalvar.sfxSNARING, user.pos)
        local quality = common.getItemQuality(glyph)
        local charges = shared.getAmountOfCharges(jewellery, glyph)
        jewellery:setData("glyphQuality", quality)
        jewellery:setData("glyphCraftedBy", glyph:getData("craftedBy"))
        shared.setCharges(jewellery, charges)
        world:erase(glyph, 1)
        glyphTutorial.update(user, 9)
    end

end

return M
