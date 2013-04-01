require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.testquest.trigger9", package.seeall)

local QUEST_NUMBER = 11111
local PRECONDITION_QUESTSTATE = 5
local POSTCONDITION_QUESTSTATE = 3

local POSITION = position(874, 758, 0)
local RADIUS = 2

function UseItem( PLAYER, item, TargetItem, counter, Param, ltstate )
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    PLAYER:inform(TEXT_DE, TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end


-- local TEXT_DE = TEXT -- German Use Text -- Deutscher Text beim Benutzen
-- local TEXT_EN = TEXT -- English Use Text -- Englischer Text beim Benutzen


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "look at funktioniert", "look at  works"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end