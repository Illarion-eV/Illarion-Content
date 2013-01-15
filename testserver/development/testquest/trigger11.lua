require("handler.sendmessagetoplayer")
require("handler.createitem")
require("questsystem.base")
module("questsystem.testquest.trigger11", package.seeall)

local QUEST_NUMBER = 11111
local PRECONDITION_QUESTSTATE = 4
local POSTCONDITION_QUESTSTATE = 5


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
    handler.createitem.createItem(position(876, 756, 0), 74, 999, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "funkt", "works"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end