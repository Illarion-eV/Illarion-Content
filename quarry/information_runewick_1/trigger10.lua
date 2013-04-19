require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger10", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 48
local POSTCONDITION_QUESTSTATE = 51

local NPC_TRIGGER_DE = "[Gg]almair"
local NPC_TRIGGER_EN = "[Gg]almair"
local NPC_REPLY_DE = "Nun eine Frage zu den Lokalitäten hier, insbesondere dem Hinterland. Wie heißt die Brücke die Runewick mit Eibental verbindet?"
local NPC_REPLY_EN = "Now, a question about locations here. In particular the hinterland. What is the name of the bridge that connects Runewick with Yewdale?"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Hinweis: Frage nach dem Hinterland", "Answer the question to get more money and further question. Hint: Ask for the hinterland."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end