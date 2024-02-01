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

local M = {}

local function showGlyphItemMessageDialogue(user, glyph)

    local callback = function(dialog) end
    local commonItem = world:getItemStatsFromId(glyph.id)
    local title = common.GetNLS(user, commonItem.German, commonItem.English)
    local text = {}

    local glyphQuality = common.getItemQuality(glyph)

    local englishEffect, germanEffect = shared.getGlyphEffectText(glyph)

    local compatibleJewellery = shared.getCompatibleJewellery(glyph.id)

    local jewelleryPrefix = {german = "", english = "Compatible jewellery: "}

    local copperJewellery = compatibleJewellery[1]
    local commonCopperJewellery = world:getItemStatsFromId(copperJewellery)
    local jewelleryName = common.GetNLS(user, commonCopperJewellery.German, commonCopperJewellery.English)
    local jewelleryText = common.GetNLS(user, string.gsub(jewelleryName, "Kupfernes ", ""), string.gsub(jewelleryName, "copper ", ""))

    text.german = "GERMAN TRANSLATION"..shared.qualityTexts.german[glyphQuality].."\n\n"..jewelleryPrefix.german..jewelleryText..germanEffect

    text.english = "Quality: "..shared.qualityTexts.english[glyphQuality].."\n\n"..jewelleryPrefix.english..jewelleryText.."\n\nEffect:\n\n"..englishEffect

    local dialog = MessageDialog(title, common.GetNLS(user, text.german, text.english), callback)

    user:requestMessageDialog(dialog)

    glyphTutorial.update(user, 7)

end

function M.start(user)

    local glyphsAtBelt = shared.listGlyphsAtBelt(user)

    if #glyphsAtBelt == 0 then
        user:inform("GERMAN TRANSLATION", "The glyph needs to be at your belt if you want to inspect it.")
        return
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        showGlyphItemMessageDialogue(user, glyphsAtBelt[selected])

    end

    local title = common.GetNLS(user,"GERMAN TRANSLATION", "Inspection of glyphs")

    local description = common.GetNLS(user, "GERMAN TRANSLATION", "Select the glyph you wish to inspect.")

    local dialog = SelectionDialog(title, description, callback)

    for _, glyph in pairs(glyphsAtBelt) do
        local commonItem = world:getItemStatsFromId(glyph.id)
        dialog:addOption(glyph.id, common.GetNLS(user, commonItem.German, commonItem.English))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end


return M
