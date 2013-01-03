require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger71", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 73
local POSTCONDITION_QUESTSTATE = 79

local ITEM_ID = 306
local ITEM_AMNT = 1
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Wie ich sehe, wurde die Notiz gefunden und auch einen Schinken gebracht. Man darf ihn behalten. Nun ab in Irmoroms Tempel und sag mir auf was der Zwerg dort auf dem Bild einschlägt. "
local NPC_REPLY_EN = "I see, you found the noice and got ham. Fine, you can keep the ham. Go to the temple of Irmorom and tell me against what the dwarf swings his axe at one of the pictures there."
local NPC_NOITEM_DE = "Die Notiz scheint gefunden worden sein, aber befolgt sollte sie auch werden."
local NPC_NOITEM_EN = "The notice has been found, but the task has not been accomplished!"

function receiveText(npc, type, text, PLAYER)
    if PLAYER:getType() == Character.player
    and ADDITIONALCONDITIONS(PLAYER)
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
            if PLAYER:countItem(ITEM_ID)>=ITEM_AMNT then
                npc:talk(Character.say, getNLS(PLAYER, NPC_REPLY_DE, NPC_REPLY_EN))
            
                HANDLER(PLAYER)
            
                questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        
                return true
            elseif (NPC_NOITEM_DE~="") then
                npc:talk(Character.say, getNLS(PLAYER, NPC_NOITEM_DE, NPC_NOITEM_EN))
          
                return true
            else
                return false
            end
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe nun in den Tempel von Irmorom und betrachte die Bilder dort.", "Go to the temple of Irmorom and lock at the pictures there."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end