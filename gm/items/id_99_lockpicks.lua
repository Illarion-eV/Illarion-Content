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
-- GM tool to delete items, to teleport and to conduct character changes

-- UPDATE common SET com_script='gm.items.id_99_lockpicks' WHERE com_itemid=99;
local lookat = require("base.lookat")
local common = require("base.common")
local factions = require("base.factions")
local monsterHooks = require("monster.base.hooks")

local M = {}

local itemPos = {"Head","Neck","Breast","Hands","Left Tool","Right Tool",
    "Left Finger","Right Finger","Legs","Feet","Coat","Belt 1",
    "Belt 2","Belt 3","Belt 4","Belt 5","Belt 6"}
itemPos[0] = "Backpack"

local SubLocation={"Cadomyr","Galmair","Runewick","Wilderness","Dungeons"}
local Location={}
Location[1]={"Player","","X","Y","Z"}
Location[2]={"GM Castle","",250,100,0}
Location[3]={"Hemp Necktie Inn","",690,320,0}
Location[4]={"Cadomyr Palace of Her Majesty","Cadomyr",122,521,0}
Location[5]={"Cadomyr Market","Cadomyr",130,600,0}
Location[6]={"Galmair Crest","Galmair",337,215,0}
Location[7]={"Galmair Town","Galmair",400,250,0}
Location[8]={"Runewick Library","Runewick",946, 804, 0}
Location[9]={"Runewick Market","Runewick",935, 833, 0}
Location[10]={"Cadomyr Cornerstone of Candour","Cadomyr",130,700,0}
Location[11]={"Cadomyr Liberty Quarry","Cadomyr",170,620,0}
Location[12]={"Cadomyr Blood Circle Arena","Cadomyr",258,668,0}
Location[13]={"Galmair Balckhole Mine","Galmair",388,157,-3}
Location[14]={"Galmair Malachite Mine","Galmair",400,355,0}
Location[15]={"Galmair Game Room","Galmair",293,260,-5}
Location[16]={"Runewick Yewdale","Runewick",750,810,0}
Location[17]={"Runewick Lurnord Bridge","Runewick",844,822,0}
Location[18]={"Dragorog Cult","Dungeons",366,477,0}
Location[19]={"Fox Den","Dungeons",813,382,0}
Location[20]={"Mount Letma","Dungeons",220,771,0}
Location[21]={"Sunken Altar","Dungeons",742,252,0}
Location[22]={"Fort Hammerfall","Dungeons",191,425,0}
Location[23]={"Grugmut's Cave","Dungeons",200,557,0}
Location[24]={"Khesra","Dungeons",406,578,0}
Location[25]={"Pauldron","Wilderness",868,337,0}
Location[26]={"Fort Schnellbeil","Wilderness",366,344,0}
Location[27]={"Shadowlands","Dungeons",414,383,0}
Location[28]={"Sir Reginald's Tomb","Dungeons",139,645,0}
Location[29]={"Bandit Hideout","Dungeons",204,466,0}
Location[30]={"Bear Cave","Wilderness",792,716,0}
Location[31]={"Dragon Cave","Dungeons",784,681,0}
Location[32]={"Lake of Life","Dungeons",638,271,0}
Location[33]={"Necro Hideout","Dungeons",528,555,0}
Location[34]={"Ronagan Dungeon","Dungeons",904,595,0}
Location[35]={"Salavesh","Dungeons",670,410,0}
Location[36]={"Spider Dungeon","Dungeons",854,414,0}
Location[37]={"Viridian Needles lair","Dungeons",522,205,0}
Location[38]={"Northern Islands","Wilderness",365,50,0}

local skillNames = {
    Character.alchemy,
    Character.armourer,
    Character.blacksmithing,
    Character.brewing,
    Character.carpentry,
    Character.concussionWeapons,
    Character.cookingAndBaking,
    Character.digging,
    Character.distanceWeapons,
    Character.drum,
    Character.farming,
    Character.finesmithing,
    Character.fishing,
    Character.flute,
    Character.gemcutting,
    Character.glassBlowing,
    Character.harp,
    Character.heavyArmour,
    Character.herblore,
    Character.horn,
    Character.husbandry,
    Character.lightArmour,
    Character.lute,
    Character.mediumArmour,
    Character.mining,
    Character.panpipe,
    Character.parry,
    Character.pottery,
    Character.punctureWeapons,
    Character.slashingWeapons,
    Character.tailoring,
    Character.tanningAndWeaving,
    Character.wandMagic,
    Character.woodcutting,
    Character.wrestling
}

local classNames={}
classNames[0] = "Mage"
classNames[1] = "Priest"
classNames[2] = "Bard"
classNames[3] = "Alchemist"

local function akalutCadomyrBlockade(User, SourceItem, ltstate)

    local foundValue, value = ScriptVars:find("akalutCadomyrBlockade")
    local newValue
    local title
    local description
    local informMessage

    if foundValue and tonumber(value) == 1then
        newValue = 0
        title = "Akalut: Cadomyr blockade. Do you want to deactivate it?"
        description = "This special event renders Cadomyr's teleporter useless. You cannot travel to it or from it. Furthermore, portal books do not work in Cadomyr and cannot be used to get to Cadomyr. Do you really want to deactivate this?"
        informMessage = "You deactivated the Cadomyr blockade for the Akalut quest."
    else
        newValue = 1
        title = "Akalut: Cadomyr blockade. Do you want to activate it?"
        description = "This special event renders Cadomyr's teleporter useless. You cannot travel to it or from it. Furthermore, portal books do not work in Cadomyr and cannot be used to get to Cadomyr. Do you really want to activate this?"
        informMessage = "You activated the Cadomyr blockade for the Akalut quest."
    end

    local yesOrNo = {"Yes", "No"}
    local cbQuestEvents = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            User:inform(informMessage)
            ScriptVars:set("akalutCadomyrBlockade",newValue)
            ScriptVars:save()
            local foundValue, value = ScriptVars:find("akalutCadomyrBlockade")
        else
            return
        end
    end
    local sd = SelectionDialog(title, description, cbQuestEvents)
    for _, m in ipairs(yesOrNo) do
        sd:addOption(0, m)
    end
    User:requestSelectionDialog(sd)

end

local function questEvents(User, SourceItem, ltstate)

    local questEvents = {"Akalut: Cadomyr blockade"}
    local cbQuestEvents = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            akalutCadomyrBlockade(User, SourceItem, ltstate)
        end
    end
    local sd = SelectionDialog("Select special quest event.", "Select special quest event", cbQuestEvents)
    for _, m in ipairs(questEvents) do
        sd:addOption(0, m)
    end
    User:requestSelectionDialog(sd)

end

local function flameThrower(user)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        
        local inputNumber = dialog:getInput()
        if (string.find(inputNumber,"(%d+) (%d+) (%d+)") ~= nil) then
            local _, _, flameId, radius, wear = string.find(inputNumber,"(%d+) (%d+) (%d+)")
            flameId = tonumber(flameId)
            radius = tonumber(radius)
            wear = tonumber(wear)
            
            local fireFlame = 359
            local iceFlame = 360
            if flameId ~= fireFlame and flameId ~= iceFlame then
                user:inform("No proper flame id provided.")
                return
            end
            
            if wear > 255 then
                wear = 255
            end
            
            if radius > 10 then
                radius = 10
            end
            
            local event = function(currentPosition)
                if world:isItemOnField(currentPosition) == false or world:getItemOnField(currentPosition).id ~= flameId then
                    world:createItemFromId(flameId, 1, currentPosition, true, 999, {})
                end
            end
            
            event(user.pos)
            for i = 1, radius do
                common.CreateCircle(user.pos, i, event)
            end
            
        else
            user:inform("Provide proper input, please.")
        end
        
    end
    
    user:requestInputDialog(InputDialog("Spawn a filled cirecle of flames", "Usage enter: flameId radius wear  -- Flame id can be 359 (fire) or 360 (ice). Radius is capped at 10." ,false, 255, cbInputDialog))
end

local function flameRemover(user)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        
        local inputNumber = dialog:getInput()
        if (string.find(inputNumber, "(%d+) (%d+)") ~= nil) then
            local _, _, flameId, radius = string.find(inputNumber,"(%d+) (%d+)")
            flameId = tonumber(flameId)
            radius = tonumber(radius)
            
            local fireFlame = 359
            local iceFlame = 360
            if flameId ~= fireFlame and flameId ~= iceFlame then
                user:inform("No proper flame id provided.")
                return
            end
            
            if radius > 10 then
                radius = 10
            end
            
            local event = function(currentPosition)
                if world:isItemOnField(currentPosition) then
                    local checkItem = world:getItemOnField(currentPosition)
                    if checkItem.id == flameId then
                        world:erase(checkItem, 1)
                    end
                end
            end
            
            event(user.pos)
            for i = 1, radius do
                common.CreateCircle(user.pos, i, event)
            end
            
        else
            user:inform("Provide proper input, please.")
        end
        
    end
    
    user:requestInputDialog(InputDialog("Remove flames around you", "Usage enter: flameId radius  -- Flame id can be 359 (fire) or 360 (ice). Radius is capped at 10." ,false, 255, cbInputDialog))
end

local eraser
local teleporter
local factionInfoOfCharsInRadius
local charInfo
local changeSkills
local getSetQueststatus
local godMode
local setMC
local changeMagicClass
local actionWithChar

function M.UseItem(User, SourceItem, ltstate)

    --if injured, heal!
    if User:increaseAttrib("hitpoints",0) < 10000 or User:increaseAttrib("mana",0) < 10000 then
        User:increaseAttrib("hitpoints", 10000)
        User:increaseAttrib("mana", 10000)
        User:increaseAttrib("foodlevel", 100000)
    end

    -- First check for mode change
    local modes = {"Eraser", "Teleport", "Faction info of chars in radius", "Char Info", "Change skills", "Get/ Set Queststatus", "Instant kill/ revive", "Quest events", "Set MC", "Create flames", "Remove flames", "Get/ Set Magic Class", "Miscellaneous actions at char","Test"}
    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            eraser(User, SourceItem, ltstate)
        elseif index == 2 then
            teleporter(User, SourceItem, ltstate)
        elseif index == 3 then
            factionInfoOfCharsInRadius(User, SourceItem, ltstate)
        elseif index == 4 then
            charInfo(User, SourceItem,ltstate)
        elseif index == 5 then
            changeSkills(User, SourceItem, ltstate)
        elseif index == 6 then
            getSetQueststatus(User, SourceItem, ltstate)
        elseif index == 7 then
            godMode(User, SourceItem, ltstate)
        elseif index == 8 then
            questEvents(User, SourceItem, ltstate)
        elseif index == 9 then
            setMC(User, SourceItem, ltstate)
        elseif index == 10 then
            flameThrower(User)
        elseif index == 11 then
            flameRemover(User)
        elseif index == 12 then
            changeMagicClass(User, SourceItem, ltstate)
        elseif index == 13 then
            actionWithChar(User, SourceItem, ltstate)
        elseif index == 14 then
            BandukTest(User)
        end
    end
    local sd = SelectionDialog("Pick a function of the lockpicks.", "Which do you want to use?", cbSetMode)
    for _, m in ipairs(modes) do
        sd:addOption(0, m)
    end
    User:requestSelectionDialog(sd)
end

function BandukTest(User)
    local gmSpell = require("monster.base.spells.firecone"){probability = 1,  damage = {from = 1250, to = 1500}, range = 6, angularAperture = 30, itemProbability = 0.1, quality = {from = 0, to = 1}}
    User:inform("==1")
    gmSpell.cast(User,User)
    User:inform("==3")
end

function eraser(User, SourceItem, ltstate)

    --get all the items the char has on him, with the stuff in the backpack
    local itemsOnChar = {}
    for i = 17, 0, -1 do
        local item = User:getItemAt(i)
        if (item.id > 0) then
            table.insert(itemsOnChar, item)
        end
    end

    local cbChooseItem = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local chosenItem
        local index = dialog:getSelectedIndex()
        if (index == 0) then
            chosenItem = common.GetFrontItem(User)
            if chosenItem ~= nil then
                world:erase(chosenItem, chosenItem.number)
                User:logAdmin("erases " .. chosenItem.number .. " items from map: " .. world:getItemName(chosenItem.id, Player.english) .. "(" .. chosenItem.id .. ") at " .. tostring(common.GetFrontPosition(User)))
            end
        elseif (index == 1) then
            while common.GetFrontItem(User) ~= nil do
                chosenItem = common.GetFrontItem(User)
                world:erase(chosenItem, chosenItem.number)
                User:logAdmin("erases " .. chosenItem.number .. " items from map: " .. world:getItemName(chosenItem.id, Player.english) .. "(" .. chosenItem.id .. ") at " .. tostring(common.GetFrontPosition(User)))
            end
        else
            chosenItem = itemsOnChar[index-1]
            world:erase(chosenItem, chosenItem.number)
            User:logAdmin("erases " ..chosenItem.number.. " items from inventory: " .. world:getItemName(chosenItem.id, Player.english) .. "(" .. chosenItem.id .. ")")
        end
    end
    local sdItems = SelectionDialog("Erase items.", "Choose the item you wish to erase:", cbChooseItem)
    sdItems:addOption(0, "Front of char - Top item")
    sdItems:addOption(0, "Front of char - All stack")
    for _, item in ipairs(itemsOnChar) do
        local itemName = world:getItemName(item.id, Player.english)
        sdItems:addOption(item.id, itemName .. " (" .. itemPos[item.itempos] .. ") Count: ".. item.number)
    end
    User:requestSelectionDialog(sdItems)
end

function teleporter(User, SourceItem, ltstate)
    local validTarget = {}

    local cbChooseLocation = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            local onlineChars = world:getPlayersOnline()
            local cbChoosePlayerLocation = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local warpToPlayer = onlineChars[dialog:getSelectedIndex() + 1]
                if isValidChar(warpToPlayer) then
                    User:warp(position(warpToPlayer.pos.x, warpToPlayer.pos.y, warpToPlayer.pos.z))
                else
                    User:inform("This character is not online anymore.")
                end
            end
            local sdTeleportPlayer = SelectionDialog("Teleporter.", "Choose a destination:", cbChoosePlayerLocation)
            for i = 1, #onlineChars do
                local checkChar = onlineChars[i]
                local onlineCharsName = checkChar.name
                sdTeleportPlayer:addOption(0, onlineCharsName .. " (" .. checkChar.pos.x..", "..checkChar.pos.y..", "..checkChar.pos.z .. ")")
            end
            User:requestSelectionDialog(sdTeleportPlayer)
        else
            if validTarget[index][4] == 0 then
                User:warp(position(validTarget[index][1], validTarget[index][2], validTarget[index][3]))
            else
            local cbChooseSubLocation = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local indexSubTarget = dialog:getSelectedIndex() + 1
                User:warp(position(validTarget[indexSubTarget][1], validTarget[indexSubTarget][2], validTarget[indexSubTarget][3]))
            end
            local sdSubTeleport = SelectionDialog("Teleporter.", "Choose a destination:", cbChooseSubLocation)
            local optionSubId = 1
            for i = 1, #(Location) do
                if Location[i][2] == SubLocation[validTarget[index][4]] then
                    sdSubTeleport:addOption(0, Location[i][1] .. " (" .. Location[i][3]..", "..Location[i][4]..", "..Location[i][5] .. ")")
                    validTarget[optionSubId] = {Location[i][3],Location[i][4],Location[i][5],0}
                    optionSubId = optionSubId+1
                end
            end
            User:requestSelectionDialog(sdSubTeleport)
            end
        end
    end
    local sdTeleport = SelectionDialog("Teleporter.", "Choose a destination:", cbChooseLocation)
    local optionId = 1
    for i = 1, #(Location) do
        if common.IsNilOrEmpty(Location[i][2]) then
            sdTeleport:addOption(0, Location[i][1] .. " (" .. Location[i][3]..", "..Location[i][4]..", "..Location[i][5] .. ")")
            validTarget[optionId] = {Location[i][3],Location[i][4],Location[i][5],0}
            optionId = optionId+1
        end
    end
    for i = 1, #(SubLocation) do
        sdTeleport:addOption(0, "Group: "..SubLocation[i])
        validTarget[optionId] = {0,0,0,i}
        optionId = optionId+1
    end
    User:requestSelectionDialog(sdTeleport)
end

function factionInfoOfCharsInRadius(User, SourceItem, ltstate)

    local players = world:getPlayersInRangeOf(User.pos, 40)
    local infos = ""
    local germanRank, englishRank

    for _, player in ipairs(players) do
        germanRank, englishRank = factions.getRank(player, true)
        if germanRank == nil or englishRank == nil then
            germanRank = "Vogelfrei"
            englishRank = "Outlaw"
        end
        infos = infos..player.name.." - "..englishRank.."/"..germanRank.." - "..factions.getRankpoints(player).."\n"
    end
    local mDialog = MessageDialog("Factioninformation", infos, nil)
    User:requestMessageDialog(mDialog)
end

function charInfo(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenPlayer = players[dialog:getSelectedIndex() + 1]
        local faction = factions.getFaction(chosenPlayer)
        local factionInfo = "Town: " .. factions.getMembershipByName(chosenPlayer)
        factionInfo = factionInfo .. "\nChanged towns already (town count): " .. faction.towncnt
        if (factions.townRanks[faction.tid] ~= nil and factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
            local germanRank, englishRank = factions.getRank(chosenPlayer, true)
            factionInfo = factionInfo .. "\nRank: " .. englishRank .. "/" .. germanRank
        else
            factionInfo = factionInfo .. "\nRank: no rank " .. faction.rankTown
        end
        factionInfo = factionInfo .. "\nExact rankpoints: " .. faction.rankpoints
        local mDialog = MessageDialog("Character Info for "..chosenPlayer.name, "HP: "..chosenPlayer:increaseAttrib("hitpoints", 0).." MP: "..chosenPlayer:increaseAttrib("mana", 0)..
                        "\nSTR: "..chosenPlayer:increaseAttrib("strength", 0).." CON: "..chosenPlayer:increaseAttrib("constitution", 0).." DEX: "..chosenPlayer:increaseAttrib("dexterity", 0).." AGI: "..chosenPlayer:increaseAttrib("agility", 0)..
                        "\nINT: "..chosenPlayer:increaseAttrib("intelligence", 0).." WIL: "..chosenPlayer:increaseAttrib("willpower", 0).." PERC: "..chosenPlayer:increaseAttrib("perception", 0).." ESS: "..chosenPlayer:increaseAttrib("essence", 0)..
                        "\nIdle for [s]: "..tostring(chosenPlayer:idleTime()) ..
                        "\n" .. factionInfo, cbChoosePlayer)
        User:requestMessageDialog(mDialog)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Get the stats of ...", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end

local function String2Number(str)
    if (string.find(str, "(%d+)") ~= nil) then
        local _, _, num = string.find(str, "(%d+)")
        if (num ~= "") then
            num = tonumber(num)
            return num, true
        end
    end
    return 0, false
end

function changeSkills(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenPlayer = players[dialog:getSelectedIndex() + 1]
        local skillDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local chosenSkill = skillNames[dialog:getSelectedIndex() + 1]
            local changeDialog = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local skillValue, okay = String2Number(dialog:getInput())
                if (not okay) then
                    User:inform("no number")
                    return
                end
                if (skillValue < 0 or skillValue > 100) then
                    User:inform("Value has to be between 0 and 100.")
                    return
                end
                local delta = skillValue - chosenPlayer:getSkill(chosenSkill)
                chosenPlayer:increaseSkill(chosenSkill, delta)
                User:logAdmin("changes skill of character " .. chosenPlayer.name .. ". " .. chosenPlayer:getSkillName(chosenSkill) .. ": " .. chosenPlayer:getSkill(chosenSkill) - delta .. " to " .. chosenPlayer:getSkill(chosenSkill))
            end
            local sdChange = InputDialog("Change skill for "..chosenPlayer.name, "Type in the new value for "..User:getSkillName(chosenSkill).."\nCurrent value: " .. chosenPlayer:getSkill(chosenSkill), false, 255, changeDialog)
            User:requestInputDialog(sdChange)
        end
        local sdSkill = SelectionDialog("Select skill", "What skill do you wish to change for "..chosenPlayer.name.."?", skillDialog)
        for _, skill in ipairs(skillNames) do
            sdSkill:addOption(0,User:getSkillName(skill).." value: "..chosenPlayer:getSkill(skill))
        end
        User:requestSelectionDialog(sdSkill)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Change a skill.", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end

function getSetQueststatus(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenPlayer = players[dialog:getSelectedIndex() + 1]
        local changeDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local inputString = dialog:getInput()
            if (string.find(inputString, "(%d+) (%d+)") ~= nil) then
                local a, b, quest, status = string.find(inputString, "(%d+) (%d+)")
                local quest = tonumber(quest)
                local status = tonumber(status)
                chosenPlayer:setQuestProgress(quest, status)
                User:inform("Quest " .. quest .. " has been set to " .. status .. "!")
                User:logAdmin("changes queststatus of character " .. chosenPlayer.name .. ". Quest ID " .. quest .. " set to value " .. status)
            elseif (string.find(inputString, "(%d+)") ~= nil) then
                local a, b, quest = string.find(inputString, "(%d+)")
                local quest = tonumber(quest)
                User:inform("Quest " .. quest .. " has the status " .. chosenPlayer:getQuestProgress(quest) .. ".")
            else
                User:inform("Sorry, I didn't understand you.")
                User:requestInputDialog(InputDialog("Get/ Set Queststatus for "..chosenPlayer.name, "Usage: To get the value type in the questnumber.\n To set the value type in questnumber and the new status.", false, 255, changeDialog))
            end
        end
        local sdChange = InputDialog("Get/ Set Queststatus for "..chosenPlayer.name, "Usage: To get the value type in the questnumber.\n To set the value type in questnumber and the new status.", false, 255, changeDialog)
        User:requestInputDialog(sdChange)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Get/ Set Queststatus", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end

function godMode(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()
        if index == 0 then
            local monsters = world:getMonstersInRangeOf(User.pos, 3)
            for _, monster in ipairs(monsters) do
                monsterHooks.setForcedDeath(monster)
                monster:increaseAttrib("hitpoints", -10000)
            end
            User:logAdmin("instant kills " .. #monsters .. " monsters at " .. tostring(User.pos))
        else
            local chosenPlayer = players[index]
            local killDialog = function (dialog)
                if (not dialog:getSuccess()) then
                    return
                end
                local index = dialog:getSelectedIndex()
                if index == 0 then --let's kill it
                    chosenPlayer:increaseAttrib("hitpoints", -10000)
                    User:logAdmin("instant kills character " .. chosenPlayer.name)
                elseif index == 1 then --let's revive it
                    chosenPlayer:increaseAttrib("hitpoints", 10000)
                    User:logAdmin("instant revives character " .. chosenPlayer.name)
                end
            end
            local sdKill = SelectionDialog("Play god", "What do you wish to do to "..chosenPlayer.name.."?", killDialog)
            sdKill:addOption(0, "Instant kill")
            sdKill:addOption(0, "Instant revive")
            User:requestSelectionDialog(sdKill)
        end
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Kill or revive...", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
    sdPlayer:addOption(0, "Kill all Monster in a 3 tile radius")
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end

function M.LookAtItem(User, Item)
    lookat.SetSpecialDescription(Item, "Verwende die Dietriche zum Aufrufen der Funktionen.", "Use the lockpicks to pick a function.")
    lookat.SetSpecialName(Item, "Dietriche", "Lockpicks")
    return lookat.GenerateLookAt(User, Item, lookat.METAL)
end

function setMC(User, SourceItem, ltstate)

    local setMCInputDialog = function (dialog)
    
        if (not dialog:getSuccess()) then
            return
        end
        
        local input = dialog:getInput()
        
        if input == "" or not input then
            User:inform("Invalid input.")
            return
        end
        
        input = math.ceil(tonumber(input))
        
        if input < 1 or input > 100000000 then
            User:inform("Invalid input.")
            return
        end
        
        User:increaseMentalCapacity(input - User:getMentalCapacity())
        User:inform("New MC: "..User:getMentalCapacity())
        
    end
    
    User:requestInputDialog(InputDialog("Set MC", "Enter desired MC value (1-100000000)." ,false, 255, setMCInputDialog))

end

function changeMagicClass(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenPlayer = players[dialog:getSelectedIndex() + 1]
        local magicClassDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local targetClass = dialog:getSelectedIndex()
            if targetClass ~= chosenPlayer:getMagicType() then
                User:logAdmin("Change magic class of character " .. chosenPlayer.name .. " from " .. classNames[chosenPlayer:getMagicType()].. " to " .. classNames[targetClass])
                chosenPlayer:setMagicType(targetClass)
                chosenPlayer:inform("GM changed magic class to " .. classNames[targetClass])
            end
        end
        local sdClass = SelectionDialog("Select action", "What magic class should be set for "..chosenPlayer.name.."?", magicClassDialog)
        for i=0, #classNames do
            if chosenPlayer:getMagicType() == i then
                sdClass:addOption(0," Is: "..classNames[i])
            else
                sdClass:addOption(0," Change to: "..classNames[i])
            end
        end
        User:requestSelectionDialog(sdClass)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Change the magic class.", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end


function actionWithChar(User, SourceItem, ltstate)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end

    local cbChoosePlayer = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenPlayer = players[dialog:getSelectedIndex() + 1]
        local charActionDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local actionToPerform = dialog:getSelectedIndex()
            if actionToPerform == 0 then
                if chosenPlayer:getQuestProgress(36) == 0 then
                    chosenPlayer:setQuestProgress(36,1)
                    User:logAdmin("Make character " .. chosenPlayer.name .. " unable to be attacked.")
                    chosenPlayer:inform("GM makes your character unable to attack.")
                else
                    chosenPlayer:setQuestProgress(36,0)
                    User:logAdmin("Make character " .. chosenPlayer.name .. " able to be attacked.")
                    chosenPlayer:inform("GM makes your character able to attack.")
                end
            elseif actionToPerform == 1 then
                chosenPlayer:increaseAttrib("foodlevel", 60000)
            elseif actionToPerform == 2 then
                chosenPlayer:increaseAttrib("foodlevel", -15000)
            end
        end
        local sdAction = SelectionDialog("Select action", "What action should be performed for "..chosenPlayer.name.."?", charActionDialog)
        if chosenPlayer:getQuestProgress(36) == 0 then
            sdAction:addOption(0," Make unable to attack!")
        else
            sdAction:addOption(0," Make able to attack!")
        end
        sdAction:addOption(0," Feed!")
        sdAction:addOption(0," -25% foot points!")
       
        User:requestSelectionDialog(sdAction)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Change the magic class.", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
        local race = math.min(player:getRace() + 1, #raceNames)
        sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
        end
    User:requestSelectionDialog(sdPlayer)
end

return M

