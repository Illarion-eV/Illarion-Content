require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger59", package.seeall)

local QUEST_NUMBER = 631
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zurück zu Iradona und teile ihr mit auf was der Zwerg auf dem rechten Bild dort einschlägt.", "Go to Iradona and tell her against what the dwarf swings his axe at the right painting there."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end