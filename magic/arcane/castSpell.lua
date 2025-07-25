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
local magic = require("base.magic")
local testing = require("base.testing")

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
    stats = {english = "As you attempt to cast the spell, you feel an abrupt headache prevent you from proceeding. Did something happen to your ability to cast magic?", german = "Als du versuchst den Zauber zu Sprechen, versp�rst du pl�tzlich heftige Kopfschmerzen die dich daran hindern. Ist etwas mit deiner F�higkeit zu Zaubern passiert? "}
}

local function skillCheckPassed(user, spell)

    local name = skilling.getMagicSkillSpellBelongsTo(spell)
    local skillName = user:getSkillName(Character[name])
    local skillLevel = user:getSkill(Character[name])

    local listOfRunesInSpell = {}

    for runeNumber = 1, #runes.runes do

        local rune = runes.runeNumberToName(runeNumber)

        if runes.checkSpellForRuneByName(rune, spell) then
            table.insert(listOfRunesInSpell, runeNumber)
        end
    end


    for _, rune in pairs(listOfRunesInSpell) do
        local runeName = runes.runeNumberToName(rune)
        local requiredLevel = runes.getLevelRequirementOfRune(rune)

        if requiredLevel > skillLevel then
            return false, requiredLevel, skillName, runeName
        end
    end

    return true
end

local function checkForWand(user)

    local wand = common.getItemInHand(user, magic.wandIds)

    if not wand then return true, false end -- Even without a wand you can cast rune spells, but they won't get the multiple advantages using a wand brings to your spells such a targeting, more power and more range

    if common.isBroken(wand) then --You dont get the wand bonuses without an intact wand so a warning instead
        user:inform("Dein Zauberstab ist zerbrochen. Du solltest ihn reparieren lassen, bevor du versuchst, ihn zu benutzen.", "Your wand is broken. You should see to its repairs before trying to use it.")
        return false, false
    end

    return true, wand
end

local function checksPassed(user, spell, element, thePosition)

    local wandCheckPassed = checkForWand(user)

    if not wandCheckPassed then
        return false
    end

    if not statReqMet(user, spell) then
        --If stats are lowered below the threshhold to learn a rune, whether through a trainer, a potion or something else
        user:inform(myTexts.stats.german, myTexts.stats.english)
        return false
    end

    if not range.isTargetInRange(user, spell, element, thePosition) then
        user:inform(myTexts.range.german, myTexts.range.english)
        return false
    end

    local passed, level, skillName, runeName = skillCheckPassed(user, spell)

    if not passed then
        user:inform("Du erf�llst nicht die Stufenanforderung, um "..runeName.." mit "..skillName.." zu wirken. Du ben�tigst mindestens Stufe "..level..".", "You do not meet the level requirement for casting "..runeName.." using "..skillName..". You need a minimum level of "..level..".")
        return false
    end
    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if not PEN and range.checkForObstacles(user, spell, thePosition) then
        user:inform(myTexts.sight.german, myTexts.sight.english)
        return false
    end

    if not mana.checkIfEnoughMana(user, spell) then
        user:inform(myTexts.mana.german, myTexts.mana.english)
        return false
    end

    return true
end

local function interrupted(player)
    local health = player:increaseAttrib("hitpoints", 0)
    local max_chance = 25 --max percentage chance of interrupting a cast
    local healthRoof = 7500 -- chance to interrupt begin at 7500 health
    local healthFloor = 2500 -- chance to interrupt reaches max_chance at 2500 health
    local willpower = player:increaseAttrib("willpower", 0)
    local attribBonus = common.GetAttributeBonusHigh(willpower)
    max_chance = math.floor(max_chance / (1+attribBonus)) -- At max attrib bonus for willpower, the max chance becomes 12.5%
    local healthRange = healthRoof-healthFloor
    local percent = healthRange/100
    local actual_chance = max_chance - math.floor(((health-healthFloor)/percent)/(100/max_chance))

    if health > healthRoof then
        return false
    end

    if health < healthFloor then
        actual_chance = max_chance
    end

    actual_chance = actual_chance/100

    local chance = math.random()

    if chance <= actual_chance then
        player:inform("Deine Verletzungen machen es dir schwer dich zu konzentrieren. Du machst einen Fehler beim Zaubern!", "Your wounds made it hard for you to concentrate, causing you to make a mistake in your casting.")
        return true
    end

    return false
end


function M.castSpell(user, spell, actionState, oralCast)

    if not oralCast then
        incantation.speakIncantation(user, spell)
        return
    end

    if interrupted(user) then
        return
    end

    if not M[user.id] then
        M[user.id] = {}
    end

    local skill = skilling.getMagicSkillSpellBelongsTo(spell)

    local level = user:getSkill(Character[skill])

    local element = runes.fetchElement(spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    local RA = runes.checkSpellForRuneByName("RA", spell)
    local SUL = runes.checkSpellForRuneByName("SUL", spell)
    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local MES = runes.checkSpellForRuneByName("MES", spell)
    local ORL = runes.checkSpellForRuneByName("ORL", spell)
    local castSFX = 0
    local castSFXDuration = 10
    local castGFXDuration = 10
    local castGFX = magicGFXSFX.getUserGFXSFX(spell)

    if actionState == Action.none then

        if _G.stopAutoCast and _G.stopAutoCast[user.id] then
            _G.stopAutoCast[user.id] = false
        end

        M[user.id].positionsAndTargets = targeting.getPositionsAndTargets(user, spell)

        if not M[user.id].positionsAndTargets then --rarely happens if you try to cast immediately after an !fr, also happens if you cast a PEN LEV spell after expiry
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

        local foundEffect, paralysis = user.effects:find(23)

        if foundEffect then
            local foundTime, timeLeft = paralysis:findValue("timeLeft")
            if foundTime and timeLeft >= 1 then
                M[user.id].extendBy = timeLeft
            else
                M[user.id].extendBy = 0
            end
        else
            M[user.id].extendBy = 0
        end

        if not _G.extendedCastingTimeForParalysis then
            _G.extendedCastingTimeForParalysis = {}
        end

        _G.extendedCastingTimeForParalysis[user.id] = 0

        user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
    elseif actionState == Action.abort then
        return
    elseif actionState == Action.success then

        --if paralysed then we extend the cast timer by the time paralysed

        if not _G.extendedCastingTimeForParalysis then
            _G.extendedCastingTimeForParalysis = {}
        end

        if M[user.id].extendBy > 0 then

            if testing.active then
                user:talk(Character.say, "#me's cast is extended by "..(M[user.id].extendBy/10).." seconds.")
            end

            user:startAction(M[user.id].extendBy, castGFX, castGFXDuration, castSFX, castSFXDuration)
            return

        elseif _G.extendedCastingTimeForParalysis[user.id] and _G.extendedCastingTimeForParalysis[user.id] > 0 then

            if testing.active then
                user:talk(Character.say, "#me's cast is extended by "..(_G.extendedCastingTimeForParalysis[user.id]/10).." seconds.")
            end

            user:startAction(_G.extendedCastingTimeForParalysis[user.id], castGFX, castGFXDuration, castSFX, castSFXDuration)
            _G.extendedCastingTimeForParalysis[user.id] = 0

            return
        end

        if not range.isTargetInRange(user, spell, element, M[user.id].thePosition) then
            user:inform(myTexts.range.german, myTexts.range.english)
            return
        end
        if not runes.checkSpellForRuneByName("BHONA", spell) then
            mana.removedUsedMana(user, spell)
            local castDuration = M[user.id].storedDuration
            skilling.increaseExperience(user, spell, castDuration, M[user.id].positionsAndTargets)
            castTime.resetTan(user)
            if JUS and ORL then
                diminishingReturns.applyOrl(user, M[user.id].thePosition, spell, level)
            end
            if (SUL and (RA or CUN)) or (JUS and MES) then
                delayedAttack.applyDelay(user, M[user.id].thePosition, spell, false, level)
            else
                delayedAttack.spellEffects(user, M[user.id].positionsAndTargets, spell, element, false, level, castDuration)
            end

            local _, wand = checkForWand(user)

            if user.attackmode and runes.isSpellAutoCast(spell, wand) and checksPassed(user, spell, element, M[user.id].thePosition) then
                -- To mimic wand magic so that the fire magic replacement does not feel like a downgrade, we allow auto casting of some spells

                if _G.stopAutoCast and _G.stopAutoCast[user.id] then
                    _G.stopAutoCast[user.id] = false
                    return
                end


                castDuration = castTime.arcaneSpellCastSpeed(user, spell)
                M[user.id].storedDuration = castDuration

                if interrupted(user) then
                    return
                end

                user:startAction(castDuration, castGFX, castGFXDuration, castSFX, castSFXDuration)
            end
        else
            teaching.teachRune(user, M[user.id].positionsAndTargets, spell)
        end
    end
end
return M
