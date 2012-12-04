require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger20", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 90
local POSTCONDITION_QUESTSTATE = 97

local NPC_TRIGGER_DE = "[Jjung|[Nn]obl|[Nn]obel"
local NPC_TRIGGER_EN = "[Yy]oung|[Nn]oble"
local NPC_REPLY_DE = "Genau, Zhambra erscheint oft als eine junger, nobler Krieger und hier ein Spiegel als Belohnung. F�r die n�chste Aufgabe geht in den Palast. Gefragt ist die Jahreszahl des Todes von Sir Reginald."
local NPC_REPLY_EN = "Exactly, Zhambra appears often as a young, noble warrior and here is a mirror as your reward. For your next task you have to go the palace and tell me the year of the death of Sir Reginald."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Gehe nun in den S�den in das Tollloch und betrachte den Grabstein dort.", "Go south to the Sport Hole. Examine the tombstones there."):execute()
    handler.createplayeritem.createPlayerItem(PLAYER, 336, 333, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end