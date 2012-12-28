require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger67", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 169
local POSTCONDITION_QUESTSTATE = 319


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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Der Stuhl an der Wand sieht auffällig auf. Vielleicht solltest du dir den mal genauer aus der Nähe ansehen.", "The chair on the wall looks suspicious. You should probably take a look from a close position at this chair."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end