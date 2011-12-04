require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger52", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 79
local POSTCONDITION_QUESTSTATE = 79

local NPC_TRIGGER_DE = "quest"
local NPC_TRIGGER_EN = "quest"
local NPC_REPLY_DE = "Ab in den Garten. Dort sind vier Säulen mit Elementen. Welches ist auf der linken Säule."
local NPC_REPLY_EN = "Go to the garden and tell me name of the element on the left column there."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zum Garten nun - das rote Portal in der Stadt. Am hinteren Ende findest du die Säulen, die du ansehen musst.", "Go to the garden now - the red portal in the town. You find the columns at the end of the garden. You have to look at them then."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end