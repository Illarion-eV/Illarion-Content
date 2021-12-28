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
local common = require("base.common")
local gatherInfo = require("magic.arcane.spirit.gatherInfo")
local convertInfoToDialogue = require("magic.arcane.spirit.convertInfoToDialogue")
local lookat = require("base.lookat")
local playerlookat = require("server.playerlookat")
local texts = require("magic.arcane.base.texts")
local fakeItems = require("magic.arcane.spirit.items")
local information = {}

local M = {}

M.fakeEquipmentText = texts.fakeEquipmentText


local function fakeEquipment(user, targets, myTarget, spell)
    --selection dialogue to pick the qual and durability of the items to show the text that is in playerlookat and equipment lua
    local germanText
    local englishText
    local qual
    local dura
    local gender
        for _, target in pairs(information[user.name]) do
            if tostring(target.target) == tostring(myTarget) then
                gender = target.gender
            end
        end
    local qualityTextsGerman = playerlookat.ClQQualText[0]
    local qualityTextsEnglish = playerlookat.ClQQualText[1]
    local qualitySuffixGerman = playerlookat.clQText[0]
    local qualitySuffixEnglish = playerlookat.clQText[1]
    local durabilityTextsGerman = playerlookat.ClDuraText[0]
    local durabilityTextsEnglish = playerlookat.ClDuraText[1]
    local durabilityPrefix1German = playerlookat.sexText[0][gender]
    local durabilityPrefix1English = playerlookat.sexText[1][gender]
    local durabilityPrefix2German = playerlookat.clText[0]
    local durabilityPrefix2English = playerlookat.clText[1]

    local fakeEquipmentText = M.fakeEquipmentText
    local callbackDurability = function(durabilityDialog)
        if not durabilityDialog:getSuccess() then
            return
        end

        local index = durabilityDialog:getSelectedIndex()
        for i = 0,9  do
            if index == i then
                dura = (i*10)
                for _, target in pairs(information[user.name]) do
                    if tostring(target.target) == tostring(myTarget) then
                        for i2 = 1, #playerlookat.ClQQualText[0] do
                            if index == i2 then
                                germanText = playerlookat.getClothesText(qual, dura, Player.german, gender)
                                englishText = playerlookat.getClothesText(qual, dura, Player.english, gender)
                                target.equipment.english = englishText
                                target.equipment.german = germanText
                                M.fakeDialogue(user, targets, spell)
                                break
                            end
                        end
                        break
                    end
                end
                break
            end
        end
    end

    local durabilityDialog = SelectionDialog(common.GetNLS(user,fakeEquipmentText.durability.name.german,fakeEquipmentText.durability.name.english), common.GetNLS(user,fakeEquipmentText.durability.text.german,fakeEquipmentText.durability.text.english), callbackDurability)

    for i = 0, 9 do
        local optionText = common.GetNLS(user, durabilityPrefix1German..durabilityPrefix2German..durabilityTextsGerman[10-i], durabilityPrefix1English..durabilityPrefix2English..durabilityTextsEnglish[10-i])
        durabilityDialog:addOption(0, optionText)
    end

    local callbackQuality = function(qualityDialog)
        if not qualityDialog:getSuccess() then
            return
        end
        local index = qualityDialog:getSelectedIndex()
        for i = 0,9 do
            if index == i then
                qual = i
                user:requestSelectionDialog(durabilityDialog)
            end
        end
    end

    local qualityDialog = SelectionDialog(common.GetNLS(user,fakeEquipmentText.quality.name.german,fakeEquipmentText.quality.name.english), common.GetNLS(user,fakeEquipmentText.quality.text.german,fakeEquipmentText.quality.text.english), callbackQuality)

    for i = 0, 9 do
        local optionText = common.GetNLS(user, qualityTextsGerman[10-i]..qualitySuffixGerman, qualityTextsEnglish[10-i]..qualitySuffixEnglish)
        qualityDialog:addOption(0, optionText)
    end

    user:requestSelectionDialog(qualityDialog)

end

local function editEquippedItem(user, targets, myTarget, spell, theItem)
    local fakeItemTexts = M.fakeItemTexts
    local GenericQualDe = lookat.GenericQualDe
    local GenericDuraDe = lookat.GenericDuraDe[1]
    local GenericQualEn = lookat.GenericQualEn
    local GenericDuraEn = lookat.GenericDuraEn[1]
    local durability
    local quality
    local weight
    local _
        local inputCallback = function (inputDialog)
            if (not inputDialog:getSuccess()) then
                return
            end
            local input = inputDialog:getInput()
            if (string.find(input,"(%d+)")~=nil) then
                _, _, weight = string.find(input,"(%d+)")
                local englishText, germanText = fakeItems.individualItemText(theItem, durability, quality, weight)
                for _, target in pairs(information[user.name]) do
                    if tostring(target.target) == tostring(myTarget) then
                        for _, currentItem in pairs(target.equipment.items) do
                            if tostring(currentItem.target) == tostring(theItem) then
                                currentItem.text.english = englishText
                                currentItem.text.german = germanText
                                M.fakeDialogue(user, targets, spell)
                            end
                        end
                    end
                end
            else
                user:inform("Input must be a number.")
            end
        end

    local durabilityCallback = function (durabilityDialog)
        if not durabilityDialog:getSuccess() then
            return
        end
        local index = durabilityDialog:getSelectedIndex() +1
        for i = 1, #GenericDuraEn do
            if index == i then
                durability = i
                user:requestInputDialog(InputDialog(common.GetNLS(user, fakeItemTexts.weight.title.german, fakeItemTexts.weight.title.english),common.GetNLS(user,fakeItemTexts.weight.text.german,fakeItemTexts.weight.text.english),false, 255, inputCallback))
                break
            end
        end
    end

    local durabilityDialog = SelectionDialog(common.GetNLS(user, fakeItemTexts.durability.title.german, fakeItemTexts.durability.title.english), common.GetNLS(user, fakeItemTexts.durability.text.german, fakeItemTexts.durability.text.english), durabilityCallback)
    for i = 1, #GenericDuraEn do
        durabilityDialog:addOption(0, common.GetNLS(user, GenericDuraDe[i], GenericDuraEn[i]))
    end
    local qualityCallback = function (qualityDialog)
        if not qualityDialog:getSuccess() then
            return
        end
        local index = qualityDialog:getSelectedIndex() +1
        for i = 1, #GenericQualEn do
            if index == i then
                quality = i
                user:requestSelectionDialog(durabilityDialog)
                break
            end
        end
    end
    local qualityDialog = SelectionDialog(common.GetNLS(user, fakeItemTexts.quality.title.german, fakeItemTexts.quality.title.english), common.GetNLS(user, fakeItemTexts.quality.text.german, fakeItemTexts.quality.text.english), qualityCallback)
    for i = 1, #GenericQualEn do
        qualityDialog:addOption(0, common.GetNLS(user, GenericQualDe[i], GenericQualEn[i]))
    end
    user:requestSelectionDialog(qualityDialog)

end

local function fakeEquippedItems(user, targets, myTarget, spell)
    local info = information[user.name]
    local equippedItemList
        for _, target in pairs(info) do
            if tostring(target.target) == tostring(myTarget) then
                equippedItemList = target.equipment.items
            end
        end
    if not equippedItemList then
        return
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #equippedItemList do
            if index == i then
                editEquippedItem(user, targets, myTarget, spell, equippedItemList[i].target)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Target Selection"), common.GetNLS(user,"","Select which target you want to edit the information of."), callback)
    for i = 1, #equippedItemList do
        dialog:addOption(0, common.GetNLS(user, equippedItemList[i].name.german, equippedItemList[i].name.english))
    end
    user:requestSelectionDialog(dialog)
end

local function fakeTerrain(user, targets, myTarget, spell)

    local tilePrefix = texts.tilePrefix
    local tileDescriptions = texts.tileDescriptions
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
         for i = 1, #tileDescriptions do
                if index == i then
                    local tileEn = tileDescriptions[i].english
                    local tileDe = tileDescriptions[i].german
                    local englishText = tilePrefix.english.."\n"..tileEn
                    local germanText = tilePrefix.german.."\n"..tileDe
                    for _, target in pairs(information[user.name]) do
                        if tostring(target.target) == tostring(myTarget) then
                            target.terrain = {}
                            target.terrain.german = germanText
                            target.terrain.english = englishText
                            M.fakeDialogue(user, targets, spell)
                        end
                    end
                end
            end
        end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what type of tile you want to fake."), callback)
        for i = 1, #tileDescriptions do
            dialog:addOption(0, tileDescriptions[i].english)
        end
    user:requestSelectionDialog(dialog)
end

local function fakeLocation(user, targets, myTarget, spell)
    local directionsList = texts.directionsList
    local locationTexts = texts.locationTexts
    local directionEn
    local directionDe
    local distance
    local _

        local inputCallback = function (inputDialog)
            if (not inputDialog:getSuccess()) then
                return
            end
            local input = inputDialog:getInput()
            if (string.find(input,"(%d+)")~=nil) then
                _, _, distance = string.find(input,"(%d+)")
                local germanText = locationTexts[1].german..distance..locationTexts[2].german..directionDe
                local englishText = locationTexts[1].english..distance..locationTexts[2].english..directionEn
                for _, tar in pairs(information[user.name]) do
                    if tostring(tar.target) == tostring(myTarget) then
                        tar.location = {}
                        tar.location.english = englishText
                        tar.location.german = germanText
                        M.fakeDialogue(user, targets, spell)
                        break
                    end
                end
            else
                user:inform("Input must be a number.")
            end
        end

        local callback = function(dialog)
            if not dialog:getSuccess() then
                return
            end
            local index = dialog:getSelectedIndex() +1
            for i = 1, #directionsList do
                if index == i then
                    directionEn = directionsList[i].direction.english
                    directionDe = directionsList[i].direction.german
                    user:requestInputDialog(InputDialog("Distance in number of tiles", "How many tiles away is the fake target meant to be?" ,false, 255, inputCallback))
                    break
                end
            end
        end

        local dialog = SelectionDialog(common.GetNLS(user,"","Direction choice"), common.GetNLS(user,"","Select which direction the fake target is meant to be in."), callback)

        for i = 1, #directionsList do
            dialog:addOption(0, common.GetNLS(user,directionsList[i].direction.german ,directionsList[i].direction.english))
        end
    user:requestSelectionDialog(dialog)
end

local function fakeGenderRace(user, targets, myTarget, spell)
    local englishText
    local germanText
    local englishRace
    local germanRace
    local englishGender
    local germanGender
    local raceList = texts.raceList
    local racePrefixText = texts.racePrefixText
    local genderTexts = texts.genderTexts

    local callback2 = function(genderDialog)
        if not genderDialog:getSuccess() then
            return
        end

        local index = genderDialog:getSelectedIndex() +1
        for i = 1, 2 do
            if index == i then
                englishGender = genderTexts[3].english..genderTexts[i].english
                germanGender = genderTexts[3].german..genderTexts[i].german
                germanText = germanRace.."\n"..germanGender
                englishText = englishRace.."\n"..englishGender
                for _, target in pairs(information[user.name]) do
                    if tostring(target.target) == tostring(myTarget) then
                        target.genderRace = {}
                        target.gender = i
                        target.genderRace.english = englishText
                        target.genderRace.german = germanText
                        M.fakeDialogue(user, targets, spell)
                        break
                    end
                end
                break
            end
        end
    end
    local genderDialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what race the target should be portrayed as having."), callback2)
    for i = 1, 2 do
        local optionText = common.GetNLS(user, genderTexts[i].german, genderTexts[i].english)
        genderDialog:addOption(0, optionText)
    end

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1
        for i = 1, #raceList do
            if index == i then
                englishRace = racePrefixText.english..raceList[i].name.english
                germanRace = racePrefixText.german..raceList[i].name.german
                user:requestSelectionDialog(genderDialog)
                break
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what race the target should be portrayed as having."), callback)

    for i = 1, #raceList do
        local dialogText = common.GetNLS(user, raceList[i].name.german, raceList[i].name.english)
        dialog:addOption(0, dialogText)
    end
    user:requestSelectionDialog(dialog)
end

local function fakeSpeed(user, targets, myTarget, spell)
    local speedTexts = texts.speedTexts
    local germanText
    local englishText
    local speedValues = {"high", "normal", "low"}

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        for i = 1, #speedValues do
            if index == i then
                germanText = speedTexts[speedValues[i]].german
                englishText = speedTexts[speedValues[i]].english
                for _, tar in pairs(information[user.name]) do
                    if tostring(tar.target) == tostring(myTarget) then
                        tar.spd = {}
                        tar.spd.german = germanText
                        tar.spd.english = englishText
                        M.fakeDialogue(user, targets, spell)
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select whether the fake target should be portrayed as being under speed influencing magic."), callback)

    for i = 1, #speedValues do
        local dialogText = common.GetNLS(user, speedTexts[speedValues[i]].german, speedTexts[speedValues[i]].english)
        dialog:addOption(0, dialogText)
    end
    user:requestSelectionDialog(dialog)
end

M.fakeItemTexts = {
weight = {title = {english = "Weight input", german = ""}, text = {english = "How much do you want the weight of the item to equate to in number of blackberries?", german = ""}},
durability = {title = {english = "Durability selection", german = ""}, text = {english = "Select what durability the item should be portrayed as having.", german = ""}},
quality = {title = {english = "Quality selection", german = ""}, text = {english = "Select which quality the item should be portrayed as having.", german = ""}}

}


local function fakeItem(user, targets, myTarget, spell)
    local fakeItemTexts = M.fakeItemTexts
    local GenericQualDe = lookat.GenericQualDe
    local GenericDuraDe = lookat.GenericDuraDe[1]
    local GenericQualEn = lookat.GenericQualEn
    local GenericDuraEn = lookat.GenericDuraEn[1]
    local durability
    local quality
    local weight
    local _
        local inputCallback = function (inputDialog)
            if (not inputDialog:getSuccess()) then
                return
            end
            local input = inputDialog:getInput()
            if (string.find(input,"(%d+)")~=nil) then
                _, _, weight = string.find(input,"(%d+)")
                local englishText, germanText = fakeItems.individualItemText(myTarget, durability, quality, weight)
                for _, target in pairs(information[user.name]) do
                    if tostring(target.target) == tostring(myTarget) then
                        target.item = {}
                        target.item.english = englishText
                        target.item.german = germanText
                        M.fakeDialogue(user, targets, spell)
                    end
                end
            else
                user:inform("Input must be a number.")
            end
        end

    local durabilityCallback = function (durabilityDialog)
        if not durabilityDialog:getSuccess() then
            return
        end
        local index = durabilityDialog:getSelectedIndex() +1
        for i = 1, #GenericDuraEn do
            if index == i then
                durability = i
                user:requestInputDialog(InputDialog(common.GetNLS(user, fakeItemTexts.weight.title.german, fakeItemTexts.weight.title.english),common.GetNLS(user,fakeItemTexts.weight.text.german,fakeItemTexts.weight.text.english),false, 255, inputCallback))
                break
            end
        end
    end
    local durabilityDialog = SelectionDialog(common.GetNLS(user, fakeItemTexts.durability.title.german, fakeItemTexts.durability.title.english), common.GetNLS(user, fakeItemTexts.durability.text.german, fakeItemTexts.durability.text.english), durabilityCallback)
    for i = 1, #GenericDuraEn do
        durabilityDialog:addOption(0, common.GetNLS(user, GenericDuraDe[i], GenericDuraEn[i]))
    end
    local qualityCallback = function (qualityDialog)
        if not qualityDialog:getSuccess() then
            return
        end
        local index = qualityDialog:getSelectedIndex() +1
        for i = 1, #GenericQualEn do
            if index == i then
                quality = i
                user:requestSelectionDialog(durabilityDialog)
                break
            end
        end
    end
    local qualityDialog = SelectionDialog(common.GetNLS(user, fakeItemTexts.quality.title.german, fakeItemTexts.quality.title.english), common.GetNLS(user, fakeItemTexts.quality.text.german, fakeItemTexts.quality.text.english), qualityCallback)
    for i = 1, #GenericQualEn do
        qualityDialog:addOption(0, common.GetNLS(user, GenericQualDe[i], GenericQualEn[i]))
    end
    user:requestSelectionDialog(qualityDialog)

end

local function fakeAttributes(user, targets, myTarget, spell)
    local statText = texts.statText
    local statValuesText = texts.statValuesText
    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()
        if string.find(input,"(%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+)") then
            local _, _, int, str, con, dex, agi, wil, per, ess = string.find(input,"(%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+)")
            local statsValues = {int, str, con, dex, agi, wil, per, ess}
            for i = 1, #statText do
                local stat = tonumber(statsValues[i])
                for _, value in ipairs(statValuesText) do
                    if stat >= value.value then
                        for _, tar in pairs(information[user.name]) do
                            if tostring(tar.target) == tostring(myTarget) then
                                local germanText = value.german..statText[i].adjective.german
                                local englishText = value.english..statText[i].adjective.english
                                tar[statText[i].stat] = {}
                                tar[statText[i].stat].german = germanText
                                tar[statText[i].stat].english = englishText
                            end
                        end
                        break
                    end
                end
            end
            M.fakeDialogue(user, targets, spell)
        else
            user:inform("", "You must put in a numerical value for each stat.")
            return
        end
    end
    local statOrderText = ""
    for _, stat in ipairs (statText) do
        statOrderText = statOrderText..common.GetNLS(user, stat.germanStat, stat.stat)
    end
    local dialog = InputDialog(common.GetNLS(user, "", "Fake attributes"), common.GetNLS(user, "", "Type in what the value should be for the targets stats in the follow order: \n "..statOrderText.."\n EG: 0 17 20 15 7 14 2 8"), false, 255, callback)

    user:requestInputDialog(dialog)
end

local function fakeHealth(user, targets, myTarget, spell)
    local healthTexts = texts.healthTexts

    local attribValues = {
        {value = 10000},
        {value = 8001},
        {value = 5001},
        {value = 2001},
        {value = 1},
        {value = 0}
    }

    local health
    local englishText
    local germanText

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #attribValues do
            if index == i then
                health = attribValues[i].value
                for _, heal in ipairs(healthTexts) do
                    if health >= heal.health then
                       germanText = heal.german
                       englishText = heal.english
                       break
                    end
                end
                for _, tar in pairs(information[user.name]) do
                    if tostring(tar.target) == tostring(myTarget) then
                        tar.HP = {}
                        tar.HP.english = englishText
                        tar.HP.german = germanText
                        M.fakeDialogue(user, targets, spell)
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much health the fake target should be portrayed as having."), callback)

    for i = 1, #attribValues do
        for _, heal in ipairs(healthTexts) do
            if attribValues[i].value >= heal.health then
                local optionText = common.GetNLS(user, heal.german, heal.english)
                dialog:addOption(0, optionText)
                break
            end
        end
    end
    user:requestSelectionDialog(dialog)
end

local function fakeMagicResistance(user, targets, myTarget, spell)
    local MRtexts = texts.MRtexts
    local magicResistanceValues = {
        {value = 1},
        {value = 0.65},
        {value = 0.32}
    }

    local MR

    for _, value in pairs(magicResistanceValues) do
        if value.value < 0.33 then
            value.text = common.GetNLS(user, MRtexts.low.german, MRtexts.low.english)
        elseif value.value < 0.66 then
            value.text = common.GetNLS(user, MRtexts.average.german, MRtexts.average.english)
        elseif value.value > 0.66 then
            value.text = common.GetNLS(user, MRtexts.high.german, MRtexts.high.english)
        end
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #magicResistanceValues do
            if index == i then
                MR = magicResistanceValues[i].value
                local germanText
                local englishText
                if MR < 0.33 then
                    germanText = MRtexts.low.german
                    englishText = MRtexts.low.english
                elseif MR < 0.66 then
                    germanText = MRtexts.average.german
                    englishText = MRtexts.average.english
                elseif MR > 0.66 then
                    germanText = MRtexts.high.german
                    englishText = MRtexts.high.english
                end
                for _, tar in pairs(information[user.name]) do
                    if tostring(tar.target) == tostring(myTarget) then
                        tar.MR = {}
                        tar.MR.german = germanText
                        tar.MR.english = englishText
                        M.fakeDialogue(user, targets, spell)
                    end
                end
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much magic resistance the fake target should be portrayed as having."), callback)

    for i = 1, #magicResistanceValues do
        dialog:addOption(0, magicResistanceValues[i].text)
    end
    user:requestSelectionDialog(dialog)
end

local function fakeSkill(user, targets, myTarget, spell)
    local skillTexts = texts.skillTexts

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #skillTexts do
            if index == i then
                local englishText = skillTexts[i].english
                local germanText = skillTexts[i].german
                for _, target in pairs(information[user.name]) do
                    if tostring(target.target) == tostring(myTarget) then
                        target.skill = {}
                        target.skill.german = germanText
                        target.skill.english = englishText
                        M.fakeDialogue(user, targets, spell)
                        return
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how skilled the fake target should be portrayed as being."), callback)

    for i = 1, #skillTexts do
        dialog:addOption(0, common.GetNLS(user, skillTexts[i].german, skillTexts[i].english))
    end

    user:requestSelectionDialog(dialog)
end

local function fakePlayerMana(user, targets, myTarget, spell)
    local manaTexts = texts.manaTexts

    local attribValues = {
        {value = 10000},
        {value = 8001},
        {value = 5001},
        {value = 2001},
        {value = 1},
        {value = 0}
    }

    local mana
    local englishText
    local germanText

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #attribValues do
            if index == i then
                mana = attribValues[i].value
                for _, manaText in ipairs(manaTexts) do
                    if mana >= manaText.mana then
                        germanText = manaText.german
                        englishText = manaText.english
                        break
                    end
                end
                for _, tar in pairs(information[user.name]) do
                    if tostring(tar.target) == tostring(myTarget) then
                        tar.MP = {}
                        tar.MP.english = englishText
                        tar.MP.german = germanText
                        M.fakeDialogue(user, targets, spell)
                        return
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much mana the fake target should be portrayed as having."), callback)

    for i = 1, #attribValues do
        for _, manaText in ipairs(manaTexts) do
            if attribValues[i].value >= manaText.mana then
                local optionText = common.GetNLS(user, manaText.german, manaText.english)
                dialog:addOption(0, optionText)
                break
            end
        end
    end
    user:requestSelectionDialog(dialog)
end

local function fakeFood(user, targets, myTarget, spell)
    local staminaTexts = texts.staminaTexts
        local attribValues = {
            {value = 10000},
            {value = 8001},
            {value = 5001},
            {value = 2001},
            {value = 1},
            {value = 0}
        }

        local food
        local germanText
        local englishText

        local callback = function(dialog)
            if not dialog:getSuccess() then
                return
            end
            local index = dialog:getSelectedIndex() +1
            for i = 1, #attribValues do
                if index == i then
                    food = attribValues[i].value
                    for _, foodText in ipairs(staminaTexts) do
                        if food >= foodText.food then
                            germanText = foodText.german
                            englishText = foodText.english
                            break
                        end
                    end
                    for _, tar in pairs(information[user.name]) do
                        if tostring(tar.target) == tostring(myTarget) then
                            tar.FP = {}
                            tar.FP.german = germanText
                            tar.FP.english = englishText
                            M.fakeDialogue(user, targets, spell)
                            break
                        end
                    end
                end
            end
        end

        local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select how much stamina the fake target should be portrayed as having."), callback)

        for i = 1, #attribValues do
            for _, foodText in ipairs(staminaTexts) do
                if attribValues[i].value >= foodText.food then
                    local optionText = common.GetNLS(user, foodText.german, foodText.english)
                    dialog:addOption(0, optionText)
                    break
                end
            end
        end
    user:requestSelectionDialog(dialog)
end

local function createFakeInfo(user, targets, myTarget, spell)
    local fakeInfoOptionsText = {
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
    {english = "Equipment", german = "", identifier = "equipment", rune = "Sav"},
    {english = "Equipped items", german = "", identifier = "equipment", rune = "Sav", rune2 = "Anth"}
    }

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local missingInfo = 0
        for i = 1, #fakeInfoOptionsText do
            local infoExists
            for _, target in pairs(information[user.name]) do
                if tostring(target.target) == tostring(myTarget) then
                    infoExists = target[fakeInfoOptionsText[i].identifier]
                end
            end
            local runeCheck = runes.checkSpellForRuneByName(fakeInfoOptionsText[i].rune, spell)
                if fakeInfoOptionsText[i].rune2 then
                    runeCheck = runeCheck and runes.checkSpellForRuneByName(fakeInfoOptionsText[i].rune2, spell)
                end
            if infoExists and runeCheck then
                if index == i-missingInfo then
                    if i == 1 then
                        fakeGenderRace(user, targets, myTarget, spell)
                    elseif i == 2 then
                        fakePlayerMana(user, targets, myTarget, spell)
                    elseif i == 3 then
                        fakeFood(user, targets, myTarget, spell)
                    elseif i == 4 then
                        fakeLocation(user, targets, myTarget, spell)
                    elseif i == 5 then
                        fakeSkill(user, targets, myTarget, spell)
                    elseif i == 6 then
                        fakeMagicResistance(user, targets, myTarget, spell)
                    elseif i == 7 then
                        fakeAttributes(user, targets, myTarget, spell)
                    elseif i == 8 then
                        fakeTerrain(user, targets, myTarget, spell)
                    elseif i == 9 then
                        fakeHealth(user, targets, myTarget, spell)
                    elseif i == 10 then
                        fakeSpeed(user, targets, myTarget, spell)
                    elseif i == 11 then
                        fakeItem(user, targets, myTarget, spell)
                    elseif i == 12 then
                        fakeEquipment(user, targets, myTarget, spell)
                    elseif i == 13 then
                        fakeEquippedItems(user, targets, myTarget, spell)
                    end
                    break
                end
            else
                missingInfo = missingInfo+1
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user, "", "Fake information selection"),  common.GetNLS(user,"","Select what type of information you want to fake."), callback)

    for i = 1, #fakeInfoOptionsText do
        local runeCheck = runes.checkSpellForRuneByName(fakeInfoOptionsText[i].rune, spell)

        if fakeInfoOptionsText[i].rune2 then
            runeCheck = runeCheck and runes.checkSpellForRuneByName(fakeInfoOptionsText[i].rune2, spell)
        end

        local infoExists

        for _, target in pairs(information[user.name]) do
            if tostring(target.target) == tostring(myTarget) then
                infoExists = target[fakeInfoOptionsText[i].identifier]
            end
        end

        if infoExists and runeCheck then
            dialog:addOption(0, common.GetNLS(user, fakeInfoOptionsText[i].german, fakeInfoOptionsText[i].english))
        end
    end
    user:requestSelectionDialog(dialog)
end

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

local function fakeTargetSelection(user, spell, targets)
    local info = information[user.name]
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1, #info do
            if index == i then
                createFakeInfo(user, targets, info[i].target, spell)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Target Selection"), common.GetNLS(user,"","Select which target you want to edit the information of."), callback)
    for i = 1, #info do
        local englishType = info[i].type
        local germanType = getGermanType(englishType)
        dialog:addOption(0, common.GetNLS(user, "german"..i.." "..germanType, "Target "..i.." "..englishType))
    end
    user:requestSelectionDialog(dialog)
end

local function resetFakeInfo(user, targets, spell)
    local realInfo = gatherInfo.invoke(user, targets, spell)
    information[user.name] = realInfo
    user:inform(common.GetNLS(user, "german", "Fake info has been reset to current targets real information."))
    M.fakeDialogue(user, targets, spell)
end

function M.fakeDialogue(user, targets, spell)
    local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
    local realInfo = gatherInfo.invoke(user, targets, spell)
    if not information[user.name] then
        information[user.name] = realInfo
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            fakeTargetSelection(user, spell, targets)
        elseif index == 2 then
            resetFakeInfo(user, targets, spell)
        elseif index == 3 then
            convertInfoToDialogue.getDialogue(user, targets, spell, information[user.name])
        elseif index == 4 and Fhan then
            convertInfoToDialogue.getDialogue(false, targets, spell)
        elseif index == 5 and Fhan then
            convertInfoToDialogue.getDialogue(false, targets, spell, information[user.name])
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"","Fake information selection"), common.GetNLS(user,"","Select what type of information you want to fake."), callback)
    dialog:addOption(0,common.GetNLS(user, "german", "Create fake info"))
    dialog:addOption(0,common.GetNLS(user, "german", "Reset fake info"))
    dialog:addOption(0,common.GetNLS(user, "german", "View fake info"))
    if Fhan then
        dialog:addOption(0,common.GetNLS(user, "german", "Send real info"))
        dialog:addOption(0,common.GetNLS(user, "german", "Send fake info"))
    end
    user:requestSelectionDialog(dialog)
end

return M
