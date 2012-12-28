require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger78", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 250
local POSTCONDITION_QUESTSTATE = 307

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Gut, ihr habt gezeigt, dass ihr ein gewisses Maß an Gefahr bestehen könnt. Bevor die letzte Mission begonnen werden kann, habe ich noch eine Bitte. Und zwar eine Pfeife und zehn Sibanac Blätter!"
local NPC_REPLY_EN = "Well, you have shown that you can manage some danger. But before you can start your final misison, I have a request. Please, bring me a pipe and ten sibanac leaves."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Finde einen Schreiner oder Händler über die du die gewünschten Dinge besorgen kannst, wenn du sie nicht selber erzeugen kannst.", "Look for a carpenter or merchant who can supply you with the requested goods, if you cannot produce them by yourself."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end