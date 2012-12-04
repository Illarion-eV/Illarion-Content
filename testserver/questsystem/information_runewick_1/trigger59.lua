require("handler.sendmessagetoplayer")
require("handler.createitem")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger59", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 164
local POSTCONDITION_QUESTSTATE = 94

local POSITION = position(860, 865, 0)
local RADIUS = 1

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur�ck zu Elesil um deine Belohnung zu erhalten, nachdem das Feuer brennt.", " Go back to Elesil to get your reward, since the fire is enlighted now."):execute()
    handler.createitem.createItem(position(860, 865, 0), 12, 999, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end