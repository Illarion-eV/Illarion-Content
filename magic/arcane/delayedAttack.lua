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

local magicGFX = require("magic.arcane.magicGFX")
local targeting = require("magic.arcane.targeting")
local dealDamage = require("magic.arcane.dealMagicDamage")
local incantation = require("magic.arcane.incantation")
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
local information = require("magic.arcane.information")

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
    DoT.dealMagicDoT(user, targets, spell, element)
    magicGFX.getAdditionalUserGFX(user, spell)
    staticObjects.spawnStaticObjects(user, targets, spell)
    MSReduction.checkForReduceManaOrStamina(user, targets, spell)
    harvestFruit.checkIfHarvestFruit(user, targets, spell)
    movement.applyMovementSpells(user, targets, spell, Orl)
    lifesteal.instantLifeOrManaSteal(user, targets, spell, Orl)
    traps.createEarthTraps(user, targets, spell)
    plantRoot.createEntanglingPlant(user, targets, spell)
    dealDamage.applyMagicDamage(user, targets, spell, element, Orl)
    illuminate.CheckIfIlluminate(user, targets, spell)
    snare.applySnare(user, targets, spell, Orl)
    stun.checkForStun(spell, targets)
    MSReduction.checkForIncreaseStamina(user, targets, spell)
    plantRoot.applyPlantRoot(user, targets, spell)
    stallMana.applyManaStalling(user, targets, spell)
    information.invokeSpiritSpells(user, targets, spell)
    magicGFX.getTargetGFX(targets, spell, true)
end

function M.applyDelay(user, target, spell, Orl)
    local targetx = target.x
    local targety = target.y
    local targetz = target.z
    local casterx = user.pos.x
    local castery = user.pos.y

    local myEffect = LongTimeEffect(7,5)
    incantation.speakIncantation(user, spell)
    user.effects:addEffect(myEffect)
    myEffect:addValue("lastX", casterx)
    myEffect:addValue("lastY", castery)
    myEffect:addValue("targetX", targetx)
    myEffect:addValue("targetY", targety)
    myEffect:addValue("targetZ", targetz)
    myEffect:addValue("spell", spell)
    if Orl then
        myEffect:addValue("Orl", Orl)
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
        magicGFX.getTargetGFX(effectTargets, spell)
        myEffect.nextCalled=5
    end
return true
end
return M