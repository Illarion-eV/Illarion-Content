require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger21", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 91
local POSTCONDITION_QUESTSTATE = 95

local POSITION = position(1, 1, 1)
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "W�hrend du im Buch liest, f�llt dir eine Notiz auf: 'Gut, und nun finde das Buch �ber unsere Fraktion. Frizza'.", "While you are reading the book you see a note: 'Good, and now find the book about our faction. Frizza'."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end