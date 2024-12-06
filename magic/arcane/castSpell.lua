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
local magicGFXSFX = require("magic.arcane.magicGFXSFX")
local targeting = require("magic.arcane.targeting")
local runes = require("magic.arcane.runes")
local teaching = require("magic.arcane.teaching")
local delayedAttack = require("magic.arcane.delayedAttack")
local incantation = require("magic.arcane.incantation")
local diminishingReturns = require("magic.arcane.diminishingReturns")
local skilling = require("magic.arcane.skilling")
local common = require("base.common")

local M = {}

local function statReqMet(user, spell)
    local statReq = 0
    for _ , rune in pairs(runes.runes) do
        if runes.checkSpellForRune(rune.id, spell) then
            local newStat = runes.getStatRequirementOfRune(rune.id)
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

local myTexts = {
    range = {english = "The target is too far away.", german = "Dein Ziel ist zu weit weg."},
    secret = {english = "You secretly begin casting a wind spell.", german = "Du beginnst heimlich einen Windzauber zu wirken."},
    mana = {english = "You do not have enough mana.", german = "Du hast nicht genug Mana."},
    sight = {english = "Line of sight is not clear.", german = "Du kannst dein Ziel nicht richtig sehen."},
    stats = {english = "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?", german = "Als du versuchst den Zauber zu Sprechen, verspürst du plötzlich heftige Kopfschmerzen die dich daran hindern. Ist etwas mit deiner Fähigkeit zu Zaubern passiert? "}
}

local function checksPassed(user, spell, element, thePosition)

    if not statReqMet(user, spell) then
        --If stats are lowered below the threshhold to learn a rune, whether through a trainer, a potion or something else
        user:inform(myTexts.stats.german, myTexts.stats.english)
        return false
    end

    if not range.isTargetInRange(user, spell, element, thePosition) then
        user:inform(myTexts.range.german, myTexts.range.english)
        return false
    end

    if range.checkForObstacles(user, spell, element, thePosition) then
        user:inform(myTexts.sight.german, myTexts.sight.english)
        return false
    end

    if not mana.checkIfEnoughMana(user, spell) then
        user:inform(myTexts.mana.german, myTexts.mana.english)
        return false
    end

    return true
end

function M.castSpell(user, spell, actionState, oralCast)

    if not oralCast then
        incantation.speakIncantation(user, spell)
        return
    end

    if not M[user.id] then
        M[user.id] = {}
    end

    local element = runes.fetchElement(spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    local RA = runes.checkSpellForRuneByName("RA", spell)
    local Sul = runes.checkSpellForRuneByName("Sul", spell)
    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local Mes = runes.checkSpellForRuneByName("Mes", spell)
    local Orl = runes.checkSpellForRuneByName("Orl", spell)
    local castSFX = 0
    local castSFXDuration = 10
    local castGFXDuration = 10
    local castGFX = magicGFXSFX.getUserGFXSFX(spell)

    if actionState == Action.none then

        M[user.id].positionsAndTargets = targeting.getPositionsAndTargets(user, spell)

        if not M[user.id].positionsAndTargets then --rarely happens if you try to cast immediately after an !fr, also happens if you cast a PEN Lev spell after expiry
            return
        end

        M[user.id].thePosition = M[user.id].positionsAndTargets.thePosition

        common.TurnTo(user, M[user.id].thePosition)

        if not checksPassed(user, spell, element, M[user.id].thePosition) then
            return
        end

        if castGFX == 0 then
            user:inform(myTexts.secret.german, myTexts.secret.english)
        end

        local castDuration = castTime.arcaneSpellCastSpeed(user, spell)

        M[user.id].storedDuration = castDuration

        user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
    elseif actionState == Action.abort then
        return
    elseif actionState == Action.success then
        if not range.isTargetInRange(user, spell, element, M[user.id].thePosition) then
            user:inform(myTexts.range.german, myTexts.range.english)
            return
        end
        if not runes.checkSpellForRuneByName("BHONA", spell) then
            mana.removedUsedMana(user, spell)
            skilling.increaseExperience(user, spell, M[user.id].storedDuration)
            castTime.resetTan(user)
            if JUS and Orl then
                diminishingReturns.applyOrl(user, M[user.id].thePosition, spell)
            end
            if (Sul and (RA or CUN)) or (JUS and Mes) then
                delayedAttack.applyDelay(user, M[user.id].thePosition, spell)
            else
                delayedAttack.spellEffects(user, M[user.id].positionsAndTargets, spell, element)
            end

            if user.attackmode and runes.isSpellAutoCast(spell) and checksPassed(user, spell, element, M[user.id].thePosition) then
                -- To mimic wand magic so that the fire magic replacement does not feel like a downgrade, we allow auto casting of some spells

                local castDuration = castTime.arcaneSpellCastSpeed(user, spell)
                M[user.id].storedDuration = castDuration

                user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
            end
        else
            teaching.teachRune(user, M[user.id].positionsAndTargets, spell)
        end
    end
end
return M
