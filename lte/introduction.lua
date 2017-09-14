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

    if factions.isCadomyrCitizen(User) then
    
        local waypoint = {
        position(1,2,0),
        position(2,2,0),
        position(3,2,0),
        position(4,2,0),
        position(5,2,0),
        position(6,2,0),
        position(7,2,0),
        position(8,2,0),
        position(9,2,0),
        position(10,2,0),
        position(11,2,0),
        position(12,2,0),
        position(13,2,0)}
        
        local waypointRadius = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}
        
        local informTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local informTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
    elseif factions.isGalmairCitizen(User) then
    
        User:inform("Galmair")
            
        local waypoint = {
        position(1,2,0),
        position(2,2,0),
        position(3,2,0),
        position(4,2,0),
        position(5,2,0),
        position(6,2,0),
        position(7,2,0),
        position(8,2,0),
        position(9,2,0),
        position(10,2,0),
        position(11,2,0),
        position(12,2,0),
        position(13,2,0)}
        
        local waypointRadius = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}
        
        local informTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local informTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
    elseif factions.isRunewickCitizen(User) then
    
        local waypoint = {
        position(1,2,0),
        position(2,2,0),
        position(3,2,0),
        position(4,2,0),
        position(5,2,0),
        position(6,2,0),
        position(7,2,0),
        position(8,2,0),
        position(9,2,0),
        position(10,2,0),
        position(11,2,0),
        position(12,2,0),
        position(13,2,0)}
        
        local waypointRadius = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}
        
        local informTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local informTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextG = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}
        
        local dialogTextE = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""}

    else
        User:inform("No faction")
    end
    
    User:inform("Waypoints: "..#waypoint.."!")
    return waypoint, waypointRadius, informTextG, informTextE, dialogTextG, dialogTextE
end

function M.addEffect(introductionEffect, User)
    introductionEffect:addValue("10",0) --dummy value to make sure the effect does not get deleted right after the first call
end

function M.callEffect(introductionEffect, User)

    if factions.isOutlaw(User) then --abort the quest
        User:setQuestProgress(44,0)
        User:setQuestProgress(45,0)
        User:setQuestProgress(46,0)
        return false
    end
    
    local waypoint, waypointRadius, informTextG, informTextE, dialogTextG, dialogTextE = M.init(User)

    -- CHECK LOCATIONS    
    local queststatus = User:getQuestProgress(44) --here, we save which places were visited
    local queststatuslist = {}
    queststatuslist = common.Split_number(queststatus, 13) --reading the digits of the queststatus as table
    
    for i = 1, #waypoint do
    
        if queststatuslist[i] == 0 and User:isInRangeToPosition(waypoint[i], waypointRadius[i]) then
        
            common.InformNLS(User,informTextG[i],informTextE[i])
            local callbackFound = function() end --empty callback
            local dialogText = common.GetNLS(User,dialogTextG[i],dialogTextE[i])
            local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
            local dialogGreeting = MessageDialog(dialogTitle, dialogText, callbackFound)
            User:requestMessageDialog(dialogFound)            
            queststatuslist[i] = 1 --remember we visited the place
            
        end
        
    end
    
    local newQueststatuslist = (queststatuslist[1]*1000000000000+queststatuslist[2]*100000000000+queststatuslist[3]*10000000000+queststatuslist[4]*1000000000+queststatuslist[5]*100000000+queststatuslist[6]*10000000+queststatuslist[7]*1000000+queststatuslist[8]*100000+queststatuslist[9]*10000+queststatuslist[10]*1000+queststatuslist[11]*100+ queststatuslist[12]*10+ queststatuslist[13]*1)
    User:setQuestProgress(44,newQueststatuslist)
    
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
    if User:getQuestProgress(44) == 1111111111111 and User:getQuestProgress(45) == 1 then --all places visited, found another player
        User:setQuestProgress(46,2) --end the quest
        local callbackFinish = function() end --empty callback
        local dialogText = common.GetNLS(User,"Letzte Hinweise...","Final hints...")
        local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
        local dialogFinish = MessageDialog(dialogTitle, dialogText, callbackFinish)
        User:requestMessageDialog(dialogFinish)
        return false --removes the effect
    else
        introductionEffect.nextCalled = 20 
        return true
    end

end

function M.removeEffect(introductionEffect, User)
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

