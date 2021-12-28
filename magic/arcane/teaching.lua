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
local incantation = require("magic.arcane.incantation")
local texts = require("magic.arcane.base.texts")

local M = {}

local cooldown =  604800 --604800 is one week in seconds

local function getRuneToTeach(spell)
    for i = 1, #runes.Runes do
        if i ~= 6 then --no point checking for Bhona
            if runes.checkSpellForRune(i, spell) then
                return i
            end
        end
        if i == #runes.Runes then
            return 6
        end
    end
end

local function getTargetsMagicLevels(target, rune)
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

local function levelRequirementNotMet(target, runeToTeach)
    local levelReq = runes.getLevelRequirementOfRune(runeToTeach)
    local targetLevel = getTargetsMagicLevels(target, runeToTeach)
    if targetLevel >= levelReq then
        return false
    end
    return true
end

local function notEnoughTimeHasPassed(target)
    local quests = {7002, 7003}
    for _, quest in pairs(quests) do
        local time = target:getQuestProgress(quest)
        if time == 0 then
            return false
        end
    end
    return true
end

local function statRequirementNotMet(target, runeToTeach)
    local statReq = runes.getStatRequirementOfRune(runeToTeach)
    local targetStatTotal = target:increaseAttrib("willpower", 0) + target:increaseAttrib("essence", 0) + target:increaseAttrib("intelligence", 0)

    if tonumber(targetStatTotal) >= tonumber(statReq) then
        return false
    end

    return true
end

local function notAMage(target)
    if target:getMagicType() == 0 then
        return false
    end
return true
end

local function reachedTeachingCapacity(user)
    local quests = {7004, 7005, 7006, 7007}
    for _, quest in pairs(quests) do
        local time = user:getQuestProgress(quest)
        if time == 0 then
            return false
        end
    end
return true
end

local function checkForExpiredCooldowns(target)
    local time = tonumber(world:getTime("unix"))
    local quests = {7002, 7003, 7004, 7005, 7006, 7007}
    for _, quest in pairs(quests) do
        local setTime = target:getQuestProgress(quest)
        if time >= setTime then
            target:setQuestProgress(quest, 0)
        end
    end
end

local function setLearningCooldown(target)
    local time = tonumber(world:getTime("unix"))
    local timeWithCooldown = time+cooldown
    local learnedTime1 = target:getQuestProgress(7002)
    local learnedTime2 = target:getQuestProgress(7003)
    if learnedTime1 == 0 then
        target:setQuestProgress(7002, timeWithCooldown)
    elseif learnedTime2 == 0 then
        target:setQuestProgress(7003, timeWithCooldown)
    else
        debug("This shouldn't happen.")
    end
end

local function setTeachingCooldown(user)
    local time = tonumber(world:getTime("unix"))
    local timeWithCooldown = time+cooldown
    local learnedTime1 = user:getQuestProgress(7004)
    local learnedTime2 = user:getQuestProgress(7005)
    local learnedTime3 = user:getQuestProgress(7006)
    local learnedTime4 = user:getQuestProgress(7007)
    if learnedTime1 == 0 then
        user:setQuestProgress(7004, timeWithCooldown)
    elseif learnedTime2 == 0 then
        user:setQuestProgress(7005, timeWithCooldown)
    elseif learnedTime3 == 0 then
        user:setQuestProgress(7006, timeWithCooldown)
    elseif learnedTime4 == 0 then
        user:setQuestProgress(7007, timeWithCooldown)
    else
        debug("This shouldn't happen.")
    end
end

local myTexts = texts.teachingTexts

local function teachingCheck(user, target, spell)
    local manaCost = 5000
    local runeToTeach = getRuneToTeach(spell)
    checkForExpiredCooldowns(user)
    checkForExpiredCooldowns(target)
        if  magic.hasSufficientMana(user,manaCost) then
            if runes.checkIfLearnedRune(target,"", runeToTeach, "isQuest") then
                user:inform(myTexts.knows.german, myTexts.knows.english)
                return
            end
            if levelRequirementNotMet(target, runeToTeach) then
                user:inform(myTexts.level.german, myTexts.level.english)
                return
            end
            if notEnoughTimeHasPassed(target) then
                user:inform(myTexts.studentCooldown.german, myTexts.studentCooldown.english)
                return
            end
            if statRequirementNotMet(target, runeToTeach) then
                user:inform(myTexts.stats.german, myTexts.stats.english)
                return
            end
            if notAMage(target) then
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
            target:inform(myTexts.learned.german..runes.Runes[runeToTeach][2]..".", myTexts.learned.english..runes.Runes[runeToTeach][2]..".")
            user:inform(myTexts.taught.german..runes.Runes[runeToTeach][2]..".", myTexts.taught.english..runes.Runes[runeToTeach][2]..".")
            setLearningCooldown(target)
            setTeachingCooldown(user)
            incantation.speakIncantation(user, spell)
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
