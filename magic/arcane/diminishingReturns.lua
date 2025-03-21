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
local castingSpeed = require("magic.arcane.castingSpeed")

local M = {}

function M.applyOrl(user, target, spell, level)
    local targetx = target.x
    local targety = target.y
    local targetz = target.z
    local myEffect = LongTimeEffect(11,70)
    user.effects:addEffect(myEffect)
    myEffect:addValue("x", targetx)
    myEffect:addValue("y", targety)
    myEffect:addValue("z", targetz)
    myEffect:addValue("spell", spell)
    myEffect:addValue("level", level)
end

function M.addEffect(myEffect, user)
end

function M.callEffect(myEffect, user)
    local foundX, x = myEffect:findValue("x")
    local foundY, y = myEffect:findValue("y")
    local foundZ, z = myEffect:findValue("z")
    local foundSpell, spell = myEffect:findValue("spell")
    local foundLevel, level = myEffect:findValue("level")
    if not foundLevel then
        level = 0
    end
    local element
    local myPosition
    local targets
    if foundX and foundY and foundZ and foundSpell then
        myPosition = position(x, y, z)
        element = runes.fetchElement(spell)
    end
    if not myPosition then
        return
    end
    targets = targeting.getPositionsAndTargets(user, spell, myPosition)
    targets = targeting.refreshTargets(targets)
local MES = runes.checkSpellForRuneByName("MES", spell)
    if MES then
        delayedAttack.applyDelay(user, myPosition, spell, true, level)
    else
        local castDuration = castingSpeed.arcaneSpellCastSpeed(nil, spell, true)
        delayedAttack.spellEffects(user, targets, spell, element, true, level, castDuration)
    end

return false
end
return M
