require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger12", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 53
local POSTCONDITION_QUESTSTATE = 55

local NPC_TRIGGER_DE = "[Ll]otta|[Mm]edborgar"
local NPC_TRIGGER_EN = "[Ll]otta|[Mm]edborgar"
local NPC_REPLY_DE = "Gut, sie zu besuchen wird nicht von Schaden sein. Jetzt gilt es erstmal sich dem Don vorzustellen. Komm zur�ck wenn du dies getan hast."
local NPC_REPLY_EN = "Fine, it will be to your advance if you visit her. But now look for the Don to introduce yourself. Come back if you have done that."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Finde den Don, rede mit ihm und komme wieder zurück.", "Find the Don, speak with him and come back."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end