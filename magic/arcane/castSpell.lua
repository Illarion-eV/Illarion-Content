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
local shared = require("craft.base.shared")
local effectScaling = require("magic.arcane.effectScaling")

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

local function checksPassed(user, spell, element, thePosition, startedInAttackMode)

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
        user:inform("Du erfüllst nicht die Stufenanforderung, um "..runeName.." mit "..skillName.." zu wirken. Du benötigst mindestens Stufe "..level..".", "You do not meet the level requirement for casting "..runeName.." using "..skillName..". You need a minimum level of "..level..".")
        return false
    end
    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if not PEN and range.checkForObstacles(user, spell, thePosition) then
        user:inform(myTexts.sight.german, myTexts.sight.english)
        return false
    end

    if not mana.checkIfEnoughMana(user, spell, thePosition, startedInAttackMode) then
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

local function overWriteSlot(user, savedTargets, index, newTarget, slotLimit)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newString = ""

            for i = 1, slotLimit do
                if i ~= 1 then
                    newString = newString..","
                end

                for ti, target in ipairs(savedTargets) do
                    if ti ~= index and ti == i then
                        newString = newString..target.name..","..target.id
                    end
                end

                if i == index then
                    newString = newString..input..","..newTarget.id
                end
            end

            ScriptVars:set("heptTargets"..tostring(user.id), newString)
            ScriptVars:save()
        end
    end

    local dialog = InputDialog(common.GetNLS(user, "Ziel benennen", "Name Target"), common.GetNLS(user, "Gib den Namen ein, den der Slot für das aktuelle Ziel haben soll.", "Write in what name you want the slot for the current target to have."), false, 255, callback)

    user:requestInputDialog(dialog)

end



M.getTargets = targeting.getFriendlistTargets

local function getSlotLimit(user, spell)

    local baseSlot = 1

    local scaling = effectScaling.getEffectScaling(user, nil, spell)/2

    local level = user:getSkill(Character["spiritMagic"])

    local levelBonus = math.floor(level/25) --max 4 bonus slots from level

    local slots = baseSlot + levelBonus

    slots = math.min(10, slots*scaling) --At most 10 slots

    slots = math.max(baseSlot, slots) --In case of terrible scaling, at least 1 slot always

    return slots

end

M.getSlotLimit = getSlotLimit

local function storeHeptTaurTarget(user, spell, positionsAndTargets)

    local PEN = runes.checkSpellForRuneByName("PEN", spell)
    local HEPT = runes.checkSpellForRuneByName("HEPT", spell)
    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)

    if PEN and HEPT then
        if not _G.storedPenLevTargets then
            _G.storedPenLevTargets = {}
        end
        _G.storedPenLevTargets[user.id] = nil
    end

    local newTarget = positionsAndTargets.targets[1]

    if not newTarget or not isValidChar(newTarget) or newTarget:getType() ~= Character.player then
        return
    end

    if not (PEN and HEPT and TAUR) then
        return
    end

    local savedTargets = M.getTargets(user) --The list of any targets already saved

    local slotLimit = getSlotLimit(user, spell)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if index <= slotLimit then
            overWriteSlot(user, savedTargets, index, newTarget, slotLimit)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Gespeicherte Ziele","Stored Targets") , common.GetNLS(user,"Wähle einen Slot zum Überschreiben aus, um dein aktuelles Ziel für die zukünftige Verwendung von PEN-LEV-Magie zu speichern. Die gespeicherte Liste kann über dein Grimoire aufgerufen werden.","Select a slot to overwrite to store your current target in for future PEN LEV magic use. The stored list can be accessed via your grimoire.") , callback)

    for index, target in ipairs(savedTargets) do
        if index <= slotLimit then
            dialog:addOption(0, target.name)
        end
    end

    if #savedTargets < slotLimit then
        for i = 1,  slotLimit-#savedTargets do
            dialog:addOption(0, common.GetNLS(user, "Leerer Platz", "Empty Slot"))
        end
    end

    user:requestSelectionDialog(dialog)

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

        local thePosition, targetToTeach, startedInAttackMode = targeting.initPosition(user, spell)


        if not thePosition then --rarely happens if you try to cast immediately after an !fr, also happens if you cast a PEN LEV spell after expiry
            return
        end

        M[user.id].thePosition = thePosition
        M[user.id].targetToTeach = targetToTeach
        M[user.id].startedInAttackMode = startedInAttackMode

        common.TurnTo(user, M[user.id].thePosition)

        if not checksPassed(user, spell, element, M[user.id].thePosition, startedInAttackMode) then
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

        M[user.id].positionsAndTargets = targeting.getPositionsAndTargets(user, spell, false, false, M[user.id].startedInAttackMode, M[user.id].targetToTeach, M[user.id].thePosition)

        if not checksPassed(user, spell, element, M[user.id].thePosition, M[user.id].startedInAttackMode) then
            return
        end

        if not range.isTargetInRange(user, spell, element, M[user.id].thePosition) then
            user:inform(myTexts.range.german, myTexts.range.english)
            return
        end

        M[user.id].positionsAndTargets = targeting.addTargets(user, spell, M[user.id].positionsAndTargets)

        if not runes.checkSpellForRuneByName("BHONA", spell) then
            mana.removedUsedMana(user, spell, M[user.id].thePosition, M[user.id].startedInAttackMode)
            local castDuration = M[user.id].storedDuration
            skilling.increaseExperience(user, spell, castDuration, M[user.id].positionsAndTargets)
            castTime.resetTan(user)
            storeHeptTaurTarget(user, spell, M[user.id].positionsAndTargets)
            if JUS and ORL then
                diminishingReturns.applyOrl(user, M[user.id].thePosition, spell, level)
            end
            if (SUL and (RA or CUN)) or (JUS and MES) then
                delayedAttack.applyDelay(user, M[user.id].thePosition, spell, false, level, M[user.id].positionsAndTargets.startedInAttackMode)
            else
                delayedAttack.spellEffects(user, M[user.id].positionsAndTargets, spell, element, false, level, castDuration, M[user.id].thePosition)
            end

            local _, wand = checkForWand(user)

            if wand then
                shared.toolBreaks(user, wand, castDuration)
            end

            if not _G.storedPenLevTargets then
                _G.storedPenLevTargets = {}
            end
            _G.storedPenLevTargets[user.id] = nil

            if user.attackmode and runes.isSpellAutoCast(spell, wand) and checksPassed(user, spell, element, M[user.id].thePosition, M[user.id].startedInAttackMode) then
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
