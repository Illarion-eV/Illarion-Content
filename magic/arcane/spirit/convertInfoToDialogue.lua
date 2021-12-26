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
local gatherInfo = require("magic.arcane.spirit.gatherInfo")
local common = require("base.common")
local runes = require("magic.arcane.runes")
local attributes = require("magic.arcane.spirit.attributes")

local M = {}

M.informDialogueTexts = {

}

M.infoOptionsText = {
    {english = "Gender/race", german = "", identifier = "genderRace", rune = "Fhen"},
    {english = "Mana", german = "", identifier = "MP", rune = "Ira"},
    {english = "Stamina", german = "", identifier = "FP", rune = "Kah"},
    {english = "Location", german = "", identifier = "location", rune = "Mes"},
    {english = "Skill", german = "", identifier = "skill", rune = "Orl"},
    {english = "Magic Resistance", german = "", identifier = "MR", rune = "Pherc"},
    {english = "Attributes", german = "", identifier = "intelligence", rune = "Qwan"},
    {english = "Terrain type", german = "", identifier = "terrain", rune = "PEN"},
    {english = "Health", german = "", identifier = "HP", rune = "Sih"},
    {english = "Speed", german = "", identifier = "spd", rune = "Sul"},
    {english = "Item properties", german = "", identifier = "item", rune = "Anth"},
    {english = "Equipment", german = "", identifier = "equipment", rune = "Sav"}
    }

local function viewEquippedItem(informedTarget, selectedItem, information, spell)
    local germanTitle = selectedItem.name.german
    local englishTitle = selectedItem.name.english
    local germanText = selectedItem.text.german
    local englishText = selectedItem.text.english

    local callback = function(dialog)
        M.startDialogue(informedTarget, information, spell)
    end

    local dialog = MessageDialog(common.GetNLS(informedTarget, germanTitle, englishTitle), common.GetNLS(informedTarget, germanText, englishText), callback)
    informedTarget:requestMessageDialog(dialog)

end

local function viewEquipmentSelectionDialogue(informedTarget, information, selectedTarget, spell)
    local englishTitle
    local germanTitle
    local englishText
    local germanText

    for _, infoText in pairs(M.infoOptionsText) do
        if infoText.identifier == "equipment" then
            englishTitle = infoText.english
            germanTitle = infoText.german
        end
    end

    for _, target in pairs(information) do
        if tostring(target.target) == tostring(selectedTarget) then
            germanText = target.equipment.german
            englishText = target.equipment.english
        end
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for _, target in pairs(information) do

            if tostring(target.target) == tostring(selectedTarget) then

                for i = 1, #target.equipment.items do

                    if index == i then
                        viewEquippedItem(informedTarget, target.equipment.items[i], information, spell)
                        return
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(informedTarget, germanTitle, englishTitle), common.GetNLS(informedTarget, germanText, englishText), callback)

    for _, target in pairs(information) do
        if tostring(target.target) == tostring(selectedTarget) then
            for i = 1, #target.equipment.items do
                local germanOption = target.equipment.items[i].name.german
                local englishOption = target.equipment.items[i].name.english
                dialog:addOption(0, common.GetNLS(informedTarget, germanOption, englishOption))
            end

            break
        end
    end

    informedTarget:requestSelectionDialog(dialog)

end

local function viewAttributteMessageDialogue(informedTarget, information, selectedTarget, spell)
    local englishTitle
    local germanTitle

    for _, infoText in pairs(M.infoOptionsText) do
        if infoText.identifier == "intelligence" then
            englishTitle = infoText.english
            germanTitle = infoText.german
        end
    end

    local germanText = ""
    local englishText = ""
    local statText = attributes.statText

    for _, target in pairs(information) do
        if tostring(target.target) == tostring(selectedTarget) then
            for _, stat in ipairs(statText) do
                englishText = englishText.."\n"..target[stat.stat].english
                germanText = germanText.."\n"..target[stat.stat].german
            end
        end
    end


    local callback = function(dialog)
        M.startDialogue(informedTarget, information, spell)
    end

    local dialog = MessageDialog(common.GetNLS(informedTarget, germanTitle, englishTitle), common.GetNLS(informedTarget, germanText, englishText), callback)
    informedTarget:requestMessageDialog(dialog)
end


local function viewMessageDialogue(informedTarget, information, selectedTarget, identifier, spell)

    local Anth = runes.checkSpellForRuneByName("Anth", spell)
    local englishTitle
    local germanTitle
    local englishText
    local germanText

    if identifier == "equipment" then
        if Anth then
            viewEquipmentSelectionDialogue(informedTarget, information, selectedTarget, spell)
            return
        end
    end

    if identifier == "intelligence" then
        viewAttributteMessageDialogue(informedTarget, information, selectedTarget, spell)
        return
    end

    for _, infoText in pairs(M.infoOptionsText) do
        if infoText.identifier == identifier then
            englishTitle = infoText.english
            germanTitle = infoText.german
        end
    end

    for _, target in pairs(information) do
        if tostring(selectedTarget) == tostring(target.target) then
            englishText = target[identifier].english
            germanText = target[identifier].german
        end
    end

    local callback = function(dialog)
        M.startDialogue(informedTarget, information, spell)
    end

    local dialog = MessageDialog(common.GetNLS(informedTarget, germanTitle, englishTitle), common.GetNLS(informedTarget, germanText, englishText), callback)
    informedTarget:requestMessageDialog(dialog)

end

M.chooseInfoTexts = {
title = {english = "Target information", german = ""},
text = {english = "Choose what information of the target you want to view.", german = ""}
}

local function chooseWhatInfoToView(informedTarget, information, selectedTarget, spell)

    local infoOptionsText = M.infoOptionsText
    local chooseInfoTexts = M.chooseInfoTexts

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for _, target in pairs(information) do
            if tostring(target.target) == tostring(selectedTarget) then
                local skippedTargets = 0
                for i = 1, #infoOptionsText do
                    if target[infoOptionsText[i].identifier] then
                        if index == i-skippedTargets then
                            viewMessageDialogue(informedTarget, information, selectedTarget, infoOptionsText[i].identifier, spell)
                        end
                    else
                        skippedTargets = skippedTargets+1
                    end
                end
                break
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(informedTarget, chooseInfoTexts.title.german, chooseInfoTexts.title.english), common.GetNLS(informedTarget, chooseInfoTexts.text.german, chooseInfoTexts.text.english), callback)
    for _, target in pairs(information) do
        if tostring(target.target) == tostring(selectedTarget) then
            for _, infoText in pairs(infoOptionsText) do
                if target[infoText.identifier] then
                    dialog:addOption(0,common.GetNLS(informedTarget, infoText.german, infoText.english))
                end
            end
            break
        end
    end

    informedTarget:requestSelectionDialog(dialog)

end

M.targetSelectionList = {
    title = {english = "Target Selection", german = ""},
    text1 = {english = "Select which target you want to send the information to.", german = ""},
    text2 = {english = "Select which target you want to view the information of.", german = ""},
    target = {english = "Target ", german = ""}
}

M.types = {
    {english = "creature", german = ""},
    {english = "item", german = ""},
    {english = "position", german = ""},
    {english = "player", german = ""}
}

local function getGermanType(type)
    for _, currentType in pairs(M.types) do
        if type == currentType.english then
            return currentType.german
        end
    end
end

function M.startDialogue(informedTarget, information, spell)
    local targetSelectionList = M.targetSelectionList

    if #information == 1 then
        chooseWhatInfoToView(informedTarget, information, information[1].target, spell)
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #information do
            if index == i then
                chooseWhatInfoToView(informedTarget, information, information[i].target, spell)
                return
            end
        end
    end

    local dialog =  SelectionDialog(common.GetNLS(informedTarget, targetSelectionList.title.german, targetSelectionList.title.english), common.GetNLS(informedTarget, targetSelectionList.text2.german, targetSelectionList.text2.english), callback)

    for i = 1, #information do
        local englishType = information[i].type
        local germanType = getGermanType(englishType)
        dialog:addOption(0, common.GetNLS(informedTarget,targetSelectionList.target.german..i..": "..germanType, targetSelectionList.target.english..i..": "..englishType ))
    end

    informedTarget:requestSelectionDialog(dialog)

end

local function getTargetFromList(user, information, spell)
    local targetSelectionList = M.targetSelectionList
    local range = 7
    local nearbyPlayers = world:getCharactersInRangeOf(user.pos, range)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1, #nearbyPlayers do
            if index == i then
                M.startDialogue(nearbyPlayers[i], information, spell)
                return
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, targetSelectionList.title.german, targetSelectionList.title.english), common.GetNLS(user, targetSelectionList.text1.german, targetSelectionList.text1.english), callback)

    for i = 1, #nearbyPlayers do
        dialog:addOption(0,nearbyPlayers[i].name)
    end

    user:requestSelectionDialog(dialog)
end

function M.getDialogue(user, targets, spell, fakeInfo)
    local information = gatherInfo.invoke(user, targets, spell)

    if fakeInfo then
        information = fakeInfo
    end

    if user then --send to self
        M.startDialogue(user, information, spell)
    else
        getTargetFromList(user, information, spell)
    end
end

return M
