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
local lookat = require("base.lookat")
local common = require("base.common")
local globalvar = require("base.globalvar")


local M = {}

local handOrBelt = {5,6,12,13,14,15,16,17}
local nameItem

local DIVINE_SCROLL_RANGE = 12

local function inputText(item, user, sourceItem, nameDe, nameEn, descriptionDe, descriptionEn, inputType)
    local typeTextDe=  {"deutscher Name", "englischer Name", "deutsche Beschreibung", "englische Beschreibung"}
    local typeTextEn = {"German name", "English name", "German description", "English description"}
    local maxTextLen = {25,25,254,254}
    local titleText = common.GetNLS(user,"Eingabe "..typeTextDe[inputType],
                                         "Input "..typeTextEn[inputType])
    local descriptionText = common.GetNLS(user,"Bitte den Text so eintragen, wie er erscheinen soll.",
                                               "Please enter the text as it should be shown later.")
    
    local thisInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        
        local input = dialog:getInput()
        
        if not common.IsNilOrEmpty(input) then
            if string.len(input) > maxTextLen[inputType] then
                common.HighInformNLS(user,"Der Text war zu lang. Maximal sind "..tostring(maxTextLen[inputType]).." Zeichen möglich.",
                                          "The text was too long. There are not more than "..tostring(maxTextLen[inputType]).." charcter possible.")
            elseif inputType == 1 then
                nameDe = input
                if common.IsNilOrEmpty(nameEn) then
                    nameEn = input
                end
            elseif inputType == 2 then
                nameEn = input
                if common.IsNilOrEmpty(nameDe) then
                    nameDe = input
                end
            elseif inputType == 3 then
                descriptionDe = input
                if common.IsNilOrEmpty(descriptionEn) then
                    descriptionEn = input
                end
            elseif inputType == 4 then
                descriptionEn = input
                if common.IsNilOrEmpty(descriptionDe) then
                    descriptionDe = input
                end
            end
            nameItem(item, user, sourceItem, nameDe, nameEn, descriptionDe, descriptionEn)
        end
        
    end
    
    user:requestInputDialog(InputDialog(titleText, descriptionText ,false, 255, thisInputDialog))
end

function nameItem(item, user, sourceItem, nameDe, nameEn, descriptionDe, descriptionEn)
    local titleText = ""
    local descriptionText = ""
    local cbDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()+1
        if index == 5 then
            if not common.IsNilOrEmpty(nameDe) then
                item:setData("nameDe", nameDe)
                item:setData("nameEn", nameEn)
            end
            if not common.IsNilOrEmpty(descriptionDe) then
                item:setData("descriptionDe", descriptionDe)
                item:setData("descriptionEn", descriptionEn)
            end
            item:setData("namerUsed", "player")
            world:changeItem(item)
            common.InformNLS(user,"Dein "..world:getItemName(item.id,Player.german).." leuchtet kurz auf. Du hast ein einzigartiges Stück Handwerkskunst hergestellt.",
                                  "Your "..world:getItemName(item.id,Player.english).." shines for a moment in a bright light. You made a unique piece of craftsman art.")
            world:gfx(globalvar.gfxLIGHT,user.pos)
            world:erase(sourceItem, 1)
            return
        else
            inputText(item, user, sourceItem, nameDe, nameEn, descriptionDe, descriptionEn, index)
        end
    end
    titleText = common.GetNLS(user,"Bennenen eines Gegenstandes","Name an item")
    descriptionText = common.GetNLS(user,"Wie soll"..common.getItemName(item, user:getPlayerLanguage()).." benannt werden?"..
                                         "\nEine Zuweisung kann nicht rückgängig gemacht werden!",
                                         "What should be name and description of item "..common.getItemName(item, user:getPlayerLanguage()).."?"..
                                         "\nA final decision cannot be reverted!")..
                                         "\nDeutscher Name: "..nameDe..
                                         "\nEnglish name: "..nameEn..
                                         "\nDeutsche Beschreibung: "..descriptionDe..
                                         "\nEnglish description: "..descriptionEn
    local sd = SelectionDialog(titleText, descriptionText, cbDialog)
    sd:addOption(item.id, common.GetNLS(user,"Deutscher Name","German name"))
    sd:addOption(item.id, common.GetNLS(user,"Englischer Name","English name"))
    sd:addOption(item.id, common.GetNLS(user,"Deutsche Beschreibung","German description"))
    sd:addOption(item.id, common.GetNLS(user,"Englische Beschreibung","English description"))
    sd:addOption(item.id, common.GetNLS(user,"Ausführung (Die neuen Namen werden endgültig dem Gegenstand eingeprägt.)","Application (The new names finally will be applied to the item)"))
    user:requestSelectionDialog(sd)
end

local function selectItem(itemList, user, sourceItem)
    local titleText = ""
    local descriptionText = ""
    local cbDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()+1
        nameItem(itemList[index], user, sourceItem, "", "", "", "")
        return
    end
    titleText = common.GetNLS(user,"Auswahl des Gegenstandes","Item selection")
    descriptionText = common.GetNLS(user,"Welchen der folgenden Gegenstände möchtest du benennen?",
                                         "Please select the item you want to name out of the list.")
    local sd = SelectionDialog(titleText, descriptionText, cbDialog)
    for _, item in ipairs(itemList) do
        sd:addOption(item.id, common.getItemName(item, user:getPlayerLanguage()))
    end
    user:requestSelectionDialog(sd)
end

local function namer(user, sourceItem)
    local itemList = {}
    local selectedItem
    for _, positionAtChar in pairs(handOrBelt) do
        local itemAtCharacter = user:getItemAt( positionAtChar )
        if itemAtCharacter:getData("craftedBy") == user.name
           and common.getItemDurability(itemAtCharacter) == 99
           and common.IsNilOrEmpty(itemAtCharacter:getData("qualityAtCreation")) then
            table.insert(itemList,itemAtCharacter)
        end
    end

    if #itemList == 0 then
        common.InformNLS(user,"Du hast kein Item, das du benennen kannst. Das Item muss von dir neu gefertigt worden sein.",
                              "You don't have an item that can be named. The item has to be new made by yourself.")
        return
    elseif #itemList == 1 then
        nameItem(itemList[1], user, sourceItem, "", "", "", "")
    else
        selectItem(itemList, user, sourceItem)
    end
end

local function divinescroll(user, sourceItem)
    local players = world:getPlayersInRangeOf(user.pos,DIVINE_SCROLL_RANGE)
    for i, player in pairs(players) do
        if player.id ~= user.id then
            if player:increaseAttrib("hitpoints",0) == 0 then
                local userHP = user:increaseAttrib("hitpoints",0)
                player:increaseAttrib("hitpoints",userHP)
                userHP = userHP - 1
                user:increaseAttrib("hitpoints",-userHP)
                world:erase(sourceItem, 1)
                world:gfx(globalvar.gfxFALL,user.pos)
                world:gfx(globalvar.gfxRAIN,player.pos)
                common.InformNLS(user,"Du spürst, wie deine Lebensenergie auf einem Schlag ausgesaugt wirst.",
                                      "You feel your live enery was withdrawn at one fell swoop.")
                common.InformNLS(player,"Als würden die Götter dich berühren, fühlst du dich plötzlich wieder fit.",
                                        "Suddenly you feel much better. It was as if the gods touched you.")
                common.ParalyseCharacter(user, 2, true, true)
                return
            end
        end
    end
end

function M.UseItem(user, sourceItem)
    if sourceItem:getData("namer") == "true" then
        namer(user, sourceItem)
    end
    if sourceItem:getData("divinescroll") == "true" then
        divinescroll(user, sourceItem)
    end
end

return M

