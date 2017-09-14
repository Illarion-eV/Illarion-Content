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

-- Introduction LTE
-- by Estralis
-- EffectID = 37
-- Quest status = 44 (places), 45 (greeting), 46 (overall status)

local common = require("base.common")
local factions = require("base.factions")

local M = {}

function M.init(User)

    --[[This is a list of places the player should visit during the introduction. The order does not matter.
    1: Depot
    2: Market
    3: Workshop
    4: Cross
    5: Money Changer
    6: Notary
    7: Treasurer
    8: Faction leader
    9: Gate/guard
    10: Teleporter
    11: Temple 1
    12: Temple 2
    13: Temple 3
    ]]

    local waypoint = {}
    local waypointRadius = {}
    local informTextG = {}
    local informTextE = {}
    local dialogTextG = {}
    local dialogTextE = {}
    
    if factions.isCadomyrCitizen(User) then
    
        waypoint = {
        position(1,1,0),
        position(2,2,0),
        position(3,3,0),
        position(4,4,0),
        position(5,5,0),
        position(6,6,0),
        position(7,7,0),
        position(8,8,0),
        position(9,9,0),
        position(10,10,0),
        position(11,11,0),
        position(12,12,0),
        position(13,13,0)}
        
        waypointRadius = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        
        informTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        informTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
    elseif factions.isGalmairCitizen(User) then
    
        waypoint = {
        position(1,1,0),
        position(2,2,0),
        position(3,3,0),
        position(4,4,0),
        position(5,5,0),
        position(6,6,0),
        position(7,7,0),
        position(8,8,0),
        position(9,9,0),
        position(10,10,0),
        position(11,11,0),
        position(12,12,0),
        position(13,13,0)}
        
        waypointRadius = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        
        informTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        informTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
    elseif factions.isRunewickCitizen(User) then
    
        waypoint = {
        position(1,1,0),
        position(2,2,0),
        position(3,3,0),
        position(4,4,0),
        position(5,5,0),
        position(6,6,0),
        position(7,7,0),
        position(8,8,0),
        position(9,9,0),
        position(10,10,0),
        position(11,11,0),
        position(12,12,0),
        position(13,13,0)}
        
        waypointRadius = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        
        informTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        informTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextG = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}
        
        dialogTextE = {
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        "Text",
        ""}

    end
    
    return waypoint, waypointRadius, informTextG, informTextE, dialogTextG, dialogTextE
end

function M.addEffect(introductionEffect, User)
    introductionEffect:addValue("10",0) --dummy value to make sure the effect does not get deleted right after the first call
end

function M.callEffect(introductionEffect, User)

    User:inform("Effect called")
    
    if factions.isOutlaw(User) then --abort the quest
        User:setQuestProgress(44,0)
        User:setQuestProgress(45,0)
        User:setQuestProgress(46,0)
        User:inform("Outlaw")
        return false
    end

    local waypoint = {}
    local waypointRadius = {}
    local informTextG = {}
    local informTextE = {}
    local dialogTextG = {}
    local dialogTextE = {}
    
    local waypoint, waypointRadius, informTextG, informTextE, dialogTextG, dialogTextE = M.init(User)

    -- CHECK LOCATIONS    
    local queststatus = User:getQuestProgress(44) --here, we save which places were visited
    
    for i = 1, #waypoint do

        if not common.isBitSet(queststatus,i) and User:isInRangeToPosition(waypoint[i], waypointRadius[i]) then
        
            user:inform("Found: "..i.."!")
            common.InformNLS(User,informTextG[i],informTextE[i])
            local callbackFound = function() end --empty callback
            local dialogText = common.GetNLS(User,dialogTextG[i],dialogTextE[i])
            local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
            local dialogFound = MessageDialog(dialogTitle, dialogText, callbackFound)
            User:requestMessageDialog(dialogFound)            
            User:setQuestProgress(44,common.addBit(queststatus,i)) --remember we visited the place
            
        end
        
    end
 
    -- LOOK FOR OTHER PLAYERS
    local otherPlayers = world:getPlayersInRangeOf(User.pos, 5)
    if #otherPlayers > 1 and User:getQuestProgress(45) == 0 then
    
        User:setQuestProgress(45,1) --remember we found someone
        local callbackGreeting = function() end --empty callback
        local dialogText = common.GetNLS(User,"Interaktion, #i usw.","Interaction, introduction etc.")
        local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
        local dialogGreeting = MessageDialog(dialogTitle, dialogText, callbackGreeting)
        User:requestMessageDialog(dialogGreeting)
        
    end
    
    -- FINISH QUEST OR NEXT CALL
    if common.countBit(User:getQuestProgress(44)) == #waypoint and User:getQuestProgress(45) == 1 then --all places visited, found another player
        User:setQuestProgress(46,2) --end the quest
        local callbackFinish = function() end --empty callback
        local dialogText = common.GetNLS(User,"Letzte Hinweise...","Final hints...")
        local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
        local dialogFinish = MessageDialog(dialogTitle, dialogText, callbackFinish)
        User:requestMessageDialog(dialogFinish)
        return false --removes the effect
    end

    introductionEffect.nextCalled = 20 
    return true
end

function M.removeEffect(introductionEffect, User)
    User:inform("Effect removed")
    return false
end

function M.loadEffect(introductionEffect, User)

    -- Login Dialog
    local callbackLogin = function() end --empty callback
    local dialogText = common.GetNLS(User,"Willkommen zurück!\n\nGERMAN","Welcome back!\n\nENGLISH")
    local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
    local dialogLogin = MessageDialog(dialogTitle, dialogText, callbackLogin)
    User:requestMessageDialog(dialogLogin)
    
end

return M