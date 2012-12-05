require("questsystem.base")
module("questsystem.information_runewick_2.trigger43", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 214
local POSTCONDITION_QUESTSTATE = 222

local NPC_TRIGGER_DE = "[Dd]rache"
local NPC_TRIGGER_EN = "[Dd]ragon"
local NPC_REPLY_DE = "Ihr kommt euren Preis näher. Wem zu Ehren wurde die Statue beim 'Feiglings letztes Gefecht' errichtet?"
local NPC_REPLY_EN = "You are coming your reward closer. To whom refers the statue at 'Cowards last stand'?"

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
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end