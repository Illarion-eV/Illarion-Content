require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger70", package.seeall)

local QUEST_NUMBER = 631
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Vielleicht dieser Grabstein an der Wand? Gehe näher und untersuche ihn!", "Maybe this tomb stone at the wall? Go closer and examine it!"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end