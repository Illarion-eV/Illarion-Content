require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger13", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 55
local POSTCONDITION_QUESTSTATE = 61

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Sch�n, dass du deinen Weg nach Galmair gefunden habt. M�ge dein Gold das meine bereichern."
local NPC_REPLY_EN = "Wonderful, you found your way to Galmair. Your gold may grow and serve me."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du kannst gerne weiter mit dem Don reden, aber auch zur�ck zu Iradona gehen.", "You can continue your conversation with the Don, or go back to Iradona."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end