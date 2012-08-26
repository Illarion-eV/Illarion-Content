require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger52", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 100
local POSTCONDITION_QUESTSTATE = 100

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_REPLY_DE = "Für die nächste Aufgabe geht es zu den Grabsteinen beim Feuer des Triumph. Gefragt ist die Jahreszahl der angesprochenen Kampagne."
local NPC_REPLY_EN = "For your next task you have to go north to the tombstones at the Fire of Triumph and tell me the year of the compaign noted there."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zurück zu Elesil und teile ihr mit die Jahreszahl der Kampagne.", "Go back to Elesil and tell her the year of the compaign."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end