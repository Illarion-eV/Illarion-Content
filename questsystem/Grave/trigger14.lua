require("questsystem.base")
module("questsystem.Grave.trigger14", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 69
local POSTCONDITION_QUESTSTATE = 72

local NPC_TRIGGER_DE = "[Ff]ertig, [Ii]ch habe eine Firnisblüte ans Grab gelegt, [Ii]ch habe euren Wunsch erfüllt"
local NPC_TRIGGER_EN = "[Dd]one, [Ii] have placed a firnis blossom on the grave, [Ii] have made your wish come true"
local NPC_REPLY_DE = "Ich danke euch vielmals. Ich schenke Euch einen Ring. Ein roter Rubin, rot wie die Liebe. Ein Geschenkt für eure wahre Liebe ."
local NPC_REPLY_EN = "I thank you so much. I give you a ring. A red ruby, red like  the colour of Love. Save it  for your true love one day. "

function receiveText(type, text, PLAYER)
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
      
            thisNPC:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
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
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end