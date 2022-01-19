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
-- UPDATE common SET com_script='gm.items.id_382_ceilingtrowel' WHERE com_itemid IN (382);
local lookat = require("base.lookat")
local factions = require("base.factions")
local common = require("base.common")
local licence = require("base.licence")
local specialeggs = require("content.specialeggs")
local scheduledFunction = require("scheduled.scheduledFunction")
local mysticalcracker = require ("item.id_3894_mystical_cracker")
local spawntreasures = require ("scheduled.spawn_treasure")
local shard = require("item.shard")
local glyphs = require("base.glyphs")
local seafaring = require("base.seafaring")
local staticteleporter = require("base.static_teleporter")
local drinks = require("item.drinks")
local food = require("item.food")
local customPotion = require("alchemy.base.customPotion")


local M = {}

local chooseItem
local weather
local factionHandling
local spawnPoint
local spawnGM
local updateMonsters
local changeItemSelection

local gmSpawnpointSettings = {}
local gmMonsters = {}
local removePositions = {}

local SPAWN_PLAYER_OUT_OF_SIGHT = 20
local SPAWN_MONSTER_RUN_AWAY = 35

local MagicGem=1
local SpecialItem = {}
local SpecialItemSubMenu = {"Money","Magic Gems","Pure Elements"}
--SpecialItem[x] = {"Name",IsExtraFunction,ItemID,special,SubMenue}
SpecialItem[1] = {"Mystical Cracker",true,3894,0,""}
SpecialItem[2] = {"Special Eggs",true,1150,0,""}
SpecialItem[3] = {"Treasure Chest",true,2830,0,""}
SpecialItem[4] = {"Latent Magic Topaz",false,3525,MagicGem,"Magic Gems"}
SpecialItem[5] = {"Latent Magic Amethyst",false,3519,MagicGem,"Magic Gems"}
SpecialItem[6] = {"Latent Magic Obsidian",false,3524,MagicGem,"Magic Gems"}
SpecialItem[7] = {"Latent Magic Sappire",false,3522,MagicGem,"Magic Gems"}
SpecialItem[8] = {"Latent Magic Ruby",false,3521,MagicGem,"Magic Gems"}
SpecialItem[9] = {"Latent Magic Emerald",false,3523,MagicGem,"Magic Gems"}
SpecialItem[10] = {"Pure Fire",false,2553,0,"Pure Elements"}
SpecialItem[11] = {"Pure Air",false,2551,0,"Pure Elements"}
SpecialItem[12] = {"Pure Earth",false,2552,0,"Pure Elements"}
SpecialItem[13] = {"Pure Water",false,2554,0,"Pure Elements"}
SpecialItem[14] = {"Pure Spirit",false,3607,0,"Pure Elements"}
SpecialItem[15] = {"Silver Coins",false,3077,0,"Money"}
SpecialItem[16] = {"Gold Coins",false,61,0,"Money"}
SpecialItem[17] = {"Poison Coins",false,3078,0,"Money"}
SpecialItem[18] = {"Glyph Shards",true,3493,0,""}
SpecialItem[19] = {"Latent Magic Diamond",false,3520,MagicGem,"Magic Gems"}

local itemPos = {{en="Head", de="Kopf"},{en="Neck", de="Hals"},{en="Breast", de="Brust"},{en="Both Hands", de="Beide Hände"},{en="Left Hand", de="Linke Hand"}, {en="Right Hand", de="Rechte Hand"},
    {en="Left Finger", de="Linker Finger"},{en="Right Finger", de="Rechter Finger"} ,{en="Legs", de="Beine"}, {en="Feet", de="Füße"}, {en="Coat", de="Umhang"},{en="Belt 1", de="Gürtel 1"},
    {en="Belt 2", de="Gürtel 2"},{en="Belt 3", de="Gürtel 3"},{en="Belt 4", de="Gürtel 4"},{en="Belt 5", de="Gürtel 5"},{en="Belt 6", de="Gürtel 6"}}
itemPos[0] = {en="Backpack", de="Rucksack" }
local itemOrder = {5,6,12,13,14,15,16,17,1,11,3,4,9,10,2,7,8}

function M.changeRankOnLogin(user)
    for i = 1,100 do
        local foundRank, rank = ScriptVars:find("SRCnumber"..i)
        local foundName, name = ScriptVars:find("SRCplayerName"..i)
        local foundAdmin, admin = ScriptVars:find("SRCadminName"..i)
        local foundRankName, rankName = ScriptVars:find("SRCrankName"..i)
        if foundRank then
            if foundAdmin and foundName and foundRankName then
                if name == user.name then
                    local rankNumber = tonumber(rank)
                    local points
                    if rankNumber == 1 then
                        points = 0
                    elseif rankNumber == 2 then
                        points = 100
                    elseif rankNumber == 3 then
                        points = 200
                    elseif rankNumber == 4 then
                        points = 300
                    elseif rankNumber == 5 then
                        points = 400
                    elseif rankNumber == 6 then
                        points = 500
                    elseif rankNumber == 7 then
                        points = 600
                    elseif rankNumber == 8 then
                        points = 700
                    elseif rankNumber == 9 then
                        points = 800
                    elseif rankNumber == 10 then
                        points = 900
                    end
                    factions.setRankpoints(user, points)
                    factions.setSpecialRank(user, tonumber(rank))
                    ScriptVars:remove("SRCnumber"..i)
                    ScriptVars:remove("SRCplayerName"..i)
                    ScriptVars:remove("SRCadminName"..i)
                    ScriptVars:remove("SRCrankName"..i)
                    ScriptVars:save()
                    log("The player "..name.." has upon login been set to the rank "..rankName.."(whichever corresponds to the players town) by a scheduled script started by "..admin)
                    return
                end
            end
        end
    end
end

local function scheduledChangeOfRank(targetName, rankNumber, rankName, adminName)
    for i = 1,100 do
        if not ScriptVars:find("SRCnumber"..i) then
            ScriptVars:set("SRCnumber"..i,rankNumber)
            ScriptVars:set("SRCplayerName"..i,targetName)
            ScriptVars:set("SRCadminName"..i,adminName)
            ScriptVars:set("SRCrankName"..i,rankName)
            ScriptVars:save()
            return
        elseif i == 100 then
            debug("Scheduled ranks somehow hit the limit of 100, which shouldn't even happen unless something is wrong.")
        end
    end
end

local function scheduledRankSelection(user, input)
    local rankNames = {"Tramp/Novice/Serf","Assistant/Apprentice/Bondsman","Pedlar/Student/Servant","Grocer/Scholar/Yeoman","Merchant/Master/Page",
                    "Financier/Doctor/Squire","Patrician/Docent/Knight","Mogul/Professor/Baron", "Magnate/Dean/Count", "Tycoon/Rector/Duke"}
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        scheduledChangeOfRank(input, index, rankNames[index], user.name)
        user:inform("The change of "..input.."'s rank to "..rankNames[index].." in their appropriate town has been scheduled.")
    end

    local dialog = SelectionDialog("Schedule Rank Change", "Select the rank you want to change the player to.", callback)

    for i = 1, #rankNames do
        dialog:addOption(0, rankNames[i])
    end

    user:requestSelectionDialog(dialog)
end

local function scheduleRankChangeForPlayer(user)
local input
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        input = dialog:getInput()
        scheduledRankSelection(user, input)
    end
    user:requestInputDialog(InputDialog("Schedule Rank Change", "Type in the name of the player you wish to schedule a rank change for." ,false, 255, callback))
end

local function accessListOfScheduledRankChanges(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local numberOfSkippedSlots = 0
        for i = 1,100 do
            local foundScheduled = ScriptVars:find("SRCnumber"..i)
            if not foundScheduled then
                numberOfSkippedSlots = numberOfSkippedSlots+1
            elseif index == i - numberOfSkippedSlots then
                ScriptVars:remove("SRCnumber"..i)
                ScriptVars:remove("SRCplayerName"..i)
                ScriptVars:remove("SRCadminName"..i)
                ScriptVars:remove("SRCrankName"..i)
                ScriptVars:save()
                user:inform("Target was successfully removed from the list.")
                return
            end
        end
    end
    local dialog = SelectionDialog("Pending Rank Changes", "Select a pending change to delete it.", callback)
    for i = 1, 100 do
        local foundRank = ScriptVars:find("SRCnumber"..i)
        local foundName, name = ScriptVars:find("SRCplayerName"..i)
        local foundAdmin, admin = ScriptVars:find("SRCadminName"..i)
        local foundRankName, rankName = ScriptVars:find("SRCrankName"..i)
        if foundRank then
            if not foundRankName or not foundName or not foundAdmin then
                debug("Something went wrong.")
                return
            end
            dialog:addOption(0, tostring(name).." has been set to have the rank among "..rankName.." which corresponds to their town. Scheduled by "..tostring(admin)..".")
        end
    end
    user:requestSelectionDialog(dialog)
end

local function scheduledRankChanges(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            scheduleRankChangeForPlayer(user)
        elseif index == 2 then
            accessListOfScheduledRankChanges(user)
        end
    end
    local dialog = SelectionDialog("Schedule Rank Change", "Schedule a rank change for an offline player or review scheduled changes that haven't taken effect yet.", callback)
    dialog:addOption(0,"Schedule a Rank Change")
    dialog:addOption(0,"Review List of Scheduled Changes")
    user:requestSelectionDialog(dialog)
end

local function checkValue(input)
    if input == nil or input == 0 then
        return false
    else
        return true
    end
end

function chooseItem(user)

    local dialogTitle = common.GetNLS(user, "Item wählen", "Choose Item")
    local dialogInfoText = common.GetNLS(user, "Wähle den Gegenstand aus, den du bearbeiten möchtest:",  "Please choose an item you wish to edit:")


    local itemsOnChar = {}
    local itemPosOnChar = {}
    local frontItem = common.GetFrontItem(user)
    if (frontItem ~= nil and frontItem.id > 0) then
        table.insert(itemsOnChar, frontItem)
        table.insert(itemPosOnChar, {en="Item in front", de="Item vor dir" })
    end
    --get all the items the char has on him, without the stuff in the backpack
    for i = 1, #(itemOrder) do
        local item = user:getItemAt(itemOrder[i])
        if item.id > 0 then
            table.insert(itemsOnChar, item)
            table.insert(itemPosOnChar, itemPos[itemOrder[i]])
        end
    end

    local cbChooseItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        local chosenItem = itemsOnChar[index]

        if chosenItem ~= nil then
            changeItemSelection(user, chosenItem)
        else
            user:inform("[ERROR] Something went wrong, please inform a developer.");
        end
    end
    local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem)
    sdItems:setCloseOnMove()
    local itemName, itemPosText
    for i,item in ipairs(itemsOnChar) do
        itemName = world:getItemName(item.id, user:getPlayerLanguage())
        itemPosText = common.GetNLS(user, itemPosOnChar[i].de, itemPosOnChar[i].en)
        sdItems:addOption(item.id,itemName .. " (" .. itemPosText .. ")\n")
    end
    user:requestSelectionDialog(sdItems)
end

local function changeItemNumber(user, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            local _, _, newnumber = string.find(input,"(%d+)")
            TargetItem.number=math.min(1000, tonumber(newnumber))
            world:changeItem(TargetItem)
            user:inform("Amount of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.number)
            user:logAdmin("changed number of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.number)
        else
            user:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(user, TargetItem)
    end
    user:requestInputDialog(InputDialog("Set the mumber of items", "How many "..world:getItemName(TargetItem.id, Player.english).." do you want?" ,false, 255, cbInputDialog))
end

local function changeItemQuality(user, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d)(%d)(%d)")~=nil) then
            local _, _, newqual=string.find(input,"(%d+)")
            TargetItem.quality=tonumber(newqual)
            world:changeItem(TargetItem)
            user:inform("Quality of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.quality)
            user:logAdmin("changed quality of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.quality)
        else
            user:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(user, TargetItem)
    end
    user:requestInputDialog(InputDialog("Set the quality of items", "Enter target quality for: "..world:getItemName(TargetItem.id, Player.english).." \n 101-999; [1-9][01-99] Quality / Durability\nCurrent value: "..tostring(TargetItem.quality) ,false, 255, cbInputDialog))
end

local function changeItemWear(user, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            local _, _, newwear = string.find(input,"(%d+)")
            TargetItem.wear=tonumber(newwear)
            world:changeItem(TargetItem)
            user:inform("Wear of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.wear)
            user:logAdmin("changed wear of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.wear)
        else
            user:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(user, TargetItem)
    end
    user:requestInputDialog(InputDialog("Set the wear of items", "How long "..world:getItemName(TargetItem.id, Player.english).." should need to rot?\n about x * 3 min\nCurrent value: "..tostring(TargetItem.wear) ,false, 255, cbInputDialog))
end

local function changeItemData(user, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%w+) (.+)")~=nil) then
            local _, _, dataString,newdata = string.find(input,"(%w+) (.+)")
            TargetItem:setData(dataString,newdata)
            world:changeItem(TargetItem)
            user:inform("Data of "..world:getItemName(TargetItem.id, Player.english).." set to key: " ..dataString.." value: "..TargetItem:getData(dataString))
            user:logAdmin("changed data of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to key: " ..dataString.." value: "..TargetItem:getData(dataString))
        else
            user:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(user, TargetItem)
    end
    user:requestInputDialog(InputDialog("Set data of items", "Data for "..world:getItemName(TargetItem.id, Player.english)..".\n Use 'data value'" ,false, 255, cbInputDialog))
end

local function changeItemNameEnglish(user, TargetItem)
local newName
local _
    local dialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(.+)")~=nil) then
            _, _, newName = string.find(input,"(.+)")
        else
            newName = ""
        end
        if not common.IsNilOrEmpty(newName) then
            TargetItem:setData("nameEn",newName)
            world:changeItem(TargetItem)
            user:inform("English name of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newName)
            user:logAdmin("changed English name of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newName)
        else
            user:inform("The entry can not be left blank.")
        end
    end
    user:requestInputDialog(InputDialog("Set item name", "English name for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, dialog))
end
local function changeItemNameGerman(user, TargetItem)
local newName
local _
    local dialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(.+)")~=nil) then
            _, _, newName = string.find(input,"(.+)")
        else
            newName = ""
        end
        if not common.IsNilOrEmpty(newName) then
            TargetItem:setData("nameDe",newName)
            world:changeItem(TargetItem)
            user:inform("German name of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newName)
            user:logAdmin("changed German name of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newName)
        else
            user:inform("The entry can not be left blank.")
        end
    end
    user:requestInputDialog(InputDialog("Set item name", "German name for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, dialog))
end
local function changeItemName(user, TargetItem)
    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            changeItemNameEnglish(user, TargetItem)
        elseif index == 2 then
            changeItemNameGerman(user, TargetItem)
        end
    end

    local dialog = SelectionDialog("Item Name", "Select which language you want to edit the item name for.", callback)

    dialog:addOption(0,"English")
    dialog:addOption(0,"German")
    user:requestSelectionDialog(dialog)
end

local function changeItemDescriptionEnglish(user, TargetItem)
local newDescription
local _
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(.+)")~=nil) then
            _, _, newDescription = string.find(input,"(.+)")
        else
            newDescription = ""
        end
        if common.IsNilOrEmpty(newDescription) == false then
            TargetItem:setData("descriptionEn",newDescription)
            world:changeItem(TargetItem)
            user:inform("English description of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newDescription)
            user:logAdmin("changed English description of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newDescription)
        else
            user:inform("The entry can not be left blank.")
        end
    end
    user:requestInputDialog(InputDialog("Set item description", "English description for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, callback))
end

local function changeItemDescriptionGerman(user, TargetItem)
    local newDescription
    local _
        local callback = function(dialog)
            if not dialog:getSuccess() then
                return
            end
            local input = dialog:getInput()
            if (string.find(input,"(.+)")~=nil) then
                _, _, newDescription = string.find(input,"(.+)")
            else
                newDescription = ""
            end
            if common.IsNilOrEmpty(newDescription) == false then
                TargetItem:setData("descriptionEn",newDescription)
                world:changeItem(TargetItem)
                user:inform("German description of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newDescription)
                user:logAdmin("changed German description of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newDescription)
            else
                user:inform("The entry can not be left blank.")
            end
        end
        user:requestInputDialog(InputDialog("Set item description", "German description for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, callback))
    end

local function changeItemDescription(user, TargetItem)
    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            changeItemDescriptionEnglish(user, TargetItem)
        elseif index == 2 then
            changeItemDescriptionGerman(user, TargetItem)
        end
    end

    local dialog = SelectionDialog("Item Description", "Select which language you want to edit the item description for.", callback)

    dialog:addOption(0,"English")
    dialog:addOption(0,"German")
    user:requestSelectionDialog(dialog)
end

local function changeItemGlyph(user, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            if glyphs.getGlyphRingOrAmulet(TargetItem) == 0 then
                user:inform("Item "..world:getItemName(TargetItem.id, Player.english).." cannot be glyphed. Only rings or amulets can contain glyph charges.")
            else
                local _, _, newcharges = string.find(input,"(%d+)")
                glyphs.setRemainingGlyphs(TargetItem,newcharges)
                user:inform("Item "..world:getItemName(TargetItem.id, Player.english).." got "..tostring(newcharges).." glyph charges.")
            end
        else
            user:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(user, TargetItem)
    end
    user:requestInputDialog(InputDialog("Set the glyph charges of items", "How many charges "..world:getItemName(TargetItem.id, Player.english).." should get?" ,false, 255, cbInputDialog))
end

local function checkIfFoodDrinkPotion(item)
local drinkIDs = drinks.drinkList
local foodIDs = food.foodList
local potionIDs = customPotion.potionList
    if potionIDs[item.id] then
        return "potion"
    elseif foodIDs[item.id] or drinkIDs[item.id] then
        return true
    else
        return false
    end
end

local function setEnglishInform(user, item, isPotion)
    local input
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        input = dialog:getInput()
        if not isPotion then
            item:setData("customInformEN", input)
        else
            item:setData("customPotion", input)
        end
        world:changeItem(item)
        user:inform("Custom English Inform set to: "..input)
    end
    user:requestInputDialog(InputDialog("English Custom Inform", "Type in what the English inform should be upon consumption." ,false, 255, callback))
end
local function setGermanInform(user, item, isPotion)
    local input
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        input = dialog:getInput()
        if not isPotion then
            item:setData("customInformDE", input)
        else
            item:setData("customPotionDE", input)
        end
        world:changeItem(item)
        user:inform("Custom German Inform set to: "..input)
    end
    user:requestInputDialog(InputDialog("German Custom Inform", "Type in what the German inform should be upon consumption." ,false, 255, callback))
end

local function setCustomInform(user, item, isPotion)
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            setEnglishInform(user, item, isPotion)
        elseif index == 2 then
            setGermanInform(user, item, isPotion)
        end
    end
    local oldGermanInform = item:getData("customInformDE")
    local oldEnglishInform = item:getData("customInformEN")
        if isPotion then
            oldGermanInform = item:getData("customPotionDE")
            oldEnglishInform = item:getData("customPotion")
        end
    if not oldGermanInform or oldGermanInform == "" then
        oldGermanInform = "None"
    end
    if not oldEnglishInform or oldEnglishInform == "" then
        oldEnglishInform = "None"
    end

    local dialog = SelectionDialog("Custom Informs", "Select which language to set a custom inform for.\nCurrent custom informs:\nEnglish:"..oldEnglishInform.."\nGerman: "..oldGermanInform, callback)
    dialog:addOption(0,"Set English Inform")
    dialog:addOption(0,"Set German Inform")
    user:requestSelectionDialog(dialog)
end

function changeItemSelection(user, TargetItem)
    local changeItemFunctions = {}
    changeItemFunctions[1] = {"Set Number"}
    changeItemFunctions[2] = {"Set Quality and Durability"}
    changeItemFunctions[3] = {"Set Name"}
    changeItemFunctions[4] = {"Set Description"}
    changeItemFunctions[5] = {"Set Wear"}
    changeItemFunctions[6] = {"Set Data"}
    changeItemFunctions[7] = {"Set Glyph charges"}
    local foodDrinkOrPotion = checkIfFoodDrinkPotion(TargetItem)
    if foodDrinkOrPotion then
        changeItemFunctions[8] = {"Set Custom Inform"}
    end
    local isPotion
    if foodDrinkOrPotion == "potion" then
        isPotion = true
    end

    local cbChangeItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            changeItemNumber(user, TargetItem)
        elseif index == 2 then
            changeItemQuality(user, TargetItem)
        elseif index == 3 then
            changeItemName(user, TargetItem)
        elseif index == 4 then
            changeItemDescription(user, TargetItem)
        elseif index == 5 then
            changeItemWear(user, TargetItem)
        elseif index == 6 then
            changeItemData(user, TargetItem)
        elseif index == 7 then
            changeItemGlyph(user, TargetItem)
        elseif index == 8 then
            setCustomInform(user, TargetItem, isPotion)
        end
    end
    local sd = SelectionDialog(world:getItemName(TargetItem.id, Player.english), "Choose the porperty you want to change.", cbChangeItem)
    for i=1, #(changeItemFunctions) do
        sd:addOption(0,changeItemFunctions[i][1])
    end
    user:requestSelectionDialog(sd)
end

function weather(user, SourceItem)

    local currWeather = world.weather

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"help")~=nil) then
            user:inform("Set cloud density: \"clouds <value>\" - range: 0 - 100")
            user:inform("Set fog density: \"fog <value>\" - range: 0 - 100")
            user:inform("Set wind direction: \"wind dir <value>\" - range: -100 - +100")
            user:inform("Set gust strength: \"gust str <value>\" - range: 0 - 100")
            user:inform("Set percipitation strength: \"per <value>\" - range: 0 - 100")
            user:inform("Set thunderstorm strength: \"thunder <value>\" - range: 0 - 100")
            user:inform("Set temperature: \"temp <value>\" - range: -50 - +50")
        end
        if (string.find(input,"clouds (%d+)")~=nil) then
            local _, _, value = string.find(input"clouds (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.cloud_density = value
                user:inform("cloud density changed to: "..value)
                user:logAdmin("changed cloud densitiy to: "..value)
            else
                user:inform("Failed changing cloud desity: out of range (0-100)")
            end
        end
        if (string.find(input,"fog (%d+)")~=nil) then
            local _, _, value = string.find(input,"fog (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.fog_density = value
                user:inform("fog density changed to: "..value)
                user:logAdmin("changed fog densitiy to: "..value)
            else
                user:inform("Failed changing fog desity: out of range (0-100)")
            end
        end
        if (string.find(input,"wind dir ([-,0-9]+)")~=nil) then
            local _, _, value = string.find(input,"wind dir ([-,0-9]+)")
            value=tonumber(value)
            if (value<101 and value>-101) then
                currWeather.wind_dir = value
                user:inform("wind direction changed to: "..value)
                user:logAdmin("changed wind direction to: "..value)
            else
                user:inform("Failed changing wind direction: out of range (-100 - +100)")
            end
        end
        if (string.find(input,"gust str (%d+)")~=nil) then
            local _, _, value = string.find(input,"gust str (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.gust_strength = value
                user:inform("gust strength changed to: "..value)
                user:logAdmin("changed gust strength to: "..value)
            else
                user:inform("Failed changing gust strength: out of range (0-100)")
            end
        end
        if (string.find(input,"per (%d+)")~=nil) then
            local _, _, value = string.find(input,"per (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.percipitation_strength = value
                user:inform("percipitation strength changed to: "..value)
                user:logAdmin("changed percipitation strength to: "..value)
            else
                user:inform("Failed changing percipitation strength: out of range (0-100)")
            end
        end
        if (string.find(input,"thunder (%d+)")~=nil) then
            local _, _, value = string.find(input,"thunder (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.thunderstorm = value
                user:inform("thunderstorm changed to: "..value)
                user:logAdmin("changed thunderstorm to: "..value)
            else
                user:inform("Failed changing thunderstorm: out of range (0-100)")
            end
        end
        if (string.find(input,"temp ([-,0-9]+)")~=nil) then
            local _, _, value = string.find(input,"temp ([-,0-9]+)")
            value=tonumber(value)
            if (value<51 and value>-51) then
                currWeather.temperature = value
                user:inform("temperature changed to: "..value)
                user:logAdmin("changed temperature to: "..value)
            else
                user:inform("Failed changing temperature: out of range (-50 - +50)")
            end
        end
    end
    user:requestInputDialog(InputDialog("Set an option for the weather", "Possible actions: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value> " ,false, 255, cbInputDialog))

    if (currWeather.temperature>-1) then
        currWeather.percipitation_type=1
    else
        currWeather.percipitation_type=2
    end
    world:setWeather(currWeather)
end


local function String2Number(str)
    if (string.find(str, "(%d+)") ~= nil) then
        local _,_,num = string.find(str, "(%d+)")
        if (num~="") then
            num = tonumber(num)
            return num, true
        end
    end
    return 0, false
end

local function guardInfo(chosenPlayer)
    local guardModes = {"None","Passive","Hostile","Aggressive","Let always pass"}
    local myInfoText = "\nIndividual guard mode:"

    local days, setTime = chosenPlayer:getQuestProgress(192)
    local daysInSec = (days/3)*24*60*60
    if days ~= 0 then
        if (world:getTime("unix") - setTime >= daysInSec) then
            days = nil
        else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
        end
    end
    if days == 0 then
        myInfoText = myInfoText.."\nCadomyr: "..guardModes[chosenPlayer:getQuestProgress(191)+1].." (permanent)"
    elseif days == nil then
        myInfoText = myInfoText.."\nCadomyr: None (permanent)"
    else
        myInfoText = myInfoText.."\nCadomyr: "..guardModes[chosenPlayer:getQuestProgress(191)+1].." ("..days.." days left)"
    end

    days, setTime = chosenPlayer:getQuestProgress(194)
    daysInSec = (days/3)*24*60*60
    if days ~= 0 then
        if  (world:getTime("unix") - setTime >= daysInSec) then
            days = nil
        else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
        end
    end
    if days == 0 then
        myInfoText = myInfoText.."\nRunewick: "..guardModes[chosenPlayer:getQuestProgress(193)+1].." (permanent)"
    elseif days == nil then
        myInfoText = myInfoText.."\nRunewick: None (permanent)"
    else
        myInfoText = myInfoText.."\nRunewick: "..guardModes[chosenPlayer:getQuestProgress(193)+1].." ("..days.." days left)"
    end

    days, setTime = chosenPlayer:getQuestProgress(196)
    daysInSec = (days/3)*24*60*60
    if days ~= 0 then
        if  (world:getTime("unix") - setTime >= daysInSec) then
            days = nil
        else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
        end
    end
    if days == 0 then
        myInfoText = myInfoText.."\nGalmair: "..guardModes[chosenPlayer:getQuestProgress(195)+1].." (permanent)"
    elseif days == nil then
        myInfoText = myInfoText.."\nGalmair: None (permanent)"
    else
        myInfoText = myInfoText.."\nGalmair: "..guardModes[chosenPlayer:getQuestProgress(195)+1].." ("..days.." days left)"
    end

    return myInfoText
end

local function changeRankpoints(user, modifier, value, faction, radius)
    --check if the points shall be added or removed
    local text

    if modifier == "add" then
        text = "added"
    elseif modifier == "sub" then
        text = "removed"
        value = -value
    else
        return
    end
    if radius == nil then
        radius = 5
    end
    local player_list = world:getPlayersInRangeOf(user.pos, radius)
    if player_list[1]~=nil then
        for i=1, #(player_list) do
            local Factionvalues = factions.getFaction(player_list[i])
            if faction == nil or faction == 99 then
                factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value)
                user:inform("You just "..text.." "..value.." rankpoints to everyone in a radius of ".. radius.." ("..player_list[i].name..").")
                user:logAdmin(text .. " " .. value .. " rankpoints to character " .. player_list[i].name)
            elseif tonumber(faction) == tonumber(Factionvalues.tid) then
                factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value)
                user:inform("You just "..text.." "..value.." rankpoints to "..player_list[i].name.." of the faction "..factions.getTownNameByID(Factionvalues.tid).." in a radius of ".. radius..".")
                user:logAdmin(text .. " " ..value.. " rankpoints to character " .. player_list[i].name .. " of the faction " .. factions.getTownNameByID(Factionvalues.tid))
            end
        end
    end
end

local function changeRankpointsInRadius(user)
    local cbRadius = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputString = dialog:getInput()
        if (string.find(inputString,"(%a+) (%d+) (%d+) (%d+)") ~= nil) then
            local _, _, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+) (%d+)")
            value=tonumber(value)
            faction=tonumber(faction)
            radius=tonumber(radius)
            changeRankpoints(user,modifier,value,faction,radius)
        elseif (string.find(inputString,"(%a+) (%d+) (%d+)") ~= nil) then
            local _, _, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+)")
            faction=tonumber(faction)
            value=tonumber(value)
            changeRankpoints(user,modifier,value,faction,radius)
        elseif (string.find(inputString,"(%a+) (%d+)") ~= nil) then
            local _, _, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+)")
            value=tonumber(value)
            changeRankpoints(user,modifier,value,faction,radius)
        else
            user:inform("Sorry, I didn't understand you.")
            changeRankpointsInRadius(user) -- re-call dialog
        end
    end
    local idChange = InputDialog("Add/Subtract rankpoints in radius", "Usage: <modifier> <value> <faction> <radius>\nPossible values:\nmodifier: <add|sub> \nfaction: <1|2|3|99|nil> (= cadomyr|runewick|galmair|all|all)\nradius: <1|2|...|nil> (nil means default: 5)", false, 255, cbRadius)
    user:requestInputDialog(idChange)
end

function factionHandling(user, SourceItem)

    local cbFaction = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()
        if (index == 0) then -- get/set for specific player
            local playersTmp = world:getPlayersInRangeOf(user.pos, 25)
            local players = {user}
            for _,player in pairs(playersTmp) do
                if (player.id ~= user.id) then
                    table.insert(players, player)
                end
            end
            local cbChoosePlayer = function (subdialog)
                if (not subdialog:getSuccess()) then
                    return
                end
                local chosenPlayer = players[subdialog:getSelectedIndex()+1]
                local faction = factions.getFaction(chosenPlayer)
                local cbSetFactionValue = function (subsubdialog)
                    if (not subsubdialog:getSuccess()) then
                        return
                    end
                    local ind = subsubdialog:getSelectedIndex()
                    -- change town
                    if (ind < 4) then
                        faction.tid = ind
                        faction.rankpoints = 0
                        factions.setFaction(chosenPlayer, faction)
                        user:logAdmin("changes faction of character " .. chosenPlayer.name .. " to " .. factions.getMembershipByName(chosenPlayer))
                    --change towncount
                    elseif (ind == 4) then
                        local cbSetCount = function (subsubsubdialog)
                            if (not subsubsubdialog:getSuccess()) then
                                return
                            end
                            local countValue, okay = String2Number(subsubsubdialog:getInput())
                            if (not okay) then
                                user:inform("no number")
                                return
                            end
                            local oldValue = faction.towncnt
                            faction.towncnt = countValue
                            factions.setFaction(chosenPlayer, faction)
                            user:logAdmin("changes town count of character " .. chosenPlayer.name .. " from " .. oldValue .. " to " .. countValue)
                        end
                        user:requestInputDialog(InputDialog("Set town count", "", false, 255, cbSetCount))
                    --change the rankpoints
                    elseif (ind == 5) then
                        local cbSetRank = function (subsubsubdialog)
                            if (not subsubsubdialog:getSuccess()) then
                                return
                            end
                            local rankpoints, okay = String2Number(subsubsubdialog:getInput())
                            if (not okay) then
                                user:inform("no number")
                                return
                            end
                            if factions.getMembership(chosenPlayer) > 0 and factions.getMembership(chosenPlayer) < 4 then
                                local oldValue = faction.rankpoints
                                factions.setRankpoints(chosenPlayer, rankpoints)
                                user:logAdmin("changes rankpoints of character " .. chosenPlayer.name .. " from " .. oldValue .. " to " .. rankpoints)
                            else
                                user:inform("Player does not belong to any faction. Rankpoints not changed.")
                            end
                        end
                        user:requestInputDialog(InputDialog("Set rankpoints", "Every 100 points there is a new rank.\nE.g. 300-399 points is rank 4.\nThere are 7 normal and 3 special ranks plus the leader.", false, 255, cbSetRank))
                    --change special rank
                    elseif (ind == 6) then
                        local cbSetSpecialRank = function (subsubsubdialog)
                            if (not subsubsubdialog:getSuccess()) then
                                return
                            end
                            local _, oldRank = factions.getRank(chosenPlayer, true)
                            local success
                            local subindex = subsubsubdialog:getSelectedIndex()
                            if subindex == 0 then -- demoting
                                success = factions.setSpecialRank(chosenPlayer, 0)
                            else -- promoting
                                success = factions.setSpecialRank(chosenPlayer, factions.highestRank+tonumber(subindex))
                            end

                            if success == false and factions.getRankpoints(chosenPlayer) < (factions.highestRank-1)*100 then
                                user:inform("Rangchange failed. Player has not enough rankpoints. Current rankpoints: "..factions.getRankpoints(chosenPlayer))
                            elseif success == true then
                                user:inform("Rankchange for "..chosenPlayer.name.." successful.")
                                local _, newRank = factions.getRank(chosenPlayer, true)
                                user:logAdmin("changes special rank of character " .. chosenPlayer.name .. " from " .. oldRank .. " to " .. newRank)
                            else
                                user:inform("Rangchange failed for unknown reasons. Please inform a developer.")
                            end
                    end

                    local infoText = ""
                    local sd = SelectionDialog("Special rank", infoText, cbSetSpecialRank)
                    sd:addOption(0, "Demote")
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 8))
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 9))
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 10))
                    user:requestSelectionDialog(sd)
                end
             end

            --general faction part
            local infoText = "Town: " .. factions.getMembershipByName(chosenPlayer)
            infoText = infoText .. "\nChanged towns already (town count): " .. faction.towncnt
            if (factions.townRanks[faction.tid] ~= nil and factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
                local germanRank, englishRank = factions.getRank(chosenPlayer, true)
                infoText = infoText .. "\nRank: " .. englishRank .. "/" .. germanRank
            else
                infoText = infoText .. "\nRank: no rank " .. faction.rankTown
            end
            infoText = infoText .. "\nExact rankpoints: " .. faction.rankpoints
            infoText = infoText .. guardInfo(chosenPlayer)
            local sd = SelectionDialog("Set faction value", infoText, cbSetFactionValue)
            sd:addOption(0, "Change town to None")
            sd:addOption(0, "Change town to Cadomyr")
            sd:addOption(0, "Change town to Runewick")
            sd:addOption(0, "Change town to Galmair")
            sd:addOption(0, "Change town count")
            sd:addOption(0, "Change rankpoints")
            sd:addOption(0, "Change special rank")
            user:requestSelectionDialog(sd)
            end

            --general playerchoosing part
            local sd = SelectionDialog("Get/Set faction values for ...", "First choose a player:", cbChoosePlayer)
            local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
            for _,player in ipairs(players) do
                local race = math.min(player:getRace()+1, #raceNames)
                sd:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
            user:requestSelectionDialog(sd)

        -- rankpoints in radius
        elseif (index == 1) then
            changeRankpointsInRadius(user)

        -- guard modes
        elseif (index == 2) then
            local factionIds = {0,1,2,3}
            local cbFirstFaction = function (subdialog)
                if (not subdialog:getSuccess()) then
                    return
                end
                local firstFaction = factionIds[subdialog:getSelectedIndex()+1]
                local modeStrings = {}
                modeStrings[factions.RELATION_SELF] = "self"
                modeStrings[factions.RELATION_NEUTRAL] = "neutral"
                modeStrings[factions.RELATION_HOSTILE] = "hostile"
                modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
                modeStrings[factions.RELATION_FRIENDLY] = "friendly"
                modeStrings[factions.RELATION_ACCEPTED] = "accepted player"
                local modeValues = {factions.RELATION_FRIENDLY, factions.RELATION_NEUTRAL, factions.RELATION_HOSTILE, factions.RELATION_AGGRESSIVE}
                local cbSecondFaction = function (subsubdialog)
                    if (not subsubdialog:getSuccess()) then
                        return
                    end
                    local secondFaction = factionIds[subsubdialog:getSelectedIndex()+1]
                    local cbSetMode = function (subsubsubdialog)
                        if (not subsubsubdialog:getSuccess()) then
                            return
                        end
                        local mode = modeValues[subsubsubdialog:getSelectedIndex()+1]
                        factions.setFactionRelation(firstFaction, secondFaction, mode)
                        user:logAdmin("changes guard mode of " .. factions.getTownNameByID(firstFaction) .. " with respect to " .. factions.getTownNameByID(secondFaction) .. " to " .. modeStrings[mode])
                    end
                    local sd = SelectionDialog("Set guard modes", "Set guard modes of " .. factions.getTownNameByID(firstFaction) .. " with respect to " .. factions.getTownNameByID(secondFaction) .. " to ...", cbSetMode)
                    for _,m in ipairs(modeValues) do
                        sd:addOption(0,modeStrings[m])
                    end
                    user:requestSelectionDialog(sd)
                end
                local sd = SelectionDialog("Guard modes", "Set guard modes of " .. factions.getTownNameByID(firstFaction) .. " with respect to ...", cbSecondFaction)
                for _,f in ipairs(factionIds) do
                    sd:addOption(0,factions.getTownNameByID(f) .. ": " .. modeStrings[factions.getFactionRelation(firstFaction, f)])
                end
                user:requestSelectionDialog(sd)
            end
            local sd = SelectionDialog("Get/Set guard modes", "For which faction do you want to get/set values?", cbFirstFaction)
            for _,f in ipairs(factionIds) do
                sd:addOption(0,factions.getTownNameByID(f))
            end
            user:requestSelectionDialog(sd)

        -- licence
        elseif (index == 3) then
            local factionIds = {0,1,2,3}
            local cbFirstLicence = function (subdialog)
                if (not subdialog:getSuccess()) then
                    return
                end
                local FirstLicence = factionIds[subdialog:getSelectedIndex()+1]
                local licenceStrings = {}
                licenceStrings[licence.PERMISSION_NONE] = "Permission for static tools is restricted"
                licenceStrings[licence.PERMISSION_ACTIVE] = "Permission for static tools is granted"
                local licenceValues = {licence.PERMISSION_NONE, licence.PERMISSION_ACTIVE}
                local cbSecondLicence = function (subsubdialog)
                    if (not subsubdialog:getSuccess()) then
                        return
                    end
                    local SecondLicence = factionIds[subsubdialog:getSelectedIndex()+1]
                    local cbSetLicence = function (subsubsubdialog)
                        if (not subsubsubdialog:getSuccess()) then
                            return
                        end
                        local newLicence = licenceValues[subsubsubdialog:getSelectedIndex()+1]
                        licence.SetLicence(FirstLicence, SecondLicence, newLicence)
                        user:logAdmin("changes licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to " .. licenceStrings[newLicence])
                    end
                    local sd = SelectionDialog("Set licence", "Set licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to ...", cbSetLicence)
                    for _,m in ipairs(licenceValues) do
                        sd:addOption(0,licenceStrings[m])
                    end
                    user:requestSelectionDialog(sd)
                end
                local sd = SelectionDialog("Licence", "Set licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to ...", cbSecondLicence)
                for _,f in ipairs(factionIds) do
                    sd:addOption(0,factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)])
                end
                user:requestSelectionDialog(sd)
            end
            local sd = SelectionDialog("Get/Set licence", "For which faction do you want to get/set values?", cbFirstLicence)
            for _,f in ipairs(factionIds) do
                sd:addOption(0,factions.getTownNameByID(f))
            end
            user:requestSelectionDialog(sd)
        elseif index == 4 then
            scheduledRankChanges(user)
        end
    end
    local sd = SelectionDialog("What do you want to do about factions?", "", cbFaction)
    sd:addOption(0,"Get/Set faction values for ...")
    sd:addOption(0,"Add/Subtract rankpoints in radius")
    sd:addOption(0,"Get/Set guard modes")
    sd:addOption(0,"Get/Set licence")
    sd:addOption(0,"Schedule Rank Change Of Offline Player")
    user:requestSelectionDialog(sd)
end

local spawnMonster
local spawnIntervalsPerSpawn
local spawnAmount
local spawnTime
local spawnEffects
local spawnStart
local spawnRemove
local spawnPause
local spawnReset

function spawnPoint(user, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            spawnStart(user, SourceItem)
        elseif index == 2 then
            spawnMonster(user, SourceItem)
        elseif index == 3 then
            spawnIntervalsPerSpawn(user, SourceItem)
        elseif index == 4 then
            spawnAmount(user, SourceItem)
        elseif index == 5 then
            spawnTime(user, SourceItem)
        elseif index == 6 then
            spawnEffects(user, SourceItem)
        elseif index == 7 then
            spawnRemove(user, SourceItem)
        elseif index == 8 then
            spawnPause(user, SourceItem)
        elseif index == 9 then
            spawnReset(user, SourceItem)
        end
    end
    local dialogText = "To which mode do you want to change it?"
    local sd = SelectionDialog("Set the mode of this Spawnpoint.", dialogText, cbSetMode)
    sd:addOption(1,"Start Spawnpoint")
    sd:addOption(0,"Monster ID's ("..tostring(SourceItem:getData("monsters"))..")")
    local intervals = tonumber(SourceItem:getData("intervals"))
    if checkValue(intervals) == false then
        intervals = 1
    end
    sd:addOption(0,"Spawn cycle (ca. "..tostring(intervals*7).." s)")
    sd:addOption(0,"Amount of monsters at the same time ("..tostring(SourceItem:getData("amount"))..")")
    local endurance = tonumber(SourceItem:getData("endurance"))
    if checkValue(endurance) == false then
        endurance = 1
    end
    sd:addOption(0,"Endurance of spawn point ("..tostring(math.floor(endurance*7/3.6)/1000).." h)")
    sd:addOption(0,"Effects (gfx:"..tostring(SourceItem:getData("gfxId")).." sfx;"..tostring(SourceItem:getData("sfxId"))..")")
    sd:addOption(0,"Delete Spawnpoint")
    sd:addOption(0,"Pause Spawnpoint")
    sd:addOption(0,"Reset Spawntool")
    user:requestSelectionDialog(sd)
end

function spawnRemove(user, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        user:inform("You removed the spawnpoint at " ..tostring(gmMonsters[index][1]))
        user:logAdmin("removed the spawnpoint at " ..tostring(gmMonsters[index][1]))
        table.remove(gmSpawnpointSettings, index)
        table.remove(gmMonsters, index)
    end
    local sd = SelectionDialog("Pick a spawnpoint to delete", "To which point do you want to delete?", cbSetMode)
    for _,m in ipairs(gmSpawnpointSettings) do
        sd:addOption(0,tostring(m[2]))
    end
    user:requestSelectionDialog(sd)
end

function spawnPause(user, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if gmSpawnpointSettings[index][9] == 0 then
            user:inform("You paused the spawnpoint at " ..tostring(gmMonsters[index][1]))
            user:logAdmin("paused the spawnpoint at " ..tostring(gmMonsters[index][1]))
            gmSpawnpointSettings[index][9] = 1
        else
            user:inform("You reactivated the spawnpoint at " ..tostring(gmMonsters[index][1]))
            user:logAdmin("reactivated the spawnpoint at " ..tostring(gmMonsters[index][1]))
            gmSpawnpointSettings[index][9] = 0
        end
    end
    local sd = SelectionDialog("Pick a spawnpoint to pause/reactivate", "To which point do you want to pause/reactivate?", cbSetMode)
    for _,m in ipairs(gmSpawnpointSettings) do
        sd:addOption(0,tostring(m[2]))
    end
    user:requestSelectionDialog(sd)
end

function spawnMonster(user, SourceItem)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputString = dialog:getInput()
        if (string.find(inputString,"(%d+)") ~= nil) then
            SourceItem:setData("monsters", inputString)
            world:changeItem(SourceItem)
        else
            user:inform("Enter MonsterID")
        end
    end
    user:requestInputDialog(InputDialog("Enter Monster IDs.", "Usage: Enter the IDs of the monsters." ,false, 255, cbInputDialog))
end

function spawnIntervalsPerSpawn(user, SourceItem)
    -- Write down how many Mobs shall spawn per Minute
    -- If input contains number, sets input to Data "intervals"
    local cbInputDialog = function (dialog)
    if (not dialog:getSuccess()) then
        return
    end
    local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local _, _, intervals = string.find(input,"(%d+)")
            SourceItem:setData("intervals", intervals)
            world:changeItem(SourceItem)
        end
    end
    user:requestInputDialog(InputDialog("Set spawn cycles.", "Usage: Time in between 2 monster spawns.\nSet number of (roughly) 7 second intervals." ,false, 255, cbInputDialog))
end

function spawnAmount(user, SourceItem)
    -- If input contains number, sets input to Data "amount"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            SourceItem:setData("amount", input)
            world:changeItem(SourceItem)
        end
    end
    user:requestInputDialog(InputDialog("Set limit for monsters", "Set max. number of monsters present at the same time" ,false, 255, cbInputDialog))
end

function spawnTime(user, SourceItem)
    -- If input contains number, sets input to Data "endurance"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            SourceItem:setData("endurance", input)
            world:changeItem(SourceItem)
        end
    end
    user:requestInputDialog(InputDialog("Set how long the spawn shall take place.", "Usage: Set the amount of total intervals (ca. 7s)." ,false, 255, cbInputDialog))
end

function spawnEffects(user, SourceItem)
    -- If input contains number, sets input to Data "endurance"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+)") ~= nil) then
            local _, _, gfxId, sfxId = string.find(input,"(%d+) (%d+)")
            gfxId = tonumber(gfxId)
            sfxId = tonumber(sfxId)
            SourceItem:setData("sfxId", sfxId)
            SourceItem:setData("gfxId", gfxId)
            world:changeItem(SourceItem)
        elseif (string.find(input,"(%d+)") ~= nil) then
            SourceItem:setData("gfxId", input)
            world:changeItem(SourceItem)
        end
    end
    user:requestInputDialog(InputDialog("Set the graphic and sound appearing at spawn", "Usage: Enter a gfxId [sfxId]" ,false, 255, cbInputDialog))
end

local function checkData(SourceItem,data)
    if SourceItem:getData(data) == "" then
        SourceItem:setData(data, "0")
        world:changeItem(SourceItem)
        return false
    elseif SourceItem:getData(data) == "0" then
        return false
    else
        return true
    end
end

function spawnStart(user, SourceItem)

    local spawnPos = common.GetFrontPosition(user)

    checkData(SourceItem,"intervals")
    checkData(SourceItem,"endurance")
    checkData(SourceItem,"amount")
    checkData(SourceItem,"gfxId")
    checkData(SourceItem,"sfxId")

    local intervals = tonumber(SourceItem:getData("intervals"))
    local endurance = tonumber(SourceItem:getData("endurance"))
    local amount = tonumber(SourceItem:getData("amount"))
    local gfxId = tonumber(SourceItem:getData("gfxId"))
    local sfxId = tonumber(SourceItem:getData("sfxId"))
    local monsters = tostring(SourceItem:getData("monsters"))

    local length = #gmSpawnpointSettings +1

    --Converts monsters String into monsterIds Array
    local counter = 0
    local fin = 1
    local monsterIds = {}

    while fin <= string.len(monsters) do

        if (string.find(monsters,"(%d+)",fin) ~= nil) then

            local _, b, monsterId = string.find(monsters,"(%d+)",fin)
            fin = b + 1
            counter = counter +1
            monsterIds[counter]    = tonumber(monsterId)
        else
            user:inform("Enter MonsterID")
--            fin = string.len(inputNumber)
            return
        end
    end

    if checkData(SourceItem,"monsters") == true then
        table.insert(gmSpawnpointSettings, length, {monsterIds, spawnPos, amount, intervals, endurance, gfxId, sfxId,0 ,0})
        table.insert(gmMonsters, length, {spawnPos})
        user:inform("You added a spawnpoint at " .. tostring(gmSpawnpointSettings[length][2]))
        user:logAdmin("added a spawnpoint at " .. tostring(gmSpawnpointSettings[length][2]))
        scheduledFunction.registerFunction(2, function() spawnGM() end)
    else
        user:inform("Enter MonsterID")
    end
end

function spawnReset(user, SourceItem)

    SourceItem:setData("monsters", "0")
    SourceItem:setData("intervals", "0")
    SourceItem:setData("endurance", "0")
    SourceItem:setData("amount", "0")
    SourceItem:setData("gfxId", "0")
    SourceItem:setData("sfxId", "0")
    world:changeItem(SourceItem)
end


function M.LookAtItem(user, Item)
    lookat.SetSpecialDescription(Item, "Verwende die Kelle zum Aufrufen der Funktionen (items, weather, factions, spawnpoints).", "Use the trowel to pick a function (items, weather, factions, spawnpoints).")
    lookat.SetSpecialName(Item, "Kelle", "Trowel")
    return lookat.GenerateLookAt(user, Item, lookat.METAL)
end

function M.UseItemWithField(user, SourceItem, TargetPos)
    local Field=world:getField(TargetPos)
    user:inform("This field has the ID: "..Field:tile())
end

function spawnGM()
    local mon;
    if gmSpawnpointSettings[1] == nil then
        return
    end
    for i=1, #gmSpawnpointSettings do
        local monsterIds = gmSpawnpointSettings[i][1];
        local position = gmSpawnpointSettings[i][2];
        local amount = gmSpawnpointSettings[i][3];
        local intervals = gmSpawnpointSettings[i][4];
        local endurance = gmSpawnpointSettings[i][5];
        local gfxId = gmSpawnpointSettings[i][6];
        local sfxId = gmSpawnpointSettings[i][7];
        local pause = gmSpawnpointSettings[i][9];

        local removed = false -- remove spawnpoints with portals destoyed by sand
        if removePositions[tostring(position.x) .. " " .. tostring(position.y) .. " " .. tostring(position.z)] then
            table.remove(gmSpawnpointSettings, i)
            table.remove(gmMonsters, i)
            removed = true
        end
        --sets/checks 8 array pos as counter
        if checkValue(pause) == false and removed == false then
        if gmSpawnpointSettings[i][8] == nil then
            gmSpawnpointSettings[i][8] = 0;
        else
            gmSpawnpointSettings[i][8] = gmSpawnpointSettings[i][8]+1;
        end
        if checkValue(intervals) == false then
            intervals = 1
        end
        if gmSpawnpointSettings[i][8] % intervals == 0 then
            --keeps counter from overflow
            if checkValue(endurance) == false then
                gmSpawnpointSettings[i][8] = 0
            end
            if #gmMonsters[i]-1 < amount then
                updateMonsters(gmMonsters,i,position);
                mon = world:createMonster(monsterIds[math.random(1,#monsterIds)], position,10);
                if isValidChar(mon) then
                    table.insert(gmMonsters[i],mon);
                    --does GFX with spawn
                    if checkValue(gfxId) == true then
                        world:gfx(gfxId,position)
                    end
                    --Does SFX with spawn
                    if  checkValue(sfxId) == true then
                        world:makeSound(sfxId,position)
                    end
                end
            else
                updateMonsters(gmMonsters,i,position);
            end
        end
        --Removes spawnpoint if he reaches the maximum number of cycles
        if checkValue(endurance) == true then
            if gmSpawnpointSettings[i][8] >= endurance then
                table.remove(gmSpawnpointSettings, i)
                table.remove(gmMonsters, i)
            end
        end
        end
    end
    removePositions = {}
    if #gmSpawnpointSettings > 0 then
        scheduledFunction.registerFunction(2, function() spawnGM() end)
    end
end


function updateMonsters(array,number,basePosition)
    if #array[number] > 1 then
        for i = #array[number], 2, -1 do
            local mon = array[number][i]
            if not isValidChar(mon) then
                table.remove(array[number], i)
            elseif not mon:isInRangeToPosition(basePosition,SPAWN_MONSTER_RUN_AWAY) then
                local playerInSight = world:getPlayersInRangeOf(mon.pos,SPAWN_PLAYER_OUT_OF_SIGHT)
                if #playerInSight == 0 then
                    local targetPos = common.getFreePos(basePosition, 5)
                    mon:warp(targetPos)
                end
            end
        end
    end
end

local function createCustomInformPotion(user, potionID)
local input
local input2
    local callback2 = function(dialog2)
        if not dialog2:getSuccess() then
            return
        end
        input2 = dialog2:getInput()
        common.CreateItem(user,tonumber(potionID),1,999,{["customPotion"]=input,["customPotionDE"]=input2})
    end
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        input = dialog:getInput()
        user:requestInputDialog(InputDialog("Custom Inform Potion", "Now insert the German inform.",false, 255, callback2))
    end
user:requestInputDialog(InputDialog("Custom Inform Potion", "Write in the English inform you want the consumption of the potion to bring, EG:'As you drink the potion, you feel...' ",false,255,callback))
end

local function createPotion(user, potionID, potionEffect)
local potionAmount
local potionQuality
local _
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            _, _, potionQuality = string.find(input,"(%d+)")
        end
        local callback2 = function(dialog2)
            if not dialog:getSuccess() then
                return
            end
            local input2 = dialog2:getInput()
            if (string.find(input2,"(%d+)")~=nil) then
                _, _, potionAmount = string.find(input2,"(%d+)")
            end
            local callback3 = function(dialog3)
                if not dialog:getSuccess() then
                    return
                end
                local potionName = dialog3:getInput()
                common.CreateItem(user,tonumber(potionID),tonumber(potionAmount),tonumber(potionQuality),{["potionEffectId"]=tonumber(potionEffect),["descriptionEn"]=potionName,["descriptionDe"]=potionName})
            end
            user:requestInputDialog(InputDialog("Potion Creation", "What do you want to label your potions?",false,255,callback3))
        end
        if tonumber(potionQuality) > tonumber("999") then
            user:inform("Number can't be higher than 999.")
        else
            user:requestInputDialog(InputDialog("Potion creation", "How many potions do you wish to create?",false,255,callback2))
        end
    end
user:requestInputDialog(InputDialog("Potion creation", "What quality should the potions have (Max 999).",false,255,callback))
end
local function customPotionInput(user, potionType, potionID)
local potionEffect
local _
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            _, _, potionEffect = string.find(input,"(%d+)")
            createPotion(user, tostring(potionID), tostring(potionEffect))
        end
    end
    if potionType == "Amethyst" then
        user:requestInputDialog(InputDialog("Potion creation", "Add the custom value.\nExample: '95559555' would be a Health Potion.\nValues: 9 = +4, 5 = 0, 1 = -4.\n[1]Heal[2]Mana[3]Food[4]Antidote\n[5]HoT[6]MoT [7]FoT  [8]AoT       ",false,255,callback))
    elseif potionType == "Ruby" then
        user:requestInputDialog(InputDialog("Potion creation", "Add the custom value.\nExample: '95559555' would be a Health Potion.\nValues: 9 = +4, 5 = 0, 1 = -4.\n[1]Str[2]Int[3]Dex[4]Per\n[5]Con[6]Ess[7]Agi[8]Wil",false,255,callback))
    end
end
local function potionTypeSelection(user, potionType)
    local callback1 = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        if index == 1 then
            customPotionInput(user, potionType, "166")
        elseif index == 2 then
            createPotion(user,"166","95559555")
        elseif index == 3 then
            createPotion(user,"166","15551555")
        elseif index == 4 then
            createPotion(user,"166","59555955")
        elseif index == 5 then
            createPotion(user,"166","51555155")
        elseif index == 6 then
            createPotion(user,"166","55955595")
        elseif index == 7 then
            createPotion(user,"166","55155515")
        elseif index == 8 then
            createPotion(user,"166","55595559")
        elseif index == 9 then
            createPotion(user,"166","55515551")
        elseif index == 10 then
            createPotion(user,"166","95599559")
        elseif index == 11 then
            createPotion(user,"166","15511551")
        elseif index == 12 then
            createPotion(user,"166","99999999")
        elseif index == 13 then
            createPotion(user,"166","11111111")
        elseif index == 14 then
            createPotion(user,"166","10")
        elseif index == 15 then
            createCustomInformPotion(user, "166")
        end
    end
    local callback2 = function(dialog2)
        if not dialog2:getSuccess() then
            return
        end
        local index = dialog2:getSelectedIndex() +1
        if index == 1 then
            customPotionInput(user, potionType, "59")
        elseif index == 2 then
            createPotion(user,"59","59555959")
        elseif index == 3 then
            createPotion(user,"59","95999595")
        elseif index == 4 then
            createPotion(user,"59","99999999")
        elseif index == 5 then
            createPotion(user,"59","11111111")
        elseif index == 6 then
            createCustomInformPotion(user, "59")
        end
    end
    local callback3 = function(dialog3)
        if not dialog3:getSuccess() then
            return
        end
        local index = dialog3:getSelectedIndex() +1
        if index == 1 then
            createPotion(user,"329","560")
        elseif index == 2 then
            createPotion(user,"329","531")
        elseif index == 3 then
            createPotion(user,"329","530")
        elseif index == 4 then
            createPotion(user,"329","551")
        elseif index == 5 then
            createPotion(user,"329","550")
        elseif index == 6 then
            createPotion(user,"329","501")
        elseif index == 7 then
            createPotion(user,"329","500")
        elseif index == 8 then
            createPotion(user,"329","521")
        elseif index == 9 then
            createPotion(user,"329","520")
        elseif index == 10 then
            createPotion(user,"329","541")
        elseif index == 11 then
            createPotion(user,"329","540")
        elseif index == 12 then
            createPotion(user,"329","511")
        elseif index == 13 then
            createPotion(user,"329","510")
        elseif index == 14 then
            createCustomInformPotion(user, "329")
        end
    end
    local callback4 = function(dialog4)
        if not dialog4:getSuccess() then
            return
        end
        local index = dialog4:getSelectedIndex() +1
        if index == 1 then
            createPotion(user,"327","301")
        elseif index == 2 then
            createPotion(user,"327","302")
        elseif index == 3 then
            createPotion(user,"327","304")
        elseif index == 4 then
            createPotion(user,"327","306")
        elseif index == 5 then
            createPotion(user,"327","307")
        elseif index == 6 then
            createPotion(user,"327","309")
        elseif index == 7 then
            createPotion(user,"327","316")
        elseif index == 8 then
            createPotion(user,"327","317")
        elseif index == 9 then
            createPotion(user,"327","311")
        elseif index == 10 then
            createPotion(user,"327","312")
        elseif index == 11 then
            createPotion(user,"327","314")
        elseif index == 12 then
            createPotion(user,"327","320")
        elseif index == 13 then
            createCustomInformPotion(user, "327")
        end
    end
    local callback5 = function(dialog5)
        if not dialog5:getSuccess() then
            return
        end
        local index = dialog5:getSelectedIndex() +1
        if index == 1 then
            createPotion(user,"330","600")
        elseif index == 2 then
            createPotion(user,"330","607")
        elseif index == 3 then
            createPotion(user,"330","603")
        elseif index == 4 then
            createPotion(user,"330","604")
        elseif index == 5 then
            createPotion(user,"330","601")
        elseif index == 6 then
            createPotion(user,"330","606")
        elseif index == 7 then
            createPotion(user,"330","605")
        elseif index == 8 then
            createPotion(user,"330","602")
        elseif index == 9 then
            createCustomInformPotion(user, "330")
        end
    end
    local callback6 = function(dialog6)
        if not dialog6:getSuccess() then
            return
        end
        local index = dialog6:getSelectedIndex() +1
        if index == 1 then
            createPotion(user,"165","400")
        elseif index == 2 then
            createPotion(user,"165","401")
        elseif index == 3 then
            createPotion(user,"165","402")
        elseif index == 4 then
            createPotion(user,"165","403")
        elseif index == 5 then
            createPotion(user,"165","404")
        elseif index == 6 then
            createPotion(user,"165","405")
        elseif index == 7 then
            createPotion(user,"165","406")
        elseif index == 8 then
            createCustomInformPotion(user, "165")
        end
    end
    local callback7 = function(dialog7)
        if not dialog7:getSuccess() then
            return
        end
        local index = dialog7:getSelectedIndex() +1
        if index == 1 then
            createCustomInformPotion(user,"165")
        elseif index == 2 then
            createCustomInformPotion(user,"166")
        elseif index == 3 then
            createCustomInformPotion(user,"327")
        elseif index == 4 then
            createCustomInformPotion(user,"330")
        elseif index == 5 then
            createCustomInformPotion(user,"59")
        elseif index == 6 then
            createCustomInformPotion(user,"329")
        elseif index == 7 then
            createCustomInformPotion(user,"167")
        elseif index == 8 then
            createCustomInformPotion(user,"328")
        elseif index == 9 then
            createCustomInformPotion(user,"331")
        elseif index == 10 then
            createCustomInformPotion(user,"1063")
        elseif index == 11 then
            createCustomInformPotion(user,"1164")
        elseif index == 12 then
            createCustomInformPotion(user,"1165")
        elseif index == 13 then
            createCustomInformPotion(user,"1166")
        elseif index == 14 then
            createCustomInformPotion(user,"1167")
        elseif index == 15 then
            createCustomInformPotion(user,"1168")
        elseif index == 16 then
            createCustomInformPotion(user,"1169")
        end
    end
    local dialog = SelectionDialog("Amethyst Potions", "Select which type of Amethyst Potion you want to create.", callback1)
    local dialog2 = SelectionDialog("Ruby Potions", "Select which type of Ruby Potion you want to create.", callback2)
    local dialog3 = SelectionDialog("Shapeshifters", "Select which type of shapeshifter you want to create.", callback3)
    local dialog4 = SelectionDialog("Bombs", "Select which type of bomb you want to create.", callback4)
    local dialog5 = SelectionDialog("Language Potions", "Select which type of language potion you want to create.", callback5)
    local dialog6 = SelectionDialog("Quality Raisers", "Select which type of potion you want to create a quality raiser for.", callback6)
    local dialog7 = SelectionDialog("Custom Informs", "Select which type of potion you want to create a custom inform for.", callback7)
    dialog:addOption(0, "Custom Potion")
    dialog:addOption(0, "Health Potion")
    dialog:addOption(0, "Un-Health Potion")
    dialog:addOption(0, "Mana Potion")
    dialog:addOption(0, "Anti-Mana Potion")
    dialog:addOption(0, "Nutritional Potion")
    dialog:addOption(0, "Anti-Nutrition Potion")
    dialog:addOption(0, "Antidote")
    dialog:addOption(0, "Poison")
    dialog:addOption(0, "Potent Antidote")
    dialog:addOption(0, "Potent Poison")
    dialog:addOption(0, "Elixir of Life")
    dialog:addOption(0, "Elixir of Death")
    dialog:addOption(0, "Dragon's Breath")
    dialog2:addOption(0, "Custom Potion")
    dialog2:addOption(0, "Mage Potion")
    dialog2:addOption(0, "Warrior Potion")
    dialog2:addOption(0, "Potion of Power")
    dialog2:addOption(0, "Potion of Weakness")
    dialog3:addOption(0, "Houndsblood")
    dialog3:addOption(0, "Female Elf")
    dialog3:addOption(0, "Male Elf")
    dialog3:addOption(0, "Female Lizardman")
    dialog3:addOption(0, "Male Lizardman")
    dialog3:addOption(0, "Female Human")
    dialog3:addOption(0, "Male Human")
    dialog3:addOption(0, "Female Halfling")
    dialog3:addOption(0, "Male Halfling")
    dialog3:addOption(0, "Female Orc")
    dialog3:addOption(0, "Male Orc")
    dialog3:addOption(0, "Female Dwarf")
    dialog3:addOption(0, "Male Dwarf")
    dialog4:addOption(0, "Small Explosive")
    dialog4:addOption(0, "Medium Explosive")
    dialog4:addOption(0, "Big Explosive")
    dialog4:addOption(0, "Small Mana Annihilator")
    dialog4:addOption(0, "Medium Mana Annihilator")
    dialog4:addOption(0, "Big Mana Annihilator")
    dialog4:addOption(0, "Small Slime Barrier")
    dialog4:addOption(0, "Big Slime Barrier")
    dialog4:addOption(0, "Small Nutrition Annihilator")
    dialog4:addOption(0, "Medium Nutrition Annihilator")
    dialog4:addOption(0, "Big Nutrition Annihilator")
    dialog4:addOption(0, "Brightrim's Demon Skeleton Weakener")
    dialog5:addOption(0, "Common Language")
    dialog5:addOption(0, "Ancient Language")
    dialog5:addOption(0, "Elven Language")
    dialog5:addOption(0, "Lizardman Language")
    dialog5:addOption(0, "Human Language")
    dialog5:addOption(0, "Halfling Language")
    dialog5:addOption(0, "Orcen Language")
    dialog5:addOption(0, "Dwarven Language")
    dialog6:addOption(0, "Quality Raisers")
    dialog6:addOption(0, "Ruby Potions")
    dialog6:addOption(0, "Bombs")
    dialog6:addOption(0, "Shapeshifters")
    dialog6:addOption(0, "Amethyst Potions")
    dialog6:addOption(0, "Topaz Potions")
    dialog6:addOption(0, "Language Potions")
    dialog7:addOption(0, "Blue Potion")
    dialog7:addOption(0, "Violet Potion")
    dialog7:addOption(0, "Dark Blue Potion")
    dialog7:addOption(0, "White Potion")
    dialog7:addOption(0, "Red Potion")
    dialog7:addOption(0, "Black Potion")
    dialog7:addOption(0, "Yellow Potion")
    dialog7:addOption(0, "Orange Potion")
    dialog7:addOption(0, "Green Potion")
    dialog7:addOption(0, "Light Green Potion")
    dialog7:addOption(0, "Light Blue Sparkling Potion")
    dialog7:addOption(0, "Dark Blue Sparkling Potion")
    dialog7:addOption(0, "Green Sparkling Potion")
    dialog7:addOption(0, "Violet Sparkling Potion")
    dialog7:addOption(0, "Yellow Sparkling Potion")
    dialog7:addOption(0, "Red Sparkling Potion")
    if potionType == "Amethyst" then
        user:requestSelectionDialog(dialog)
    elseif potionType == "Ruby" then
        user:requestSelectionDialog(dialog2)
    elseif potionType == "Obsidian" then
        user:requestSelectionDialog(dialog3)
    elseif potionType == "Sapphire" then
        user:requestSelectionDialog(dialog4)
    elseif potionType == "Diamond" then
        user:requestSelectionDialog(dialog5)
    elseif potionType == "Emerald" then
        user:requestSelectionDialog(dialog6)
    elseif potionType == "None" then
        user:requestSelectionDialog(dialog7)
    end
end

local function potionSelection(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            potionTypeSelection(user, "Amethyst")
        elseif index == 2 then
            potionTypeSelection(user, "Ruby" )
        elseif index == 3 then
            potionTypeSelection(user, "Obsidian" )
        elseif index == 4 then
            potionTypeSelection(user, "Sapphire" )
        elseif index == 5 then
            potionTypeSelection(user, "Diamond" )
        elseif index == 6 then
            potionTypeSelection(user, "Emerald" )
        elseif index == 7 then
            potionTypeSelection(user, "None" )
        end
    end
    local dialog = SelectionDialog("Potion Creation", "What type of potion do you want to create?", callback)
    dialog:addOption(0, "Amethyst")
    dialog:addOption(0, "Ruby")
    dialog:addOption(0, "Shapeshifter")
    dialog:addOption(0, "Bombs")
    dialog:addOption(0, "Language")
    dialog:addOption(0, "Quality Increaser")
    dialog:addOption(0, "Custom Inform Potions")
    user:requestSelectionDialog(dialog)
end

local function createPortal(user, portalType)
    local x
    local y
    local z
    local amount
    local _
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+) (%d+)")~=nil) then
            _, _, x, y, z = string.find(input,"(%d+) (%d+) (%d+)")
        end
        local callback2 = function(dialog2)
            if not dialog:getSuccess() then
                return
            end
            local input2 = dialog2:getInput()
            if (string.find(input2,"(%d+)")~=nil) then
                _, _, amount = string.find(input2,"(%d+)")
                common.CreateItem(user,tonumber(portalType),tonumber(amount),999,{["destinationCoordsX"]=x,["destinationCoordsY"]=y,["destinationCoordsZ"]=z})
            end
        end
        user:requestInputDialog(InputDialog("Portal creation", "How many portals with these coordinates do you want to create?",false,255,callback2))
    end
user:requestInputDialog(InputDialog("Portal creation", "Set the coordinates the portals should lead to.\nEG:131 609 0",false,255,callback))
end

local function portalsSelection(user)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            createPortal(user, "10")
        elseif index == 2 then
            createPortal(user, "798")
        elseif index == 3 then
            createPortal(user, "1061")
        end
    end
    local dialog = SelectionDialog("Portal creation", "What type of portal do you want to create?", callback)
    dialog:addOption(0, "Blue Portal")
    dialog:addOption(0, "Red Portal")
    dialog:addOption(0, "Portal Book")
    user:requestSelectionDialog(dialog)
end

local function specialItemCreationSpecialEggs(user)

    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local _, _, amount = string.find(input,"(%d+)")
            specialeggs.createSpecialEgg(user, tonumber(amount))
        end
    end
    user:requestInputDialog(InputDialog("Egg creation", "How many special eggs to you want to create? (Notice: Eggs will have a normal wear of 3. Increase manually if needed." ,false, 255, cbInputDialog))
end

local function specialItemCreationMysticalCracker(user)

    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local _, _, amount = string.find(input,"(%d+)")
            mysticalcracker.createMysticalCracker(user, tonumber(amount))
        end
    end
    user:requestInputDialog(InputDialog("Cracker Creation", "How many mystical crackers to you want to create? (Notice: Crackers will have a normal wear of 10. Increase manually if needed." ,false, 255, cbInputDialog))
end

local function specialItemCreationTreasureChest(user)
    local position
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d) (%d)") ~= nil) then
            local _, _, level, persons = string.find(input,"(%d) (%d)")
            if level == nil or tonumber(level) < 0 or tonumber(level) > 9 then
                user:inform("The level of the treasure chest must be a value from 0(no treasure via 1(farmer) to 9(nabranoo).")
                return
            end
            if persons == nil or tonumber(persons) < 1 or tonumber(persons) > 8 then
                user:inform("The number of persons needed to open the treasure chest must be a value from 1 to 8.")
                return
            end
            position = common.GetFrontPosition(user)
            if world:isItemOnField(position) == true then
                user:inform("The place for the chest is not free.")
                return
            end
            spawntreasures.spawnTreasureChest(position, level, persons)
        else
            user:inform("The input :'" .. input .. "' is not corret. Please use e.g. '3 2'.")
        end
    end
    user:requestInputDialog(InputDialog("Treasure Chest Creation", "Please enter level and amount of people needed\nFormat: '[1-9] [1-8]'" ,false, 255, cbInputDialog))
end

local function specialItemCreationGlyphShard(user)
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            if (string.find(input,"[1-7][1-7]") ~= nil) then
                local _, _, level = string.find(input,"(%d+)")
                shard.createShardWithLevelOnUser(user, level)
            else
                local _, _, amount = string.find(input,"(%d+)")
                for i=1, tonumber(amount) do
                    shard.createShardOnUser(user)
                end
            end
        else
            shard.createShardOnUser(user)
        end
    end
    user:requestInputDialog(InputDialog("Glyph Shard Creation",
                                        "Please enter which shard you want to create" ..
                                        "\n- Nothing: A single random shard." ..
                                        "\n- [1-7][1-7]: A singe defined shard." ..
                                        "\n- Other numbers: Number of random shards.",false, 255, cbInputDialog))
end

local function specialItemCreationCreate(user,indexItem)
    if SpecialItem[indexItem][2] then
        if indexItem == 1 then
            specialItemCreationMysticalCracker(user)
        elseif indexItem == 2 then
            specialItemCreationSpecialEggs(user)
        elseif indexItem == 3 then
            specialItemCreationTreasureChest(user)
        elseif indexItem == 18 then
            specialItemCreationGlyphShard(user)
        else
            return
        end
    else
        local cbInputDialog = function (dialog)
            if not dialog:getSuccess() then
                return
            end
            local input = dialog:getInput()
            if (string.find(input,"(%d+)") ~= nil) then
                local _, _, amount = string.find(input,"(%d+)")
                if SpecialItem[indexItem][4] == MagicGem then
                    common.CreateItem(user, SpecialItem[indexItem][3], tonumber(amount), 333,{gemLevel=1})
                else
                    common.CreateItem(user, SpecialItem[indexItem][3], tonumber(amount), 333,nil)
                end
            end
        end
        user:requestInputDialog(InputDialog("Item Creation", "How many "..SpecialItem[indexItem][1].." do you want to create?" ,false, 255, cbInputDialog))
    end
end

local function specialItemCreation(user)
    local validItems = {}
    local validItemsSub = {}

    local cbChooseItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local indexItem = dialog:getSelectedIndex() + 1
        if validItems[indexItem][2] == 0 then
            specialItemCreationCreate(user,validItems[indexItem][1])
        else
        --
            local cbChooseSubItem = function (subdialog)
                if (not subdialog:getSuccess()) then
                    return
                end
                local indexItemSub = subdialog:getSelectedIndex() + 1
                specialItemCreationCreate(user,validItemsSub[indexItemSub][1])
            end
            local sdItemListSub = SelectionDialog("Special Items.", "Choose an item:", cbChooseSubItem)
            local optionSubId = 1
            for i = 1, #(SpecialItem) do
                if SpecialItem[i][5] ==  SpecialItemSubMenu[validItems[indexItem][2]]then
                    sdItemListSub:addOption(SpecialItem[i][3], SpecialItem[i][1])
                    validItemsSub[optionSubId] = {i,0}
                    optionSubId = optionSubId+1
                end
            end
            user:requestSelectionDialog(sdItemListSub)
        --
        end
    end
    local sdItemList = SelectionDialog("Special Items.", "Choose an item:", cbChooseItem)
    local optionId = 1
    for i = 1, #(SpecialItem) do
        if common.IsNilOrEmpty(SpecialItem[i][5]) then
            sdItemList:addOption(SpecialItem[i][3], SpecialItem[i][1])
            validItems[optionId] = {i,0}
            optionId = optionId+1
        end
    end
    for i = 1, #(SpecialItemSubMenu) do
        sdItemList:addOption(0, "Group: "..SpecialItemSubMenu[i])
        validItems[optionId] = {0,i}
        optionId = optionId+1
    end
    user:requestSelectionDialog(sdItemList)
end

local function readScriptVars(user)
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if string.find(input,"([%w]+) ([%w]+)") ~= nil then
            local _, _, varName, varValue = string.find(input,"([%w]+) ([%w]+)")
            local foundVar, currentVar = ScriptVars:find(varName)
            if not foundVar then
                user:inform("The script variable '"..varName.."' does not exists.")
            else
                ScriptVars:set(varName, varValue)
                user:inform("Script variable: '"..varName.."' changed from "..tostring(currentVar).." to "..tostring(varValue))
                user:logAdmin("Script variable: '"..varName.."' changed from "..tostring(currentVar).." to "..tostring(varValue))
            end
        elseif string.find(input,"([%w]+)") ~= nil then
            local _, _, varName = string.find(input,"([%w]+)")
            local foundVar, currentVar = ScriptVars:find(varName)
            if not foundVar then
                user:inform("The script variable '"..varName.."' does not exists.")
            else
                user:inform("Script variable: '"..varName.."' = "..tostring(currentVar))
            end
        end
    end
    user:requestInputDialog(InputDialog("Global Script Variables", "Please enter the name and value of the vaiable."..
                                                                   "\nWithout value you get the value",false, 255, cbInputDialog))
end

function M.saveRemovePosition(thePos)
    if gmSpawnpointSettings[1] == nil then
        return
    end

    for i=1, #gmSpawnpointSettings do
        local position = gmSpawnpointSettings[i][2];
        if thePos == position then
            world:makeSound(4,position)
            table.remove(gmSpawnpointSettings, i)
            table.remove(gmMonsters, i)
        end
    end
end

function M.UseItem(user, SourceItem)
    -- First check for mode change
    local modes = {"Items", "Weather", "Factions", "Spawnpoint", "Special Item Creation", "Script Variables","Teleporter","Harbours", "Portals", "Potions"}
    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if  index == 1 then
            chooseItem(user)
        elseif index == 2 then
            weather(user, SourceItem)
        elseif index == 3 then
            factionHandling(user, SourceItem)
        elseif index == 4 then
            spawnPoint(user, SourceItem)
        elseif index == 5 then
            specialItemCreation(user)
        elseif index == 6 then
            readScriptVars(user)
        elseif index == 7 then
            staticteleporter.gmManageTeleporter(user)
        elseif index == 8 then
            seafaring.gmManagePorts(user)
        elseif index == 9 then
            portalsSelection(user)
        elseif index == 10 then
            potionSelection(user)
        end
    end
    local sd = SelectionDialog("Set mode of this ceiling trowel", "To which mode you want to change?", cbSetMode)
    for _, m in ipairs(modes) do
        sd:addOption(0, m)
    end
    user:requestSelectionDialog(sd)
end

return M
