require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger23", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 189
local POSTCONDITION_QUESTSTATE = 189

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_REPLY_DE = "Eure momentante Aufgabe ist eine Firnisblüte an dem Grab auf der zweiten der  beiden Zwillingsaugen Inseln für mich ablegen."
local NPC_REPLY_EN = "Your current task is to bring a firnis blossom to a grave on the second of the two Twin Eyes Islands for me."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur zweiten Zwillingaugen Insel und lege die erhaltene Blume dort auf das Blumenfeld vor dem Grabstein im Süden ab.", "Go to the second Twin Eyes Island now and lay down the flower on the flower field in front of the grave in the south then."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end