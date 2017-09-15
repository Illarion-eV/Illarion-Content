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
        position(133, 626, 0),
        position(118, 606, 0),
        position(140, 587, 0),
        position(102, 562, 0),
        position(98, 567, 0),
        position(106, 553, 0),
        position(129, 529, 0),
        position(122, 521, 0),
        position(120, 642, 0),
        position(127, 647, 0),
        position(142, 564, 0),
        position(146, 677, 1),
        position(176, 761, 0)}
        
        waypointRadius = {3, 7, 5, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5}
        
        informTextG = {
        "Text1",
        "Text2",
        "Text3",
        "Text4",
        "Text5",
        "Text6",
        "Text7",
        "Text8",
        "Text9",
        "Text10",
        "Text11",
        "Text12",
        "Text13"}
        
        informTextE = {
        "Text1",
        "Fine clothing, sparkling glassware and intricate pottery adorn the market stalls of Cadomyr as merchants toiling in the desert heat proclaim their wares to be worthy of their Queen.",
        "Suffocating heat from the vast kilns and ovens of Cadomyr's potters and glassblowers fills the sweltering workshops, whilst tailors rhythmically spin thread and weave cloth for stitching in the neighbouring room.",
        "Text4",
        "In the backstreets of Cadomyr a humble woman diligently counts coins into cloth bags. On occasion she inconspiciously exchanges coins with passing citizens with barely a few words passing between them.",
        "A dignified woman sits at a desk neatly ordering ledgers. Two shimmering red and white banners of Cadomyr frame her, an indication she is an official of the realm.",
        "A stern man keeps careful watch on the donation platform from across the Throne Room. Two shimmering red and white banners of Cadomyr flank him, an indication of his importance to the realm.",
        "A proud, yet beautiful, woman wears a crown in the Throne Room of the Royal Palace. Undoubtedly she is Queen Rosaline Edwards, the righteous and ambitious ruler of Cadomyr.",
        "An imposing and heavily armoured guard stands to attention before the grand entrance to Cadomyr, scrutinising all those who try to pass over the bridge.",
        "The air crackles with energy around an ornate marble podium. A weathered pell sits on the podium listing a number of destinations.",
        "Lines of glorious mounted riders form a guard of honour leading to an altar, flanked by two armoured figures that depict a noble young soldier who epitomises the bravery and camaradarie of Zhambra.",
        "On occasion, the distant howl of a wolf might be carried on winds whistling through the modestly adorned mountain-top temple guarded by armoured statues that encapsulate the dignified honour of Malachín.",
        "The once beautiful oasis temple lies in ruins with only the altar remaining intact, yet the comfort of Sirani may still be felt by those with an open heart."}
        
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
        "Text"}
        
        dialogTextE = {
        "Text1 - Explain depots.",
        "The market contains a wealth of traders buying and selling anything from raw materials to the finest crafted products. Items can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu.",
        "The primary crafts of glassblowing, pottery and tailoring are fully supported with static tools, resources, merchants and guilds in Cadomyr. Secondary crafts are only partially supported with static tools, limited resources and poorer trading opportunities. Most static tools are found in or around the workshops. Hover over a tool to find out what it should be used for.",
        "Text4 - Explain pillar of resurrection.",
        "Copper, silver and gold coins are used in Illarion. One hundred copper coins can be exchanged for one silver coin and one hundred silver coins can be exchanged for a gold coin by the Money Changer, Cassandra Hestan.",
        "Speak to the Notary Reret Odohir if you wish to join or leave Cadomyr, find out what your rank is as a citizen of Cadomyr, or if you need to purchase a licence to use tools as a visitor to Cadomyr. You can improve your rank and advance in the Queen's favour by completing quests issued by NPCs in Cadomyr or receiving rank points from a Game Master for your contribution to the realm.",
        "Together with tax returns, donations made to the realm contribute to faction wealth and determine the number of magic gems distributed between citizens. A donation is made by placing an item or coins on the donation platform. Donated items contribute a tenth of their value.",
        "The faction ruler may be played by one of the Game Masters on occasions to attend events and interact with their subjects. If you wish to leave a message for the Queen you can contact the relevant Game Master via the forum account Rosaline Edwards. Be aware though each realm has developed their own customs and etiquette so you should try to find out what is expected of citizens. Often the faction ruler will be supported by a number of player characters who have worked their way into positions of influence.",
        "Horatio Milenus is a loyal guard of Queen Rosaline and will only allow the respectable to pass through Cadomyr's gates. Behind the gates, Cadomyr is a safe haven from the dangers beyond as the guard will defend against any monsters. Should you displease the Queen or her officials, however, you may find yourself banned from the realm and the Horatio will see you do not enter either.",
        "A teleporter can be found outside the entrance to each town and the neutral Hemp Nectie Inn. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. In Cadomyr, Evera sells portal books from the Quartermaster Store to the east, just inside the gates.",
        "The Younger Gods dominate daily life in Illarion and Zhambra is one of three patron deities of Cadomyr. As the god of friendhip and loyalty his righteous intentions are held in high esteem amongst the faithful of Cadomyr.",
        "The Younger Gods dominate daily life in Illarion and Malachín is one of three patron deities of Cadomyr. As the god of battle and hunting his valour and strong sense of justice are revered by the honourable of Cadomyr.",
        "The Younger Gods dominate daily life in Illarion and Sirani is one of three patron deities of Cadomyr. Amongst the faithful of Cadomyr, few will not recognise the beauty of the goddess of love and pleasure in their Queen."}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}
        
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
        "Text"}

    end
    
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

        if not common.isBitSet(queststatus, i) and User:isInRangeToPosition(waypoint[i], waypointRadius[i]) then
        
            common.InformNLS(User,informTextG[i],informTextE[i])
            local callbackFound = function(dialogFinish) end --callback
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
        local callbackGreeting = function(dialogFinish) end --callback
        local dialogText = common.GetNLS(User,"Interaktion, #i usw.","Interaction, introduction etc.")
        local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
        local dialogGreeting = MessageDialog(dialogTitle, dialogText, callbackGreeting)
        User:requestMessageDialog(dialogGreeting)
        
    end
 
    -- SHOW FINAL DIALOG
    local dialogFinish
    if M.questFinished(User, waypoint) then
        local callbackFinish = function() end --empty callback
        local dialogText = common.GetNLS(User,"Letzte Hinweise...","Final hints...")
        local dialogTitle = common.GetNLS(User,"Einführung","Introduction")
        local dialogFinish = MessageDialog(dialogTitle, dialogText, callbackFinish)
    end
 
    -- FINISH QUEST OR NEXT CALL
    if M.questFinished(User, waypoint) then
        User:setQuestProgress(46,2) --end the quest
        return false --remove the effect
    end
    
    introductionEffect.nextCalled = 10 
    return true
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

function M.questFinished(User, waypoint)

    if common.countBit(User:getQuestProgress(44)) == #waypoint and User:getQuestProgress(45) == 1 then
        return true
    else
        return false
    end

end

return M