require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger22", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 100
local POSTCONDITION_QUESTSTATE = 91

local NPC_TRIGGER_DE = "32|[Zw]weiundreißig"
local NPC_TRIGGER_EN = "32|[Tt]hirtytwo"
local NPC_REPLY_DE = "Gut, um mehr über die Geschichte Cadomyrs zu erfahren, empfiehlt sich unser Geschichtsbuch. Und dieses soll nun auch gelesen werden."
local NPC_REPLY_EN = "Good, if you want to know more about the history of Cadomyr look for the histroy book. So, go and find it."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Such nach dem Geschichtsbuch von Cadomyr in einem der Bücherregalen.", "Find the history book of Cadomyr in one of the bookshelves."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end