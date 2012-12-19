require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger83", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 25
local POSTCONDITION_QUESTSTATE = 25

local NPC_TRIGGER_DE = "[Ff]euer|[Ll]uft|[Ww]asser"
local NPC_TRIGGER_EN = "[Ff]ire|[Aa]ir|[Ww]ater"
local NPC_REPLY_DE = "Falsch! Nächster Versuch."
local NPC_REPLY_EN = "Wrong! Try it again."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 3077, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Frage sie nach 'Gebäude' und besuche die einzelnen Türme um die Frage beantworten zu können.", "Answer the question to get more money and further questions. You may ask her about 'building' and visit those towers in order to get the answer."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end