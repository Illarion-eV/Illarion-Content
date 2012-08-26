require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger14", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 61
local POSTCONDITION_QUESTSTATE = 66

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Ich hoffe ihr habt die Audienz genossen. Hier ein Ring zur Erinnerung an diese Begegnung mit ihm. Die nächste Aufgabe findet ihr unter einem der Stühle am Dach des Turm der Erde."
local NPC_REPLY_EN = "I hope you enjoyed the audience. Here a ring in memory of this meeting with him. You can find your next task under one of the chairs on the top of the Tower of Earth."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 281, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe auf das Dach des Turm der Erde und untersuche die Stühle dort.", "Go to the top of the Tower of Earth and examine the chairs there."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end