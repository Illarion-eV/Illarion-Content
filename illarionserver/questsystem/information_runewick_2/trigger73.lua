require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger73", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 278
local POSTCONDITION_QUESTSTATE = 287

local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Ich kann mich nicht beschweren, sehr gut! Ich habe nun keine Aufgaben mehr für euch, aber wenn ihr Informationen bezüglich Plätze benötigt, so stellt eure Fragen. Für eure Belohnung geht zum Erzmagier und sagt ihm folgenden Namen."
local NPC_REPLY_EN = "I cannot complain, very good! I do not have any further rewards for you, but if you want to have more information about places, please ask. To get your reward go to the Archmage and tell him following name."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Numila steckt dir noch ein Papier zu auf welchem du 'Mordak al Kharud' lesen kannst. Sekunden später löst sich das Stück in Staub auf.", "Numila hands you a piece of paper. You read 'Mordak al Kharud' and seconds later the paper turns to dust."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end