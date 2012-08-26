require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger16", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 73
local POSTCONDITION_QUESTSTATE = 79

local ITEM_ID = 15
local ITEM_AMNT = 1
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Wie ich sehe, wurde die Notiz gefunden und auch ein Apfel gebracht. Man darf ihn behalten. Nun ab in den Garten. Dort sind vier Säulen mit Elementen. Welches ist auf der linken Säule?"
local NPC_REPLY_EN = "I see, you found the noice and got an apple. Fine, you can keep the apple. Now go to the garden and tell me name of the element on the left column there."
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zum Garten nun - nehmt das rote Portal in der Stadt. Am hinteren Ende findest du die Säulen.", "Go to the garden now - use the red portal in the town. You find the columns at the end of the garden."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end