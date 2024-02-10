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

local function showGlyphedItemMessageDialogue(user, jewellery)

    local callback = function(dialog) end
    local commonItem = world:getItemStatsFromId(jewellery.id)
    local title = common.GetNLS(user, commonItem.German, commonItem.English)
    local text = {}

    local glyphQuality = tonumber(jewellery:getData("glyphQuality"))

    local remaining = shared.getRemainingChargePercentage(jewellery)

    local englishEffect, germanEffect = shared.getJewelleryEffectText(jewellery)

    text.german = "Glyphen Qualität: "..shared.qualityTexts.german[glyphQuality].."\n\nVerbleibende Ladungen: "..remaining.."\n\nEffekt:\n\n"..germanEffect

    text.english = "Glyph Quality: "..shared.qualityTexts.english[glyphQuality].."\n\nRemaining charges: "..remaining.."\n\nEffect:\n\n"..englishEffect

    local dialog = MessageDialog(title, common.GetNLS(user, text.german, text.english), callback)

    user:requestMessageDialog(dialog)

end

function M.start(user)

    local jewelleryAtBelt = shared.listGlyphedJewelleryAtBelt(user, true)

    if #jewelleryAtBelt == 0 then
        user:inform("Das Schmuckstück muss an deinem Gürtel sein, um es untersuchen zu können.", "The piece of enchanted jewellery needs to be in a belt slot if you want to inspect it.")
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        showGlyphedItemMessageDialogue(user, jewelleryAtBelt[selected])

    end

    local title = common.GetNLS(user,"Untersuchung von verzaubertem Schmuck", "Inspection of enchanted jewellery")

    local description = common.GetNLS(user, "Wähle das Schmuckstück aus, das du untersuchen möchtest.", "Select the piece of enchanted jewellery you wish to inspect.")

    local dialog = SelectionDialog(title, description, callback)

    for _, jewellery in pairs(jewelleryAtBelt) do
        local commonItem = world:getItemStatsFromId(jewellery.id)
        dialog:addOption(jewellery.id, common.GetNLS(user, commonItem.German, commonItem.English))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

return M
