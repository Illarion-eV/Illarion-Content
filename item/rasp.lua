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

local M = {}

local function raspInHand(user, sourceItem)

    if not common.IsItemInHands(sourceItem) then
        user:inform("Du musst die Feile in der Hand halten.","You have to hold the rasp in your hand.",Character.highPriority)
        return false
    end

    return true
end

local function itemHasCrafterTag(theItem)

    local craftedTag = theItem:getData("craftedBy")

    if not common.IsNilOrEmpty(craftedTag) then
        return craftedTag
    end

    return false

end

local function userIsTheCrafter(user, crafterTag)

    if user.name == crafterTag then
        return true
    end

    return false

end

local function itemIsValid(user, theItem, restore)

    local crafterTag = itemHasCrafterTag(theItem)

    if crafterTag and userIsTheCrafter(user, crafterTag) and ((not restore and theItem:getData("hideTag") ~= "true") or (restore and theItem:getData("hideTag") == "true")) then
        return true
    end

    return false

end

local function getNonRaspHandItem(user, restore)

    local leftHand = user:getItemAt(Character.left_tool)
    local rightHand = user:getItemAt(Character.right_tool)

    local itemToCheck = rightHand

    if rightHand.id == Item.rasp then
        itemToCheck = leftHand
    end

    if not itemToCheck or itemToCheck.id == 0 then
        return false
    end

    if itemIsValid(user, itemToCheck, restore) then
        return itemToCheck
    end

    return false

end

local function getAllBagItems(user, restore)

    local items = {}

    local bag = user:getBackPack()

    local slots = bag:getSlotCount()

    for i = 0, slots-1 do

        local success, theItem = bag:viewItemNr(i)

        if success and itemIsValid(user, theItem, restore) then
            table.insert(items, theItem)
        end
    end

    return items

end

local function eraseTag(theItem)

    theItem:setData("hideTag", "true")
    world:changeItem(theItem)

end

local function restoreTag(theItem)

    theItem:setData("hideTag", "")
    world:changeItem(theItem)

end

local suffix = {
    erase = {English = "removed", German = "entfernt"},
    restore = {English = "restored", German = "wiederhergestellt"}
}

local function singleTag(user, eraseOrRestore, theItem, multi)

    if not theItem then
        theItem = getNonRaspHandItem(user, eraseOrRestore == "restore")
        if not theItem then
            user:inform("Das Objekt in deiner Hand muss eines sein, das du hergestellt hast, um sein Etikett zu haben "..suffix[eraseOrRestore].German..".",
                        "The item in your hand must be one you made to have its tag "..suffix[eraseOrRestore].English..".")
            return
        end
    end

    local itemCommon = world:getItemStatsFromId(theItem.id)
    local english = itemCommon.English
    local german = itemCommon.German

    if eraseOrRestore == "erase" then
        eraseTag(theItem)
        if not multi then
            user:inform("Du hast das Etikett des "..german.." gelöscht.", "You've erased the tag of the "..english..".")
        end
    elseif eraseOrRestore == "restore" then
        restoreTag(theItem)
        if not multi then
            user:inform("Du hast das Etikett des "..german.." wiederhergestellt.", "You've restored the tag of the "..english..".")
        end
    end

end

local function allBagTags(user, eraseOrRestore)

    local items = getAllBagItems(user, eraseOrRestore == "restore")

    if #items == 0 then
        user:inform("Keine Gegenstände wurden " .. suffix[eraseOrRestore].German .. ".",
                    "None of the items in your bag had your tag on them to be " .. suffix[eraseOrRestore].English .. ".")
        return
    end

    for _, theItem in pairs(items) do
        singleTag(user, eraseOrRestore, theItem, true)
    end

    if eraseOrRestore == "erase" then
        user:inform("Du hast das Etikett von "..#items.." Gegenständen entfernt.", "You removed the tag of "..#items.." items.")
    elseif eraseOrRestore == "restore" then
        user:inform("Du hast das Etikett von "..#items.." Gegenständen wiederhergestellt.", "You restored the tag of "..#items.." items.")
    end

end

function M.UseItem(user, sourceItem, actionState)

    if not raspInHand(user, sourceItem) then
        return
    end

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        if not raspInHand(user, sourceItem) then
            return
        end

        if index == 1 then
            singleTag(user, "erase")
        elseif index == 2 then
            allBagTags(user, "erase")
        elseif index == 3 then
            singleTag(user, "restore")
        elseif index == 4 then
            allBagTags(user, "restore")
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Feile", "Rasp"), common.GetNLS(user, "Hier kannst du entscheiden, ob du das Herstellungs-Tag eines Gegenstands in deiner Hand oder in deiner Tasche entfernen oder wiederherstellen möchtest, solange du die Person bist, die den Gegenstand ursprünglich hergestellt hat.","Here you can decide whether to get rid of or restore the crafted tag of any item in your hand or your bag, so long as you are the person who crafted the item to begin with."), callback)

    dialog:addOption(0, common.GetNLS(user, "Tag in Hand entfernen", "Remove tag of item in hand"))
    dialog:addOption(0, common.GetNLS(user, "Tags in Tasche entfernen", "Remove tag of items in bag"))
    dialog:addOption(0, common.GetNLS(user, "Tag in Hand wiederherstellen", "Restore tag of item in hand"))
    dialog:addOption(0, common.GetNLS(user, "Tags in Tasche wiederherstellen", "Restore tag of items in bag"))

    user:requestSelectionDialog(dialog)
end

return M
