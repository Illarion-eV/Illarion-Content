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
--- This script contains basics for glyph forging.
--
--  Author: Banduk

local common = require("base.common")
local glyphs = require("base.glyphs")
local globalvar = require("base.globalvar")
local character = require("base.character")
local shard = require("item.shard")
local paralysis = require("lte.paralysis")
local shortflame = require("magic.spells.shortflame")


local standardTextRingDe = "Der Ring an deinem Finger kribbelt etwas."
local standardTextRingEn = "The ring on your finger prickles a little bit."
local standardTextAmuletDe = "Das Amulet um deine Hals wird etwas wärmer."
local standardTextAmuletEn = "The amulet around your neck becomes a little bit warmer."

local M = {}

local PROBABILITY_DESTROY_ON_END_COPPER = 0.4  -- probability the glyphed item is destroyed after the last glyph was consumed
local PROBABILITY_DESTROY_ON_END_SILVER = 0.5
local PROBABILITY_DESTROY_ON_END_GOLD = 0.6

local WAIT_TIME_AFTER_EQUIPPING = 120 --seconds after put the jewel on before it can be used

M.EFFEKT_RING_AMETHYST = glyphs.EFFEKT_RING_AMETHYST
M.EFFEKT_RING_RUBY = glyphs.EFFEKT_RING_RUBY
M.EFFEKT_RING_SAPPIRE = glyphs.EFFEKT_RING_SAPPIRE
M.EFFEKT_RING_OBSIDIAN = glyphs.EFFEKT_RING_OBSIDIAN
M.EFFEKT_RING_EMERALD = glyphs.EFFEKT_RING_EMERALD
M.EFFEKT_RING_TOPAZ = glyphs.EFFEKT_RING_TOPAZ
M.EFFEKT_RING_DIAMOND = glyphs.EFFEKT_RING_DIAMOND
M.EFFEKT_AMULET_AMETHYST = glyphs.EFFEKT_AMULET_AMETHYST
M.EFFEKT_AMULET_RUBY = glyphs.EFFEKT_AMULET_RUBY
M.EFFEKT_AMULET_SAPPIRE = glyphs.EFFEKT_AMULET_SAPPIRE
M.EFFEKT_AMULET_OBSIDIAN = glyphs.EFFEKT_AMULET_OBSIDIAN
M.EFFEKT_AMULET_EMERALD = glyphs.EFFEKT_AMULET_EMERALD
M.EFFEKT_AMULET_TOPAZ = glyphs.EFFEKT_AMULET_TOPAZ
M.EFFEKT_AMULET_DIAMOND = glyphs.EFFEKT_AMULET_DIAMOND

local function consumeGlyph(item, user, number)
    local itemName = ""
    local glyphNo = glyphs.getRemainingGlyphs(item)
    glyphNo = glyphNo - number
    if glyphNo < 1 then
        local carrierMaterial = glyphs.getGlyphMaterial(item)
        local destroyProbability = PROBABILITY_DESTROY_ON_END_GOLD
        if carrierMaterial == glyphs.COPPER then
            destroyProbability = PROBABILITY_DESTROY_ON_END_COPPER
        elseif carrierMaterial == glyphs.SILVER then
            destroyProbability = PROBABILITY_DESTROY_ON_END_SILVER
        end
        if math.random() < destroyProbability then
            if common.isSpecialItem(item) then -- reduce quality only
                itemName = common.GetNLS(user, item:getData("nameDe"), item:getData("nameEn"))
                if common.IsNilOrEmpty(itemName) then
                    itemName = common.GetNLS(user,world:getItemName(item.id,Player.german),world:getItemName(item.id,Player.english))
                end
                local itemQuality = common.getItemQuality(item)
                if common.IsNilOrEmpty(item:getData("qualityAtCreation")) then
                    item:setData("qualityAtCreation",itemQuality)
                end
                itemQuality = math.max(1, itemQuality - math.random(1,3))
                common.setItemQuality(item, itemQuality)
                common.InformNLS(user,"Dein " .. itemName .. " verliert Qualität als die Glyphe aufgebraucht ist.",
                                      "Your " .. itemName .. " lost quality as the glyph effect ends.")
            else
                itemName = common.GetNLS(user,world:getItemName(item.id,Player.german),world:getItemName(item.id,Player.english))
                world:erase(item,item.number)
                shard.createShardOnUser(user)
                common.InformNLS(user,"Dein " .. itemName .. " zerspringt als die Glyphe aufgebraucht ist. Dir bleibt ein Splitter.",
                                      "Your " .. itemName .. " breaks as the glyph effect ends. Only a single shard remains.")
                return true
            end
         end
        glyphNo = 0
    end
    glyphs.setRemainingGlyphs(item,glyphNo)
    return false
end

local function checkFingerNeck(user,finger,itemIds)

    local itemAtCharacter = user:getItemAt(finger)
    if common.isInList(itemAtCharacter.id, itemIds) then
        if glyphs.isGlyphed(itemAtCharacter) then
            local glyphEffectItem = itemAtCharacter
            local glyphEffectPower = common.posInList(itemAtCharacter.id, itemIds)
            return true, glyphEffectItem, glyphEffectPower
        end
    end
    return false, nil, nil
end

local function EffectIsSupported(user,effectId)

    local itemIds = {}
    if effectId <= 7 then
        itemIds = {glyphs.ringAndAmuletDefinition[effectId][1],glyphs.ringAndAmuletDefinition[effectId+7][1],glyphs.ringAndAmuletDefinition[effectId+14][1]}
        for finger = 7,8 do --finger left hand, finger right hand
            local isEquipped, glyphEffectItem, glyphEffectPower = checkFingerNeck(user,finger,itemIds)
            if isEquipped then
                return true, glyphEffectItem, glyphEffectPower
            end
        end
    else
        itemIds = {glyphs.ringAndAmuletDefinition[effectId-7][2],glyphs.ringAndAmuletDefinition[effectId][2],glyphs.ringAndAmuletDefinition[effectId+7][2]}
        local isEquipped, glyphEffectItem, glyphEffectPower = checkFingerNeck(user,2,itemIds)-- neck
        if isEquipped then
            return true, glyphEffectItem, glyphEffectPower
        end
    end
    return false, nil, nil
end

local function effectRepel(user)
    local HITPOINT_LIMIT = 350
    local HITPOINT_FAKTOR = -110
    local EFF_SUMMAND = 0.48
    local EFF_FACTOR = 0.24
    local isFired
    local parameter
    local isDestroyed
    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_OBSIDIAN)
    if user:increaseAttrib("hitpoints", 0) > HITPOINT_LIMIT then
        if isFired then
            local hitpointCost = math.floor(HITPOINT_FAKTOR/parameter)
            user:increaseAttrib("hitpoints", hitpointCost)
            local efficiency = EFF_SUMMAND + parameter * EFF_FACTOR
            if math.random() < efficiency then
                if not isDestroyed then
                    common.InformNLS(user,"Dein Obsidian Amulet kratzt dich heftig, als es die Magie der fremden Glyphe absorbiert.",
                                          "Your obsidian amulet scratches deeply as it absorbs the power of the foreign glyph.")
                end
                return true
            else
                if not isDestroyed then
                    common.InformNLS(user,"Dein Obsidian Amulet zerspringt fast als es erfolglos versucht, die Magie der fremden Glyphe zu absorbieren.",
                                          "Your obsidian amulet almost shatters, as it is unsuccessful in absorbing the power of the foreign glyph.")
                end
                return false
            end
        end
    end
    return false
end

function M.effectUse(user,effectId,numberOfCharges,specialProbaility)
    local consumedCharges = numberOfCharges or 1
    local isSupported
    local glyphEffectItem
    local glyphEffectPower
    local isDestroyed

    if not character.IsPlayer(user) then
        return false
    end

    isSupported, glyphEffectItem, glyphEffectPower = EffectIsSupported(user,effectId)
    if not isSupported then
        return false
    end

    local timeLimit = common.GetCurrentTimestamp() - WAIT_TIME_AFTER_EQUIPPING
    if glyphEffectItem.itempos == Character.neck then
        if user:getQuestProgress(564) >= timeLimit then
            return false
        end
    elseif glyphEffectItem.itempos == Character.finger_left_hand then
        if user:getQuestProgress(565) >= timeLimit then
            return false
        end
    elseif glyphEffectItem.itempos == Character.finger_right_hand then
        if user:getQuestProgress(566) >= timeLimit then
            return false
        end
    end

    local probability = specialProbaility or glyphs.glyphEffects[effectId][2]
    if math.random() > probability then
        return false
    end
    isDestroyed = consumeGlyph(glyphEffectItem, user, consumedCharges)
    return true, glyphs.glyphEffects[effectId][2 + glyphEffectPower], isDestroyed
end

function M.effectOnFight(attacker,defender)
    local isFired
    local parameter
    local isDestroyed

    local MOVE_POINT_BASE = 10
    isFired,parameter = M.effectUse(attacker,M.EFFEKT_RING_AMETHYST)
    if isFired then
        if effectRepel(defender) then
            world:gfx(globalvar.gfxFIZZLE,defender.pos)
        else
            character.ChangeMovepoints(defender,-math.floor(MOVE_POINT_BASE*parameter))
            world:gfx(globalvar.gfxFALL,defender.pos)
        end
    end

    isFired,parameter = M.effectUse(attacker,M.EFFEKT_AMULET_AMETHYST)
    if isFired then
        if effectRepel(defender) then
            world:gfx(globalvar.gfxFIZZLE,defender.pos)
        else
            character.ChangeMovepoints(defender,-math.floor(MOVE_POINT_BASE * 0.66 *parameter))
            character.ChangeMovepoints(attacker,math.floor(MOVE_POINT_BASE * 0.33 *parameter))
            world:gfx(globalvar.gfxFALL,defender.pos)
            world:gfx(globalvar.gfxSPELL,attacker.pos)
        end
    end

    local PARALYSIS_BASE_S = 1.2
    local MAX_PARALYSIS_S = 4
    local duration
    local foundEffect
    local paralysisEffect
    isFired,parameter,isDestroyed = M.effectUse(defender,M.EFFEKT_AMULET_EMERALD)
    if isFired then
        if effectRepel(attacker) then
            world:gfx(globalvar.gfxFIZZLE,attacker.pos)
        else
            world:gfx(globalvar.gfxSPELL,attacker.pos)
            duration = math.floor( math.max( 1, math.min(MAX_PARALYSIS_S,parameter * PARALYSIS_BASE_S)/0.3))
            foundEffect, paralysisEffect = attacker.effects:find(500)
            if foundEffect then
                local foundTime, cycleLeft = paralysisEffect:findValue("cycleLeft")
                paralysisEffect:addValue("cycleLeft", math.floor(math.min(MAX_PARALYSIS_S, cycleLeft * 0.3 + duration)))
            else
                paralysisEffect = LongTimeEffect(500,3)
                attacker.effects:addEffect(paralysisEffect)
                paralysisEffect:addValue("cycleLeft", duration - 1)
            end
        end
        if not isDestroyed then
            common.InformNLS(defender,standardTextAmuletDe,standardTextAmuletEn)
        end
    end

    local MIN_MOVEPOINT = 12
    local MOVEPOINT_BASE = 15
    local MAX_REDUCTION = 30
    local mpReductionEffect
    local totalReduction
    isFired,parameter,isDestroyed = M.effectUse(attacker,M.EFFEKT_RING_EMERALD)
    if isFired then
        if effectRepel(defender) then
            world:gfx(globalvar.gfxFIZZLE,defender.pos)
        else
            world:gfx(globalvar.gfxSPELL,defender.pos)
            foundEffect, mpReductionEffect = defender.effects:find(501)
            if foundEffect then
                local _, movepointLeft = mpReductionEffect:findValue("movepointReduction")
                totalReduction = math.min( MAX_REDUCTION, math.floor(movepointLeft + MOVEPOINT_BASE * parameter))
            else
                mpReductionEffect = LongTimeEffect(501,5)
                defender.effects:addEffect(mpReductionEffect)
                totalReduction = math.min( MAX_REDUCTION, math.floor(MOVEPOINT_BASE * parameter))
                mpReductionEffect:addValue("movepointMin", MIN_MOVEPOINT)
            end
            mpReductionEffect:addValue("movepointReduction", totalReduction)
        end
        if not isDestroyed then
            common.InformNLS(attacker,standardTextRingDe,standardTextRingEn)
        end
    end

    local FLAME_DEFENDER_S = 2
    local flameDuration
    isFired,parameter = M.effectUse(attacker,M.EFFEKT_RING_RUBY)
    if isFired then
        if effectRepel(defender) then
            world:gfx(globalvar.gfxFIZZLE,defender.pos)
        else
            flameDuration = parameter * FLAME_DEFENDER_S
            shortflame.cast(defender.pos,flameDuration)
            if not isDestroyed then
                common.InformNLS(attacker,standardTextRingDe,standardTextRingEn)
            end
        end
    end

    local FLAME_ATTACKER_S = 2
    isFired,parameter = M.effectUse(defender,M.EFFEKT_AMULET_RUBY)
    if isFired then
        if effectRepel(attacker) then
            world:gfx(globalvar.gfxFIZZLE,attacker.pos)
        else
            flameDuration = parameter * FLAME_ATTACKER_S
            shortflame.cast(attacker.pos,flameDuration)
            if not isDestroyed then
                common.InformNLS(defender,standardTextAmuletDe,standardTextAmuletEn)
            end
        end
    end

    local HP_LIMIT = 3000
    local HP_FAKTOR_USER = 0.03
    local HP_FAKTOR_ENEMY = 1.5
    local hpCosts
    if attacker:increaseAttrib("hitpoints", 0) > HP_LIMIT then
        isFired,parameter = M.effectUse(attacker,M.EFFEKT_RING_OBSIDIAN)
        if isFired then
            world:gfx(globalvar.gfxBLOOD,attacker.pos)
            world:gfx(globalvar.gfxBLOOD,defender.pos)
            hpCosts = attacker:increaseAttrib("hitpoints", 0) * parameter * HP_FAKTOR_USER
            attacker:increaseAttrib("hitpoints", - hpCosts)
            defender:increaseAttrib("hitpoints", - hpCosts * HP_FAKTOR_ENEMY)
            common.InformNLS(attacker,"Du bleibst nicht ungeschoren, als mit Hilfe deines Ringes ein mächtiger Angriff Erfolg hat.",
                                      "You do not get away unscathed, as a powerful attack is successful with the help of your ring.")
        end
    end

    local DISTANCE_BASE_ATTACK = 2
    local effectiveDistance
    isFired,parameter,isDestroyed = M.effectUse(attacker,M.EFFEKT_RING_SAPPIRE)
    if isFired then
        if effectRepel(defender) then
            world:gfx(globalvar.gfxFIZZLE,defender.pos)
        else
            effectiveDistance = math.floor( math.max( 1, parameter * DISTANCE_BASE_ATTACK))
            common.pushBack(defender,effectiveDistance,attacker.pos)
            world:gfx(globalvar.gfxSTARS,defender.pos)
        end
        if not isDestroyed then
            common.InformNLS(attacker,standardTextRingDe,standardTextRingEn)
        end
    end

    local DISTANCE_BASE_DEFEND = 2
    isFired,parameter,isDestroyed = M.effectUse(defender,M.EFFEKT_AMULET_SAPPIRE)
    if isFired then
        if effectRepel(attacker) then
            world:gfx(globalvar.gfxFIZZLE,attacker.pos)
        else
            effectiveDistance = math.floor( math.max( 1, parameter * DISTANCE_BASE_DEFEND))
            common.pushBack(defender,effectiveDistance,attacker.pos)
            world:gfx(globalvar.gfxSTARS,defender.pos)
        end
        if not isDestroyed then
            common.InformNLS(defender,standardTextAmuletDe,standardTextAmuletEn)
        end
    end
end

function M.effectOnCraftingTime(user)
    local CRAFTING_TIME_IMPROVEMENT = 0.05
    local isFired
    local parameter
    local isDestroyed
    local craftingTime = 1

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_AMETHYST)
    if isFired then
        craftingTime = 1 - parameter * CRAFTING_TIME_IMPROVEMENT
        world:gfx(globalvar.gfxSPELL,user.pos)
    end
    return craftingTime
end

function M.effectOnRepairTime(user)
    local REPAIR_TIME_IMPROVEMENT = 0.05
    local isFired
    local parameter
    local isDestroyed
    local craftingTime = 1

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_AMETHYST)
    if isFired then
        craftingTime = 1 - parameter * REPAIR_TIME_IMPROVEMENT
        world:gfx(globalvar.gfxSPELL,user.pos)
        if not isDestroyed then
            common.InformNLS(user,standardTextAmuletDe,standardTextAmuletEn)
        end
    end
    return craftingTime
end

function M.effectOnUserRepairQuality(user,item)
    local QUALITY_BASE = 0.6
    local isFired
    local parameter
    local isDestroyed
    local improvementValue = 0

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_TOPAZ)
    if isFired then
        world:gfx(globalvar.gfxDEMFIRE,user.pos)
        if not isDestroyed then
            common.InformNLS(user,standardTextAmuletDe,standardTextAmuletEn)
        end
        improvementValue = parameter * QUALITY_BASE
    end

    local NUMBER_OF_HELPER = 1
    local workbenchPos = common.GetFrontPosition(user)
    local playerInSight = world:getPlayersInRangeOf(workbenchPos,1)
    if #playerInSight > NUMBER_OF_HELPER then
        isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_RUBY)
        if isFired then
            if not isDestroyed then
                common.InformNLS(user,"Mit einer Person neben dir arbeitest du konzentrierter. Die Qualität deiner Arbeit wird besser.",
                                      "With someone next to you, you are able to concentrate much better. The quality of your work improves.")
            end
            for i=2,#playerInSight do
                world:gfx(globalvar.gfxSCOTTY,playerInSight[i].pos)
                common.InformNLS(playerInSight[i],"Du bist kurz abgelenkt. Es scheint als ob ein Teil deiner Konzentration auf den Handwerker neben dir übergegangen ist.",
                                                  "You are distracted for a moment. It seem as though your ability to concentrate was absorbed by the crafter next to you.")
            end
            improvementValue = improvementValue + parameter * QUALITY_BASE
        end
    end

    local CHARGES_ON_DIAMOND = 4
    local PROBABILITY_ON_DIAMOND = 0.5
    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_DIAMOND,CHARGES_ON_DIAMOND,PROBABILITY_ON_DIAMOND)
    if isFired then
        world:gfx(globalvar.gfxSCOTTY,user.pos)
        item:setData("craftedBy",user.name)
        common.InformNLS(user,"Du arbeitest das Werkstück so um, dass es von dir hergestellt sein könnte.",
                              "You work the item in such a way that it could have originally been made by you.")
        improvementValue = improvementValue + parameter * QUALITY_BASE
    end

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_DIAMOND,CHARGES_ON_DIAMOND,PROBABILITY_ON_DIAMOND)
    if isFired then
        world:gfx(globalvar.gfxSCOTTY,user.pos)
        local bestQuality = item:getData("qualityAtCreation")
        if common.IsNilOrEmpty(bestQuality) then
            bestQuality = common.getItemQuality(item)
        end
        bestQuality = tonumber(bestQuality)
        if bestQuality < 9 then
            bestQuality = bestQuality + 1
        end
        item:setData("qualityAtCreation", bestQuality)
        common.InformNLS(user,"Du arbeitest das Werkstück so um, dass es eine bessere Qualität haben kann als bei seiner Herstellung.",
                              "You work the item in such a way that it might attain a better quality than when it was originally crafted.")
        improvementValue = improvementValue + parameter * QUALITY_BASE
    end

    return improvementValue
end

function M.effectOnNpcRepair(user)
    local isFired
    local parameter
    local isDestroyed
    local HITPOINT_LIMIT = 1000
    local HITPOINT_FAKTOR = 110
    local PROB_SUMMAND = 0.48
    local PROB_FACTOR = 0.24
    local preventionProb

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_OBSIDIAN)
    if user:increaseAttrib("hitpoints", 0) > HITPOINT_LIMIT then
        if isFired then
            world:gfx(globalvar.gfxSPRINKLE,user.pos)
            local hitpointCost = math.floor(parameter*HITPOINT_FAKTOR)
            user:increaseAttrib("hitpoints", hitpointCost)
            preventionProb = PROB_SUMMAND + parameter * PROB_FACTOR
            if not isDestroyed then
                common.InformNLS(user,"Du zeigst deinen blutigen kratzenden Ring in der Hoffnung, dass die Arbeit fachgerecht ausgeführt wird.",
                                      "You show your bloodied, scratching ring and hope for skilful workmanship.")
            end
            return preventionProb
        end
    end
    return 0
end

function M.effectDamageIncrease(user,defender)
    local DAMAGE_INCREASE_FACTOR = 0.4
    local isFired
    local parameter
    local damageIncrease

    isFired,parameter = M.effectUse(user,M.EFFEKT_RING_TOPAZ)
    if isFired then
        world:gfx(globalvar.gfxFLAMESTRIKE,defender.pos)
        damageIncrease = 1 + parameter * DAMAGE_INCREASE_FACTOR
        return damageIncrease
    end
    return 1
end

function M.effectRevertDamage(user,attacker)
    local DAMAGE_REVERT_FACTOR = 0.75
    local isFired
    local parameter
    local damagePortion

    isFired,parameter = M.effectUse(user,M.EFFEKT_AMULET_TOPAZ)
    if isFired then
        if effectRepel(attacker) then
            world:gfx(globalvar.gfxFIZZLE,attacker.pos)
        else
            world:gfx(globalvar.gfxFLAMESTRIKE,attacker.pos)
            damagePortion = parameter * DAMAGE_REVERT_FACTOR
            return true, damagePortion
        end
    end
    return false, 1
end

local function applyDamageOverTime(user,damageTaker,damage,effectCarrier,textDe,textEn)
    local DAMAGE_FACTOR = 1
    local MAX_DAMAGE_PER_CYCLE = 40
    local MAX_TOTAL_DAMAGE = 5000
    local MIN_DURATION = 40 --0.5s cycles
    local foundEffect
    local hpReductionEffect
    local totalDamage
    local damagePerCycle

    local isFired, parameter, isDestroyed = M.effectUse(user, effectCarrier)
    if isFired then
        if effectRepel(damageTaker) then
            world:gfx(globalvar.gfxFIZZLE,damageTaker.pos)
        else
            world:gfx(globalvar.gfxICE,damageTaker.pos)
            foundEffect, hpReductionEffect = damageTaker.effects:find(502)
            if foundEffect then
                local _, damageLeft = hpReductionEffect:findValue("damageReduction")
                totalDamage = math.min( MAX_TOTAL_DAMAGE, math.floor(damageLeft + damage * parameter * DAMAGE_FACTOR))
            else
                hpReductionEffect = LongTimeEffect(502,5)
                damageTaker.effects:addEffect(hpReductionEffect)
                totalDamage = math.min( MAX_TOTAL_DAMAGE, math.floor(damage * parameter * DAMAGE_FACTOR))
            end
            if totalDamage < (MIN_DURATION * MAX_DAMAGE_PER_CYCLE) then
                damagePerCycle = math.floor(totalDamage / MIN_DURATION)
            else
                damagePerCycle = MAX_DAMAGE_PER_CYCLE
            end
            hpReductionEffect:addValue("damageReduction", totalDamage)
            hpReductionEffect:addValue("damagePerCycle", damagePerCycle)
        end
        if not isDestroyed then
            common.InformNLS(user,textDe,textEn)
        end
    end
end

function M.effectDamageOverTime(attacker,defender,damage)
    applyDamageOverTime(attacker,defender,damage,M.EFFEKT_RING_DIAMOND,standardTextRingDe,standardTextRingEn)
    applyDamageOverTime(defender,attacker,damage,M.EFFEKT_AMULET_DIAMOND,standardTextAmuletDe,standardTextAmuletEn)
end

function M.effectOnQuality(user)
    local isFired
    local parameter
    local isDestroyed
    local qualityImprovement = 0

    local REQUIRED_CHARGES = 4
    local QUALITY_FAKTOR = 0.7
    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_TOPAZ, REQUIRED_CHARGES)
    if isFired then
        world:gfx(globalvar.gfxSCOTTY,user.pos)
        if not isDestroyed then
            common.InformNLS(user,standardTextRingDe,standardTextRingEn)
        end
        qualityImprovement = parameter * QUALITY_FAKTOR
    end

    local NUMBER_OF_HELPER = 1
    local workbenchPos = common.GetFrontPosition(user)
    local playerInSight = world:getPlayersInRangeOf(workbenchPos,1)
    if #playerInSight > NUMBER_OF_HELPER then
        isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_RUBY, REQUIRED_CHARGES)
        if isFired then
            if not isDestroyed then
                common.InformNLS(user,"Mit einer Person neben dir arbeitest du konzentrierter. Die Qualität deiner Arbeit wird besser.",
                                      "With someone next to you, you are able to concentrate much better. The quality of your work improves.")
            end
            for i=2,#playerInSight do
                world:gfx(globalvar.gfxSCOTTY,playerInSight[i].pos)
                common.InformNLS(playerInSight[i],"Du bist kurz abgelenkt. Es scheint als ob ein Teil deiner Konzentration auf den Handwerker neben dir übergegangen ist.",
                                                  "You are distracted for a moment. It seem as though your ability to concentrate was absorbed by the crafter next to you.")
            end
            qualityImprovement = qualityImprovement + parameter * QUALITY_FAKTOR
        end
    end

    return qualityImprovement
end

function M.effectBloodToQuality(user)
    local REQUIRED_CHARGES = 4
    local QUALITY_FAKTOR = 0.8
    local HP_COSTS = 3000
    local HP_LIMIT = 4000
    local isFired
    local parameter
    local qualityImprovement

    if user:increaseAttrib("hitpoints", 0) > HP_LIMIT then
        isFired,parameter = M.effectUse(user,M.EFFEKT_AMULET_OBSIDIAN, REQUIRED_CHARGES)
        if isFired then
            world:gfx(globalvar.gfxBLOOD,user.pos)
            user:increaseAttrib("hitpoints", - HP_COSTS)
            common.InformNLS(user,"Unter Einsatz deines Herzblutes erreichst du eine bessere Qualität.",
                                  "Using your heart's blood you achieve a better quality.")
            qualityImprovement = parameter * QUALITY_FAKTOR
            return qualityImprovement
        end
    end
    return 0
end

function M.effectToolSelfRepair(user, toolItem, originalDurability)
    local DURABILITY_IMPROVEMENT_FACTOR = 4
    local MIN_IMPROVEMENT = 10
    local isFired
    local parameter
    local isDestroyed
    local currentDurability
    local improvement
    local targetDurability

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_EMERALD)
    if isFired then
        currentDurability = common.getItemDurability(toolItem)
        improvement = math.max(MIN_IMPROVEMENT, (originalDurability - currentDurability) * parameter * DURABILITY_IMPROVEMENT_FACTOR)
        targetDurability = math.min(99, originalDurability + improvement)
        world:gfx(globalvar.gfxSCOTTY,user.pos)
        common.setItemDurability(toolItem, targetDurability)
        if not isDestroyed then
            common.InformNLS(user,"Dein Werkzeug scheint sich selbst repariert zu haben.",
                                  "Your tool seems to have repaired itself.")
        end
    end
end

function M.effectPreventMonsterOnGathering(user)
    local PREVENTION_BASE_VALUE = 0.6
    local EFFECT_PROBABILITY = 0.9
    local isFired
    local parameter
    local isDestroyed
    local preventionProbability

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_EMERALD,1,EFFECT_PROBABILITY)
    if isFired then
        preventionProbability = parameter * PREVENTION_BASE_VALUE
        if math.random() < preventionProbability then
            world:gfx(globalvar.gfxRAIN,user.pos)
            common.InformNLS(user,"Du meinst etwas gesehen zu haben, das vor dir davonlief.",
                                  "You think you saw something running away from you.")
            return true
        else
            world:gfx(globalvar.gfxFIZZLE,user.pos)
            if not isDestroyed then
                common.InformNLS(user,standardTextAmuletDe,standardTextAmuletEn)
            end
        end
    end
    return false
end

function M.effectSaveMaterialOnProduction(user)
    local SAVE_BASE_FACTOR = 0.24
    local SAVE_BASE_SUMAND = 0.48
    local EFFECT_PROBABILITY = 0.5
    local isFired
    local parameter
    local isDestroyed
    local saveProbability

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_RING_SAPPIRE,1,EFFECT_PROBABILITY)
    if isFired then
        saveProbability = SAVE_BASE_SUMAND + parameter * SAVE_BASE_FACTOR
        if math.random() < saveProbability then
            world:gfx(globalvar.gfxSCOTTY,user.pos)
            common.InformNLS(user,"Du bist fertig und hast noch Material übrig. Das ist Magie!",
                                  "You're done and still have some material left. That's magic!")
            return true
        else
            world:gfx(globalvar.gfxFIZZLE,user.pos)
            if not isDestroyed then
                common.InformNLS(user,standardTextRingDe,standardTextRingEn)
            end
        end
    end
    return false
end

function M.effectSaveMaterialOnRepair(user)
    local SAVE_BASE_FACTOR = 0.24
    local SAVE_BASE_SUMAND = 0.48
    local EFFECT_PROBABILITY = 0.5
    local isFired
    local parameter
    local isDestroyed
    local saveProbability

    isFired,parameter,isDestroyed = M.effectUse(user,M.EFFEKT_AMULET_SAPPIRE,1,EFFECT_PROBABILITY)
    if isFired then
        saveProbability = SAVE_BASE_SUMAND + parameter * SAVE_BASE_FACTOR
        if math.random() < saveProbability then
            world:gfx(globalvar.gfxSCOTTY,user.pos)
            common.InformNLS(user,"Du bist fertig und hast weniger Material gebraucht als erwartet. Da war Magie im Spiel!",
                                  "You're done and needed less material than expected. That's magic!")
            return true
        else
            world:gfx(globalvar.gfxFIZZLE,user.pos)
            if not isDestroyed then
                common.InformNLS(user,standardTextAmuletDe,standardTextAmuletEn)
            end
        end
    end
    return false
end

function M.equipWithGlyphedItem(user,item)
    if item.itempos == Character.neck then
        user:setQuestProgress(564,common.GetCurrentTimestamp())
    elseif item.itempos == Character.finger_left_hand then
        user:setQuestProgress(565,common.GetCurrentTimestamp())
    elseif item.itempos == Character.finger_right_hand then
        user:setQuestProgress(566,common.GetCurrentTimestamp())
    end
end

return M