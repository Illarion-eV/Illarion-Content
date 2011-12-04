require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger54", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 86
local POSTCONDITION_QUESTSTATE = 86

local NPC_TRIGGER_DE = "quest"
local NPC_TRIGGER_EN = "quest"
local NPC_REPLY_DE = "Macht ein Lagerfeuer. Ein geeigneter Ort dazu findet sich an einer Feuerstelle bei der Holzfäller Hütte."
local NPC_REPLY_EN = "Make a campfire. A good place for one is at the firespot at the Woodcutter Hut."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe zur Holzfäller Hütte im Süden. Dort findest du eine Feuerstelle bei einem Teich. Dort mache ein Lagerfeuer und blicke das Feuer dann an.", "Go to the Woodcutter Hut. You will find a firespot close at a little lake. Make a fire there and look at the fire then."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 74, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end