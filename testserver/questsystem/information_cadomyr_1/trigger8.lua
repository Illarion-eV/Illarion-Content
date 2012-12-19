require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger8", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 41
local POSTCONDITION_QUESTSTATE = 46

local NPC_TRIGGER_DE = "[Mm]alachin"
local NPC_TRIGGER_EN = "[Mm]alachin"
local NPC_REPLY_DE = "Richtig. Nun eine Frage zu unseren Gegnern. Welche Fraktion wird von Erzmagier Elvaine Morgan beherrscht?"
local NPC_REPLY_EN = "Right. Now, a question about our enemies. Which faction is ruled by Archmage Elvaine Morgan?"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Hinweis: Frage sie nach dem Erzmagier.", "Answer the question to get more money and further questions. Hint: Ask her about the Archmage."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end