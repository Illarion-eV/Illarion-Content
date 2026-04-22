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

local dealDamage = require("magic.nature.dealDamage")
local shared = require("magic.nature.shared")
local akingwynt = require("magic.nature.effects.akingwynt")
local character = require("base.character")
local fighting = require("content.fighting")

local M = {}

local bleedEffectId = 40

local bleedDuration = 10 -- 10 seconds

function M.applyBleed(target, damage, user)

    damage = math.floor(damage) -- ensure whole integer

    local foundEffect, myEffect = target.effects:find(bleedEffectId)

    if foundEffect then

        local foundDamage, remainingDamage = myEffect:findValue("damage")

        if not foundDamage then
            remainingDamage = 0
        end

        local newAmount = math.max(remainingDamage+damage, 0) -- Ensure no healing values

        myEffect:addValue("damage", newAmount) -- Increase bleed damage
        myEffect:addValue("ticks", bleedDuration) --Reset duration with the added bleed damage
        if user then
            myEffect:addValue("userId", user.id)
        end
    else
        if damage > 0 then --Otherwise no effect; no healing via this
            myEffect = LongTimeEffect(bleedEffectId,10)

            myEffect:addValue("damage", damage)
            myEffect:addValue("ticks", bleedDuration)

            if user then
                myEffect:addValue("userId", user.id)
            end

            target.effects:addEffect(myEffect)
        end
    end
end

function M.addEffect(effect, user)
    user:inform("Als dich der Zauber trifft, fühlt es sich an, als hätten die Klauen eines wilden Tieres dich zerfetzt. Zurück bleibt eine blutende Wunde, die Spuren von Naturmagie in sich trägt.", "As the spell hits you feel as if the claws of a wild beast just ripped through you. Left behind is a bleeding wound carrying traces of nature magic.")
end

function M.callEffect(effect, user)

    if character.GetHP(user) == 0 then --Already dead, so we end the bleed LTE
        return false
    end

    local foundAmount, amount = effect:findValue("damage")

    local foundTicks, remainingTicks = effect:findValue("ticks")

    local foundUserId, userId = effect:findValue("userId")

    if not foundUserId then
        userId = false
    end

    if not foundAmount or not foundTicks then
        return false
    end

    local damage = math.floor(amount/remainingTicks)

    if damage <= 0 then
        M.removeEffect(effect, user)
        return false
    end

    dealDamage.dealDamage(user, damage, false, userId)

    if remainingTicks-1 == 0 then
        M.removeEffect(effect, user)
        return false
    end

    effect:addValue("damage", amount-damage)

    effect:addValue("ticks", remainingTicks-1)

    effect.nextcalled = 10 -- Call once per second

    return true

end

function M.loadEffect(effect, user)

end

function M.removeEffect(effect, user)
    user:inform("Deine Wunden schließen sich und bluten nicht mehr.", "Your wounds close up, no longer bleeding.")
end

local function getDamage(user, spellName, target)

    local damage = 600
    damage = shared.scaleEffect(user, spellName, damage, target)

    return math.floor(damage)

end

local function scaleDamage(damage, weaponType, target)

    local hitArea = fighting.GetHitArea(target:getRace())
    local hitItem = target:getItemAt(hitArea)
    local _, armour

    if hitItem and hitItem.id ~= 0 then
        _, armour = world:getArmorStruct(hitItem.id)
    end

    if not armour then
        return damage*2 --Twice the damage if unarmoured
    end

    --WeaponType can be one of: "slashing", "stabbing", "blunt"
    --Based on the rock paper scissor approach we get an increase/decrease of 50% or it justs stays the same

    local scaling = { --The scaling for general, light, medium and heavy armour
        slashing = {1,1.5,0.5,1},
        stabbing = {1,1,1.5,0.5},
        blunt = {1,0.5,1,1.5}
    }

    return damage*scaling[weaponType][armour.type]

end

function M.effect(user, location, target)

    world:gfx(59, location)
    world:makeSound(13, location)

    local damage = getDamage(user, "Incigwynt", target) --This accounts for all usual nature penetration and resistance calculations

    local beast = akingwynt.getCommunedBeast(user) -- What beast you are communed with determines the type of damage

    if not beast then
        user:inform("Der Zauber verblasst ins Nichts; du musst dich zuerst mit dem Geist eines Tieres verbinden, wenn du es befehligen willst.", "The spell fades away into nothing, you need to commune with the spirit of a beast first if you want to command it.")
        return
    end

    damage = scaleDamage(damage, beast.weaponType, target)

    M.applyBleed(target, damage, user)
end

function M.checksToPass(user, location, target)
    return true
end

return M
