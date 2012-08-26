require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger44", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 86
local POSTCONDITION_QUESTSTATE = 164

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_REPLY_DE = "Macht ein Lagerfeuer. Ein geeigneter Ort dazu findet sich an einer Feuerstelle bei dem Holzfäller Lager."
local NPC_REPLY_EN = "Make a campfire. A good place for one is at the firespot at the Woodcutter Camp."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Macht ein Lagerfeuer. Ein geeigneter Ort dazu findet sich an einer Feuerstelle bei dem Holzfäller Lager.", "Make a campfire. A good place for one is at the firespot at the Woodcutter Camp."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end