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


local M = {}

local chooseItem
local changeItem
local weather
local factionHandling
local spawnPoint
local spawnGM
local updateMonsters
local changeItemSelection

local SPAWNDATAS = {}
local gmSpawnpointSettings = {}
local gmMonsters = {}
local SPAWNDATA = {}
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

local function checkValue(input)
    if input == nil or input == 0 then
        return false
    else
        return true
    end
end

function chooseItem(User)

    local dialogTitle = common.GetNLS(User, "Item wählen", "Choose Item")
    local dialogInfoText = common.GetNLS(User, "Wähle den Gegenstand aus, den du bearbeiten möchtest:",  "Please choose an item you wish to edit:")


    local itemsOnChar = {}
    local itemPosOnChar = {}
    local frontItem = common.GetFrontItem(User)
    if (frontItem ~= nil and frontItem.id > 0) then
        table.insert(itemsOnChar, frontItem)
        table.insert(itemPosOnChar, {en="Item in front", de="Item vor dir" })
    end
    --get all the items the char has on him, without the stuff in the backpack
    for i = 1, #(itemOrder) do
        local item = User:getItemAt(itemOrder[i])
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
            changeItemSelection(User, chosenItem)
        else
            User:inform("[ERROR] Something went wrong, please inform a developer.");
        end
    end
    local sdItems = SelectionDialog(dialogTitle, dialogInfoText, cbChooseItem)
    sdItems:setCloseOnMove()
    local itemName, itemPosText
    for i,item in ipairs(itemsOnChar) do
        itemName = world:getItemName(item.id, User:getPlayerLanguage())
        itemPosText = common.GetNLS(User, itemPosOnChar[i].de, itemPosOnChar[i].en)
        sdItems:addOption(item.id,itemName .. " (" .. itemPosText .. ")\n")
    end
    User:requestSelectionDialog(sdItems)
end

local function changeItemNumber(User, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            local a,b,newnumber = string.find(input,"(%d+)")
            TargetItem.number=math.min(1000, tonumber(newnumber))
            world:changeItem(TargetItem)
            User:inform("Amount of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.number)
            User:logAdmin("changed number of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.number)
        else
            User:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(User, TargetItem)
    end
    User:requestInputDialog(InputDialog("Set the mumber of items", "How many "..world:getItemName(TargetItem.id, Player.english).." do you want?" ,false, 255, cbInputDialog))
end

local function changeItemQuality(User, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d)(%d)(%d)")~=nil) then
            local a,b,newqual=string.find(input,"(%d+)")
            TargetItem.quality=tonumber(newqual)
            world:changeItem(TargetItem)
            User:inform("Quality of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.quality)
            User:logAdmin("changed quality of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.quality)
        else
            User:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(User, TargetItem)
    end
    User:requestInputDialog(InputDialog("Set the quality of items", "Enter target quality for: "..world:getItemName(TargetItem.id, Player.english).." \n 101-999; [1-9][01-99] Quality / Durability\nCurrent value: "..tostring(TargetItem.quality) ,false, 255, cbInputDialog))
end

local function changeItemWear(User, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)")~=nil) then
            local a,b,newwear = string.find(input,"(%d+)")
            TargetItem.wear=tonumber(newwear)
            world:changeItem(TargetItem)
            User:inform("Wear of "..world:getItemName(TargetItem.id, Player.english).." set to "..TargetItem.wear)
            User:logAdmin("changed wear of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to "..TargetItem.wear)
        else
            User:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(User, TargetItem)
    end
    User:requestInputDialog(InputDialog("Set the wear of items", "How long "..world:getItemName(TargetItem.id, Player.english).." should need to rot?\n about x * 3 min\nCurrent value: "..tostring(TargetItem.wear) ,false, 255, cbInputDialog))
end

local function changeItemData(User, TargetItem)

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%w+) (.+)")~=nil) then
            local a,b,dataString,newdata = string.find(input,"(%w+) (.+)")
            TargetItem:setData(dataString,newdata)
            world:changeItem(TargetItem)
            User:inform("Data of "..world:getItemName(TargetItem.id, Player.english).." set to key: " ..dataString.." value: "..TargetItem:getData(dataString))
            User:logAdmin("changed data of "..world:getItemName(TargetItem.id, Player.english).."("..TargetItem.id..") to key: " ..dataString.." value: "..TargetItem:getData(dataString))
        else
            User:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(User, TargetItem)
    end
    User:requestInputDialog(InputDialog("Set data of items", "Data for "..world:getItemName(TargetItem.id, Player.english)..".\n Use 'data value'" ,false, 255, cbInputDialog))
end

local function changeItemName(User, TargetItem)
    local newNameDe
    local newNameEn
    local a
    local b

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialogEn = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputEn = dialog:getInput()
        if (string.find(inputEn,"(.+)")~=nil) then
            a,b,newNameEn = string.find(inputEn,"(.+)")
        else
            newNameEn = ""
        end
        local cbInputDialogDe = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local inputDe = dialog:getInput()
            if (string.find(inputDe,"(.+)")~=nil) then
                a,b,newNameDe = string.find(inputDe,"(.+)")
            else
                newNameDe = newNameEn
            end
            if common.IsNilOrEmpty(newNameEn) then
                newNameEn = newNameDe
            end
            if common.IsNilOrEmpty(newNameEn) == false then
                TargetItem:setData("nameDe",newNameDe)
                TargetItem:setData("nameEn",newNameEn)
                world:changeItem(TargetItem)
                User:inform("Name of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newNameEn.." / "..newNameDe)
                User:logAdmin("changed name of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newNameEn.." / "..newNameDe)
            else
                User:inform("Sorry, I didn't understand you.")
            end
            changeItemSelection(User, TargetItem)
        end
        User:requestInputDialog(InputDialog("Set name of items", "German name for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, cbInputDialogDe))
    end
    User:requestInputDialog(InputDialog("Set name of items", "English name for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, cbInputDialogEn))
end

local function changeItemDescription(User, TargetItem)
    local newDescriptionDe
    local newDescriptionEn
    local a
    local b

    if (TargetItem == nil or TargetItem.id == 0) then
        return
    end

    local cbInputDialogEn = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputEn = dialog:getInput()
        if (string.find(inputEn,"(.+)")~=nil) then
            a,b,newDescriptionEn = string.find(inputEn,"(.+)")
        else
            newDescriptionEn = ""
        end
        local cbInputDialogDe = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local inputDe = dialog:getInput()
            if (string.find(inputDe,"(.+)")~=nil) then
                a,b,newDescriptionDe = string.find(inputDe,"(.+)")
            else
                newDescriptionDe = newDescriptionEn
            end
            if common.IsNilOrEmpty(newDescriptionEn) then
                newDescriptionEn = newDescriptionDe
            end
            if common.IsNilOrEmpty(newDescriptionEn) == false then
                TargetItem:setData("descriptionDe",newDescriptionDe)
                TargetItem:setData("descriptionEn",newDescriptionEn)
                world:changeItem(TargetItem)
                User:inform("Description of "..world:getItemName(TargetItem.id, Player.english).." set to: " ..newDescriptionEn.." / "..newDescriptionDe)
                User:logAdmin("changed description of "..world:getItemName(TargetItem.id, Player.english).." to: " ..newDescriptionEn.." / "..newDescriptionDe)
            else
                User:inform("Sorry, I didn't understand you.")
            end
            changeItemSelection(User, TargetItem)
        end
        User:requestInputDialog(InputDialog("Set description of items", "German description for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, cbInputDialogDe))
    end
    User:requestInputDialog(InputDialog("Set description of items", "English description for "..world:getItemName(TargetItem.id, Player.english).."." ,false, 255, cbInputDialogEn))
end

local function changeItemGlyph(User, TargetItem)

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
                User:inform("Item "..world:getItemName(TargetItem.id, Player.english).." cannot be glyphed. Only rings or amulets can contain glyph charges.")
            else
                local a,b,newcharges = string.find(input,"(%d+)")
                glyphs.setRemainingGlyphs(TargetItem,newcharges)
                User:inform("Item "..world:getItemName(TargetItem.id, Player.english).." got "..tostring(newcharges).." glyph charges.")
            end
        else
            User:inform("Sorry, I didn't understand you.")
        end
        changeItemSelection(User, TargetItem)
    end
    User:requestInputDialog(InputDialog("Set the glyph charges of items", "How many charges "..world:getItemName(TargetItem.id, Player.english).." should get?" ,false, 255, cbInputDialog))
end

function changeItemSelection(User, TargetItem)
    local changeItemFunctions = {}
    changeItemFunctions[1] = {"Set Number"}
    changeItemFunctions[2] = {"Set Quality and Durability"}
    changeItemFunctions[3] = {"Set Name"}
    changeItemFunctions[4] = {"Set Description"}
    changeItemFunctions[5] = {"Set Wear"}
    changeItemFunctions[6] = {"Set Data"}
    changeItemFunctions[7] = {"Set Glyph charges"}

    local cbChangeItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            changeItemNumber(User, TargetItem)
        elseif index == 2 then
            changeItemQuality(User, TargetItem)
        elseif index == 3 then
            changeItemName(User, TargetItem)
        elseif index == 4 then
            changeItemDescription(User, TargetItem)
        elseif index == 5 then
            changeItemWear(User, TargetItem)
        elseif index == 6 then
            changeItemData(User, TargetItem)
        elseif index == 7 then
            changeItemGlyph(User, TargetItem)
        end
    end
    local sd = SelectionDialog(world:getItemName(TargetItem.id, Player.english), "Choose the porperty you want to change.", cbChangeItem)
    for i=1, #(changeItemFunctions) do
        sd:addOption(0,changeItemFunctions[i][1])
    end
    User:requestSelectionDialog(sd)
end

function weather(User, SourceItem)

    local currWeather = world.weather

    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"help")~=nil) then
            User:inform("Set cloud density: \"clouds <value>\" - range: 0 - 100")
            User:inform("Set fog density: \"fog <value>\" - range: 0 - 100")
            User:inform("Set wind direction: \"wind dir <value>\" - range: -100 - +100")
            User:inform("Set gust strength: \"gust str <value>\" - range: 0 - 100")
            User:inform("Set percipitation strength: \"per <value>\" - range: 0 - 100")
            User:inform("Set thunderstorm strength: \"thunder <value>\" - range: 0 - 100")
            User:inform("Set temperature: \"temp <value>\" - range: -50 - +50")
        end
        if (string.find(input,"clouds (%d+)")~=nil) then
            local a, b, value = string.find(input"clouds (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.cloud_density = value
                User:inform("cloud density changed to: "..value)
                User:logAdmin("changed cloud densitiy to: "..value)
            else
                User:inform("Failed changing cloud desity: out of range (0-100)")
            end
        end
        if (string.find(input,"fog (%d+)")~=nil) then
            local a, b, value = string.find(input,"fog (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.fog_density = value
                User:inform("fog density changed to: "..value)
                User:logAdmin("changed fog densitiy to: "..value)
            else
                User:inform("Failed changing fog desity: out of range (0-100)")
            end
        end
        if (string.find(input,"wind dir ([-,0-9]+)")~=nil) then
            local a, b, value = string.find(input,"wind dir ([-,0-9]+)")
            value=tonumber(value)
            if (value<101 and value>-101) then
                currWeather.wind_dir = value
                User:inform("wind direction changed to: "..value)
                User:logAdmin("changed wind direction to: "..value)
            else
                User:inform("Failed changing wind direction: out of range (-100 - +100)")
            end
        end
        if (string.find(input,"gust str (%d+)")~=nil) then
            local a, b, value = string.find(input,"gust str (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.gust_strength = value
                User:inform("gust strength changed to: "..value)
                User:logAdmin("changed gust strength to: "..value)
            else
                User:inform("Failed changing gust strength: out of range (0-100)")
            end
        end
        if (string.find(input,"per (%d+)")~=nil) then
            local a, b, value = string.find(input,"per (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.percipitation_strength = value
                User:inform("percipitation strength changed to: "..value)
                User:logAdmin("changed percipitation strength to: "..value)
            else
                User:inform("Failed changing percipitation strength: out of range (0-100)")
            end
        end
        if (string.find(input,"thunder (%d+)")~=nil) then
            local a, b, value = string.find(input,"thunder (%d+)")
            value=tonumber(value)
            if (value<101 and value>-1) then
                currWeather.thunderstorm = value
                User:inform("thunderstorm changed to: "..value)
                User:logAdmin("changed thunderstorm to: "..value)
            else
                User:inform("Failed changing thunderstorm: out of range (0-100)")
            end
        end
        if (string.find(input,"temp ([-,0-9]+)")~=nil) then
            local a, b, value = string.find(input,"temp ([-,0-9]+)")
            value=tonumber(value)
            if (value<51 and value>-51) then
                currWeather.temperature = value
                User:inform("temperature changed to: "..value)
                User:logAdmin("changed temperature to: "..value)
            else
                User:inform("Failed changing temperature: out of range (-50 - +50)")
            end
        end
    end
    User:requestInputDialog(InputDialog("Set an option for the weather", "Possible actions: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value> " ,false, 255, cbInputDialog))

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

    local days, setTime = chosenPlayer:getQuestProgress(194)
    local daysInSec = (days/3)*24*60*60
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

    local days, setTime = chosenPlayer:getQuestProgress(196)
    local daysInSec = (days/3)*24*60*60
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

local function changeRankpoints(User, modifier, value, faction, radius)
    --check if the points shall be added or removed
    local text
    local playerText
    if modifier == "add" then
        text = "added"
        playerText = {"steigt.","advance"}
    elseif modifier == "sub" then
        text = "removed"
        playerText = {"sinkt.","decline"}
        value = -value
    else
        return
    end
    if radius == nil then
        radius = 5
    end
    local player_list = world:getPlayersInRangeOf(User.pos, radius)
    if player_list[1]~=nil then
        for i=1, #(player_list) do
            local Factionvalues = factions.getFaction(player_list[i])
            if faction == nil or faction == 99 then
                factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value)
                User:inform("You just "..text.." "..value.." rankpoints to everyone in a radius of ".. radius.." ("..player_list[i].name..").")
                User:logAdmin(text .. " " .. value .. " rankpoints to character " .. player_list[i].name)
            elseif tonumber(faction) == tonumber(Factionvalues.tid) then
                factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value)
                User:inform("You just "..text.." "..value.." rankpoints to "..player_list[i].name.." of the faction "..factions.getTownNameByID(Factionvalues.tid).." in a radius of ".. radius..".")
                User:logAdmin(text .. " " ..value.. " rankpoints to character " .. player_list[i].name .. " of the faction " .. factions.getTownNameByID(Factionvalues.tid))
            else
                --                return  --bad return, since it would break up as soon someone does not fulfil requirements even if there are more players to be checked.
            end
        end
    end
end

local function changeRankpointsInRadius(User)
    local cbRadius = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputString = dialog:getInput()
        if (string.find(inputString,"(%a+) (%d+) (%d+) (%d+)") ~= nil) then
            local a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+) (%d+)")
            value=tonumber(value)
            faction=tonumber(faction)
            radius=tonumber(radius)
            changeRankpoints(User,modifier,value,faction,radius)
        elseif (string.find(inputString,"(%a+) (%d+) (%d+)") ~= nil) then
            local a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+)")
            faction=tonumber(faction)
            value=tonumber(value)
            changeRankpoints(User,modifier,value,faction,radius)
        elseif (string.find(inputString,"(%a+) (%d+)") ~= nil) then
            local a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+)")
            value=tonumber(value)
            changeRankpoints(User,modifier,value,faction,radius)
        else
            User:inform("Sorry, I didn't understand you.")
            changeRankpointsInRadius(User) -- re-call dialog
        end
    end
    local idChange = InputDialog("Add/Subtract rankpoints in radius", "Usage: <modifier> <value> <faction> <radius>\nPossible values:\nmodifier: <add|sub> \nfaction: <1|2|3|99|nil> (= cadomyr|runewick|galmair|all|all)\nradius: <1|2|...|nil> (nil means default: 5)", false, 255, cbRadius)
    User:requestInputDialog(idChange)
end

function factionHandling(User, SourceItem)

    local cbFaction = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local ind = dialog:getSelectedIndex()
        if (ind == 0) then -- get/set for specific player
            local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
            local players = {User}
            for _,player in pairs(playersTmp) do
                if (player.id ~= User.id) then
                    table.insert(players, player)
                end
            end
            local cbChoosePlayer = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local chosenPlayer = players[dialog:getSelectedIndex()+1]
                local faction = factions.getFaction(chosenPlayer)
                local cbSetFactionValue = function (dialog)
                    if (not dialog:getSuccess()) then
                        return
                    end
                    local ind = dialog:getSelectedIndex()
                    -- change town
                    if (ind < 4) then
                        faction.tid = ind
                        faction.rankpoints = 0
                        factions.setFaction(chosenPlayer, faction)
                        User:logAdmin("changes faction of character " .. chosenPlayer.name .. " to " .. factions.getMembershipByName(chosenPlayer))
                    --change towncount
                    elseif (ind == 4) then
                        local cbSetCount = function (dialog)
                            if (not dialog:getSuccess()) then
                                return
                            end
                            local countValue, okay = String2Number(dialog:getInput())
                            if (not okay) then
                                User:inform("no number")
                                return
                            end
                            local oldValue = faction.towncnt
                            faction.towncnt = countValue
                            factions.setFaction(chosenPlayer, faction)
                            User:logAdmin("changes town count of character " .. chosenPlayer.name .. " from " .. oldValue .. " to " .. countValue)
                        end
                        User:requestInputDialog(InputDialog("Set town count", "", false, 255, cbSetCount))
                    --change the rankpoints
                    elseif (ind == 5) then
                        local cbSetRank = function (dialog)
                            if (not dialog:getSuccess()) then
                                return
                            end
                            local rankpoints, okay = String2Number(dialog:getInput())
                            if (not okay) then
                                User:inform("no number")
                                return
                            end
                            if factions.getMembership(chosenPlayer) > 0 and factions.getMembership(chosenPlayer) < 4 then
                                local oldValue = faction.rankpoints
                                factions.setRankpoints(chosenPlayer, rankpoints)
                                User:logAdmin("changes rankpoints of character " .. chosenPlayer.name .. " from " .. oldValue .. " to " .. rankpoints)
                            else
                                User:inform("Player does not belong to any faction. Rankpoints not changed.")
                            end
                        end
                        User:requestInputDialog(InputDialog("Set rankpoints", "Every 100 points there is a new rank.\nE.g. 300-399 points is rank 4.\nThere are 7 normal and 3 special ranks plus the leader.", false, 255, cbSetRank))
                    --change special rank
                    elseif (ind == 6) then
                        local cbSetSpecialRank = function (dialog)
                            if (not dialog:getSuccess()) then
                                return
                            end
                            local _, oldRank = factions.getRank(chosenPlayer, true)
                            local success
                            local index = dialog:getSelectedIndex()
                            if index == 0 then -- demoting
                                success = factions.setSpecialRank(chosenPlayer, 0)
                            else -- promoting
                                success = factions.setSpecialRank(chosenPlayer, factions.highestRank+tonumber(index))
                            end

                            if success == false and factions.getRankpoints(chosenPlayer) < (factions.highestRank-1)*100 then
                                User:inform("Rangchange failed. Player has not enough rankpoints. Current rankpoints: "..factions.getRankpoints(chosenPlayer))
                            elseif success == true then
                                User:inform("Rankchange for "..chosenPlayer.name.." successful.")
                                local _, newRank = factions.getRank(chosenPlayer, true)
                                User:logAdmin("changes special rank of character " .. chosenPlayer.name .. " from " .. oldRank .. " to " .. newRank)
                            else
                                User:inform("Rangchange failed for unknown reasons. Please inform a developer.")
                            end
                    end

                    local infoText = ""
                    local sd = SelectionDialog("Special rank", infoText, cbSetSpecialRank)
                    sd:addOption(0, "Demote")
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 8))
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 9))
                    sd:addOption(0, "Promote to "..factions.getRankName(chosenPlayer, 10))
                    User:requestSelectionDialog(sd)
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
            User:requestSelectionDialog(sd)
            end

            --general playerchoosing part
            local sd = SelectionDialog("Get/Set faction values for ...", "First choose a player:", cbChoosePlayer)
            local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
            for _,player in ipairs(players) do
                local race = math.min(player:getRace()+1, #raceNames)
                sd:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
            User:requestSelectionDialog(sd)

        -- rankpoints in radius
        elseif (ind == 1) then
            changeRankpointsInRadius(User)

        -- guard modes
        elseif (ind == 2) then
            local factionIds = {0,1,2,3}
            local cbFirstFaction = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local firstFaction = factionIds[dialog:getSelectedIndex()+1]
                local modeStrings = {}
                modeStrings[factions.RELATION_SELF] = "self"
                modeStrings[factions.RELATION_NEUTRAL] = "neutral"
                modeStrings[factions.RELATION_HOSTILE] = "hostile"
                modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
                modeStrings[factions.RELATION_FRIENDLY] = "friendly"
                modeStrings[factions.RELATION_ACCEPTED] = "accepted player"
                local modeValues = {factions.RELATION_FRIENDLY, factions.RELATION_NEUTRAL, factions.RELATION_HOSTILE, factions.RELATION_AGGRESSIVE}
                local cbSecondFaction = function (dialog)
                    if (not dialog:getSuccess()) then
                        return
                    end
                    local secondFaction = factionIds[dialog:getSelectedIndex()+1]
                    local cbSetMode = function (dialog)
                        if (not dialog:getSuccess()) then
                            return
                        end
                        local mode = modeValues[dialog:getSelectedIndex()+1]
                        factions.setFactionRelation(firstFaction, secondFaction, mode)
                        User:logAdmin("changes guard mode of " .. factions.getTownNameByID(firstFaction) .. " with respect to " .. factions.getTownNameByID(secondFaction) .. " to " .. modeStrings[mode])
                    end
                    local sd = SelectionDialog("Set guard modes", "Set guard modes of " .. factions.getTownNameByID(firstFaction) .. " with respect to " .. factions.getTownNameByID(secondFaction) .. " to ...", cbSetMode)
                    for _,m in ipairs(modeValues) do
                        sd:addOption(0,modeStrings[m])
                    end
                    User:requestSelectionDialog(sd)
                end
                local sd = SelectionDialog("Guard modes", "Set guard modes of " .. factions.getTownNameByID(firstFaction) .. " with respect to ...", cbSecondFaction)
                for _,f in ipairs(factionIds) do
                    sd:addOption(0,factions.getTownNameByID(f) .. ": " .. modeStrings[factions.getFactionRelation(firstFaction, f)])
                end
                User:requestSelectionDialog(sd)
            end
            local sd = SelectionDialog("Get/Set guard modes", "For which faction do you want to get/set values?", cbFirstFaction)
            for _,f in ipairs(factionIds) do
                sd:addOption(0,factions.getTownNameByID(f))
            end
            User:requestSelectionDialog(sd)

        -- licence
        elseif (ind == 3) then
            local factionIds = {0,1,2,3}
            local cbFirstLicence = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local FirstLicence = factionIds[dialog:getSelectedIndex()+1]
                local licenceStrings = {}
                licenceStrings[licence.PERMISSION_NONE] = "Permission for static tools is restricted"
                licenceStrings[licence.PERMISSION_ACTIVE] = "Permission for static tools is granted"
                local licenceValues = {licence.PERMISSION_NONE, licence.PERMISSION_ACTIVE}
                local cbSecondLicence = function (dialog)
                    if (not dialog:getSuccess()) then
                        return
                    end
                    local SecondLicence = factionIds[dialog:getSelectedIndex()+1]
                    local cbSetLicence = function (dialog)
                        if (not dialog:getSuccess()) then
                            return
                        end
                        local newLicence = licenceValues[dialog:getSelectedIndex()+1]
                        licence.SetLicence(FirstLicence, SecondLicence, newLicence)
                        User:logAdmin("changes licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to " .. licenceStrings[newLicence])
                    end
                    local sd = SelectionDialog("Set licence", "Set licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to ...", cbSetLicence)
                    for _,m in ipairs(licenceValues) do
                        sd:addOption(0,licenceStrings[m])
                    end
                    User:requestSelectionDialog(sd)
                end
                local sd = SelectionDialog("Licence", "Set licence of " .. factions.getTownNameByID(FirstLicence) .. " with respect to ...", cbSecondLicence)
                for _,f in ipairs(factionIds) do
                    sd:addOption(0,factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)])
                end
                User:requestSelectionDialog(sd)
            end
            local sd = SelectionDialog("Get/Set licence", "For which faction do you want to get/set values?", cbFirstLicence)
            for _,f in ipairs(factionIds) do
                sd:addOption(0,factions.getTownNameByID(f))
            end
            User:requestSelectionDialog(sd)
        end
    end
    local sd = SelectionDialog("What do you want to do about factions?", "", cbFaction)
    sd:addOption(0,"Get/Set faction values for ...")
    sd:addOption(0,"Add/Subtract rankpoints in radius")
    sd:addOption(0,"Get/Set guard modes")
    sd:addOption(0,"Get/Set licence")
    User:requestSelectionDialog(sd)
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

function spawnPoint(User, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            spawnStart(User, SourceItem)
        elseif index == 2 then
            spawnMonster(User, SourceItem)
        elseif index == 3 then
            spawnIntervalsPerSpawn(User, SourceItem)
        elseif index == 4 then
            spawnAmount(User, SourceItem)
        elseif index == 5 then
            spawnTime(User, SourceItem)
        elseif index == 6 then
            spawnEffects(User, SourceItem)
        elseif index == 7 then
            spawnRemove(User, SourceItem)
        elseif index == 8 then
            spawnPause(User, SourceItem)
        elseif index == 9 then
            spawnReset(User, SourceItem)
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
    User:requestSelectionDialog(sd)
end

function spawnRemove(User, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        User:inform("You removed the spawnpoint at " ..tostring(gmMonsters[index][1]))
        User:logAdmin("removed the spawnpoint at " ..tostring(gmMonsters[index][1]))
        table.remove(gmSpawnpointSettings, index)
        table.remove(gmMonsters, index)
    end
    local sd = SelectionDialog("Pick a spawnpoint to delete", "To which point do you want to delete?", cbSetMode)
    for _,m in ipairs(gmSpawnpointSettings) do
        sd:addOption(0,tostring(m[2]))
    end
    User:requestSelectionDialog(sd)
end

function spawnPause(User, SourceItem)

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if gmSpawnpointSettings[index][9] == 0 then
            User:inform("You paused the spawnpoint at " ..tostring(gmMonsters[index][1]))
            User:logAdmin("paused the spawnpoint at " ..tostring(gmMonsters[index][1]))
            gmSpawnpointSettings[index][9] = 1
        else
            User:inform("You reactivated the spawnpoint at " ..tostring(gmMonsters[index][1]))
            User:logAdmin("reactivated the spawnpoint at " ..tostring(gmMonsters[index][1]))
            gmSpawnpointSettings[index][9] = 0
        end
    end
    local sd = SelectionDialog("Pick a spawnpoint to pause/reactivate", "To which point do you want to pause/reactivate?", cbSetMode)
    for _,m in ipairs(gmSpawnpointSettings) do
        sd:addOption(0,tostring(m[2]))
    end
    User:requestSelectionDialog(sd)
end

function spawnMonster(User, SourceItem)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local inputString = dialog:getInput()
        if (string.find(inputString,"(%d+)") ~= nil) then
            SourceItem:setData("monsters", inputString)
            world:changeItem(SourceItem)
        else
            User:inform("Enter MonsterID")
        end
    end
    User:requestInputDialog(InputDialog("Enter Monster IDs.", "Usage: Enter the IDs of the monsters." ,false, 255, cbInputDialog))
end

function spawnIntervalsPerSpawn(User, SourceItem)
    --Write down how many Mobs shall spawn per Minute
    -- If input contains number, sets input to Data "intervals"
    local intervals
    local cbInputDialog = function (dialog)
    if (not dialog:getSuccess()) then
        return
    end
    local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, intervals = string.find(input,"(%d+)")
            SourceItem:setData("intervals", intervals)
            world:changeItem(SourceItem)
        end
    end
    User:requestInputDialog(InputDialog("Set spawn cycles.", "Usage: Time in between 2 monster spawns.\nSet number of (roughly) 7 second intervals." ,false, 255, cbInputDialog))
end

function spawnAmount(User, SourceItem)
    -- If input contains number, sets input to Data "amount"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, amount = string.find(input,"(%d+)")
            SourceItem:setData("amount", input)
            world:changeItem(SourceItem)
        end
    end
    User:requestInputDialog(InputDialog("Set limit for monsters", "Set max. number of monsters present at the same time" ,false, 255, cbInputDialog))
end

function spawnTime(User, SourceItem)
    -- If input contains number, sets input to Data "endurance"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, endurance = string.find(input,"(%d+)")
            SourceItem:setData("endurance", input)
            world:changeItem(SourceItem)
        end
    end
    User:requestInputDialog(InputDialog("Set how long the spawn shall take place.", "Usage: Set the amount of total intervals (ca. 7s)." ,false, 255, cbInputDialog))
end

function spawnEffects(User, SourceItem)
    -- If input contains number, sets input to Data "endurance"
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+)") ~= nil) then
            local a, b, gfxId, sfxId = string.find(input,"(%d+) (%d+)")
            gfxId = tonumber(gfxId)
            sfxId = tonumber(sfxId)
            SourceItem:setData("sfxId", sfxId)
            SourceItem:setData("gfxId", gfxId)
            world:changeItem(SourceItem)
        elseif (string.find(input,"(%d+)") ~= nil) then
            local a, b, gfxId = string.find(input,"(%d+)")
            SourceItem:setData("gfxId", input)
            world:changeItem(SourceItem)
        end
    end
    User:requestInputDialog(InputDialog("Set the graphic and sound appearing at spawn", "Usage: Enter a gfxId [sfxId]" ,false, 255, cbInputDialog))
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

function spawnStart(User, SourceItem)

    local spawnPos = common.GetFrontPosition(User)

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

            local a, b, monsterId = string.find(monsters,"(%d+)",fin)
            fin = b + 1
            counter = counter +1
            monsterIds[counter]    = tonumber(monsterId)
        else
            User:inform("Enter MonsterID")
--            fin = string.len(inputNumber)
            return
        end
    end

    if checkData(SourceItem,"monsters") == true then
        table.insert(gmSpawnpointSettings, length, {monsterIds, spawnPos, amount, intervals, endurance, gfxId, sfxId,0 ,0})
        table.insert(gmMonsters, length, {spawnPos})
        User:inform("You added a spawnpoint at " .. tostring(gmSpawnpointSettings[length][2]))
        User:logAdmin("added a spawnpoint at " .. tostring(gmSpawnpointSettings[length][2]))
        scheduledFunction.registerFunction(2, function() spawnGM() end)
    else
        User:inform("Enter MonsterID")
    end
end

function spawnReset(User, SourceItem)

    SourceItem:setData("monsters", "0")
    SourceItem:setData("intervals", "0")
    SourceItem:setData("endurance", "0")
    SourceItem:setData("amount", "0")
    SourceItem:setData("gfxId", "0")
    SourceItem:setData("sfxId", "0")
    world:changeItem(SourceItem)
end


function M.LookAtItem(User, Item)
    lookat.SetSpecialDescription(Item, "Verwende die Kelle zum Aufrufen der Funktionen (items, weather, factions, spawnpoints).", "Use the trowel to pick a function (items, weather, factions, spawnpoints).")
    lookat.SetSpecialName(Item, "Kelle", "Trowel")
    return lookat.GenerateLookAt(User, Item, lookat.METAL)
end

function M.UseItemWithField(User, SourceItem, TargetPos)
    local Field=world:getField(TargetPos)
    User:inform("This field has the ID: "..Field:tile())
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

local function specialItemCreationSpecialEggs(User)

    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, amount = string.find(input,"(%d+)")
            specialeggs.createSpecialEgg(User, tonumber(amount))
        end
    end
    User:requestInputDialog(InputDialog("Egg creation", "How many special eggs to you want to create? (Notice: Eggs will have a normal wear of 3. Increase manually if needed." ,false, 255, cbInputDialog))
end

local function specialItemCreationMysticalCracker(User)

    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, amount = string.find(input,"(%d+)")
            mysticalcracker.createMysticalCracker(User, tonumber(amount))
        end
    end
    User:requestInputDialog(InputDialog("Cracker Creation", "How many mystical crackers to you want to create? (Notice: Crackers will have a normal wear of 10. Increase manually if needed." ,false, 255, cbInputDialog))
end

local function specialItemCreationTreasureChest(User)
    local position
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d) (%d)") ~= nil) then
            local a, b, level, persons = string.find(input,"(%d) (%d)")
            if level == nil or tonumber(level) < 0 or tonumber(level) > 9 then
                User:inform("The level of the treasure chest must be a value from 0(no treasure via 1(farmer) to 9(nabranoo).")
                return
            end
            if persons == nil or tonumber(persons) < 1 or tonumber(persons) > 8 then
                User:inform("The number of persons needed to open the treasure chest must be a value from 1 to 8.")
                return
            end
            position = common.GetFrontPosition(User)
            if world:isItemOnField(position) == true then
                User:inform("The place for the chest is not free.")
                return
            end
            spawntreasures.spawnTreasureChest(position, level, persons)
        else
            User:inform("The input :'" .. input .. "' is not corret. Please use e.g. '3 2'.")
        end
    end
    User:requestInputDialog(InputDialog("Treasure Chest Creation", "Please enter level and amount of people needed\nFormat: '[1-9] [1-8]'" ,false, 255, cbInputDialog))
end

local function specialItemCreationGlyphShard(User)
    local position
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            if (string.find(input,"[1-7][1-7]") ~= nil) then
                local a, b, level = string.find(input,"(%d+)")
                shard.createShardWithLevelOnUser(User, level)
            else
                local a, b, amount = string.find(input,"(%d+)")
                for i=1, tonumber(amount) do
                    shard.createShardOnUser(User)
                end
            end
        else
            shard.createShardOnUser(User)
        end
    end
    User:requestInputDialog(InputDialog("Glyph Shard Creation",
                                        "Please enter which shard you want to create" ..
                                        "\n- Nothing: A single random shard." ..
                                        "\n- [1-7][1-7]: A singe defined shard." ..
                                        "\n- Other numbers: Number of random shards.",false, 255, cbInputDialog))
end

local function specialItemCreationCreate(User,indexItem)
    if SpecialItem[indexItem][2] then
        if indexItem == 1 then
            specialItemCreationMysticalCracker(User)
        elseif indexItem == 2 then
            specialItemCreationSpecialEggs(User)
        elseif indexItem == 3 then
            specialItemCreationTreasureChest(User)
        elseif indexItem == 18 then
            specialItemCreationGlyphShard(User)
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
                local a, b, amount = string.find(input,"(%d+)")
                if SpecialItem[indexItem][4] == MagicGem then
                    common.CreateItem(User, SpecialItem[indexItem][3], tonumber(amount), 333,{gemLevel=1})
                else
                    common.CreateItem(User, SpecialItem[indexItem][3], tonumber(amount), 333,nil)
                end
            end
        end
        User:requestInputDialog(InputDialog("Item Creation", "How many "..SpecialItem[indexItem][1].." do you want to create?" ,false, 255, cbInputDialog))
    end
end

local function specialItemCreation(User)
    local validItems = {}
    local validItemsSub = {}

    local cbChooseItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local indexItem = dialog:getSelectedIndex() + 1
        if validItems[indexItem][2] == 0 then
            specialItemCreationCreate(User,validItems[indexItem][1])
        else
        --
            local cbChooseSubItem = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local indexItemSub = dialog:getSelectedIndex() + 1
                specialItemCreationCreate(User,validItemsSub[indexItemSub][1])
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
            User:requestSelectionDialog(sdItemListSub)
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
    User:requestSelectionDialog(sdItemList)
end

local function readScriptVars(user)
    local cbInputDialog = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if string.find(input,"([%w]+) ([%w]+)") ~= nil then
            local a, b, varName, varValue = string.find(input,"([%w]+) ([%w]+)")
            local foundVar, currentVar = ScriptVars:find(varName)
            if not foundVar then
                user:inform("The script variable '"..varName.."' does not exists.")
            else
                ScriptVars:set(varName, varValue)
                user:inform("Script variable: '"..varName.."' changed from "..tostring(currentVar).." to "..tostring(varValue))
                user:logAdmin("Script variable: '"..varName.."' changed from "..tostring(currentVar).." to "..tostring(varValue))
            end
        elseif string.find(input,"([%w]+)") ~= nil then
            local a, b, varName = string.find(input,"([%w]+)")
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

function M.UseItem(User, SourceItem)
    -- First check for mode change
    local modes = {"Items", "Weather", "Factions", "Spawnpoint", "Special Item Creation", "Script Variables","Teleporter","Harbours"}
    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if  index == 1 then
            chooseItem(User)
        elseif index == 2 then
            weather(User, SourceItem)
        elseif index == 3 then
            factionHandling(User, SourceItem)
        elseif index == 4 then
            spawnPoint(User, SourceItem)
        elseif index == 5 then
            specialItemCreation(User)
        elseif index == 6 then
            readScriptVars(User)
        elseif index == 7 then
            staticteleporter.gmManageTeleporter(User)
        elseif index == 8 then
            seafaring.gmManagePorts(User)
        end
    end
    local sd = SelectionDialog("Set mode of this ceiling trowel", "To which mode you want to change?", cbSetMode)
    for _, m in ipairs(modes) do
        sd:addOption(0, m)
    end
    User:requestSelectionDialog(sd)
end

return M
