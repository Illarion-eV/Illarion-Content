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
local runes = require("magic.arcane.runes")
local magic = require("base.magic")


local M = {}

local cooldown =  604800*2 --604800 is one week in seconds

local function getRuneToTeach(spell)

    for index, rune in pairs(runes.runes) do

        if rune.name ~= "BHONA" and runes.checkSpellForRune(rune.id, spell) then
            return rune.id
        end

        if index == #runes.runes then
            return 6 -- The ID for BHONA. When you only cast BHONA, it will try to teach the other person BHONA.
        end
    end
end

function M.getTargetsMagicLevels(target, rune)
    local skillNames = {"fireMagic", "spiritMagic", "windMagic","earthMagic","waterMagic"}
    local targetLevels = {}
    local magicLevel = 0
    for _, skill in pairs(skillNames) do
        local targetLevel= target:getSkill(Character[skill])
        if targetLevel then
            targetLevels[#targetLevels+1] = targetLevel
        end
    end
    if rune == 6 then
        for _, level in pairs(targetLevels) do
            magicLevel = magicLevel + level
        end
        magicLevel = magicLevel/#skillNames
    else
        for _, level in pairs(targetLevels) do
            if level > magicLevel then
                magicLevel = level
            end
        end
    end
    return magicLevel
end

function M.levelRequirementNotMet(target, runeToTeach)
    local levelReq = runes.getLevelRequirementOfRune(runeToTeach)
    local targetLevel = M.getTargetsMagicLevels(target, runeToTeach)
    if targetLevel >= levelReq then
        return false
    end
    return true
end

function M.notEnoughTimeHasPassed(target)
    local quests = {174, 175}
    local time
    for _, quest in pairs(quests) do
        local questTime = target:getQuestProgress(quest)

        if not time or questTime < time then
            time = questTime -- We get the one that will expire sooner
        end

        if questTime == 0 then
            return false
        end
    end
    return true, time
end

function M.statRequirementNotMet(target, runeToTeach)
    local statReq = runes.getStatRequirementOfRune(runeToTeach)
    local targetStatTotal = target:increaseAttrib("willpower", 0) + target:increaseAttrib("essence", 0) + target:increaseAttrib("intelligence", 0)

    if tonumber(targetStatTotal) >= tonumber(statReq) then
        return false
    end

    return true
end

function M.notAMage(target)
    if target:getMagicType() == 0 then
        return false
    end
return true
end

local function reachedTeachingCapacity(user)
    local quests = {176, 177, 178, 179}
    for _, quest in pairs(quests) do
        local time = user:getQuestProgress(quest)
        if time == 0 then
            return false
        end
    end
return true
end

function M.checkForExpiredCooldowns(target)
    local time = tonumber(world:getTime("unix"))
    local quests = {174, 175, 176, 177, 178, 179}
    for _, quest in pairs(quests) do
        local setTime = target:getQuestProgress(quest)
        if time >= setTime then
            target:setQuestProgress(quest, 0)
        end
    end
end

function M.setLearningCooldown(target)
    local time = tonumber(world:getTime("unix"))
    local timeWithCooldown = time+cooldown
    local learnedTime1 = target:getQuestProgress(174)
    local learnedTime2 = target:getQuestProgress(175)
    if learnedTime1 == 0 then
        target:setQuestProgress(174, timeWithCooldown)
    elseif learnedTime2 == 0 then
        target:setQuestProgress(175, timeWithCooldown)
    else
        debug("This shouldn't happen.")
    end
end

local function setTeachingCooldown(user)
    local time = tonumber(world:getTime("unix"))
    local timeWithCooldown = time+cooldown
    local learnedTime1 = user:getQuestProgress(176)
    local learnedTime2 = user:getQuestProgress(177)
    local learnedTime3 = user:getQuestProgress(178)
    local learnedTime4 = user:getQuestProgress(179)
    if learnedTime1 == 0 then
        user:setQuestProgress(176, timeWithCooldown)
    elseif learnedTime2 == 0 then
        user:setQuestProgress(177, timeWithCooldown)
    elseif learnedTime3 == 0 then
        user:setQuestProgress(178, timeWithCooldown)
    elseif learnedTime4 == 0 then
        user:setQuestProgress(179, timeWithCooldown)
    else
        debug("This shouldn't happen.")
    end
end

local myTexts = {
    knows = {english = "Target already knows that rune.", german = "Dein Ziel kennt diese Rune bereits."},
    level = {english = "Target is not skilled enough at magic to learn this rune yet.", german = "Dein Ziel versteht noch nicht genug von Magie um diese Rune lernen zu können. "},
    studentCooldown = {english = "Not enough time has passed yet since the last time the target was taught how to use a magic rune.", german = "Es verging noch nicht genug Zeit seit dein Ziel die letzte Rune gelernt hat."},
    teacherCooldown = {english = "You've been teaching too many people runes recently.", german = "Du hast in letzter Zeit zu vielen Personen Runen gelehrt."},
    stats = {english = "The target does not have the mental faculties to learn this rune.", german = "Dein Ziel besitzt nicht die geistige Leistungsfähigkeit um diese Rune zu lernen."},
    mage = {english = "The target is not attuned to the ways of magic.", german = "Dein Ziel ist nicht mit den Wegen der Magie bewandert."},
    learned = {english = "You have learned how to use the rune ", german = "Du lernst die Rune "}, --followed by the name of the rune
    taught = {english = "You have taught the target how to use the rune ", german = "Du lehrst die Rune "}, --followed by the name of the rune
    mana = {english = "Not enough mana.", german = "Nicht genug Mana."},
    target = {english = "You need a target.", german = "Du brauchst ein Ziel."},
    player = {english = "Target must be a player.", german = "Dein Ziel muss ein Spieler sein."}
}

local function teachingCheck(user, target, spell)
    local manaCost = 5000
    local runeToTeach = getRuneToTeach(spell)
    M.checkForExpiredCooldowns(user)
    M.checkForExpiredCooldowns(target)
        if  magic.hasSufficientMana(user,manaCost) then
            if runes.checkIfLearnedRune(target,"", runeToTeach, "isQuest") then
                user:inform(myTexts.knows.german, myTexts.knows.english)
                return
            end
            if M.levelRequirementNotMet(target, runeToTeach) then
                user:inform(myTexts.level.german, myTexts.level.english)
                return
            end
            if M.notEnoughTimeHasPassed(target) then
                user:inform(myTexts.studentCooldown.german, myTexts.studentCooldown.english)
                return
            end
            if M.statRequirementNotMet(target, runeToTeach) then
                user:inform(myTexts.stats.german, myTexts.stats.english)
                return
            end
            if M.notAMage(target) then
                user:inform(myTexts.mage.german, myTexts.mage.english)
                return
            end
            if reachedTeachingCapacity(user) then
                user:inform(myTexts.teacherCooldown.german, myTexts.teacherCooldown.english)
                return
            end
            user:increaseAttrib("mana", -manaCost)
            world:gfx(41,target.pos)
            world:makeSound(13,target.pos)
            runes.learnRune(target,"", runeToTeach, "isQuest")
            target:inform(myTexts.learned.german..runes.runeNumberToName(runeToTeach)..".", myTexts.learned.english..runes.runeNumberToName(runeToTeach)..".")
            user:inform(myTexts.taught.german..runes.runeNumberToName(runeToTeach)..".", myTexts.taught.english..runes.runeNumberToName(runeToTeach)..".")
            M.setLearningCooldown(target)
            setTeachingCooldown(user)
        else
            user:inform(myTexts.mana.german, myTexts.mana.english)
        end
    return
end

function M.teachRune(user, targets, spell)
local target = targets.targetToTeach
    if not target then
        user:inform(myTexts.target.german, myTexts.target.english)
        return
    else
        if target:getType() == Character.monster or target:getType() == Character.npc then
            user:inform(myTexts.player.german, myTexts.player.english)
            return
        end
        teachingCheck(user, target, spell)
    end

end



return M
