require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger75", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 109
local POSTCONDITION_QUESTSTATE = 331


function MoveToField( PLAYER )
    if ADDITIONALCONDITIONS(PLAYER)
    and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    
        HANDLER(PLAYER)
    
        questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        return true
    end
    
    return false
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Vielleicht einer der vier Särge da hinten? Gehe näher und untersuche sie!", "Maybe one of these four coffins over there? Go closer and examine them!"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end