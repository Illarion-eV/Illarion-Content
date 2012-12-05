require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger57", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 259
local POSTCONDITION_QUESTSTATE = 262

local ITEM_ID = 45
local ITEM_AMNT = 1
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "#me lächelt und reicht dir wortlos einen Stein."
local NPC_REPLY_EN = "#me smiles and hands you a stone."
local NPC_NOITEM_DE = "#me zieht zwei Messer und zeigt zu dem Tor."
local NPC_NOITEM_EN = "#me draws two knives and points to the door."

function receiveText(npc, type, text, PLAYER)
    if PLAYER:getType() == Character.player
    and ADDITIONALCONDITIONS(PLAYER)
    and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
        if PLAYER:getPlayerLanguage() == Player.german then
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_DE,'([ ]+)',' .*');
        else
            NPC_TRIGGER=string.gsub(NPC_TRIGGER_EN,'([ ]+)',' .*');
        end

        foundTrig=false
        
        for word in string.gmatch(NPC_TRIGGER, "[^|]+") do 
            if string.find(text,word)~=nil then
                foundTrig=true
            end
        end

        if foundTrig then
            if PLAYER:countItem(ITEM_ID)>=ITEM_AMNT then
                npc:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
                HANDLER(PLAYER)
            
                questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        
                return true
            elseif (NPC_NOITEM_DE~="") then
                npc:talk(Character.say, getNLS(PLAYER, NPC_NOITEM_DE, NPC_NOITEM_EN))
          
                return true
            else
                return false
            end
        end
    end

    return false
end

function getNLS(player, textDe, textEn)
    if player:getPlayerLanguage() == Player.german then
        return textDe
    else
        return textEn
    end
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun mit den erhaltenen Smaragd, Saphir und Topas zum Gasthof Hanfschlinge und suche die restliche Person. ", "Go with the received emerald, sapphire and topaz to the Hemp Necktie Inn and look for the remaining person there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 198, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end