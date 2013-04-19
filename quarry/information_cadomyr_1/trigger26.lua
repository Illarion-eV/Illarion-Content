require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger26", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 111
local POSTCONDITION_QUESTSTATE = 113

local NPC_TRIGGER_DE = "16|[Ss]echzehn"
local NPC_TRIGGER_EN = "16|[Ss]ixteen"
local NPC_REPLY_DE = "Gut, 16 BS wurde Cadomyr gegründet. Hier ein letztes Geschenk. Für weiter Auskunft stehe ich gerne zur Verfügung. Für weitere Aufträge empfiehlt es sich herumzufragen. Zum Beispiel bei Ruzusss."
local NPC_REPLY_EN = "Good, 16 BS is the founding date of Cadomyr. Here your last gift. If you need more information, you can always ask me. For more tasks ask other folk. For example Ruzusss."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 97, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end