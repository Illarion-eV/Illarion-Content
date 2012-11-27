require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger25", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 107
local POSTCONDITION_QUESTSTATE = 109

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "So, hier eine Lampe um auch im Dunklen lesen zu k�nnen. Dies sollte nun auch getest werden. Am besten dort wo es dunkel ist. Im Raum der Zwielicht! Sucht an einen der S�rge nach einer Zahl dort!"
local NPC_REPLY_EN = "So, here a lamp that you can also read in the darkness. Let us test this. Somewhere where it is dark. Room of Twilight! Look for a number at one of the coffins there!"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe in den Raum des Zwielicht und suche nach einer Nummer auf einen Sarg dort. Vergi� nicht die Lampe dort zu verwenden.", "Go to the Room of Twilight and look for a number at one of the coffins there. Don't forget to use the lamp there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 92, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end