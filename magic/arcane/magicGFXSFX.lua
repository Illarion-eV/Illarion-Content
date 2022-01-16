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

local M = {}

function M.getTargetGFXSFX(targets, spell, fancyLights)

    for _, target in pairs(targets.targets) do
        M.castTargetGFXSFX(target.pos, spell, fancyLights)
    end

    for _, item in pairs (targets.items) do
        M.castTargetGFXSFX(item.pos, spell, fancyLights)
    end

    for _, pos in pairs (targets.positions) do
        M.castTargetGFXSFX(pos, spell, fancyLights)
    end
end

function M.castTargetGFXSFX(pos, spell, fancyLights)
local gfxNumber = 0
local sfxNumber = 13
    if runes.checkSpellForRuneByName("RA", spell) then
        gfxNumber = 9
        sfxNumber = 5
        if runes.checkSpellForRuneByName("Qwan", spell) then
            gfxNumber = 36
        end
    end
    if runes.checkSpellForRuneByName("CUN", spell) then
        gfxNumber = 4
        sfxNumber = 9
        if runes.checkSpellForRuneByName("Qwan", spell) then
            gfxNumber = 3
        end
    end
    if runes.checkSpellForRuneByName("SOLH", spell) then
        gfxNumber = 8
        if runes.checkSpellForRuneByName("Qwan", spell) then
            gfxNumber = 5
        end
    end
    if runes.checkSpellForRuneByName("JUS", spell) then
        gfxNumber = 7
        if runes.checkSpellForRuneByName("Mes", spell) then
            if not fancyLights or not runes.checkSpellForMoreThanJUSMes(spell) then
                gfxNumber = 46
            end
        elseif runes.checkSpellForRuneByName("Pherc", spell) then
            if not runes.checkSpellForLightning(spell) then
                gfxNumber = 2
                sfxNumber = 4
            end
        else
            sfxNumber = 27
        end
        if not runes.checkSpellForMoreThanJUSSav(spell) then
            return
        end
    end
    if runes.checkSpellForRuneByName("PEN", spell) then
        gfxNumber = 31
    end
    if runes.checkSpellForRuneByName("Bhona", spell) then
        gfxNumber = 41
    end

    if gfxNumber == 0 then
        sfxNumber = 0
    end

    world:gfx(gfxNumber, pos)
    world:makeSound(sfxNumber, pos)

end

function M.getUserGFXSFX(spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
    if Lhor and JUS then
        return 0
    else
        return 21
    end
end

function M.getAdditionalUserGFXSFX(user, spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Sav = runes.checkSpellForRuneByName("Sav", spell)
    if JUS and Sav then
        local gfx = 7
        local sfx = 0
        world:gfx(gfx, user.pos)
        world:makeSound(sfx, user.pos)
    end
end

return M
