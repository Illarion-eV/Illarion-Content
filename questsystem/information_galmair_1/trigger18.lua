require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger18", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 94
local POSTCONDITION_QUESTSTATE = 158

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Ich sehe den Rauch. Dafür gibt es noch einen Ring. Nun, nächste Aufgabe: Ergänze: Eine Abmachung mit dem Don, ist eine mit deinem ??? Die Antwortet findest du an einer Säule unten in der Schlackengrube."
local NPC_REPLY_EN = "I see the smoke, fine. There you have another ring. Now, next task.  Complete: A deal with the Don is a deal with your ??? The answer can be found down in the Scoria Mine."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 278, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe hinunter in die Schlackengrube und finde die Säule mit dem fehlenden Wort.", "Go down into the Scoria Mine and find the column with the missing word."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end