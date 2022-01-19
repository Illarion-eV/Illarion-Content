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
local teaching = require("magic.arcane.teaching")
local common = require("base.common")
local lookat = require("base.lookat")
local texts = require("magic.arcane.base.texts")
local myTexts = texts.runeHintsBookTexts

local M = {}



local function knowAllRunes(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts.knowAll.german, myTexts.knowAll.english), callback)

    user:requestMessageDialog(dialog)

end

local function tooAdvanced(user)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts.requirementNotMet.german, myTexts.requirementNotMet.english), callback)

    user:requestMessageDialog(dialog)

end

local function checkIfKnowAllRunes(user)

    for _, rune in pairs(runes.Runes) do
        if not runes.checkIfLearnedRune(user, false, rune[1], "isQuest") then
            return false
        end
    end

    return true

end

local function listOfRunes(user)

    local list = {}

    for _, rune in pairs(runes.Runes) do
        local statsOk = false
        local statReq = runes.getStatRequirementOfRune(rune[1])
        local targetStatTotal = user:increaseAttrib("willpower", 0) + user:increaseAttrib("essence", 0) + user:increaseAttrib("intelligence", 0)

        if tonumber(targetStatTotal) >= tonumber(statReq) then
            statsOk = true
        end

        local skillOk = false
        local levelReq = runes.getLevelRequirementOfRune(rune[1])
        local targetLevel = teaching.getTargetsMagicLevels(user, rune[1])

        if targetLevel >= levelReq then
            skillOk = true
        end

        local notLearned = false
        if not runes.checkIfLearnedRune(user, false, rune[1], "isQuest") then
            notLearned = true
        end

        if notLearned and skillOk and statsOk then
            list[#list+1] = rune[2]
        end
    end

    return list

end

local function checkIfTooAdvanced(user)

    local runeList = listOfRunes(user)

    if #runeList > 0 then
        return false
    else
        return true
    end

end

local function runeHint(user, runeName)

    local callback = function(dialog)
    end

    local dialog = MessageDialog(common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english), common.GetNLS(user, myTexts[runeName].hint.german, myTexts[runeName].hint.english), callback)

    if runeName == "BHONA" then
        if user:getQuestProgress(244) == 0 then
            user:setQuestProgress(244, 1)
        end
    end
    user:requestMessageDialog(dialog)

end

local function cooldownMessage(user)

    local message = false

    teaching.checkForExpiredCooldowns(user)

    if teaching.notEnoughTimeHasPassed(user) then
        message = true
    end


    if message then
        user:inform(myTexts.unwise.german, myTexts.unwise.english)
    end

end

local function selectRune(user)

    local runeList = listOfRunes(user)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        for i = 1, #runeList do
            if index == i then
                runeHint(user, runeList[i])
                return
            end
        end
    end
    local dialog = SelectionDialog(
        common.GetNLS(user,
            myTexts.bookName.german,
            myTexts.bookName.english),
        common.GetNLS(user,
            myTexts.selectRune.german,
            myTexts.selectRune.english),
        callback)

    for i = 1, #runeList do
        dialog:addOption(0, runeList[i])
    end

    user:requestSelectionDialog(dialog)

end

local bookPosition = position(655, 315, 0)

function M.UseItem(user, sourceItem)

    if sourceItem.pos ~= bookPosition then
        return
    end

    if checkIfKnowAllRunes(user) then
        knowAllRunes(user)
        return
    end

    if checkIfTooAdvanced(user) then
        tooAdvanced(user)
        return
    end

    cooldownMessage(user)

    selectRune(user)

end

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)
    if item.pos == bookPosition then
        lookAt.name = common.GetNLS(user, myTexts.bookName.german, myTexts.bookName.english)
        lookAt.description = common.GetNLS(user, myTexts.bookDescription.german, myTexts.bookDescription.english)
    end

    return lookAt
end

return M
