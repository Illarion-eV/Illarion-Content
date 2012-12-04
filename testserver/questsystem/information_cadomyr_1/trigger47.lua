require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger47", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 95
local POSTCONDITION_QUESTSTATE = 107

local NPC_TRIGGER_DE = "cheat"
local NPC_TRIGGER_EN = "cheat"
local NPC_REPLY_DE = "W�hrend du im Buch liest, f�llt dir eine Notiz auf: 'Gut, auch dieses hast du gefunden. Komm zur�ck nun. Elesil'."
local NPC_REPLY_EN = "While you are reading the book you see a note: 'Good, you found that too. Come back now. Elesil'."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "W�hrend du im Buch liest, f�llt dir eine Notiz auf: 'Gut, auch dieses hast du gefunden. Komm zur�ck nun. Frizza'.", "While you are reading the book you see a note: 'Good, you found that too. Come back now. Frizza'."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end