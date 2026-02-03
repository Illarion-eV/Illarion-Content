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

function M.reduceCastTime(user)

    local chance = {min = 0.05, bonus = 0.1} -- 7.5% average faster casting with 15% proc rate to halve the cast time

    local success = shared.activateGlyph(user, "tan", chance, 1)

    if success then
        world:gfx( globalvar.gfxBlueSplash, user.pos)
        return true
    end

    return false
end

return M
