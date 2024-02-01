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

local glyphing = require("magic.arcane.enchanting.core.glyphing_of_item")

local common = require("base.common")

local M = {}

function M.UseItem(user, sourceItem, ltstate)

    glyphing.addGlyphToItem(user, sourceItem, ltstate)

end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    local isMage = user:getMagicType() == 0 and user:getMagicFlags(0) > 0 or user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0

    local baseText = common.GetNLS(user, "GERMAN TRANSLATION", "A faintly glowing glyph that can be socketed into the appropriate piece of jewellery to enchant it.")

    if isMage then
        lookAt.description = baseText..common.GetNLS(user, "GERMAN TRANSLATION", " With the correct use of a wand, you should be able to glean more information about its present state.")
    else
        lookAt.description = baseText..common.GetNLS(user, "GERMAN TRANSLATION", " A mage would likely be able to tell you more details about its present state and usage, though you can always try to socket it into a piece of jewellery to see what happens.")
    end

    return lookAt
end

return M
