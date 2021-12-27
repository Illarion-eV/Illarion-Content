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
local skilling = require("magic.arcane.skilling")

local M = {}

local function statReqMet(user, spell)
local statReq = 0
    for _ , rune in pairs(runes.Runes) do
        if runes.checkSpellForRune(rune[1], spell) then
            local newStat = runes.getStatRequirementOfRune(rune[1])
            if newStat > statReq then
                statReq = newStat
            end
        end
    end
    local userStats = user:increaseAttrib("willpower", 0) + user:increaseAttrib("essence", 0) + user:increaseAttrib("intelligence", 0)

    if userStats >= statReq then
        return true
    end
    return false
end

function M.castSpell(user, spell, actionState)
local positionsAndTargets = targeting.getPositionsAndTargets(user, spell)
    if not positionsAndTargets then --rarely happens if you try to cast immediately after an !fr, also happens if you cast a PEN Lev spell after expiry
        return
    end
local position = positionsAndTargets.thePosition
local element = runes.fetchElement(spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local targets
local castDuration = castTime.arcaneSpellCastSpeed(user, spell)
local castSFX = magicSFX.getMagicSFXUser()
local castSFXDuration = 0
local castGFXDuration = 10
local castGFX = magicGFX.getUserGFX(spell)
    if actionState == Action.none then
        if not statReqMet(user, spell) then
            --If stats are lowered below the threshhold to learn a rune, whether through a trainer, a potion or something else
            user:inform("", "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?")
            return
        end
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
        if castGFX == 0 then
            user:inform("", "You secretly begin casting a wind spell.")
        end
        user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
    elseif actionState == Action.abort then
        return
    elseif actionState == Action.success then
        targets = targeting.getPositionsAndTargets(user, spell)
        if not range.isTargetInRange(user, spell, element, position) then
            user:inform("","The target is too far away.")
            return
        end
        if not runes.checkSpellForRuneByName("BHONA", spell) then
            mana.removedUsedMana(user, spell)
            skilling.increaseExperience(user, spell)
            if JUS and Orl then
                diminishingReturns.applyOrl(user, position, spell)
            end
            if (Sul and (RA or CUN)) or (JUS and Mes) then
                delayedAttack.applyDelay(user, position, spell)
            else
                delayedAttack.spellEffects(user, targets, spell, element)
                incantation.speakIncantation(user, spell)
            end
        else
            teaching.teachRune(user, targets, spell)
        end
    end
end
return M
