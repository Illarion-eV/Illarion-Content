require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger20", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 90
local POSTCONDITION_QUESTSTATE = 97

local NPC_TRIGGER_DE = "[Ss]chicksal"
local NPC_TRIGGER_EN = "[Ff]ate"
local NPC_REPLY_DE = "Genau, eine Abmachung mit dem Schickal und hier ein Spiegel als Belohnung. Für die nächste Aufgabe geht es in Richtung Süden zum Tollloch. Finde raus was du bekommst wenn du den Don belügst."
local NPC_REPLY_EN = "Exactly, a deal with your fate and here is a mirror as your reward. For your next task you have to go south to the Sport Hole. Find out what you get if you lie at the Don."

function receiveText(npc, type, text, PLAYER)
    if ADDITIONALCONDITIONS(PLAYER)
    and PLAYER:getType() == Character.player
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
      
            npc:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
            HANDLER(PLAYER)
            
            questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        
            return true
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe in den Norden zu der Stelle wo du vier Lagerfeuer siehst. Dort untersuche die Grabsteine.", "Go to the north where you can find four campfires. Examine the tombstones there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 336, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end