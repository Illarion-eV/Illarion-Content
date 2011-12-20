require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger18", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 84
local POSTCONDITION_QUESTSTATE = 86

local NPC_TRIGGER_DE = "[Pp]alast"
local NPC_TRIGGER_EN = "[Pp]alace"
local NPC_REPLY_DE = "Palast ist die richtige Antwort und hier gibt es ein Beil um ein Lagerfeuer zu machen. Ein geeigneter Ort dazu findet sich an einer Feuerstelle in der Stadt."
local NPC_REPLY_EN = "Palace is the right answer and here do have a hutchet to make a campfire. A good place for one is at the firespot in the town."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe in die Stadt. Dort findest du eine Feuerstelle. Mache ein Lagerfeuer dort.", "Go into the town. You will find a firespot there. Make a fire there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 74, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end