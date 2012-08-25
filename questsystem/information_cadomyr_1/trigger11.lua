require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger11", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 51
local POSTCONDITION_QUESTSTATE = 53

local NPC_TRIGGER_DE = "[Rr]eginald"
local NPC_TRIGGER_EN = "[Rr]eginald"
local NPC_REPLY_DE = "Auch richtig. Und nun die letzte Frage bevor wir mit ein paar Aufgaben beginnen. Wer kann dir hier  mit Orten um Cadomyr behilflich sein? "
local NPC_REPLY_EN = "Again correct. Now the last question before I give you some task. Whom can you ask if you want to know more about places around Cadomyr?"

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
    handler.createplayeritem.createPlayerItem(PLAYER, 3076, 333, 10):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Hinweis: Frage nach Orten.", "Answer the question to get more money and further questions. Hint: Ask for locations."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end