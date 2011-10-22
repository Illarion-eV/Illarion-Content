require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Sirani.trigger5", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 15
local POSTCONDITION_QUESTSTATE = 17

local POSITION = position(176, 761, 0)
local RADIUS = 2

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
    handler.createeffect.createEffect(position(176, 761, 0), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du fühlst eine wohlige Wärme und Liebe  in dir aufsteigen als du Sirani´s Segen empfängst.", "You feel a comforting warmth and love rising inside you as you receive Sirani`s blessing."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end