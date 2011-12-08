require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger59", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 250
local POSTCONDITION_QUESTSTATE = 257

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Gut, ihr habt gezeigt, dass ihr ein gewisses Maß an Gefahr bestehen könnt. Damit könnt ihr nun auch folgende Personen aufsuchen: Ruzusss, Lotta Medborgar und Wulfgorda. Ein jeder hat einen Stein für dich, wie ich ihn auch habe."
local NPC_REPLY_EN = "Well, you have shown that you can manage some danger. You are ready to search for following people:  Ruzusss, Lotta Medborgar und Wulfgorda. Each of them has a stone for you as I do."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun mit dem erhaltenen Smaragd nach Galmair, Cadomyr und zum Gasthof Hanfschlinge und suche die genannten Personen. ", "Go with the received emerald to Galmair, Cadomyr and the Hemp Necktie Inn and look for these mentioned persons there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 45, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end