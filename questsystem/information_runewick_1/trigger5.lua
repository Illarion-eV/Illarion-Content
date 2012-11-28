require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger5", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 29
local POSTCONDITION_QUESTSTATE = 31

local NPC_TRIGGER_DE = "[Rr]ubin"
local NPC_TRIGGER_EN = "[Rr]uby"
local NPC_REPLY_DE = "Wieder richtig und deshalb noch mehr M�nzen! Und nun, wem darfen man hier sein Geh�r schenken?"
local NPC_REPLY_EN = "Right again and therefore more coins for you! And now, whom do you have to obey here?"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Beantworte die gestellte Frage um mehr Geld und weitere Fragen zu erhalten. Hinweis, es betrifft den Herrscher dieser Fraktion. Frage einfach nach 'Fraktion'.", "Answer the question to get more money and further questions. Hint: It is about the leader of this faction. Just ask about 'faction'."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end