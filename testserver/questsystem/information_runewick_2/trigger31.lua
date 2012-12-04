require("handler.sendmessagetoplayer")
require("handler.eraseplayeritem")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger31", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 207
local POSTCONDITION_QUESTSTATE = 208

local ITEM_ID = 388
local ITEM_AMNT = 1
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Bist du das Traubenkind? Schön, gib sie mir. Zur Belohnung bekommst du eine gelbe Robe. Geh nach hinten zu Lilith. Sie soll dich ordentlich einkleiden."
local NPC_REPLY_EN = "Are you the grapes-child? Nice, give them to me. You shall have a yellow robe as reward. Go behind to Lilith. She shall help you to get proper dressed."
local NPC_NOITEM_DE = "Bist du das Traubenkind? Wie dem auch sei, ohne Trauben gibt es keine Belohnung."
local NPC_NOITEM_EN = "Are you the grapes-child? Anyway, if you do not have the grapes you do not get your reward."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh in den anderen Raum wo Lilith zu finden ist.", "Go to the other room where Lilith can be found."):execute()
    handler.eraseplayeritem.erasePlayerItem(PLAYER, 388, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end