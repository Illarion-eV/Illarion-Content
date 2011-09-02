require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.grapes'n_nuts.trigger14", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 28
local POSTCONDITION_QUESTSTATE = 15

local POSITION = position(376, 250, 0)
local RADIUS = 1

function UseItem( PLAYER, item, TargetItem, counter, Param, ltstate )
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    --informNLS(PLAYER, TEXT_DE, TEXT_EN)
    
handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Die Kiste ist verschlossen. Du solltest wohl einen Schlüssel verwenden.", "The chest is locked. You shall use a key."):execute()
    
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
