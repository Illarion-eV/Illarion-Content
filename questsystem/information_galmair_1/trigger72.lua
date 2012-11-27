require("handler.sendmessagetoplayer")
require("handler.createitem")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger72", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 164
local POSTCONDITION_QUESTSTATE = 94

local POSITION = position(437, 232, 0)
local RADIUS = 1

function UseItem( PLAYER, item, TargetItem, counter, Param, ltstate )
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    --informNLS(PLAYER, TEXT_DE, TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function informNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    player:inform(player, item, textDe)
  else
    player:inform(player, item, textEn)
  end
end

-- local TEXT_DE = TEXT -- German Use Text -- Deutscher Text beim Benutzen
-- local TEXT_EN = TEXT -- English Use Text -- Englischer Text beim Benutzen


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur�ck zu Iradona um deine Belohnung zu erhalten, nachdem das Feuer brennt.", " Go back to Iradona to get your reward, since the fire is enlighted now."):execute()
    handler.createitem.createItem(position(437, 232, 0), 12, 999, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end