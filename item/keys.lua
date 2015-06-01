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

-- UPDATE items SET itm_script='item.keys' WHERE itm_id IN (2121,2122,2123,2124,2141,2144,2145,2161,2556,2558,3054,3055,3056);

local keys = require("base.keys")
local common = require("base.common")
local doors = require("base.doors")
local factions = require("base.factions")
local lookat = require("base.lookat")
local money = require("base.money")

local M = {}

local SentenceCharacter
local GuardBehaviourTowardsChar
local SelectTargetChar
local LabourCamp

local function getDoor(User)

    local targetItem = common.GetFrontItem(User)
    if targetItem ~= nil and (doors.CheckClosedDoor(targetItem.id) or doors.CheckOpenDoor(targetItem.id)) then
        return targetItem
    end

    local Radius = 1
    for x = -Radius ,Radius do
        for y = -Radius, Radius do
            local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z)
            if (world:isItemOnField(targetPos)) then
                local targetItem = world:getItemOnField(targetPos)
                if targetItem ~= nil and (doors.CheckClosedDoor(targetItem.id) or doors.CheckOpenDoor(targetItem.id)) then
                    return targetItem
                end
            end
        end
    end
    return nil
end

function M.UseItem(User, SourceItem)

    if SourceItem:getData("townKeyOf") ~= "" then
        -- sentence char to forced labour
        SentenceCharacter(User,SourceItem)
        return
    end

    local itemData
    local isRonaganTrap = (SourceItem:getData("ronaganTrap") == "true")
    if (isRonaganTrap == true) then
        User:inform("Ein Dieb hat dich in eine Falle gelockt. Er springt aus einem der Schatten und stielt dir ein paar Münzen.", "A thief has lured you into a trap, jumping out from a shadow, he steals some coins from you.")

        -- steal 1% - 5% of characters money in inventroy
        local wealth = money.CharCoinsToMoney(User)
        money.TakeMoneyFromChar(User, math.random(math.floor(wealth / 100), math.floor(wealth / 20)))
        return
   end
    
    local doorItem = getDoor(User)
    if not doorItem then
        return
    end

    common.TurnTo(User, doorItem.pos)
    if keys.CheckKey(SourceItem, doorItem, User) then
        if keys.LockDoor(doorItem) then
            common.InformNLS(User,"Du sperrst die Tür ab.","You lock the door.")
        elseif keys.UnlockDoor(doorItem) then
            common.InformNLS(User,"Du sperrst die Tür auf.","You unlock the door.")
        end
    else
        common.InformNLS(User,"Der Schlüssel passt hier nicht.","The key doesn't fit here.")
    end
end

function SentenceCharacter(User,SourceItem)

    if User:isAdmin() == false then
      local charname = User.name
        if (charname ~= "Elvaine Morgan" and charname ~= "Valerio Guilianni" and charname ~= "Rosaline Edwards") then
          return -- for now only GMs are supposed to use the keys
        end
    end

    local myTown = SourceItem:getData("townKeyOf")
    if not (myTown == "Cadomyr" or myTown == "Runewick" or myTown == "Galmair" or myTown == "None") then
        User:inform("This prison key does not belong to any town.")
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                LabourCamp(User, SourceItem)
            elseif selected == 2 then
                GuardBehaviourTowardsChar(User, SourceItem)
            end
        else
            User:inform("Selection aborted!")
        end
    end

    local dialog = SelectionDialog("Town key of "..SourceItem:getData("townKeyOf"), "What do you want to do?", callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, "Send someone to the labour camp")
    dialog:addOption(0, "Set behaviour of guards towards a certain person")

    User:requestSelectionDialog(dialog)
end

function GuardBehaviourTowardsChar(User, SourceItem)

    local modeStrings = {}
    modeStrings[factions.RELATION_NEUTRAL] = "neutral"
    modeStrings[factions.RELATION_HOSTILE] = "hostile"
    modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
    modeStrings[factions.RELATION_FRIENDLY] = "friendly"
    modeStrings[factions.RELATION_ACCEPTED] = "Let always pass"
    local modeValues = {factions.RELATION_FRIENDLY, factions.RELATION_NEUTRAL, factions.RELATION_HOSTILE, factions.RELATION_AGGRESSIVE, factions.RELATION_ACCEPTED}

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            SelectTargetChar(User, SourceItem, modeValues[selected])
        else
            User:inform("Selection aborted!")
        end
    end

    local dialog = SelectionDialog("Guard behaviour", "Select the behaviour you want the guards to have towards a certain person", callback)
    dialog:setCloseOnMove()
    for _,m in ipairs(modeValues) do
      dialog:addOption(0, modeStrings[m])
    end
    User:requestSelectionDialog(dialog)
end

function SelectTargetChar(User, SourceItem, behaviour)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            User:inform("Abortion. No one was sentenced to anything.")
            return
        else
            local myString = dialog:getInput()
            local myCharId
            local myCharName
            local days
            local allFound = false
            local a, b
            if string.find(myString,"(%d+) (%d+)") then
                a,b,myCharId,days = string.find(myString,"(%d+) (%d+)")
                myCharId = tonumber(myCharId) days = tonumber(days)
                allFound = true
            elseif string.find(myString,"(%d+)") then
                a,b,days = string.find(myString,"(%d+)")
                days = tonumber(days)
                if a-2 > 1 then
                    myCharName=string.sub (myString, 1,a-2)
                    allFound = true
                end
            end
            if allFound then
                local onlineChars = world:getPlayersOnline()
                local theChar
                for i=1,#onlineChars do
                    local checkChar = onlineChars[i]
                    if myCharId then
                        if checkChar.id == myCharId then
                            theChar = checkChar
                            break
                        end
                    else
                        if checkChar.name == myCharName then
                            theChar = checkChar
                            break
                        end
                    end
                end
                if not theChar then
                    User:inform("Character has not been found.")
                else
                    local modeStrings = {}
                    modeStrings[factions.RELATION_NEUTRAL] = "neutral"
                    modeStrings[factions.RELATION_HOSTILE] = "hostile"
                    modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
                    modeStrings[factions.RELATION_FRIENDLY] = "friendly"
                    modeStrings[factions.RELATION_ACCEPTED] = "Let always pass"

                    local townId = factions.getTownIdByName(SourceItem:getData("townKeyOf"))
                    factions.setIndividualPlayerRelation(theChar, townId, behaviour, days)
                    User:inform("You changed guard behaviour of " .. SourceItem:getData("townKeyOf") .. " towards character " .. theChar.name .. " to " .. modeStrings[behaviour] .. " for " .. days .. " days.")
                    User:logAdmin("changes guard behaviour of " .. SourceItem:getData("townKeyOf") .. " towards character " .. theChar.name .. " to " .. modeStrings[behaviour] .. " for " .. days .. " days.")
                end
            else
                User:inform("You haven't put in all necessary informations.")
            end
        end
    end
    local dialog = InputDialog("Set behaviour","Insert: [Name|ID] [days] Example: John Doe 100 Notice: Days are ig days. If it should be permanent, set it to 0",false,255,callback)
    User:requestInputDialog(dialog)
end

function LabourCamp(User, SourceItem)

    local townId
    if SourceItem:getData("townKeyOf") == "Cadomyr" then
        townId = 1
    elseif SourceItem:getData("townKeyOf") == "Runewick" then
        townId = 2
    elseif SourceItem:getData("townKeyOf") == "Galmair" then
        townId = 3
    elseif SourceItem:getData("townKeyOf") == "None" then
        townId = 0
    else
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            User:inform("Abortion. No one was sentenced to anything.")
            return
        else
            local myString = dialog:getInput()
            local myPrisonerId
            local myPrisonerName
            local workLoad
            local allFound = false
            local a local b
            if string.find(myString,"(%d+) (%d+)") then
                a,b,myPrisonerId,workLoad = string.find(myString,"(%d+) (%d+)")
                myPrisonerId = tonumber(myPrisonerId) workLoad = tonumber(workLoad)
                allFound = true
            elseif string.find(myString,"(%d+)") then
                a,b,workLoad = string.find(myString,"(%d+)")
                workLoad = tonumber(workLoad)
                if a-2 > 1 then
                    myPrisonerName=string.sub (myString, 1,a-2)
                    allFound = true
                end
            end
            if allFound then
                local onlineChars = world:getPlayersOnline()
                local thePrisoner
                for i=1,#onlineChars do
                    local checkChar = onlineChars[i]
                    if myPrisonerId then
                        if checkChar.id == myPrisonerId then
                            thePrisoner = checkChar
                            break
                        end
                    else
                        if checkChar.name == myPrisonerName then
                            thePrisoner = checkChar
                            break
                        end
                    end
                end
                if not thePrisoner then
                    User:inform("Character has not been found.")
                else
                    thePrisoner:setQuestProgress(25,workLoad)
                    thePrisoner:setQuestProgress(26,townId)
                    world:gfx(41,thePrisoner.pos)
                    world:makeSound(1,thePrisoner.pos)
                    thePrisoner:warp( position(-495,-484,-40) )
                    world:gfx(41,thePrisoner.pos)

                    local callbackLabour = function(dialogLabour) end
                    local dialogLabour
                    if thePrisoner:getPlayerLanguage() == 0 then
                        dialogLabour = MessageDialog("Arbeitslager","Du wurdest verurteilt "..workLoad.." Rohstoffe aus der Mine abzubauen. Erfülle deine Strafe und du darfst wieder gehen. Spitzhacke und Essen bekommst du beim Aufseher.", callbackLabour)
                    else
                        dialogLabour = MessageDialog("Labour camp" ,"You have been sentenced to collect "..workLoad.." resources in the mine. If you have served your sentence, you are free to go. You can get a pick-axe and food from the guard.", callbackLabour)
                    end
                    thePrisoner:requestMessageDialog(dialogLabour)
                    thePrisoner:createItem(2763,1,777,nil)

                    User:inform("You sentence character " .. thePrisoner.name .. " to collect " .. workLoad .. " resources.")
                    User:logAdmin("sentences character " .. thePrisoner.name .. " to collect " .. workLoad .. " resources.")
                end
            else
                User:inform("You haven't put in all necessary informations.")
            end
        end
    end
    local dialog = InputDialog("Sentence to forced labour","Insert: [Name|ID] [workload] Example: John Doe 300",false,255,callback)
    User:requestInputDialog(dialog)
end

function M.LookAtItem(User,Item)
    local data = Item:getData("lockId")

    if tonumber(data) == 666 and User:isAdmin() then
        lookat.SetSpecialDescription(Item, "Generalschlüssel", "Masterkey")
    end

   return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

return M
