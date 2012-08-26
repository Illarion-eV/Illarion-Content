require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger54", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 158
local POSTCONDITION_QUESTSTATE = 158

local NPC_TRIGGER_DE = "[Qq]uest|[Mm]ission|[Tt]ask|[Aa]dventure|[Oo]rder|[Gg]ame"
local NPC_TRIGGER_EN = "[Qq]uest|[Mm]ission|[Aa]uftrag|[Aa]benteuer|[Bb]efehl|[Ss]piel"
local NPC_REPLY_DE = "Ich sehe den Rauch. Dafür gibt es noch einen Ring. Nun, nächste Aufgabe: Welche Art von Krieger symbolisieren die beiden Statuen in Zhambras Tempel?"
local NPC_REPLY_EN = "What kind of warrior do they two statues in the temple of Zhambra symbolize?"

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
    handler.createplayeritem.createPlayerItem(PLAYER, 282, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zum Schrein der Elara und finde das erwünschte Alter heraus in dem du die Geh zum Zhambra Tempel und finde die Art der Krieger heraus in dem du die Statuen dort betrachtest. dort betrachtest.", "Go to the temple of Zhambra and figure out the required kind through looking at statues there."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end