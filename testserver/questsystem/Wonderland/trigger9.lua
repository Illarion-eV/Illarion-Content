require("handler.sendmessagetoplayer")
require("handler.warpplayer")
require("questsystem.base")
module("questsystem.Wonderland.trigger9", package.seeall)

local QUEST_NUMBER = 11112
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 3


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
    handler.warpplayer.warpPlayer(PLAYER, position(900, 580, 0)):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"", "You hear a laughter and scratchy voice saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\""):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end