require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger13", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 143
local POSTCONDITION_QUESTSTATE = 146

local NPC_TRIGGER_DE = "4|[Vv]ier"
local NPC_TRIGGER_EN = "4|[Ff]our"
local NPC_REPLY_DE = "Richtig, vier sind es. Hier habt ihr nun ein Horn. Geht damit zur Feurstelle am Nördlichen Außenposten und bläst mal ordentlich rein dort. Ich will etwas hören!"
local NPC_REPLY_EN = "Right, there are four. There you have a horn. Go with the horn to the campfire at the Northern Outpost and blow into the horn there. I want to hear some noise!"

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
    handler.createplayeritem.createPlayerItem(PLAYER, 333, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zur Feuerstelle am Nördlichen Außenposten und verwende das erhaltene Horn dort. Frage sie nach dem Nördlichen Außenposten wenn du nicht weißt wo er ist!", "Go the campfire at the Northern Outpost and use the horn there. Ask her vor the Northern Outpost if you do not know where it is."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end