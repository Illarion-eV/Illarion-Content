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

local function listOfPendingBehaviourChanges(user, SourceItem)
local townId = factions.getTownIdByName(SourceItem:getData("townKeyOf"))
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        local numberOfSkippedSlots = 0
        for i = 1,100 do
            local foundTown, town = ScriptVars:find("TBtownID"..i)
            if not foundTown or (tonumber(town) ~= tonumber(townId)) then
                numberOfSkippedSlots = numberOfSkippedSlots+1
            elseif index == i - numberOfSkippedSlots then
                ScriptVars:remove("TBtownID"..i)
                ScriptVars:remove("TBbehaviour"..i)
                ScriptVars:remove("TBdays"..i)
                ScriptVars:remove("TBtargetName"..i)
                ScriptVars:remove("TBtargetId"..i)
                ScriptVars:remove("TBadmin"..i)
                ScriptVars:save()
                user:inform("Target was successfully removed from the list.")
                return
            end
        end
    end
    local dialog = SelectionDialog("Pending Behaviour Changes", "Select a pending change to delete it.", callback)
    for i = 1, 100 do
        if ScriptVars:find("TBtownID"..i) then
            local target
            local foundId, id = ScriptVars:find("TBtargetId"..i)
            local foundName, name = ScriptVars:find("TBtargetName"..i)
            local foundTown, town = ScriptVars:find("TBtownID"..i)
            local foundBehaviour, behaviour = ScriptVars:find("TBbehaviour"..i)
            local foundDays, days = ScriptVars:find("TBdays"..i)
            local foundAdmin, admin = ScriptVars:find("TBadmin"..i)
            if not foundTown or not foundBehaviour or not foundDays or not foundAdmin then
                debug("Something went wrong.")
                return
            end
            local modeStrings = {}
            modeStrings[factions.RELATION_NEUTRAL] = "neutral"
            modeStrings[factions.RELATION_HOSTILE] = "hostile"
            modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
            modeStrings[factions.RELATION_FRIENDLY] = "friendly"
            modeStrings[factions.RELATION_ACCEPTED] = "Let always pass"
                if foundId then
                    target = id
                elseif foundName then
                    target = name
                end
            local townName = factions.getTownNameByID(tonumber(town))
            if tonumber(townId) == tonumber(town) then
                dialog:addOption(0, tostring(target).." has been set to have the attitude of the town guards of "..townName.." be changed to "..modeStrings[tonumber(behaviour)].." for "..tostring(days).." days by "..tostring(admin)..".")
            end
        end
    end
    user:requestSelectionDialog(dialog)
end

local function getDoor(user)

    local targetItem = common.GetFrontItem(user)
    if targetItem ~= nil and (doors.CheckClosedDoor(targetItem.id) or doors.CheckOpenDoor(targetItem.id)) then
        return targetItem
    end

    local Radius = 1
    for x = -Radius ,Radius do
        for y = -Radius, Radius do
            local targetPos = position(user.pos.x + x, user.pos.y + y, user.pos.z)
            if (world:isItemOnField(targetPos)) then
                targetItem = world:getItemOnField(targetPos)
                if targetItem ~= nil and (doors.CheckClosedDoor(targetItem.id) or doors.CheckOpenDoor(targetItem.id)) then
                    return targetItem
                end
            end
        end
    end
    return nil
end

function M.UseItem(user, SourceItem)

    if SourceItem:getData("townKeyOf") ~= "" then
        -- sentence char to forced labour
        SentenceCharacter(user,SourceItem)
        return
    end

    local isRonaganTrap = (SourceItem:getData("ronaganTrap") == "true")
    if (isRonaganTrap == true) then
        user:inform("Ein Dieb hat dich in eine Falle gelockt. Er springt aus einem der Schatten und stielt dir ein paar Münzen.", "A thief has lured you into a trap, jumping out from a shadow, he steals some coins from you.")

        -- steal 1% - 5% of characters money in inventroy
        local wealth = money.CharCoinsToMoney(user)
        money.TakeMoneyFromChar(user, math.random(math.floor(wealth / 100), math.floor(wealth / 20)))
        return
   end

    local frontItem = common.GetFrontItem(user)
    if frontItem.id == 2830 then
        if not frontItem:getData("treasureLockId") == SourceItem:getData("treasureLockId") then
            common.InformNLS(user, "Der Schlüssel passt hier nicht.","The key doesn't fit here.")
            return
        else
            local treasureLockStatus = frontItem:getData("treasureLockStatus")
            if treasureLockStatus == "" or treasureLockStatus == "unlocked" then
                frontItem:setData("treasureLockStatus", "locked")
                common.InformNLS(user,"Du schließt die Kiste ab.","You lock the chest.")
            elseif treasureLockStatus == "locked" then
                frontItem:setData("treasureLockStatus", "unlocked")
                common.InformNLS(user,"Du schließt die Kiste auf.","You unlock the chest.")
            end
            world:changeItem(frontItem)
        end
    end

    local doorItem = getDoor(user)
    if not doorItem then
        return
    end

    common.TurnTo(user, doorItem.pos)
    if keys.CheckKey(SourceItem, doorItem, user) then
        if keys.LockDoor(doorItem) then
            common.InformNLS(user,"Du sperrst die Tür ab.","You lock the door.")
        elseif keys.UnlockDoor(doorItem) then
            common.InformNLS(user,"Du sperrst die Tür auf.","You unlock the door.")
        end
    else
        common.InformNLS(user,"Der Schlüssel passt hier nicht.","The key doesn't fit here.")
    end
end

function SentenceCharacter(user,SourceItem)

    if user:isAdmin() == false then
      local charname = user.name
        if (charname ~= "Elvaine Morgan" and charname ~= "Valerio Guilianni" and charname ~= "Rosaline Edwards") then
          return -- for now only GMs are supposed to use the keys
        end
    end

    local myTown = SourceItem:getData("townKeyOf")
    if not (myTown == "Cadomyr" or myTown == "Runewick" or myTown == "Galmair" or myTown == "None") then
        user:inform("This prison key does not belong to any town.")
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                LabourCamp(user, SourceItem)
            elseif selected == 2 then
                GuardBehaviourTowardsChar(user, SourceItem)
            elseif selected == 3 then
                listOfPendingBehaviourChanges(user, SourceItem)
            end
        else
            user:inform("Selection aborted!")
        end
    end

    local dialog = SelectionDialog("Town key of "..SourceItem:getData("townKeyOf"), "What do you want to do?", callback)
    dialog:setCloseOnMove()
    dialog:addOption(0, "Send someone to the labour camp")
    dialog:addOption(0, "Set behaviour of guards towards a certain person")
    dialog:addOption(0, "Edit list of pending changes to guard behaviour")

    user:requestSelectionDialog(dialog)
end

function GuardBehaviourTowardsChar(user, SourceItem)

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
            SelectTargetChar(user, SourceItem, modeValues[selected])
        else
            user:inform("Selection aborted!")
        end
    end

    local dialog = SelectionDialog("Guard behaviour", "Select the behaviour you want the guards to have towards a certain person", callback)
    dialog:setCloseOnMove()
    for _,m in ipairs(modeValues) do
      dialog:addOption(0, modeStrings[m])
    end
    user:requestSelectionDialog(dialog)
end

function SelectTargetChar(user, SourceItem, behaviour)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            user:inform("Aborted. No one was sentenced to anything.")
            return
        else
            local myString = dialog:getInput()
            local myCharId
            local myCharName
            local days
            local allFound = false
            local a, _
            if string.find(myString,"(%d+) (%d+)") then
                _,_,myCharId,days = string.find(myString,"(%d+) (%d+)")
                myCharId = tonumber(myCharId) days = tonumber(days)
                allFound = true
            elseif string.find(myString,"(%d+)") then
                a,_,days = string.find(myString,"(%d+)")
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
                local townId = factions.getTownIdByName(SourceItem:getData("townKeyOf"))
                if not theChar then
                    for i = 1, 100 do
                        local foundExistingData = ScriptVars:find("TBtownID"..i)
                        if not foundExistingData then
                            ScriptVars:set("TBtownID"..i, tostring(townId))
                            ScriptVars:set("TBbehaviour"..i, behaviour)
                            ScriptVars:set("TBdays"..i, days)
                            ScriptVars:set("TBadmin"..i, user.name)
                            if myCharId then
                                ScriptVars:set("TBtargetId"..i,myCharId)
                            else
                                ScriptVars:set("TBtargetName"..i,myCharName)
                            end
                            ScriptVars:save()
                            user:inform("The player was not found to be online, so the change has been queued to happen when the player next logs on.")
                            break
                        end
                    end
                else
                    local modeStrings = {}
                    modeStrings[factions.RELATION_NEUTRAL] = "neutral"
                    modeStrings[factions.RELATION_HOSTILE] = "hostile"
                    modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
                    modeStrings[factions.RELATION_FRIENDLY] = "friendly"
                    modeStrings[factions.RELATION_ACCEPTED] = "Let always pass"

                    factions.setIndividualPlayerRelation(theChar, townId, behaviour, days)
                    user:inform("You changed guard behaviour of " .. SourceItem:getData("townKeyOf") .. " towards character " .. theChar.name .. " to " .. modeStrings[behaviour] .. " for " .. days .. " days.")
                    user:logAdmin("Changed guard behaviour of " .. SourceItem:getData("townKeyOf") .. " towards character " .. theChar.name .. " to " .. modeStrings[behaviour] .. " for " .. days .. " days.")
                end
            else
                user:inform("You haven't put in all necessary informations.")
            end
        end
    end
    local dialog = InputDialog("Set behaviour","Insert: [Name|ID] [days] Example: John Doe 100 Notice: Days are ig days. If it should be permanent, set it to 0",false,255,callback)
    user:requestInputDialog(dialog)
end

function M.changeTownBehaviourOnLogin(user)
    for i = 1, 100 do
        local foundTownId, townId = ScriptVars:find("TBtownID"..i)
        local foundBehaviour, behaviour = ScriptVars:find("TBbehaviour"..i)
        local foundDays, days = ScriptVars:find("TBdays"..i)
        local foundName, name = ScriptVars:find("TBtargetName"..i)
        local foundId, id = ScriptVars:find("TBtargetId"..i)
        local foundAdmin, nameOfAdmin = ScriptVars:find("TBadmin"..i)
        local userFound = false
            if foundName then
                if name ==  user.name then
                    userFound = true
                end
            end
            if foundId then
                if id == user.id then
                    userFound = true
                end
            end
            if userFound then
                if not foundBehaviour then
                    debug("Behaviour not found. This should never happen.")
                elseif not foundDays then
                    debug("Duration not found. This should never happen.")
                elseif not foundTownId then
                    debug("Town not found. This should never happen.")
                elseif not foundAdmin then
                    debug("Admin responsible for the change not found. This should never happen.")
                else
                    local modeStrings = {}
                    modeStrings[factions.RELATION_NEUTRAL] = "neutral"
                    modeStrings[factions.RELATION_HOSTILE] = "hostile"
                    modeStrings[factions.RELATION_AGGRESSIVE] = "aggressive"
                    modeStrings[factions.RELATION_FRIENDLY] = "friendly"
                    modeStrings[factions.RELATION_ACCEPTED] = "Let always pass"
                    factions.setIndividualPlayerRelation(user, tonumber(townId), tonumber(behaviour), tonumber(days))
                    local townName = factions.getTownNameByID(townId)
                    log(nameOfAdmin.." changed guard behaviour of " .. townName .. " towards character " .. user.name .. " to " .. modeStrings[tonumber(behaviour)] .. " for " .. days .. " days.")
                    ScriptVars:remove("TBtownID"..i)
                    ScriptVars:remove("TBbehaviour"..i)
                    ScriptVars:remove("TBdays"..i)
                    ScriptVars:remove("TBtargetName"..i)
                    ScriptVars:remove("TBtargetId"..i)
                    ScriptVars:remove("TBadmin"..i)
                    ScriptVars:save()
                end
            end
    end
end

function LabourCamp(user, SourceItem)

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
            user:inform("Aborted. No one was sentenced to anything.")
            return
        else
            local myString = dialog:getInput()
            local myPrisonerId
            local myPrisonerName
            local workLoad
            local allFound = false
            local a, _
            if string.find(myString,"(%d+) (%d+)") then
                _,_,myPrisonerId,workLoad = string.find(myString,"(%d+) (%d+)")
                myPrisonerId = tonumber(myPrisonerId) workLoad = tonumber(workLoad)
                allFound = true
            elseif string.find(myString,"(%d+)") then
                a,_,workLoad = string.find(myString,"(%d+)")
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
                    user:inform("Character has not been found.")
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
                    common.CreateItem(thePrisoner, 2763, 1, 777, nil)

                    user:inform("You sentence character " .. thePrisoner.name .. " to collect " .. workLoad .. " resources.")
                    user:logAdmin("sentences character " .. thePrisoner.name .. " to collect " .. workLoad .. " resources.")
                end
            else
                user:inform("You haven't put in all necessary informations.")
            end
        end
    end
    local dialog = InputDialog("Sentence to forced labour","Insert: [Name|ID] [workload] Example: John Doe 300",false,255,callback)
    user:requestInputDialog(dialog)
end

function M.LookAtItem(user,Item)
    local data = Item:getData("lockId")

    if tonumber(data) == 666 and user:isAdmin() then
        lookat.SetSpecialDescription(Item, "Generalschlüssel", "Masterkey")
    end

   return lookat.GenerateLookAt(user, Item, lookat.NONE)
end

return M
