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
-- UPDATE items SET itm_script='item.id_463_quill' WHERE itm_id IN (463)
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local recipe_creation = require("alchemy.base.recipe_creation")
local createSpell = require("magic.arcane.createSpell")
local texts = require("magic.arcane.base.texts")
local lookat = require("base.lookat")
local parchmentScript = require("item.id_2745_parchment")
local bookWriting = require("item.base.bookWriting")

local M = {}

local parchmentList = {2745, 3109}
local parchmentMaxTextLength = bookWriting.parchmentMaxTextLength

local function getText(user,deText,enText)
    return common.GetNLS(user,deText,enText)
end

local function CheckIfContainerPresent(user)

    local containerList = {97,799}
    local containerItem = user:getItemAt(0)

    for i=1,#containerList do

        if (containerItem.id == containerList[i]) then
            return containerItem
        end
    end

    return nil
end

local emptyBottleList = {518, 1317, 790, 164, 2498}

local function CheckIfEmptyBottlePresent(user)

    for i=1, #emptyBottleList do
        local bottleCount = user:countItem(emptyBottleList[i])
        if bottleCount > 0 then
            return true
        end
    end

    return false
end

local function CheckIfBottleInHand(user, sourceItem)

    local potionBottleList = alchemy.bottleList
    local beverageBottleList = {517, 1315, 1316, 1318, 1319, 1320, 1321, 1322,1323, 783, 784, 785, 786, 787, 788, 789, 791, 2500, 2496, 2497, 2501, 2499,3720,3721,3722}

    local bottleItem = common.GetTargetItem(user, sourceItem)
    if bottleItem == nil then
        return nil
    end

    for i=1, #potionBottleList do
        if (bottleItem.id == potionBottleList[i]) then
            return bottleItem
        end
    end
    for i=1, #beverageBottleList do
        if (bottleItem.id == beverageBottleList[i]) then
            return bottleItem
        end
    end
    for i=1, #emptyBottleList do
        if (bottleItem.id == emptyBottleList[i]) then
            return bottleItem
        end
    end

    if bottleItem.id == 3642 or bottleItem.id == 3643 then --salve jars
        return bottleItem
    end

    return nil
end

local function CheckIfParchmentInHand(user, sourceItem)
    local parchmentItem = common.GetTargetItem(user, sourceItem)
    if parchmentItem == nil then
        return nil
    end

    if common.isInList(parchmentItem.id, parchmentList) and user:countItemAt("body",parchmentItem.id)==1 then
        if (common.IsNilOrEmpty(parchmentItem:getData("descriptionEn"))) and (common.IsNilOrEmpty(parchmentItem:getData("writtenText"))) then
            return parchmentItem
        elseif not common.IsNilOrEmpty(parchmentItem:getData("writtenText")) then
            return parchmentItem
        end
    end

    return nil
end

local function CheckIfParchmentIsSigned(parchmentItem)
    if parchmentItem == nil then
        return false
    end
    if common.IsNilOrEmpty(parchmentItem:getData("signatureText")) then
        return false
    else
        return true
    end
end

local function CheckIfParchmentCanSigned(user, sourceItem)
    local parchmentItem = common.GetTargetItem(user, sourceItem)
    if parchmentItem == nil then
        return nil
    end

    for i=1, #parchmentList do
        if ((parchmentItem.id == parchmentList[i]) and not (common.IsNilOrEmpty(parchmentItem:getData("writtenText"))) and (not CheckIfParchmentIsSigned(parchmentItem)) )then
            return parchmentItem
        end
    end

    return nil
end

local function WriteParchment(user, sourceItem)

    local title = getText(user, "Pergament beschreiben", "Write Parchment")
    local infoText = getText(user, "Füge hier den Text ein, den du auf das Pergament schreiben willst. Wenn du zu einer neuen Zeile springen willst, bestätige zuerst deinen aktuellen Text.", "Insert the text you want to write on the parchment. If you want to skip to a new line, confirm your current text first.")
    local newLine = false

    -- input dialog
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        else
            local parchment = CheckIfParchmentInHand(user, sourceItem) -- check for the parchment again
            if parchment then
                local writtenText = dialog:getInput()
                local existingText = parchmentScript.getWrittenTextFromParchment(parchment)
                local existingNewLines = parchment:getData("newLines")
                if not common.IsNilOrEmpty(existingNewLines) then
                    existingNewLines = tonumber(existingNewLines)
                else
                    existingNewLines = 0
                end

                if existingText then
                    if newLine then
                        existingNewLines = existingNewLines + 1
                        existingText = existingText .. "\n"
                        parchment:setData("newLines", tostring(existingNewLines))
                    end
                    writtenText = existingText .. writtenText
                end

                local textLength = string.len (writtenText) + (41 * existingNewLines) --the latter part ensures that texts do not get too long with lineskips

                if CheckIfParchmentIsSigned(parchment) then
                    user:inform("Du kannst ein unterschriebenes Pergament nicht verändern.","You cannot change an already signed parchment.",Character.highPriority)
                elseif textLength > parchmentMaxTextLength then
                    user:inform("Du findest nicht genügend freien Platz auf dem Pergament.","The parchment is too small for your text.",Character.highPriority)
                else
                    bookWriting.convertStringToMultipleParchmentDataValues(parchment, writtenText)
                    user:inform("Du schreibst auf das Pergament:\n'".. string.gsub (writtenText,"\\n","\n") .."'.","You write on the parchment:\n'".. string.gsub (writtenText,"\\n","\n") .."'.")
                end
            else
                user:inform("Du brauchst ein Pergament in deiner Hand, um darauf zu schreiben.","You need a parchment in your hand if you want to write.",Character.highPriority)
            end
        end
    end
    local dialog = InputDialog(title, infoText, false, parchmentMaxTextLength, callback)

    local callback2 = function(dialog2)
        if not dialog2:getSuccess() then
            return
        end

        local index = dialog2:getSelectedIndex()+1

        if index == 1 then
            newLine = true
            user:requestInputDialog(dialog)
        else
            user:requestInputDialog(dialog)
        end
    end

    local text2 = common.GetNLS(user, "Dieses Pergament ist bereits beschrieben. Wo möchtest du weiterschreiben? ", "The parchment was already written on. Where do you want to resume writing?")

    local dialog2 = SelectionDialog(title, text2, callback2)

    dialog2:addOption(0, common.GetNLS(user, "In einer neuen Zeile.", "On a new line."))
    dialog2:addOption(0, common.GetNLS(user, "In der vorherigen Zeile.", "On the previous line."))

    local parchment = CheckIfParchmentInHand(user, sourceItem)

    if parchment and not common.IsNilOrEmpty(parchment:getData("writtenText")) then
        user:requestSelectionDialog(dialog2)
    else
        user:requestInputDialog(dialog)
    end
end

local function SignParchment(user,sourceItem)

    local parchment = CheckIfParchmentCanSigned(user,sourceItem) -- check for the parchment again

    if parchment then
        parchment:setData("signatureText",user.name)
        lookat.SetSpecialDescription(parchment,"Das Pergament ist unterschrieben.","The parchment is signed.")
        parchment.wear = 254 -- Written parchments should have maximum rot time to allow message exchange
        world:changeItem(parchment)
        user:inform("Du unterschreibst das Pergament.","You sign the parchment.")
    else
        user:inform("Du brauchst ein beschriebes in deiner Hand Pergament, um zu unterschreiben.","You need a written parchment in your hand to sign.",Character.highPriority)
    end
end


local function WriteContainerLabel(user,sourceItem)

    local title = getText(user, "Taschenbeschriftung", "Bag labelling")
    local infoText = getText(user, "Füge hier den Text ein, mit dem du die Tasche beschriften willst.", "Insert the text you want to write on the label.")

    -- input dialog
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        else
            local bag = CheckIfContainerPresent(user) -- check for the bag again
            if bag then
                local labelText = dialog:getInput()
                lookat.SetSpecialDescription(bag,labelText,labelText)
                world:changeItem(bag)
                user:inform("Du beschriftest die Tasche mit '"..labelText.."'.","You label the bag as '"..labelText.."'.")
            else
                user:inform("Du brauchst eine Tasche, um diese zu beschriften.","You need a bag if you want to label one.")
            end
        end
    end
    local dialog = InputDialog(title, infoText, false, 100, callback)
    user:requestInputDialog(dialog)
end

local function WriteLabel(user,sourceItem)

    local title  = getText(user, "Flaschenetikettierung", "Bottle labelling")
    local infoText = getText(user, "Füge hier den Text ein, mit dem du das Etikett beschriften willst.", "Insert the text you want to write on the label.")

    -- input dialog
    local callback = function(dialog)
        if dialog:getSuccess() then
            local bottle = CheckIfBottleInHand(user, sourceItem) -- check for the bottle again
            if bottle then
                --if bottle.number > 1 then
                --    user:inform("Du kannst immer nur eine Flasche beschriften.","You can label only one bottle at once.")
                --    return
                --end
                local labelText = dialog:getInput()
                lookat.SetSpecialDescription(bottle,labelText,labelText)
                world:changeItem(bottle)
                user:inform("Du beschriftest die Flasche mit '"..labelText.."'.","You label the bottle as '"..labelText.."'.")

            else
                user:inform("Du brauchst eine Flasche, um diese zu beschriften.","You need a bottle if you want to label one.")
            end
        end
    end
    local dialog = InputDialog(title, infoText, false, 100, callback)
    user:requestInputDialog(dialog)
end

local function removeLabel(user)

    local removalCount = 0

    for i=1, #emptyBottleList do
        local itemList = user:getItemList(emptyBottleList[i])
        for item=1, #itemList do
            lookat.UnsetSpecialDescription(itemList[item])
            lookat.UnsetItemCraftedBy(itemList[item]); -- hack for "old" items
            world:changeItem(itemList[item])
            removalCount = removalCount + itemList[item].number
        end
    end

    if removalCount == 1 then
        user:inform("Du hast von "..removalCount.." Flasche das Etikett entfernt.","You removed the label of "..removalCount.." bottle.")
    else
        user:inform("Du hast von "..removalCount.." Flaschen die Etiketten entfernt.","You removed the labels of "..removalCount.." bottles.")
    end
end

local function checkIfMagicDeskInFrontOfuser(user)
    local desks = {3502, 3503}
    local potentialDesk = common.GetFrontItem(user)

    if not potentialDesk then
        return false
    end

    for _, desk in pairs(desks) do
        if potentialDesk.id == desk then
            return true
        end
    end
return false
end

local function requestGrimoireLabel(user, theBook)
    local title = getText(user, "Zauberbuch beschriften", "Label Grimoire")
    local infoText = getText(user, "Füge hier den Text ein, mit dem du das Etikett beschriften willst.", "Insert the text you want to write on the label.")

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local labelText = dialog:getInput()
        local labelPrefixEn = "Label: "
        local labelPrefixDe = "Etikett: "
        lookat.SetSpecialDescription(theBook, labelPrefixDe..labelText, labelPrefixEn..labelText)
        world:changeItem(theBook)
        user:inform("Du beschriftest die Zauberbuch mit '"..labelText.."'.","You label the grimoire as '"..labelText.."'.")
    end

    local dialog = InputDialog(title, infoText, false, 100, callback)

    user:requestInputDialog(dialog)

end

local function labelGrimoire(user)
    local leftItem = user:getItemAt(5)
    local rightItem = user:getItemAt(6)

    local books = createSpell.books

    local theBook = false

    for _, id in pairs(books) do
        if id == rightItem.id then
            theBook = rightItem
        elseif id == leftItem.id then
            theBook = leftItem
        end
    end

    if theBook then
        if theBook:getData("magicBook") == "" then
            theBook = false
        end
    end

    if not theBook then
        user:inform(texts.quill.bookNeeded.german, texts.quill.bookNeeded.english)
        return
    end

    requestGrimoireLabel(user, theBook)

end

function M.UseItem(user, sourceItem, ltstate)

    if checkIfMagicDeskInFrontOfuser(user) then
        createSpell.mainDialog(user, sourceItem)
        return
    end

    if not common.IsItemInHands(sourceItem) then
        user:inform("Du musst die Schreibfeder in der Hand halten.","You have to hold the quill in your hand.",Character.highPriority)
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 2 then
                if not CheckIfBottleInHand(user, sourceItem) then
                    user:inform("Du brauchst eine Flasche in deiner Hand, um diese zu beschriften.","You need a bottle in your hand if you want to label one.",Character.highPriority)
                    return
                else
                    WriteLabel(user,sourceItem)
                end
            elseif selected == 3 then
                local parchment = recipe_creation.GetParchmentQuill(user)
                parchment = recipe_creation.IsParchmentOK(user,parchment)
                if not parchment then
                    return
                else
                    recipe_creation.FirstMenu(user)
                end
            elseif selected == 1 then
                if not CheckIfContainerPresent(user) then
                    user:inform("Du brauchst eine Tasche, um diese zu beschriften.","You need a bag if you want to label one.",Character.highPriority)
                    return
                else
                    WriteContainerLabel(user,sourceItem)
                end
            elseif selected == 4 then
                if not CheckIfEmptyBottlePresent(user) then
                    user:inform("Du brauchst Flaschen von denen du das Etikett entfernen kannst.","You need bottles to remove labels.",Character.highPriority)
                    return
                else
                    removeLabel(user)
                end
            elseif selected == 5 then
                if not CheckIfParchmentInHand(user, sourceItem) then
                    user:inform("Du brauchst ein einzelnes leeres oder teilweise beschriebenes Pergament in deiner Hand auf dem du schreiben kannst.","You need a single empty or half filled parchment in your hand to write on.",Character.highPriority)
                    return
                else
                    WriteParchment(user,sourceItem)
                end
            elseif selected == 6 then
                if not CheckIfParchmentCanSigned(user,sourceItem) then
                    user:inform("Du brauchst ein beschriebenes Pergament in deiner Hand auf dem du unterschreiben kannst.","You need a written parchment in your hand to sign.",Character.highPriority)
                    return
                else
                    SignParchment(user,sourceItem)
                end
            elseif selected == 7 then
                labelGrimoire(user)
            elseif selected == 8 then
                bookWriting.writeBook(user, sourceItem)
            end
        end
    end

    local dialog = SelectionDialog(getText(user,"Schreibfeder","Quill") , getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback)
    dialog:addOption(0, getText(user,"Tasche beschriften","Label bag"))
    dialog:addOption(0, getText(user,"Flasche beschriften","Label a bottle"))
    dialog:addOption(0, getText(user,"Alchemierezept schreiben","Write an alchemy recipe"))
    dialog:addOption(0, getText(user,"Flaschenetikett entfernen","Remove label of a bottle"))
    dialog:addOption(0, getText(user,"Pergament beschreiben","Write a parchment"))
    dialog:addOption(0, getText(user,"Pergament unterschreiben","Sign a parchment"))
    dialog:addOption(0, getText(user,"Zauberbuch beschriften","Label Grimoire"))
    dialog:addOption(0, getText(user, "Buch verfassen", "Author a book"))

    user:requestSelectionDialog(dialog)
end

function M.LookAtItem(user, sourceItem)

    local lookAt = lookat.GenerateLookAt(user, sourceItem, lookat.WOOD)

    return lookAt
end

return M

