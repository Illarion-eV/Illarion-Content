require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.testquest.trigger1", package.seeall)

local QUEST_NUMBER = 11111
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 4


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
    handler.createplayeritem.createPlayerItem(PLAYER, 3109, 999, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end