require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger11", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 118
local POSTCONDITION_QUESTSTATE = 118

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_REPLY_DE = "Auf das Dach des Turm des Feuers mit euch!"
local NPC_REPLY_EN = "Go to the top of the Tower of Fire!"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Auf der Pergamentrolle steht geschrieben: \"Geht hoch an die Spitze des Turm des Feuers, stellt euch zwischen der Säule des Feuers und dem Altar, und blickt in die Rolle. Die Rolle wird euch ein Zeichen geben sobald ihr richtig steht.\"", "Following is written on the poll: \"Go to the top of the Tower of Fire, stay between the column of fire and altar, and read the pell. The pell will tell you the right spot as soon as you stay there.\""):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end