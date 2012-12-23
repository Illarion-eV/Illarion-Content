require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger24", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 148
local POSTCONDITION_QUESTSTATE = 184

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Ja, das konnte man deutlich hören. Nun zu eurer nächsten Aufgabe. Hier habt ihr eine Firnisblüte. Wenn ihr die bitte an dem Grab auf der zweiten der  beiden Zwillingsaugen Inseln ablegen würdet für mich."
local NPC_REPLY_EN = "Yes, I could hear it. Now, your next task. Here you have a firnis blossom. Please, bring it to a grave on the second of the two Twin Eyes Islands."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 148, 999, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe nun zur zweiten Zwillingaugen Insel und lege die erhaltene Blume dort auf das Blumenfeld vor dem Grabstein im Süden ab.", "Go to the second Twin Eyes Island now and lay down the flower on the flower field in front of the grave in the south then."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end