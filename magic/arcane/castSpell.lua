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
local mana = require("magic.arcane.mana")
local range = require("magic.arcane.castingRange")
local castTime = require("magic.arcane.castingSpeed")
local magicGFX = require("magic.arcane.magicGFX")
local targeting = require("magic.arcane.targeting")
local runes = require("magic.arcane.runes")
local teaching = require("magic.arcane.teaching")
local magicSFX = require("magic.arcane.magicSFX")
local delayedAttack = require("magic.arcane.delayedAttack")
local incantation = require("magic.arcane.incantation")
local diminishingReturns = require("magic.arcane.diminishingReturns")

local M = {}

function M.castSpell(user, spell, actionState)
local position = targeting.getPosition(user, spell)
local element = runes.fetchElement(spell)
local rangeNum = range.getCastingRange(user, spell, element)
local Lev = runes.checkSpellForRuneByName("Lev", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local targets = targeting.getTargets(user, spell, position)
local castDuration = castTime.arcaneSpellCastSpeed(user, spell)
local castSFX = magicSFX.getMagicSFXUser()
local castSFXDuration = 0
local castGFXDuration = 10
local castGFX = magicGFX.getUserGFX(spell)
    if actionState == Action.none then
        if not range.isTargetInRange(user, spell, element, position) then
            user:inform("","The target is too far away.")
            return
        end
        if range.checkForObstacles(user, spell, element, position) then
            user:inform("","Line of sight not clear.")
            return
        end
        if not mana.checkIfEnoughMana(user, spell) then
            user:inform("","You do not have enough mana.")
            return
        end
        user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
    elseif actionState == Action.abort then
        return
    elseif actionState == Action.success then
        if not runes.checkSpellForRuneByName("Bhona", spell) then
            mana.removedUsedMana(user, spell)
            if JUS and Orl then
                diminishingReturns.applyOrl(user, position, spell)
            end
            if (Sul and (RA or CUN)) or (JUS and Mes) then
                delayedAttack.applyDelay(user, position, spell)
            else
                delayedAttack.spellEffects(user, targets, spell, element)
                incantation.speakIncantation(user, spell)
                if Lev and (RA or CUN) then
                local LevTarget = targeting.getWeakestNearTarget(user, position, rangeNum)
                    if LevTarget then
                        targets = targeting.getTargets(user, spell, LevTarget.pos)
                        delayedAttack.spellEffects(user, targets, spell, element)
                    end
                end
            end
        else
            teaching.teachRune(user, targets, spell)
        end
    end
end
return M
