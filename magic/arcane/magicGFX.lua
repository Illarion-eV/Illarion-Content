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
local runes = require("magic.arcane.runes")
local targeting = require("magic.arcane.targeting")

local M = {}

function M.getTargetGFX(targets, spell)
local position
    for _, target in pairs(targets) do
        position = targeting.getPositionByTarget(target)
        M.castTargetGFX(position, spell)
    end
end

function M.castTargetGFX(target, spell)
local gfxNumber = 0
    if runes.checkSpellForRuneByName("RA", spell) then
        gfxNumber = 9
        if runes.checkSpellForRuneByName("Qwan", spell) then
            gfxNumber = 36
        end
    end
    if runes.checkSpellForRuneByName("CUN", spell) then
        gfxNumber = 4
        if runes.checkSpellForRuneByName("Qwan", spell) then
            gfxNumber = 3
        end
    end
    if runes.checkSpellForRuneByName("Bhona", spell) then
        gfxNumber = 41
    end
local position = target
    if target.pos then
        position = target.pos
    end

    world:gfx(gfxNumber, position)
end

function M.getUserGFX()
    return 21
end

return M
