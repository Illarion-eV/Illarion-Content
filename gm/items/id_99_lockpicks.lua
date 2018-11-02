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
local globalvar = require("base.globalvar")
local factions = require("base.factions")
local monsterHooks = require("monster.base.hooks")
local explosion = require("base.explosion")
local areas = require("content.areas")
local shard = require("item.shard")
local glyphmagic = require("magic.glyphmagic")
local gods = require("content.gods")
local gems = require("base.gems")
local sepp = require("npc.sepp_leaf")

local M = {}

local itemPos = {"Head","Neck","Breast","Hands","Left Tool","Right Tool",
    "Left Finger","Right Finger","Legs","Feet","Coat","Belt 1",
    "Belt 2","Belt 3","Belt 4","Belt 5","Belt 6"}
itemPos[0] = "Backpack"

local SubLocation={"Cadomyr","Galmair","Runewick","Wilderness","Dungeons"}
local Location={}
Location[1]={"Player","","X","Y","Z"}
Location[2]={"GM Castle","",254,105,0}
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

local maxUserLocation = 6
local maxActionOnChar = 6
local maxActionOnGroup = 6

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
    Character.wrestling,
    Character.enchantingOfJewels
}
local attributeNames={
    "agility",
    "constitution",
    "dexterity",
    "essence",
    "intelligence",
    "perception",
    "strength",
    "willpower"
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

local function ambientActionFlameThrower(user,targetChar)
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

            event(targetChar.pos)
            for i = 1, radius do
                common.CreateCircle(targetChar.pos, i, event)
            end

        else
            user:inform("Provide proper input, please.")
        end

    end

    user:requestInputDialog(InputDialog("Spawn a filled cirecle of flames", "Usage enter: flameId radius wear  -- Flame id can be 359 (fire) or 360 (ice). Radius is capped at 10." ,false, 255, cbInputDialog))
end

local function ambientActionFlameRemover(user,targetChar)
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

            event(targetChar.pos)
            for i = 1, radius do
                common.CreateCircle(targetChar.pos, i, event)
            end

        else
            user:inform("Provide proper input, please.")
        end

    end

    user:requestInputDialog(InputDialog("Remove flames around you", "Usage enter: flameId radius  -- Flame id can be 359 (fire) or 360 (ice). Radius is capped at 10." ,false, 255, cbInputDialog))
end

local function ambientActionFireBreath(User,targetChar)
    local gmSpell = require("monster.base.spells.firecone"){probability = 1,  damage = {from = 1250, to = 1500}, range = 6, angularAperture = 30, itemProbability = 0.1, quality = {from = 0, to = 1}, movepoints = 0}
    gmSpell.cast(User,targetChar)
end

local function ambientActionIceBreath(User,targetChar)
    local gmSpell = require("monster.base.spells.icecone"){probability = 1,  damage = {from = 1250, to = 1500}, range = 6, angularAperture = 30, itemProbability = 0.1, quality = {from = 0, to = 1}, movepoints = 0}
    gmSpell.cast(User,targetChar)
end

local function ambientActionFireRing(targetChar)
    local gmSpell = require("monster.base.spells.firering"){probability = 1, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}, movepoints = 0}
    gmSpell.cast(targetChar,targetChar)
end

local function ambientActionIceRing(targetChar)
    local gmSpell = require("monster.base.spells.icering"){probability = 1, damage = {from = 2200, to = 2700}, range  = 6,
    itemProbability = 0.15, quality = {from = 4, to = 5}, movepoints = 0}
    gmSpell.cast(targetChar,targetChar)
end

local function ambientActionLocalStorm(targetChar)
    local probabilityWindInner = 0.17
    local probabilityWindOuther = 0.01
    local probabilityWind = 1
    local probabilityBlitzInner = 0.1
    local probabilityBlitzOuther = 0.01
    local probabilityBlitz = 1
    local innerCircle = 5
    local outherCircle = 17

    local event = function(currentPosition)
        if world:isItemOnField(currentPosition) == false then
            if math.random() <= probabilityWind then
                world:gfx(globalvar.gfxWIND,currentPosition)
            end
            if math.random() <= probabilityBlitz then
                world:gfx(globalvar.gfxBLITZ,currentPosition)
            end
        end
    end
    world:makeSound(globalvar.sfxTHUNDER,targetChar.pos)
    event(targetChar.pos)
    for i = 1, outherCircle do
        if i <= innerCircle then
            probabilityWind = probabilityWindInner
            probabilityBlitz = probabilityBlitzInner
        else
            probabilityWind = probabilityWindOuther
            probabilityBlitz = probabilityBlitzOuther
        end
        common.CreateCircle(targetChar.pos, i, event)
    end
end

local function ambientActionShardShower(targetChar)
    -- 5- 15 shards in a range of 5-7
    local shardNumber = math.random(5,15)
    local radius = math.random(5,7)
    local centerPos = targetChar.pos
    for i=1, shardNumber do
        local pos = common.getFreePos(centerPos, radius)
        shard.createShardOnPosition(pos)
        world:gfx(globalvar.gfxSUN,pos)
    end
end

local function eraser(User)

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

local function setUserTeleporter(user,Item)
    local validTarget = {}

    local cbChooseLocation = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        local cbInputDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end

            local inputText = dialog:getInput()
            if (string.find(inputText,"(%d+),(%d+),([%-]?%d+),(%S+)") ~= nil) then
                local _, _, xValue, yValue, zValue, targetName = string.find(inputText,"(%d+),(%d+),([%-]?%d+),([%S ]+)")
                Item:setData("gmLocation" .. tostring(index),inputText)
                world:changeItem(Item)
            else
                user:inform("Provide proper input, please. Input was:'"..inputText.."'")
            end

        end

        user:requestInputDialog(InputDialog("Custom target", "Define a customized teleporter target.\n Use: x,y,level,Target name" ,false, 255, cbInputDialog))
    end
    local sdTeleport = SelectionDialog("Teleporter.", "Define a destination:", cbChooseLocation)
    for i = 1, maxUserLocation do
        local locationParameter = Item:getData("gmLocation" .. tostring(i))
        if common.IsNilOrEmpty(locationParameter) then
            sdTeleport:addOption(0, tostring(i)..": empty")
        else
            sdTeleport:addOption(0, tostring(i)..": "..locationParameter)
        end
    end
    user:requestSelectionDialog(sdTeleport)
end

local function teleporter(User,item)
    local validTarget = {}
    local validCharPos = {}

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
                local warpToPlayer = validCharPos[dialog:getSelectedIndex() + 1]
                if isValidChar(warpToPlayer) then
                    User:warp(position(warpToPlayer.pos.x, warpToPlayer.pos.y, warpToPlayer.pos.z))
                else
                    User:inform("This character is not online anymore.")
                end
            end
            local sdTeleportPlayer = SelectionDialog("Teleporter.", "Choose a destination:", cbChoosePlayerLocation)
            for i, checkChar in pairs (onlineChars) do
                if checkChar.id ~= User.id then
                    sdTeleportPlayer:addOption(0, checkChar.name .. " (" .. checkChar.pos.x..", "..checkChar.pos.y..", "..checkChar.pos.z .. ")")
                    table.insert(validCharPos, checkChar)
                end
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
    for i = 1, maxUserLocation do
        local locationParameter = item:getData("gmLocation" .. tostring(i))
        if not common.IsNilOrEmpty(locationParameter) then
            if (string.find(locationParameter,"(%d+),(%d+),([%-]?%d+),(%S+)") ~= nil) then
                local _, _, xValue, yValue, zValue, targetName = string.find(locationParameter,"(%d+),(%d+),([%-]?%d+),([%S ]+)")
                sdTeleport:addOption(0, targetName .. " (" .. tostring(xValue)..",".. tostring(yValue)..",".. tostring(zValue)..")")
                validTarget[optionId] = {tonumber(xValue), tonumber(yValue), tonumber(zValue),0}
                optionId = optionId+1
            end
        end
    end
    User:requestSelectionDialog(sdTeleport)
end

local function factionInfoOfCharsInRadius(User)

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

local function charInfo(chosenPlayer)
    local output = ""
    local faction = factions.getFaction(chosenPlayer)
    local factionInfo = "Town: " .. factions.getMembershipByName(chosenPlayer)
    factionInfo = factionInfo .. " - already " .. faction.towncnt .. " x changed"
    if (factions.townRanks[faction.tid] ~= nil and factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
        local germanRank, englishRank = factions.getRank(chosenPlayer, true)
        factionInfo = factionInfo .. "\nRank: " .. englishRank .. "/" .. germanRank
    else
        factionInfo = factionInfo .. "\nRank: no rank " .. faction.rankTown
    end
    factionInfo = factionInfo .. "  Rankpoints: " .. faction.rankpoints
    output = "HP: "..chosenPlayer:increaseAttrib("hitpoints", 0).." MP: "..chosenPlayer:increaseAttrib("mana", 0).." FL: "..chosenPlayer:increaseAttrib("foodlevel", 0).."\nMC: "..chosenPlayer:getMentalCapacity()..
            "\nSTR: "..chosenPlayer:increaseAttrib("strength", 0).." CON: "..chosenPlayer:increaseAttrib("constitution", 0).." DEX: "..chosenPlayer:increaseAttrib("dexterity", 0).." AGI: "..chosenPlayer:increaseAttrib("agility", 0)..
            "\nINT: "..chosenPlayer:increaseAttrib("intelligence", 0).." WIL: "..chosenPlayer:increaseAttrib("willpower", 0).." PERC: "..chosenPlayer:increaseAttrib("perception", 0).." ESS: "..chosenPlayer:increaseAttrib("essence", 0)..
            "\nIdle for [s]: "..tostring(chosenPlayer:idleTime()) ..
            "\n" .. factionInfo

    local godInfo = gods.getCharStatusEn(chosenPlayer)
    output = output .. "\nReligion: " .. godInfo

    local specialInfo = ""
    if chosenPlayer:isAdmin() then
        specialInfo = specialInfo .. "is admin"
    end
    if not chosenPlayer:getClippingActive() then
        if not common.IsNilOrEmpty(specialInfo) then
            specialInfo = specialInfo .. " - "
        end
        specialInfo = specialInfo .. "can pass walls"
    end
    if chosenPlayer:isNewPlayer() then
        if not common.IsNilOrEmpty(specialInfo) then
            specialInfo = specialInfo .. " - "
        end
        specialInfo = specialInfo .. "is new player"
    end
    if not common.IsNilOrEmpty(specialInfo) then
        output = output .. "\n" .. specialInfo
    end
    return output
end

local function String2Number(str)
    if (string.find(str, "(-?%d+)") ~= nil) then
        local _, _, num = string.find(str, "(-?%d+)")
        if (num ~= "") then
            num = tonumber(num)
            return num, true
        end
    end
    return 0, false
end

local function settingsForCharSkills(User, chosenPlayer)
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

local function settingsForCharAttributes(User, chosenPlayer)
    local textShown
    local attibuteDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local chosenAttribute = attributeNames[dialog:getSelectedIndex() + 1]
        local changeDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local attributeValue, okay = String2Number(dialog:getInput())
            if (not okay) then
                User:inform("no number")
                return
            end
            if not chosenPlayer:isBaseAttributeValid(chosenAttribute,attributeValue) then
                User:inform("Value out of permitted range.")
--                return
            end
            User:logAdmin("changes attribute of character " .. chosenPlayer.name .. ". " .. chosenAttribute .. " from " .. chosenPlayer:getBaseAttribute(chosenAttribute).. " to " .. tostring(attributeValue)..".")
            User:inform("change " .. chosenAttribute .. " from " .. chosenPlayer:getBaseAttribute(chosenAttribute).. " to " .. tostring(attributeValue)..".")
            chosenPlayer:setBaseAttribute(chosenAttribute,attributeValue)
        end
        local sdChange = InputDialog("Change attribute for "..chosenPlayer.name, "Type in the new value for "..chosenAttribute.."\nCurrent value: " .. chosenPlayer:getBaseAttribute(chosenAttribute), false, 255, changeDialog)
        User:requestInputDialog(sdChange)
    end
    local attributeSum = chosenPlayer:getBaseAttributeSum()
    local attributePermit = chosenPlayer:getMaxAttributePoints()
    textShown = "What attribute do you wish to change for "..chosenPlayer.name.."?\nToals sum is "..tostring(attributeSum).." of "..tostring(attributePermit).."."
    if attributeSum > attributePermit then
        textShown = textShown .. "\n"..tostring(attributeSum-attributePermit).." too hight!"
    elseif attributeSum < attributePermit then
        textShown = textShown .. "\n"..tostring(attributePermit-attributeSum).." too low!"
    else
        textShown = textShown .. "\nConfiguration is permitted!"
    end
    local sdAttribute = SelectionDialog("Select attribute", textShown, attibuteDialog)
    for _, attribute in ipairs(attributeNames) do
        sdAttribute:addOption(0,attribute.." value: "..chosenPlayer:getBaseAttribute(attribute))
    end
    User:requestSelectionDialog(sdAttribute)
end

local function settingsForCharChangeDevotion(User, chosenPlayer)
    local dialogOptions = {
        {text = "Not devoted", func = gods.setNotDevoted, args = { chosenPlayer } },
    }
    for god,_ in pairs(gods.GODS) do
        table.insert(dialogOptions,
            {text = gods.getNameEn(god), func = gods.setDevoted, args = { chosenPlayer, god } }
        )
    end

    common.selectionDialogWrapper(User, "Char devotion", gods.getCharStatusEn(chosenPlayer).."\nWhich god do you want this char to be devoted?", dialogOptions)

end

local function settingsForCharChangeDivineFavour(User, chosenPlayer, god)
    local changeDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local enteredText = dialog:getInput()
        local firstChar = string.sub(enteredText, 1, 1)

        local enteredValue, okay = String2Number(string.sub(enteredText, 2))
        if (not okay) then
            User:inform("no number")
            return
        end

        local delta
        if firstChar == "-" then
            delta = -enteredValue
        elseif firstChar == "+" then
            delta = enteredValue
        elseif firstChar == "=" then
            delta = enteredValue - gods.getFavour(chosenPlayer, god)
        else
            User:inform("Must start with '+' or '-' or '='.")
            return
        end

        if (delta < -4000 or delta > 4000) then
            User:inform("Change value has to be between -4000 and 4000.")
            return
        end

        gods.increaseFavour(chosenPlayer, god, delta)
        User:logAdmin("changes divine favour of character " .. chosenPlayer.name .. ". " .. gods.getNameEn(god) .. ": by " .. delta .. " to " .. gods.getFavour(chosenPlayer, god))
    end
    local sdChange = InputDialog(
        "Change favour of "..gods.getNameEn(god),
        "Current value: "..gods.getFavour(chosenPlayer, god).."\n"..
        "Type in by how much to increase/decrease it, start with '+' or '-' or '=' :",
        false, 255, changeDialog)
    User:requestInputDialog(sdChange)
end


local function settingsForCharReligion(User, chosenPlayer)
    local dialogOptions = {
        {text = "Change devotion", func = settingsForCharChangeDevotion, args = { User, chosenPlayer } },
    }
    if gods.isDevoted(chosenPlayer) then
        table.insert(dialogOptions,
            {text = "Make priest", func = gods.setPriest, args = { chosenPlayer } }
        )
    end

    for god,_ in pairs(gods.GODS) do
        table.insert(dialogOptions,
            {text = "Favour of "..gods.getNameEn(god)..": "..gods.getFavour(chosenPlayer,god), func = settingsForCharChangeDivineFavour, args = { User, chosenPlayer, god } }
        )
    end

    common.selectionDialogWrapper(User, "Char religion", gods.getCharStatusEn(chosenPlayer), dialogOptions)

end

local function godMode(User, SourceItem, ltstate)

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
                monsterHooks.cleanHooks(monster)
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

local function numberIsPercent(inputValue)
    local outputValue = 0
    if not common.IsNilOrEmpty(inputValue) then
        if inputValue == "max" then
            outputValue = 100 -- below 1% will not filled full
        elseif tonumber(inputValue) > -100 and tonumber(inputValue) <= 100 then
            outputValue = tonumber(inputValue)/100
        end
    end
    return outputValue
end

local function gfxsfxVerification(inputValue)
    local outputValue = 0
    if not common.IsNilOrEmpty(inputValue) then
        outputValue = tonumber(inputValue)
        if outputValue == nil then
            outputValue = 0
        end
    end
    return outputValue
end

local function actionOnCharSingleChar(targetChar, gfxValue, changeHP, changeMP, changeFL,textToPlayer)
-- Free configurable without sound
    local currentHP = targetChar:increaseAttrib("hitpoints", 0)
    local currentMP = targetChar:increaseAttrib("mana", 0)
    local currentFL = targetChar:increaseAttrib("foodlevel", 0)
    targetChar:increaseAttrib("hitpoints", currentHP*numberIsPercent(changeHP))
    targetChar:increaseAttrib("mana", currentMP*numberIsPercent(changeMP))
    targetChar:increaseAttrib("foodlevel", currentFL*numberIsPercent(changeFL))
    if gfxsfxVerification(gfxValue) ~= 0 then
        world:gfx(gfxsfxVerification(gfxValue),targetChar.pos)
    end
    if not common.IsNilOrEmpty(textToPlayer) then
        targetChar:inform(textToPlayer)
    end
end

local function setUserActionOnGroup(user,Item)
    local validTarget = {}

    local cbChooseAction = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        local cbInputDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end

            local inputText = dialog:getInput()
            if (string.find(inputText,"([%S ]+),(%d+),(%d+),(%d+),(%S+),(%S+),(%S+)") ~= nil) then
                Item:setData("gmSequenceOnGroup" .. tostring(index),inputText)
                world:changeItem(Item)
            else
                user:inform("Provide proper input, please. Input was:'"..inputText.."'")
            end

        end

        user:requestInputDialog(InputDialog("Custom action", "Use: action name,range,gfx,sfx,HP%,MP%,FL%,text\nHP% MP% FL% percentage:\n   -99 .. 100 related to current state \n   'max' fill full" ,false, 255, cbInputDialog))
    end
    local sdAction = SelectionDialog("Customized action.", "Select a slot for actions on char:", cbChooseAction)
    for i = 1, maxActionOnChar do
        local sequenceParameter = Item:getData("gmSequenceOnGroup" .. tostring(i))
        if common.IsNilOrEmpty(sequenceParameter) then
            sdAction:addOption(0, tostring(i)..": empty")
        else
            sdAction:addOption(0, tostring(i)..": "..sequenceParameter)
        end
    end
    user:requestSelectionDialog(sdAction)
end

local function setUserActionOnChar(user,Item)
    local validTarget = {}

    local cbChooseAction = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        local cbInputDialog = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end

            local inputText = dialog:getInput()
            if (string.find(inputText,"([%S ]+),(%d+),(%d+),(%S+),(%S+),(%S+)") ~= nil) then
                Item:setData("gmSequenceOnChar" .. tostring(index),inputText)
                world:changeItem(Item)
            else
                user:inform("Provide proper input, please. Input was:'"..inputText.."'")
            end

        end

        user:requestInputDialog(InputDialog("Custom action", "Use: action name,gfx,sfx,HP%,MP%,FL%,text\nHP% MP% FL% percentage:\n   -99 .. 100 related to current state \n   'max' fill full" ,false, 255, cbInputDialog))
    end
    local sdAction = SelectionDialog("Customized action.", "Select a slot for actions on char:", cbChooseAction)
    for i = 1, maxActionOnChar do
        local sequenceParameter = Item:getData("gmSequenceOnChar" .. tostring(i))
        if common.IsNilOrEmpty(sequenceParameter) then
            sdAction:addOption(0, tostring(i)..": empty")
        else
            sdAction:addOption(0, tostring(i)..": "..sequenceParameter)
        end
    end
    user:requestSelectionDialog(sdAction)
end

local function actionOnCharInput(user,targetChar)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local inputText = dialog:getInput()
        if (string.find(inputText,"(%S+),(%S+),(%S+),(%S+),(%S+)") ~= nil) then
            local _, _, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(inputText,"(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
            actionOnCharSingleChar(targetChar, gfxValue, changeHP, changeMP, changeFL, textToPlayer)
            if gfxsfxVerification(sfxValue) ~= 0 then
                world:makeSound(gfxsfxVerification(sfxValue),targetChar.pos)
            end
            user:logAdmin("Performed a customized sequence on " ..  targetChar.name)
        else
            user:inform("Provide proper input, please. '"..inputText.."'")
        end

    end

    user:requestInputDialog(InputDialog("Custom event on char", "Perform a sequence on " .. targetChar.name .."\n Use: gfx,sfx,HP%,MP%,FL%,text\nHP% MP% FL% percentage:\n   -99 .. 100 related to current state \n   'max' fill full" ,false, 255, cbInputDialog))
end

local function actionOnGroupInput(user,targetChar)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local inputText = dialog:getInput()
        if (string.find(inputText,"(%d+),(%S+),(%S+),(%S+),(%S+),(%S+)") ~= nil) then
            local _, _, rangeInput, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(inputText,"(%d+),(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
            local range = tonumber(rangeInput)
            if range == nil or range < 1 then
                range = 1
            elseif range > 20 then
                range = 20
            end
            local playersTmp = world:getPlayersInRangeOf(targetChar.pos, range)
            for _, player in pairs(playersTmp) do
                if (player.id ~= user.id) then
                    actionOnCharSingleChar(player, gfxValue, changeHP, changeMP, changeFL, textToPlayer)
                end
            end
            if gfxsfxVerification(sfxValue) ~= 0 then
                world:makeSound(gfxsfxVerification(sfxValue),targetChar.pos)
            end
            user:logAdmin("Performed a customized sequence on " ..  targetChar.name)
        else
            user:inform("Provide proper input, please. '"..inputText.."'")
        end

    end

    user:requestInputDialog(InputDialog("Custom event on char", "Perform a sequence on " .. targetChar.name .."\n Use: range,gfx,sfx,HP%,MP%,FL%,text\nrange is capped at 20\nHP% MP% FL% percentage:\n   -99 .. 100 related to current state \n   'max' fill full" ,false, 255, cbInputDialog))
end

local function actionOnCharDivineFeed(User, targetChar)
-- Full Mana and food, + 10% health, fairy shower
    targetChar:increaseAttrib("mana", 10000)
    targetChar:increaseAttrib("foodlevel", 100000)
    targetChar:increaseAttrib("hitpoints", 1000)
    world:gfx(globalvar.gfxSCOTTY,targetChar.pos)
    common.InformNLS(targetChar, "Du fühlst dich frisch und satt.", "You feel fresh and well-feed.")
    User:logAdmin("Performed DivineFeed on " ..  targetChar.name)
end

local function actionOnCharDivineNotice(User, targetChar)
-- lightspot, wind
    world:gfx(globalvar.gfxSUN,targetChar.pos)
    world:makeSound(globalvar.sfxWIND2,targetChar.pos)
    common.InformNLS(targetChar, "Ein sanfter Wind umspielt deinen Kopf. Du fühlst dich gut.", "A soft wind touches your head. You feel good.")
    User:logAdmin("Performed DivineNotice on " ..  targetChar.name)
end

local function actionOnCharDivineFury(User, targetChar)
-- Take 25% Mana and food, - 10% health, lightning, thunder
    targetChar:increaseAttrib("mana", -2500)
    targetChar:increaseAttrib("foodlevel", -25000)
    targetChar:increaseAttrib("hitpoints", -1000)
    world:gfx(globalvar.gfxBLITZ,targetChar.pos)
    world:makeSound(globalvar.sfxTHUNDER,targetChar.pos)
    common.InformNLS(targetChar, "Bilder zorniger Götter laufen vor deinen Augen ab.", "Visions of angry Gods fill your head.")
    User:logAdmin("Performed DivineFury on " ..  targetChar.name)
end

local function settingsForCharQueststatus(User, chosenPlayer)
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
            settingsForCharQueststatus(User, chosenPlayer) -- re-call dialog
        end
    end
    local idChange = InputDialog("Get/ Set Queststatus for "..chosenPlayer.name, "Usage: To get the value type in the questnumber.\n To set the value type in questnumber and the new status.", false, 255, changeDialog)
    User:requestInputDialog(idChange)
end

local function settingsForCharMagicClass(User, chosenPlayer)
    local magicClassDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local targetClass = dialog:getSelectedIndex()
        if targetClass ~= chosenPlayer:getMagicType() then
            User:logAdmin("Change magic class of character " .. chosenPlayer.name .. " from " .. classNames[chosenPlayer:getMagicType()].. " to " .. classNames[targetClass])
            chosenPlayer:setMagicType(targetClass)
            if targetClass == 0 then -- Mage
                chosenPlayer:setQuestProgress(37, 1)
            else
                chosenPlayer:setQuestProgress(37, 0)
            end
            common.InformNLS(chosenPlayer, "[GM Info] Die magische Klasse wurde auf " .. classNames[targetClass] .. "geändert", "[GM Info] The magic class has been changed to" .. classNames[targetClass].. ".")
        end
    end
    local sdClass = SelectionDialog("Change Magic Class", "What magic class should be set for "..chosenPlayer.name.."?", magicClassDialog)
    for i=0, #classNames do
        if chosenPlayer:getMagicType() == i then
            sdClass:addOption(0," Is: "..classNames[i])
        else
            sdClass:addOption(0," Change to: "..classNames[i])
        end
    end
    User:requestSelectionDialog(sdClass)
end

local function settingsForCharMC(User, targetChar)

    local setMCInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if input == "" or not input then
            User:inform("MC of char " .. targetChar.name .. ": " .. targetChar:getMentalCapacity())
            return
        end

        input = math.ceil(tonumber(input))

        if input < 1 or input > 100000000 then
            User:inform("Invalid input. Value not in range 1-100000000")
            return
        end

        targetChar:increaseMentalCapacity(input - targetChar:getMentalCapacity())
        User:inform("New MC: "..User:getMentalCapacity())
        User:logAdmin("Set MC for " ..  targetChar.name .. " to " .. tostring(input))

    end

    User:requestInputDialog(InputDialog("Get / Set MC", "Set desired MC value (1-100000000).\nEmpty for get the current value." ,false, 255, setMCInputDialog))

end

local function settingsForCharAttacableLimited(User, chosenPlayer)
    if chosenPlayer:getQuestProgress(236) == 0 then
        chosenPlayer:setQuestProgress(236,3)
        User:logAdmin("Make character " .. chosenPlayer.name .. " unable to be attacked for 15 min.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird für ca. 15 Minuten nicht von NPC angegriffen.", "[GM Info] Your character is unable to be attacked by NPC for about 15 min.")
    else
        chosenPlayer:setQuestProgress(236,0)
        User:logAdmin("Remove character " .. chosenPlayer.name .. " limited attack proof.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird wieder von NPC angegriffen.", "[GM Info] Your character can be attacked by NPC again.")
    end
end

local function settingsForCharAttacableForever(User, chosenPlayer)
    if chosenPlayer:getQuestProgress(36) == 0 then
        chosenPlayer:setQuestProgress(36,1)
        User:logAdmin("Make character " .. chosenPlayer.name .. " unable to be attacked for ever.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird nie wieder von NPC angegriffen.", "[GM Info] Your character is unable to be attacked by NPC for ever.")
    else
        chosenPlayer:setQuestProgress(36,0)
        User:logAdmin("Remove character " .. chosenPlayer.name .. " indefinite attack proof.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird wieder von NPC angegriffen.", "[GM Info] Your character can be attacked by NPC again.")
    end
end

local function settingsForCharFireProof(User, chosenPlayer)
    if chosenPlayer:getQuestProgress(298) == 0 then
        chosenPlayer:setQuestProgress(298,3)
        User:logAdmin("Make character " .. chosenPlayer.name .. " fireproof for 15 min.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird für ca. 15 Minuten gegen magische Flammen resistent sein.", "[GM Info] Your character is proof against magic flames for about 15 min.")
    else
        chosenPlayer:setQuestProgress(298,0)
        User:logAdmin("Remove fireproof for character " .. chosenPlayer.name .. " .")
        common.InformNLS(chosenPlayer, "[GM Info] Die Resistenz gegen magische Flammen ist beendet.", "[GM Info] Your character's proof against magic flames is over.")
    end
end

local function settingsForCharIceFlameProof(User, chosenPlayer)
    if chosenPlayer:getQuestProgress(299) == 0 then
        chosenPlayer:setQuestProgress(299,3)
        User:logAdmin("Make character " .. chosenPlayer.name .. " ice flame proof for 15 min.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird für ca. 15 Minuten gegen Eisflammen resistent sein.", "[GM Info] Your character is proof against ice flames for about 15 min.")
    else
        chosenPlayer:setQuestProgress(299,0)
        User:logAdmin("Remove ice flame proof for character " .. chosenPlayer.name .. " .")
        common.InformNLS(chosenPlayer, "[GM Info] Die Resistenz gegen Eisflammen ist beendet.", "[GM Info] Your character's proof against ice flames is over.")
    end
end

local function settingsForCharPoisonCloudProof(User, chosenPlayer)
    if chosenPlayer:getQuestProgress(300) == 0 then
        chosenPlayer:setQuestProgress(300,3)
        User:logAdmin("Make character " .. chosenPlayer.name .. " proof against poison clouds for 15 min.")
        common.InformNLS(chosenPlayer, "[GM Info] Dein Char wird für ca. 15 Minuten gegen Giftwolken resistent sein.", "[GM Info] Your character is proof against poison clouds for about 15 min.")
    else
        chosenPlayer:setQuestProgress(300,0)
        User:logAdmin("Remove proof against poison clouds for character " .. chosenPlayer.name .. " .")
        common.InformNLS(chosenPlayer, "[GM Info] Die Resistenz gegen Giftwolken ist beendet.", "[GM Info] Your character's proof against poison clouds is over.")
    end
end

local function ambientAction(User)

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
                ambientActionFlameThrower(User, chosenPlayer)
            elseif actionToPerform == 1 then
                ambientActionFlameRemover(User, chosenPlayer)
            elseif actionToPerform == 2 then
                ambientActionFireBreath(User, chosenPlayer)
            elseif actionToPerform == 3 then
                ambientActionIceBreath(User, chosenPlayer)
            elseif actionToPerform == 4 then
                ambientActionFireRing(chosenPlayer)
            elseif actionToPerform == 5 then
                ambientActionIceRing(chosenPlayer)
            elseif actionToPerform == 6 then
                ambientActionLocalStorm(chosenPlayer)
            elseif actionToPerform == 7 then
                explosion.CreateExplosion(chosenPlayer.pos)
            elseif actionToPerform == 8 then
                ambientActionShardShower(chosenPlayer)
            end
        end
        local sdAction = SelectionDialog("Select effect", "Effect center is "..chosenPlayer.name.."?", charActionDialog)
        sdAction:addOption(0,"Create flame area")
        sdAction:addOption(0,"Extinguish flame area")
        sdAction:addOption(0,"Dragon fire breath")
        sdAction:addOption(0,"Dragon ice breath")
        sdAction:addOption(0,"Fire ring")
        sdAction:addOption(0,"Ice ring")
        sdAction:addOption(0,"Local thunderstorm")
        sdAction:addOption(0,"Explosion")
        sdAction:addOption(0,"Glyph shard shower")

        User:requestSelectionDialog(sdAction)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Ambient action.", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
    local meFirst = true
        for _, player in ipairs(players) do
            local race = math.min(player:getRace() + 1, #raceNames)
            if meFirst then
                sdPlayer:addOption(0, "Me")
                meFirst = false
            else
                sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
        end
    User:requestSelectionDialog(sdPlayer)
end

local function actionOnChar(User, item)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end
    local validAction = {}

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
                actionOnCharInput(User,chosenPlayer)
            elseif actionToPerform == 1 then
                actionOnCharDivineNotice(User, chosenPlayer)
            elseif actionToPerform == 2 then
                actionOnCharDivineFeed(User, chosenPlayer)
            elseif actionToPerform == 3 then
                actionOnCharDivineFury(User, chosenPlayer)
            else
                local inputText = item:getData("gmSequenceOnChar" .. tostring(validAction[actionToPerform]))
                if (string.find(inputText,"([%S ]+),(%S+),(%S+),(%S+),(%S+),(%S+)") ~= nil) then
                    local _, _, actionName, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(inputText,"([%S ]+),(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
                    actionOnCharSingleChar(chosenPlayer, gfxValue, changeHP, changeMP, changeFL, textToPlayer)
                    if gfxsfxVerification(sfxValue) ~= 0 then
                        world:makeSound(gfxsfxVerification(sfxValue),chosenPlayer.pos)
                    end
                    User:logAdmin("Performed a customized sequence on " ..  chosenPlayer.name)
                else
                    User:inform("Wrong configured sequence. '"..inputText.."'")
                end
            end
        end
        local sdAction = SelectionDialog("Select action", "What action should be performed for "..chosenPlayer.name.."?", charActionDialog)
        sdAction:addOption(2745,"Free configurable action")
        sdAction:addOption(400,"Divine notice!")
        sdAction:addOption(2278,"Divine feed and mana!")
        sdAction:addOption(2627,"Divine fury")
        local optionId = 4
        for i = 1, maxActionOnChar do
            local sequenceParameter = item:getData("gmSequenceOnChar" .. tostring(i))
            if not common.IsNilOrEmpty(sequenceParameter) then
                if (string.find(sequenceParameter,"([%S ]+),([%S ]+)") ~= nil) then
                    local _, _, actionName, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(sequenceParameter,"([%S ]+),(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
                    sdAction:addOption(463, actionName)
                    validAction[optionId] = i
                    optionId = optionId+1
                end
            end
        end

        User:requestSelectionDialog(sdAction)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Event on single char.", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
    local meFirst = true
        for _, player in ipairs(players) do
            local race = math.min(player:getRace() + 1, #raceNames)
            if meFirst then
                sdPlayer:addOption(0, "Me")
                meFirst = false
            else
                sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
        end
    User:requestSelectionDialog(sdPlayer)
end

local function actionOnGroup(User,item)

    local playersTmp = world:getPlayersInRangeOf(User.pos, 25)
    local players = {User}
    for _, player in pairs(playersTmp) do
        if (player.id ~= User.id) then
            table.insert(players, player)
        end
    end
    local validAction = {}

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
                actionOnGroupInput(User,chosenPlayer)
            else
                local inputText = item:getData("gmSequenceOnGroup" .. tostring(validAction[actionToPerform]))
                if (string.find(inputText,"([%S ]+),(%S+),(%S+),(%S+),(%S+),(%S+)") ~= nil) then
                    local _, _, rangeInput, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(inputText,"(%d+),(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
                    local range = tonumber(rangeInput)
                    if range == nil or range < 1 then
                        range = 1
                    elseif range > 20 then
                        range = 20
                    end
                    local playersTmp = world:getPlayersInRangeOf(chosenPlayer.pos, range)
                    for _, player in pairs(playersTmp) do
                        if (player.id ~= User.id) then
                            actionOnCharSingleChar(player, gfxValue, changeHP, changeMP, changeFL, textToPlayer)
                        end
                    end
                    if gfxsfxVerification(sfxValue) ~= 0 then
                        world:makeSound(gfxsfxVerification(sfxValue),chosenPlayer.pos)
                    end
                    User:logAdmin("Performed a customized sequence on " ..  chosenPlayer.name)
                else
                    User:inform("Wrong configured sequence. '"..inputText.."'")
                end
            end
        end
        local sdAction = SelectionDialog("Select action", "What action should be performed for all player?\nCenter of action at "..chosenPlayer.name.."?", charActionDialog)
        sdAction:addOption(2745,"Free configurable action")

        local optionId = 1
        for i = 1, maxActionOnGroup do
            local sequenceParameter = item:getData("gmSequenceOnGroup" .. tostring(i))
            if not common.IsNilOrEmpty(sequenceParameter) then
                if (string.find(sequenceParameter,"([%S ]+),([%S ]+)") ~= nil) then
                    local _, _, actionName, rangeInput, gfxValue, sfxValue, changeHP, changeMP, changeFL, textToPlayer = string.find(sequenceParameter,"([%S ]+),(%d+),(%S+),(%S+),(%S+),(%S+),(%S+),([%S ]+)")
                    sdAction:addOption(463, actionName)
                    validAction[optionId] = i
                    optionId = optionId+1
                end
            end
        end
        User:requestSelectionDialog(sdAction)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Event on group.", "First choose center of event:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
    local meFirst = true
        for _, player in ipairs(players) do
            local race = math.min(player:getRace() + 1, #raceNames)
            if meFirst then
                sdPlayer:addOption(0, "Me")
                meFirst = false
            else
                sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
        end
    User:requestSelectionDialog(sdPlayer)
end

local function settingsForChar(User)

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
                settingsForCharQueststatus(User, chosenPlayer)
            elseif actionToPerform == 1 then
                settingsForCharAttacableLimited(User, chosenPlayer)
            elseif actionToPerform == 2 then
                settingsForCharAttacableForever(User, chosenPlayer)
            elseif actionToPerform == 3 then
                settingsForCharSkills(User, chosenPlayer)
            elseif actionToPerform == 4 then
                settingsForCharMagicClass(User, chosenPlayer)
            elseif actionToPerform == 5 then
                settingsForCharMC(User, chosenPlayer)
            elseif actionToPerform == 6 then
                settingsForCharFireProof(User, chosenPlayer)
            elseif actionToPerform == 7 then
                settingsForCharIceFlameProof(User, chosenPlayer)
            elseif actionToPerform == 8 then
                settingsForCharPoisonCloudProof(User, chosenPlayer)
            elseif actionToPerform == 9 then
                settingsForCharAttributes(User, chosenPlayer)
            elseif actionToPerform == 10 then
                settingsForCharReligion(User, chosenPlayer)
            end
        end
        local sdAction = SelectionDialog("Character settings", chosenPlayer.name.."\n" .. charInfo(chosenPlayer), charActionDialog)
        sdAction:addOption(3109,"Get/set Queststatus")
        if chosenPlayer:getQuestProgress(236) == 0 then
            sdAction:addOption(20,"Make 15 min attack proof!")
        else
            sdAction:addOption(1,"Remove time limited  attack proof! (" .. tostring(chosenPlayer:getQuestProgress(236)*5) .. "min)")
        end
        if chosenPlayer:getQuestProgress(36) == 0 then
            sdAction:addOption(20,"Make for ever attack proof!")
        else
            sdAction:addOption(1,"Remove indefinite attack proof!")
        end
        sdAction:addOption(23,"Change skills")
        sdAction:addOption(2784,"Set magic class")
        sdAction:addOption(106,"Set MC (mental capacity)")
        if chosenPlayer:getQuestProgress(298) == 0 then
            sdAction:addOption(52,"Make 15 min fire proof!")
        else
            sdAction:addOption(51,"Remove fire proof!")
        end
        if chosenPlayer:getQuestProgress(299) == 0 then
            sdAction:addOption(193,"Make 15 min ice flame proof!")
        else
            sdAction:addOption(180,"Remove ice flame proof!")
        end
        if chosenPlayer:getQuestProgress(300) == 0 then
            sdAction:addOption(167,"Make 15 min poison cloud proof!")
        else
            sdAction:addOption(164,"Remove poison cloud proof!")
        end
        sdAction:addOption(93,"Set attributes")

        sdAction:addOption(1060, "Religion")

        User:requestSelectionDialog(sdAction)
    end
    --Dialog to choose the player
    local sdPlayer = SelectionDialog("Character settings", "First choose a character:", cbChoosePlayer)
    local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
    local meFirst = true
        for _, player in ipairs(players) do
            local race = math.min(player:getRace() + 1, #raceNames)
            if meFirst then
                sdPlayer:addOption(0, "Me")
                meFirst = false
            else
                sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id)
            end
        end
    User:requestSelectionDialog(sdPlayer)
end

local function testArea(User)
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local point = User.pos
            if areas.PointInArea(point, input) then
                User:inform("This is part of area "..input)
            else
                User:inform("This is not part of area "..input)
           end
        end

    end

    User:requestInputDialog(InputDialog("Is char in area?", "Enter the area name according to areas.lua" ,false, 255, thisInputDialog))

end

local function testBanduk(user)
    user:inform(">>> developer test area")
    
    local pos = user.pos
    local number = common.positionToNumber(pos)
    local tpos = common.numberToPosition(number)

    user:inform(">>>:"..tostring(pos.x).."."..tostring(pos.y).."."..tostring(pos.z).."=="..tostring(number).."=="..tostring(tpos.x).."."..tostring(tpos.y).."."..tostring(tpos.z))
end

function M.UseItem(User, SourceItem, ltstate)
    --if injured, heal!
    User:increaseAttrib("hitpoints", 10000)
    User:increaseAttrib("mana", 10000)
    User:increaseAttrib("foodlevel", 100000)

    -- First check for mode change
    local modes = {"Eraser", "Teleport", "Instant kill/ revive", "Char Settings", "Global events", "Events on single char", "Events on groups", "Faction info of chars in radius", "Quest events","Define Teleporter Targets","Define events on single char","Define events on groups","Test area","Test"}
--    local modes = {"Eraser", "Teleport", "Instant kill/ revive", "Char Settings", "Global events", "Events on single char", "Events on groups", "Faction info of chars in radius", "Quest events","Define Teleporter Targets","Define events on single char","Define events on groups","Test area"}
    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            eraser(User)
        elseif index == 2 then
            teleporter(User, SourceItem)
        elseif index == 3 then
            godMode(User, SourceItem, ltstate)
        elseif index == 4 then
            settingsForChar(User)
        elseif index == 5 then
            ambientAction(User)
        elseif index == 6 then
            actionOnChar(User, SourceItem)
        elseif index == 7 then
            actionOnGroup(User, SourceItem)
        elseif index == 8 then
            factionInfoOfCharsInRadius(User, SourceItem, ltstate)
        elseif index == 9 then
            questEvents(User, SourceItem, ltstate)
        elseif index == 10 then
            setUserTeleporter(User, SourceItem)
        elseif index == 11 then
            setUserActionOnChar(User, SourceItem)
        elseif index == 12 then
            setUserActionOnGroup(User, SourceItem)
        elseif index == 13 then
            testArea(User)
        elseif index == 14 then
            testBanduk(User)
        end
    end
    local sd = SelectionDialog("Pick a function of the lockpicks.", "Which do you want to use?", cbSetMode)
    for _, m in ipairs(modes) do
        sd:addOption(0, m)
    end
    User:requestSelectionDialog(sd)
end

function M.LookAtItem(User, Item)
    lookat.SetSpecialDescription(Item, "Verwende die Dietriche zum Aufrufen der Funktionen.", "Use the lockpicks to pick a function.")
    lookat.SetSpecialName(Item, "Dietriche", "Lockpicks")
    return lookat.GenerateLookAt(User, Item, lookat.METAL)
end

return M

