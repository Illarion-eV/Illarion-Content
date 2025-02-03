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

function M.lifesteal(user, damage)

    local currentHP = user:increaseAttrib("hitpoints", 0)

    if currentHP == 10000 then
        return false    -- Already at full HP, lets not waste glyph charges
    end

    local chance = {min = 0.05, bonus = 0.20}

    local success = shared.activateGlyph(user, "dendron", chance, 1)

    if success then
        local increase = damage/5 -- 20% lifesteal on proc, procs at most one out of 4 attacks on average, meaning 5% average lifesteal per attack
        user:increaseAttrib("hitpoints", increase)
        world:gfx(globalvar.gfxGreenSplash, user.pos)
    end
end

return M
