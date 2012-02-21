require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger4", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 118
local POSTCONDITION_QUESTSTATE = 123


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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du fühlst, wie die Pergamentrolle merklich schwerer wird.", "You feel that the pell becomes heavier."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end