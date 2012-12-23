require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger59", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 79
local POSTCONDITION_QUESTSTATE = 84


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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zurück zu Frizza und nenne ihr das Gebäude das dort auf dem Bild beschrieben wird.", "Go to Frizza back and tell her the building that is mentioned on the painting at the wall."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end