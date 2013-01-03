require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger17", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 142
local POSTCONDITION_QUESTSTATE = 143


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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Zähle schnell durch, und geh zurück zu Numila um ihr die Anzahl zu sagen und deine Belohnung zu erhalten.", "Count these riderstatues and go back to Numila to tell her the number of them and to get your reward."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end