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

local common = require("base.common")
local lookat = require("base.lookat")
local texts = require("magic.arcane.base.texts")
local teaching = require("magic.arcane.teaching")
local runes = require("magic.arcane.runes")

local M = {}


local function getRune(item)
    for _, rune in pairs(texts.runeHintsBookTexts) do
        if rune.location then
            if rune.location == item.pos then
                return rune
            end
        end
    end
    return false
end

local function learnRune(user, rune)

    teaching.checkForExpiredCooldowns(user)

    local runeNumber = runes.runeNameToNumber(rune)
    local levelCheck = teaching.levelRequirementNotMet(user, runeNumber)
    local statCheck = teaching.statRequirementNotMet(user, runeNumber)
    local notMage = teaching.notAMage(user)
    local knowsRune = runes.checkIfLearnedRune(user, false, runeNumber, "isQuest")

    if notMage then
        user:inform(texts.runeHintsBookTexts.notMage.german, texts.runeHintsBookTexts.notMage.english)
        return
    end

    if knowsRune then
        user:inform(texts.runeHintsBookTexts.alreadyKnows.german, texts.runeHintsBookTexts.alreadyKnows.english)
        return
    end

    if levelCheck or statCheck then
        user:inform(texts.runeHintsBookTexts.notMetCriteria.german, texts.runeHintsBookTexts.notMetCriteria.english)
        return
    end

    if teaching.notEnoughTimeHasPassed(user) then
        user:inform(texts.runeHintsBookTexts.cooldown.german, texts.runeHintsBookTexts.cooldown.english)
        return
    end
    runes.learnRune(user,"", runeNumber, "isQuest")
    teaching.setLearningCooldown(user)
    user:inform(texts.runeHintsBookTexts.learned.german..rune, texts.runeHintsBookTexts.learned.english..rune)
end

local function lightSphere(user, item, lit)
    local newItemId

    if lit then
        newItemId = 3501
    else
        newItemId = 3499
    end
    world:erase(item, item.number)
    world:createItemFromId(newItemId, 1, item.pos, true, 999, {})
end

local function checkIfCriteriaMet(user, rune)

    local retVal = false

    if rune == "RA" then --Simple puzzle, you only have to find the sphere to activate it
        retVal = true
    end

    if retVal then
        user:inform(texts.runeHintsBookTexts.activated.german, texts.runeHintsBookTexts.activated.english)
    end

    return retVal
end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            lookAt.name= common.GetNLS(user, rune.name.german , rune.name.english )
            lookAt.description = common.GetNLS(user, rune.description.german, rune.description.english)
        else
            lookAt.name = common.GetNLS(user, texts.runeHintsBookTexts.unlitSphere.german, texts.runeHintsBookTexts.unlitSphere.english)
        end
    end


    return lookAt
end

function M.UseItem(user, item)

    local rune = getRune(item)

    if rune then
        if item.id == 3501 then
            learnRune(user, rune.rune)
            lightSphere(user, item, false)
        elseif item.id == 3499 then
            if checkIfCriteriaMet(user, rune.rune) then
                lightSphere(user, item, true)
            else
                user:inform(texts.runeHintsBookTexts.unsolved.german, texts.runeHintsBookTexts.unsolved.english)
            end
        end
    end

end

return M
