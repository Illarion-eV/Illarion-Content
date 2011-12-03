require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger4", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 10

local NPC_TRIGGER_DE = "Aufgabe"
local NPC_TRIGGER_EN = "adventure"
local NPC_REPLY_DE = "Ich habe die eine oder andere Aufgabe zu vergeben. Dafür muss man aber erst einen kleinen Test bestehen. In welcher Fraktion befindest wir uns?"
local NPC_REPLY_EN = "I have one or more task, but first you have to manage a little test. In which factio are we?"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Nenne nun den Namen der Fraktion in der du dich befindest.", "Say the name of the faction you are now"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end