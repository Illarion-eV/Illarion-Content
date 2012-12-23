require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.Geld_in_Hecke.trigger7", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 14
local POSTCONDITION_QUESTSTATE = 14


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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Irgendetwas ist auffällig an dem Fass bei dem Wagen. Vielleicht schaust du es dir mal genauer an?", "Something is diffrent with this barrel at the wagon. Maybe you should take a closer look?"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end