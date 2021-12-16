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
local M = {}

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

local function levelRequirementNotMet(target, spell)
    return false --temporarily just bypass level requirement
end

local function notEnoughTimeHasPassed(target, spell)
    return false --temporarily just bypass teaching cooldown
end

local function statRequirementNotMet(target, spell)
    return false --temporarily bypass stat requirement
end

local function notAMage(target)
    return false --temporarily bypass mage check
end

local function reachedTeachingCapacity(user)
    return false --temporarily bypass teaching capacity
end

local function setLearningCooldown(target)
    return --awaiting implementation of learning cooldown
end

local function setTeachingCooldown(user)
    return --awaiting implemenation of teaching cooldown
end

local function teachingCheck(user, target, spell)
    local manaCost = 5000
    local runeToTeach = getRuneToTeach(spell)
        if  magic.hasSufficientMana(user,manaCost) then
            if runes.checkIfLearnedRune(target,"", runeToTeach, "isQuest") then
                user:inform("","Target already knows that rune.")
                return
            end
            if levelRequirementNotMet(target, spell) then
                user:inform("", "Target is not skilled enough at magic to learn this rune yet.")
                return
            end
            if notEnoughTimeHasPassed(target, spell) then
                user:inform("", "Not enough time has passed yet since the last time the target was taught how to use a magic rune.")
                return
            end
            if statRequirementNotMet(target, spell) then
                user:inform("", "The target does not have the mental faculties to learn this rune.")
                return
            end
            if notAMage(target) then
                user:inform("", "The target is not attuned to the ways of magic.")
                return
            end
            if reachedTeachingCapacity(user) then
                user:inform("", "You've been teaching too many people runes recently.")
                return
            end
            user:increaseAttrib("mana", -manaCost)
            world:gfx(41,target.pos)
            world:makeSound(13,target.pos)
            runes.learnRune(target,"", runeToTeach, "isQuest")
            target:inform("","You have learned how to use the rune "..runes.Runes[runeToTeach][2]..".")
            user:inform("","You have taught the target how to use the rune "..runes.Runes[runeToTeach][2]..".")
            setLearningCooldown(target)
            setTeachingCooldown(user)
            incantation.speakIncantation(user, spell)
        else
            user:inform("","Not enough mana.")
        end
    return
end

function M.teachRune(user, targets, spell)
local targetExists = false
    for _, target in pairs(targets.targets) do
        if target:getType() == Character.monster or target:getType() == Character.npc then
            user:inform("","Target must be a player.")
            return
        end
        teachingCheck(user, target, spell)
        targetExists = true
    end
    if not targetExists then
        user:inform("","You need a target.")
        return
    end
end



return M
