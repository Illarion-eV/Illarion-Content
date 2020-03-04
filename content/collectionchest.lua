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

-- This script contains the functions for realm collection chests.
--[[There are 3 collection tasks possible for each realm
Each collection can have 12 different items
Configured by a town official vie the town board
global script variable
coltask[1-9]Name, Public name of the task
coltask[1-9]Id, ID of the task, must be equal QuestID 3[1-9]00
coltask[1-9]Active, 0 if not yet active and visible, changeable, 1 if active but not changeable
coltask[1-9]Town[0-3], 0 donation not permitted for the related town, 1 permitted
coltask[1-9]Slot[1-12]Item, task content itemID
coltask[1-9]Slot[1-12]Total, task content needed amount total
coltask[1-9]Slot[1-12]SinglePlayer, task content max for single player
coltask[1-9]Slot[1-12]Collected, task content already collected
[1-9] 1-3: Cadomyr; 4-6: Galmair; 7-9: Runewick

QuestID's
3[1-0]00,"CollectionTaskID",,,"Banduk","User is active in the related collection task"
3[1-9][01-12],"Already given for Slot",,,"Banduk","Character already gave, must not be more than coltask[1-9]Slot[1-12]SinglePlayer
]]
local common = require("base.common")
local factions = require("base.factions")
local globalvar = require("base.globalvar")

local M = {}

local CHEST_ID_CLOSED = 1360
local CHEST_ID_OPENED = 1361

local COLTASK_CHEST_LOCATION = {
position(116, 528, 0), -- Cadomyr
position(950, 783, 1), -- Runewick
position(334, 217, 0)  -- Galmair
}
local COLTASK_MAX_SLOTS = 12
local COLTASK_TASKS = {
{1, 2, 3}, -- Cadomyr
{4, 5, 6}, -- Runewick
{7, 8, 9}  -- Galmair
}

local LISTED_CONSTRUCTION_ITEMS = {
--{groupNameDe, groupNameEn, listOfItems}
{"Holz","Wood",{2560,2716,543,545,3,2543,544,546,56,3786}},
{"Sand und Stein","Sand and Stone",{726,316,735,733,2588}},
{"Stoffe","Drapery",{170,168,3787,176,178,179,177.2579,174,175}},
{"Edelsteine","Gems",{}},
{"Werkzeuge","Tools",{}},
{"Essen","Food",{}},
{"Getränke","Drinks",{}},
{"Geschirr","Tableware",{}},
{"Reine Elemente","Pure elements",{}},
{"sonstiges","miscellaneous",{}}
}

local currentSelectedColtask = 0

local function getBaseQuestId(coltask)
    local baseQuestId = 3000 + 100 * tonumber(coltask)
    return baseQuestId
end

local function returnItemToUser(item, user)
    local backPack
    if user:getItemAt(Character.backpack) then
        backPack = user:getBackPack()
    end
    if backPack then
        backPack:insertItem(item)
        world:erase(item,item.number)
    else
        -- This part creates a script error
        local targetPos = user.pos
        world:createItemFromItem(item,targetPos,true)
        world:erase(item,item.number)
    end

end

local function getCurrentColtaskId(coltask)
    local _, currentColtaskId = ScriptVars:find("coltask"..tostring(coltask).."Id")
    if common.IsNilOrEmpty(currentColtaskId) then
        currentColtaskId = 0
    end
    return currentColtaskId
end

local function getCurrentColtaskName(coltask)
    local _, currentColtaskName = ScriptVars:find("coltask"..tostring(coltask).."Name")
    if common.IsNilOrEmpty(currentColtaskName) then
        currentColtaskName = "---"
    end
    return currentColtaskName
end

local function isCurrentColtaskPermission(coltask,town)
    local _, currentColtask = ScriptVars:find("coltask"..tostring(coltask).."Town"..tostring(town))
    if common.IsNilOrEmpty(currentColtask) or currentColtask == "0" then
        return false
    end
    return true
end

local function getItemIdInSlot(coltask,slot)
    local _, itemId = ScriptVars:find("coltask"..tostring(coltask).."Slot"..tostring(slot).."Item")
    if common.IsNilOrEmpty(itemId) then
        itemId = 0
    end
    return tonumber(itemId)
end

local function initializePlayerDonation(coltask,user)
    local currentColtaskId = getCurrentColtaskId(coltask)
    local baseQuestId = getBaseQuestId(coltask)
    local currentUserId = user:getQuestProgress(baseQuestId)
    currentColtaskId = tonumber(currentColtaskId)
    if currentColtaskId ~= currentUserId then --user never took part in that quest, reset all user variables
        user:setQuestProgress(baseQuestId,currentColtaskId)
        for i = baseQuestId + 1 , baseQuestId + COLTASK_MAX_SLOTS do
            user:setQuestProgress(i,0)
        end
    end
end

local function getAlreadyDonatedItems(user,coltask,slot)
    local questId = getBaseQuestId(coltask) + tonumber(slot)
    local questValue = user:getQuestProgress(questId)
    if common.IsNilOrEmpty(questValue) then
        questValue = 0
    end
    return tonumber(questValue)
end

local function isActiveCollection(coltask)
    local _, coltaskActive = ScriptVars:find("coltask"..tostring(coltask).."Active")
    if common.IsNilOrEmpty(coltaskActive) or coltaskActive == "0" then
        return false
    end
    return true
end

local function numberOfItemsInSlot(coltask,slot)
    local _, coltaskTotal = ScriptVars:find("coltask"..tostring(coltask).."Slot"..tostring(slot).."Total")
    local _, coltaskCollected = ScriptVars:find("coltask"..tostring(coltask).."Slot"..tostring(slot).."Collected")
    local _, coltaskSinglePlayer = ScriptVars:find("coltask"..tostring(coltask).."Slot"..tostring(slot).."SinglePlayer")
    if common.IsNilOrEmpty(coltaskTotal) then
        coltaskTotal = 0
    end
    if common.IsNilOrEmpty(coltaskCollected) then
        coltaskCollected = 0
    end
    if common.IsNilOrEmpty(coltaskSinglePlayer) then
        coltaskSinglePlayer = coltaskTotal
    end
    return tonumber(coltaskTotal), tonumber(coltaskCollected), tonumber(coltaskSinglePlayer)
end

local function numberOfItemsOpenInSlot(coltask,slot)

    local coltaskTotal, coltaskCollected = numberOfItemsInSlot(coltask,slot)
    return tonumber(coltaskTotal) - tonumber(coltaskCollected)
end

local function isAllCollected(coltask)
    for i = 1 , COLTASK_MAX_SLOTS do
        if numberOfItemsOpenInSlot(coltask,i) > 0 then
            return false
        end
    end
    return true
end

local function isPermitForPlayerDonation(coltask,user)
    if isActiveCollection(coltask) == false then
        common.InformNLS(user,  "Diese Sammlung wurde noch nicht gestartet.",
                                "This collection hasn't been staretd yet.")
        return false
    end
    local _, coltaskTown = ScriptVars:find("coltask"..tostring(coltask).."Town"..tostring(factions.getMembership(user)))
    if tonumber(coltaskTown) == 0 then
        common.InformNLS(user,  "Bürger deiner Stadt dürfen sich an dieser Sammlung nicht beteiligen.",
                                "People from your realm are not permitted taking part in this collection.")
        return false
    end
    if isAllCollected(coltask) then
        common.InformNLS(user,  "Alle Materialien für diese Sammlung wurden bereits zusammengetragen.",
                                "All items for this collection has been collected already.")
        return false
    end
    return true
end

local function collectionStateText(user,coltask)
    local text = ""
    if isActiveCollection(coltask) then
        text = common.GetNLS(user, "aktiv", "active")
    else
        text = common.GetNLS(user, "inaktiv", "not active")
    end
    if isAllCollected(coltask) then
        text = text .. "; " .. common.GetNLS(user, "Sammlung beendet", "Collection ended")
    else
        text = text .. "; " .. common.GetNLS(user, "Material benötigt", "Material needed")
    end
    return text
end

local function collectionOverview(user,coltask)
    local text = getCurrentColtaskName(coltask)
    text = text .. " (" .. collectionStateText(user,coltask) .. ")"
    return text
end

local function slotOverview(user,coltask,slot)
    local text = ""
    local lang = user:getPlayerLanguage()
    local itemId = getItemIdInSlot(coltask,slot)
    if itemId == 0 then
        text = common.GetNLS(user, tostring(slot) .. ": Leer", tostring(slot) .. ": Empty")
    else
        local coltaskTotal
        local coltaskCollected
        local coltaskSinglePlayer
        coltaskTotal, coltaskCollected, coltaskSinglePlayer = numberOfItemsInSlot(coltask,slot)
        text =  tostring(coltaskCollected) .. " of " .. tostring(coltaskTotal) .. " " .. world:getItemName(itemId ,lang) ..
                common.GetNLS(user, "; Eine Person:", "; Single Person:") .. tostring(coltaskSinglePlayer)
    end
    return text
end

local function slotOverviewDonator(user,coltask,slot)
    local text = ""
    local lang = user:getPlayerLanguage()
    local itemId = getItemIdInSlot(coltask,slot)
    if itemId == 0 then
        text = common.GetNLS(user, "Leer", "Empty")
    else
        local coltaskTotal
        local coltaskCollected
        local coltaskSinglePlayer
        coltaskTotal, coltaskCollected, coltaskSinglePlayer = numberOfItemsInSlot(coltask,slot)
        local alreadyDonated = getAlreadyDonatedItems(user,coltask,slot)
        local maxItemsToGive = math.min(tonumber(coltaskTotal) - tonumber(coltaskCollected),
                                        tonumber(coltaskSinglePlayer) - alreadyDonated)

        text =  tostring(maxItemsToGive) .. " " .. world:getItemName(itemId ,lang) ..
                common.GetNLS(user, "; gesamt ", "; total ") .. tostring(coltaskCollected) .. " of " .. tostring(coltaskTotal)
    end
    return text
end

local function switchPermissionForTown(coltask,town)
    if isCurrentColtaskPermission(coltask,town) then
        ScriptVars:set("coltask"..tostring(coltask).."Town"..tostring(town),0)
    else
        ScriptVars:set("coltask"..tostring(coltask).."Town"..tostring(town),1)
    end
    ScriptVars:save()
end

local function startNewCollection(coltask,taskName)
    local currentColtaskId = getCurrentColtaskId(coltask)

    ScriptVars:set("coltask"..tostring(coltask).."Name",taskName)
    ScriptVars:set("coltask"..tostring(coltask).."Id",tonumber(currentColtaskId) + 1)
    ScriptVars:set("coltask"..tostring(coltask).."Active",0)

    local townPermitted
    for i = 0, 3 do
        townPermitted = 0
        if coltask <= 3 and i == globalvar.townCADOMYR then
            townPermitted = 1
        end
        if coltask >= 4 and coltask <= 6 and i == globalvar.townRUNEWICK then
            townPermitted = 1
        end
        if coltask >= 7 and i == globalvar.townGALMAIR then
            townPermitted = 1
        end
        ScriptVars:set("coltask"..tostring(coltask).."Town"..tostring(i),townPermitted)
    end

    for i = 1, COLTASK_MAX_SLOTS do
        ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(i).."Item",0)
        ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(i).."Total",0)
        ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(i).."SinglePlayer",0)
        ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(i).."Collected",0)
    end
    ScriptVars:save()
end

local function getNewCollectionName(user,coltask)

    local currentInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if common.IsNilOrEmpty(input) then
            common.InformNLS(user,"Nichts verändert?","Nothing changed!")
            return
        end
        startNewCollection(coltask,input)
        user:logAdmin("New made town material collection no " .. tostring(coltask) .. "by " ..  user.name)

    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = common.GetNLS(user, "Wähle den Namen der Sammlung.", "Selecte the name of the collection.")
    user:requestInputDialog(InputDialog(dialogTitle, dialogText ,false, 255, currentInputDialog))
end

local function changeCollectionName(user,coltask)

    local currentInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if common.IsNilOrEmpty(input) then
            common.InformNLS(user,"Nichts verändert?","Nothing changed!")
            return
        end
        ScriptVars:set("coltask"..tostring(coltask).."Name",input)

    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = common.GetNLS(user, "Bitte gebe den neuen Namen an.", "Please enter the new name.")
    user:requestInputDialog(InputDialog(dialogTitle, dialogText ,false, 255, currentInputDialog))
end

local function defineSlotValues(user,coltask,slot)
    local currentInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+) (%d+)") ~= nil) then
            local _, _, itemId, amountNeeded, amountSinglePlayer = string.find(input,"(%d+) (%d+) (%d+)")
            itemId = tonumber(itemId)
            amountNeeded = tonumber(amountNeeded)
            amountSinglePlayer = tonumber(amountSinglePlayer)
            if itemId == 0 then
                amountNeeded = 0
                amountSinglePlayer = 0
            else
                if amountSinglePlayer == 0 or amountSinglePlayer > amountNeeded then
                    amountNeeded = amountSinglePlayer
                end
            end
            ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(slot).."Item",itemId)
            ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(slot).."Total",amountNeeded)
            ScriptVars:set("coltask"..tostring(coltask).."Slot"..tostring(slot).."SinglePlayer",amountSinglePlayer)
            ScriptVars:save()
        else
            common.InformNLS(user,"Eingabe falsch. Nichts verändert!","Wrong input. Nothing changed!")
            return
        end

    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = common.GetNLS(user,
                        "Bitte gebe die Konfiguration für Kanal "..tostring(slot).." an.\n"..
                        "[ItemID[ [Gesamt benötigt] [Max durch einen Spieler bereitstellbar]",
                        "Please enter the configuration for slot "..tostring(slot)..".\n"..
                        "[ItemID[ [Total needed] [Max deliverable by a single player]")
    user:requestInputDialog(InputDialog(dialogTitle, dialogText ,false, 255, currentInputDialog))
end

local function manageSingleCollection(user,coltask)
    local ID_1ST_TOWN = 4
    local ID_1ST_SLOT = ID_1ST_TOWN + 4
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1
        if selected == 1 then
            getNewCollectionName(user,coltask)
        elseif selected == 2 then
            if isActiveCollection(coltask) then
                ScriptVars:set("coltask"..tostring(coltask).."Active",0)
            else
                ScriptVars:set("coltask"..tostring(coltask).."Active",1)
            end
            ScriptVars:save()
        elseif selected == 3 then
            changeCollectionName(user,coltask)
        elseif selected <=(ID_1ST_TOWN + 3) then
            switchPermissionForTown(coltask,selected - ID_1ST_TOWN)
        else
            defineSlotValues(user,coltask,selected - ID_1ST_SLOT + 1)
        end

    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = collectionOverview(user,coltask)
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    dialog:addOption(0, common.GetNLS(user, "Löschen und neu anlegen", "Delete and make new"))
    if isActiveCollection(coltask) then
        dialog:addOption(0, common.GetNLS(user, "Deaktivieren (ist aktiv)", "Deactivate (is active)"))
    else
        dialog:addOption(0, common.GetNLS(user, "Aktivieren", "Activate"))
    end
    dialog:addOption(0, common.GetNLS(user, "Namen ändern", "Change name"))
    for i=0,3 do
        local text = factions.getTownNameByID(i)
        if isCurrentColtaskPermission(coltask,i) then
            text = text .. common.GetNLS(user, " ist möglich: Verbieten!", " is possible: Deny!")
        else
            text = text .. common.GetNLS(user, " ist verboten: Ermöglichen!", " is denied: Allow!")
        end
        dialog:addOption(0, text)
    end
    for i=1, COLTASK_MAX_SLOTS do
        dialog:addOption(getItemIdInSlot(coltask,i), slotOverview(user,coltask,i))
    end

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

local function donateSingleCollection(user,coltask,itemChest)
    if isPermitForPlayerDonation(coltask,user) then
        if itemChest.id == CHEST_ID_CLOSED then
            itemChest.id = CHEST_ID_OPENED
            world:changeItem(itemChest)
        end
        local callback = function(dialog)
            if not dialog:getSuccess() then
                currentSelectedColtask = 0
                itemChest.id = CHEST_ID_CLOSED
                world:changeItem(itemChest)
                return
            end

            local selected = dialog:getSelectedIndex() + 1
            currentSelectedColtask = 0
            itemChest.id = CHEST_ID_CLOSED
            world:changeItem(itemChest)

            end

        local dialogTitle = common.GetNLS(user, "Materialsammlung: ", "Material Collection: ") .. getCurrentColtaskName(coltask)
        local dialogText = collectionStateText(user,coltask)..
                           common.GetNLS(user, "\nDu kannst die folgenden Materialien liefern:" ..
                                               "\nLege das Material in die offene Kiste.",
                                               "\nYou are able to deliver the following material:" ..
                                               "\nPut the material into the open chest.")
        local dialog = SelectionDialog(dialogTitle, dialogText, callback)

        for i=1, COLTASK_MAX_SLOTS do
            if getItemIdInSlot(coltask,i) ~= 0 then
                dialog:addOption(getItemIdInSlot(coltask,i),slotOverviewDonator(user,coltask,i))
            end
        end

        dialog:setCloseOnMove()
        user:requestSelectionDialog(dialog)
    end
end

local function selectCollectionToDonate(user,itemChest,townId)
    local collectionList = COLTASK_TASKS[townId]
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1
        currentSelectedColtask = collectionList[selected]
        donateSingleCollection(user,currentSelectedColtask,itemChest,townId)
    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = common.GetNLS(user, "Wo möchtest du liefern?", "Where do you want to deliver items to?")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i = 1, #collectionList do
        dialog:addOption(0, tostring(i)..": "..collectionOverview(user,collectionList[i]))
    end

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)end

function M.isCollectionChestExists(townId)
    local positionChest = COLTASK_CHEST_LOCATION [townId]
    local itemAtPosition
    if world:isItemOnField(positionChest) then
        itemAtPosition = world:getItemOnField(positionChest)
        if itemAtPosition.id == CHEST_ID_CLOSED or itemAtPosition.id == CHEST_ID_OPENED then
            return true
        else
            return false
        end
    end
    return false
end


function M.donate(item, user, town)
    local lang = user:getPlayerLanguage()
    if currentSelectedColtask == 0 then
        if M.isCollectionChestExists(town) then
            returnItemToUser(item, user)
            common.InformNLS(user,
                            "Du bekommst die Items einfach nicht in die Kiste. Vielleicht solltest du zuerst eine Sammlung auswählen.",
                            "You don't get the items into the chest. Maybe you select a collection first.")
        end
        return
    end
    initializePlayerDonation(currentSelectedColtask,user)
    local itemId = item.id
    for slot=1, COLTASK_MAX_SLOTS do
        if getItemIdInSlot(currentSelectedColtask,slot) == itemId then
            local coltaskTotal
            local coltaskCollected
            local coltaskSinglePlayer
            coltaskTotal, coltaskCollected, coltaskSinglePlayer = numberOfItemsInSlot(currentSelectedColtask,slot)
            local donatedItemNumber = item.number
            local alreadyDonated = getAlreadyDonatedItems(user,currentSelectedColtask,slot)
            coltaskTotal = tonumber(coltaskTotal)
            coltaskCollected = tonumber(coltaskCollected)
            coltaskSinglePlayer = tonumber(coltaskSinglePlayer)
            donatedItemNumber = tonumber(donatedItemNumber)
            alreadyDonated = tonumber(alreadyDonated)

            if coltaskSinglePlayer < donatedItemNumber then
                common.InformNLS(user,
                                "Eine Person darf nicht mehr als " .. tostring(coltaskSinglePlayer) .. " " .. world:getItemName(itemId ,lang) .. " geben.",
                                "One person cannot give more then ".. tostring(coltaskSinglePlayer) .. " " .. world:getItemName(itemId ,lang) .. ".")
                returnItemToUser(item, user)
                return
            end

            local maxItemsToGive = math.min(coltaskTotal - coltaskCollected,
                                            coltaskSinglePlayer - alreadyDonated)
            if maxItemsToGive == 0 then
                common.InformNLS(user,
                                "Du kannst kein " .. world:getItemName(itemId ,lang) .. " mehr geben.",
                                "You cannot give more " .. world:getItemName(itemId ,lang) .. ".")
                returnItemToUser(item, user)
                return
            end
            if maxItemsToGive < donatedItemNumber then
                common.InformNLS(user,
                                "Du kannst noch maximal " .. tostring(maxItemsToGive) .. " " .. world:getItemName(itemId ,lang) .. " geben.",
                                "You can give not more then ".. tostring(maxItemsToGive) .. " " .. world:getItemName(itemId ,lang) .. ".")
                returnItemToUser(item, user)
                return
            end
            ScriptVars:set("coltask"..tostring(currentSelectedColtask).."Slot"..tostring(slot).."Collected",tonumber(coltaskCollected) + donatedItemNumber)
            ScriptVars:save()
            local questId = getBaseQuestId(currentSelectedColtask) + slot
            local userGaveItems = user:getQuestProgress(questId)
            userGaveItems = tonumber(userGaveItems) + donatedItemNumber
            user:setQuestProgress(questId, userGaveItems)
            world:erase(item,donatedItemNumber)
            common.InformNLS(user,
                            "Du hast " .. tostring(donatedItemNumber) .. " " .. world:getItemName(itemId ,lang) .. " gegeben.",
                            "You gave ".. tostring(donatedItemNumber) .. " " .. world:getItemName(itemId ,lang) .. ".")
            return

        end
    end
end

function M.collectionChestUsed(user,itemChest)
    local currentPosition = itemChest.pos
    for i=1, #COLTASK_CHEST_LOCATION do
        if COLTASK_CHEST_LOCATION[i] == currentPosition then
            common.TurnTo(user,currentPosition)
            if itemChest.id == CHEST_ID_OPENED then
                itemChest.id = CHEST_ID_CLOSED
                world:changeItem(itemChest)
                return true
            end
            if itemChest.id == CHEST_ID_CLOSED then
                selectCollectionToDonate(user,itemChest,i)
                return true
            end
        end
    end
    return false
end

function M.manageCollections(user, townId)
    local collectionList = COLTASK_TASKS[townId]
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1
        manageSingleCollection(user,collectionList[selected])
    end

    local dialogTitle = common.GetNLS(user, "Materialsammlungen", "Material Collections")
    local dialogText = common.GetNLS(user, "Wähle eine zu organisierende Sammlung.", "Selecte the collection to organize.")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    for i = 1, #collectionList do
        dialog:addOption(0, tostring(i)..": "..collectionOverview(user,collectionList[i]))
    end

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end
return M
