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

local delayedAttack = require("magic.arcane.delayedAttack")
local runes = require("magic.arcane.runes")
local targeting = require("magic.arcane.targeting")

local M = {}

function M.applyOrl(user, target, spell)
    local targetx = target.x
    local targety = target.y
    local targetz = target.z
    local myEffect = LongTimeEffect(11,70)
    user.effects:addEffect(myEffect)
    myEffect:addValue("x", targetx)
    myEffect:addValue("y", targety)
    myEffect:addValue("z", targetz)
    myEffect:addValue("spell", spell)
end

function M.addEffect(myEffect, user)
end

function M.callEffect(myEffect, user)
    local foundX, x = myEffect:findValue("x")
    local foundY, y = myEffect:findValue("y")
    local foundZ, z = myEffect:findValue("z")
    local foundSpell, spell = myEffect:findValue("spell")
    local element
    local myPosition
    local positions = {}
    local targets
    if foundX and foundY and foundZ and foundSpell then
        myPosition = position(x, y, z)
        element = runes.fetchElement(spell)
    end

    table.insert(positions,{position = myPosition})

    targets = targeting.positionsIntoTargets(positions)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
    if Mes then
        delayedAttack.applyDelay(user, myPosition, spell, true)
    else
        delayedAttack.spellEffects(user, targets, spell, element, true)
    end

return false
end
return M
