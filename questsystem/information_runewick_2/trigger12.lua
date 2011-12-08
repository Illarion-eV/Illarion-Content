require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger12", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 123
local POSTCONDITION_QUESTSTATE = 132

local NPC_TRIGGER_DE = "Cheat"
local NPC_TRIGGER_EN = "Cheat"
local NPC_REPLY_DE = "lalal"
local NPC_REPLY_EN = "allalal"

function receiveText(type, text, PLAYER)
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
      
            thisNPC:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Auf der Pergamentrolle ist das Wort 'Eibental' zulesen. Es scheint nun Zeit zurück zu Numila zu gehen und ihr das genannte Wort zu nennen.", "The word 'Yewdale' appears on the pell. It seems to be time to go back to Numila now and to tell her the noted word."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end