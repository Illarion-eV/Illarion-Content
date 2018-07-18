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

-- UPDATE items SET itm_script='item.id_3498_glyphforge' WHERE itm_id IN (3498);

local common = require("base.common")
local lookat = require("base.lookat")
local glyphmagic = require("magic.glyphmagic")

local M = {}

function M.UseItem(user, sourceItem, ltstate)
    glyphmagic.forgeGlyphs(user, sourceItem, ltstate)
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)
    if item.wear < 3 then
        lookAt.description = common.GetNLS(user, "Die Steine bröckeln. Die Magie des Ortes scheint fast völlig verschwunden.",
                                                 "The stones crumble. The magic of the place has almost disappeared.")
    elseif glyphmagic.checkForgeIsReady(item) then
        lookAt.description = common.GetNLS(user, "Das Ritual ist bereits vorbereitet.",
                                                 "The ritual is already prepared.")
    end

    return lookAt
end

return M

