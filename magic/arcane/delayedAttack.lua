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

local magicGFXSFX = require("magic.arcane.magicGFXSFX")
local targeting = require("magic.arcane.targeting")
local dealDamage = require("magic.arcane.dealMagicDamage")
local staticObjects = require("magic.arcane.staticObjects")
local stun = require("magic.arcane.stun")
local MSReduction = require("magic.arcane.manaStaminaReduction")
local illuminate = require("magic.arcane.illuminate")
local DoT = require("magic.arcane.magicDoT")
local runes = require("magic.arcane.runes")
local harvestFruit = require("magic.arcane.harvestFruit")
local movement = require("magic.arcane.movement")
local lifesteal = require("magic.arcane.lifesteal")
local snare = require("magic.arcane.snare")
local plantRoot = require("magic.arcane.plantRoot")
local stallMana = require("magic.arcane.stallMana")
local traps = require("magic.arcane.traps")
local information = require("magic.arcane.spirit.information")
local tutorials = require("magic.tutorials")
local dispel = require("magic.arcane.dispel")

local M = {}


function M.getTarget(user, myEffect, lx, ly, tx, ty, tz)
local x
local y
    if lx == tx and ly == ty then
        return false
    end
    if ty > ly then
        y = ly+1
    elseif ty < ly then
        y = ly-1
    else
        y = ly
    end
    if tx > lx then
        x = lx+1
    elseif tx < lx then
        x = lx-1
    else
        x = lx
    end
    myEffect:addValue("lastX", x)
    myEffect:addValue("lastY", y)
return position(x, y, tz)
end
function M.spellEffects(user, targets, spell, element, Orl)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local OrlRune = runes.checkSpellForRuneByName("Orl", spell)
    if not (SOLH and OrlRune) then
        illuminate.CheckIfIlluminate(user, targets, spell)
        DoT.dealMagicDoT(user, targets, spell, element)
        magicGFXSFX.getAdditionalUserGFXSFX(user, spell)
        MSReduction.checkForReduceManaOrStamina(user, targets, spell)
        harvestFruit.checkIfHarvestFruit(user, targets, spell)
        movement.applyMovementSpells(user, targets, spell, Orl)
        lifesteal.instantLifeOrManaSteal(user, targets, spell, Orl)
        plantRoot.createEntanglingPlant(user, targets, spell)
        dealDamage.applyMagicDamage(user, targets, spell, element, Orl)
        snare.applySnare(user, targets, spell, Orl)
        stun.checkForStun(spell, targets)
        MSReduction.checkForIncreaseStamina(user, targets, spell)
        plantRoot.applyPlantRoot(user, targets, spell)
        staticObjects.spawnStaticObjects(user, targets, spell)
        stallMana.applyManaStalling(user, targets, spell)
        information.invokeSpiritSpells(user, targets, spell)
        dispel.dispel(spell, targets)
    else --spell effect gets applied to trap instead
        traps.createEarthTraps(user, targets, spell)
    end
    magicGFXSFX.getTargetGFXSFX(targets, spell, true)
    if spell == 8 then
        if tutorials.isTutorialNPCnearby(user) then
            if user:getQuestProgress(237) == 5 then
                user:setQuestProgress(237, 6)
            end
        end
    end
end

function M.applyDelay(user, target, spell, Orl)
    local targetx = target.x
    local targety = target.y
    local targetz = target.z
    local casterx = user.pos.x
    local castery = user.pos.y

    local foundEffect, myEffect = user.effects:find(7)

    if not foundEffect then
        myEffect = LongTimeEffect(7,5)
        myEffect:addValue("lastX", casterx)
        myEffect:addValue("lastY", castery)
        myEffect:addValue("targetX", targetx)
        myEffect:addValue("targetY", targety)
        myEffect:addValue("targetZ", targetz)
        myEffect:addValue("spell", spell)
        if Orl then
            myEffect:addValue("Orl", Orl)
        end
        user.effects:addEffect(myEffect)
    else
        myEffect:addValue("lastX", casterx)
        myEffect:addValue("lastY", castery)
        myEffect:addValue("targetX", targetx)
        myEffect:addValue("targetY", targety)
        myEffect:addValue("targetZ", targetz)
        myEffect:addValue("spell", spell)
        if Orl then
            myEffect:addValue("Orl", Orl)
        end
        M.addEffect(myEffect, user)
    end
end

function M.addEffect(myEffect, user)
end

local function nextPositionIntoTargets(nextPosition)
local targets = {positions = {nextPosition}, items = {}, targets = {}}
return targets
end

function M.callEffect(myEffect, user)
local foundLX, lx = myEffect:findValue("lastX")
local foundLY, ly = myEffect:findValue("lastY")
local foundTX, tx = myEffect:findValue("targetX")
local foundTY, ty = myEffect:findValue("targetY")
local foundTZ, tz = myEffect:findValue("targetZ")
local foundOrl, Orl = myEffect:findValue("Orl")
local foundSpell, spell = myEffect:findValue("spell")
local nextPosition
local castSpell = false
local positions = {}
local targetPosition
local targets
    if not foundSpell then
        return
    end
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
    if not foundOrl then
        Orl = false
    end
    if foundLX and foundLY and foundTX and foundTY and foundTZ then
        targetPosition = position(tonumber(tx), tonumber(ty), tonumber(tz))
        nextPosition = M.getTarget(user, myEffect, lx, ly, tx, ty, tz)
        if not nextPosition then
            nextPosition = position(tx, ty, tz)
            castSpell = true
        end
        table.insert(positions, {position = nextPosition})
    end
local element
    if foundSpell then
        element = runes.fetchElement(spell)
    end
local effectTargets = nextPositionIntoTargets(nextPosition)
    if castSpell then
        targets = targeting.getPositionsAndTargets(user, spell, targetPosition)
        if (RA or CUN) and Sul then
           targets = targeting.refreshTargets(targets)
        end
        M.spellEffects(user, targets, spell, element, Orl)
        return false
    end
    if foundSpell then
        magicGFXSFX.getTargetGFXSFX(effectTargets, spell)
        myEffect.nextCalled=5
    end
return true
end
return M
