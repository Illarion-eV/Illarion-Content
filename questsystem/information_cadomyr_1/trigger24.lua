require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger24", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 107
local POSTCONDITION_QUESTSTATE = 109

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "So, hier eine Lampe um auch im Dunklen lesen zu können. Dies sollte nun auch getest werden. Am besten dort wo es dunkel ist. In der Gruft! Sucht an einen der Särge nach einer Zahl dort!"
local NPC_REPLY_EN = "So, here a lamp that you can also read in the darkness. Let us test this. Somewhere where it is dark. The tomb! Look for a number at one of the coffins there!"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe in die Sir Reginald Gruft und suche nach einer Nummer auf einen Sarg dort. Vergiß nicht die Lampe dort zu verwenden.", "Go to the Sir Reginald Tomb and look for a number at one of the coffins there. Don't forget to use the lamp there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 92, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end