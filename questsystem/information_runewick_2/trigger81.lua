require("handler.sendmessagetoplayer")
require("handler.eraseplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger81", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 310
local POSTCONDITION_QUESTSTATE = 314

local ITEM_ID = 155
local ITEM_AMNT = 10
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Sehr gut! *stopft das Sibanac in die Pfeife und nimmt einen Zug* Bereit? "
local NPC_REPLY_EN = "Alright! *puts some sibanac into the pipe and takes a drag* Ready?"
local NPC_NOITEM_DE = "Ohne Pfeife braucht ihr gar nicht mehr zu kommen."
local NPC_NOITEM_EN = "You do not have to show up without a pipe the next time."

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
    handler.eraseplayeritem.erasePlayerItem(PLAYER, 155, 10):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Sag \"Bereit\" wenn du für die letzte Aufgabe bereit bist.", "Say \"ready\" if you are ready for your last task."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end