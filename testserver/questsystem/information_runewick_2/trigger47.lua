require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger47", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 226
local POSTCONDITION_QUESTSTATE = 233

local NPC_TRIGGER_DE = "[Tt]urm"
local NPC_TRIGGER_EN = "[Tt]ower"
local NPC_REPLY_DE = "Sehr gut! Nun könnt ihr euch eure Belohnung abholen. Ich war so gemein und hab sie für euch verstecken lassen. Geht zur Fröhlichen Lichtung und blickt dort unter einem der Getreidebündel nach. *schmunzelt*"
local NPC_REPLY_EN = "Very good. Now, you can pick up your reward. I was mean and let it hide for you. Go to Merryglade and look in one of the bundles of grain. *grins*"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur Fröhlichen Lichtung und suche in den Getreidebündeln in der Scheune nach deiner Belohung.", "Go to Merryglade and search in one of the bundles of grain in the barn there for your reward."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end