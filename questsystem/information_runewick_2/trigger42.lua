require("questsystem.base")
module("questsystem.information_runewick_2.trigger42", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 218
local POSTCONDITION_QUESTSTATE = 214

local NPC_TRIGGER_DE = "[Ee]xperiment"
local NPC_TRIGGER_EN = "[Ee]xperiment"
local NPC_REPLY_DE = "Gut, erste Frage wäre beantwortet. Nächste Frage: Wer hat den Todes Gestank zudem verwandelt das er nun ist?"
local NPC_REPLY_EN = "Good, first question was answered. Next question: Who has turned the Death Stench to the current state?"

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
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end