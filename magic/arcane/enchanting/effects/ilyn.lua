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

function M.duplicateItem(user, itemLevel)

    local chargesRequired = math.max(1, itemLevel/10)
    local chance = {min = 0.0025, bonus = 0.0075}
    local success = shared.activateGlyph(user, "ilyn", chance, chargesRequired)

    if success then
        world:gfx( globalvar.gfxSPLASH, user.pos)
        return true
    end

    return false

end

return M
