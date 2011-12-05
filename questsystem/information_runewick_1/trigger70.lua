require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger70", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 79
local POSTCONDITION_QUESTSTATE = 84

local POSITION = position(951, 792, 0)

function MoveToField( PLAYER )
    if ADDITIONALCONDITIONS(PLAYER)
    and uestsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    
        HANDLER(PLAYER)
    
        questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
        return true
    end
    
    return false
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zurück zu Elsil und teile ihr mit welches Element du gefunden hast.", "Go to Elesil and tell her the kind of element you found."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end