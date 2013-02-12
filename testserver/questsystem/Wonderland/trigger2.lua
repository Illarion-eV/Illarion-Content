require("handler.sendmessagetoplayer")
require("handler.warpplayer")
require("questsystem.base")
module("questsystem.Wonderland.trigger2", package.seeall)

local QUEST_NUMBER = 11112
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 11


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
    handler.warpplayer.warpPlayer(PLAYER, position(905, 576, 0)):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf die eine Stimme aus dem Süden sagt: \"Lauf weg!\"", "The scratchy voice says: \"No Chance!\". A voice from the south replies: \"Run away!\""):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end