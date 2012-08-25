require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger3", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 10
local POSTCONDITION_QUESTSTATE = 118

local ITEM_ID = 3109
local ITEM_AMNT = 1
local NPC_TRIGGER_DE = "."
local NPC_TRIGGER_EN = "."
local NPC_REPLY_DE = "Ich sehe ihr habt die Pergamentrolle. Gut, gebt sie mir. *nimmt sie und schreibt ein paar Zeilen bevor sie sie wieder zurück gibt*."
local NPC_REPLY_EN = "I see you have the roll. Good, give it to me. *takes it and writes some lines before she hands them back*."
local NPC_NOITEM_DE = "Ich habe euch doch darum gebeten mir eine Pergamentrolle zu bringen. Bringt mir daher eine."
local NPC_NOITEM_EN = "I asked you for a pell, therefore, please bring me one."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Auf der Pergamentrolle steht geschrieben: \"Geht hoch an die Spitze des Turm des Feuers, stellt euch zwischen der Säule des Feuers und dem Altar, und blickt in die Rolle. Die Rolle wird euch ein Zeichen geben sobald ihr richtig steht.\"", "Following is written on the poll: \"Go to the top of the Tower of Fire, stay between the column of fire and altar, and read the pell. The pell will tell you the right spot as soon as you stay there.\""):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end