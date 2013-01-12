require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.TanoraBless.trigger2", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 15
local POSTCONDITION_QUESTSTATE = 17

local POSITION = position(630, 594, 0)
local RADIUS = 2

function UseItem( PLAYER, item, TargetItem, ltstate )
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
    handler.createeffect.createEffect(position(630, 594, 0), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du fühlst dich frei  wie der Wind und stark wie die See.", "You feel free like the wind and strong like the sea"):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Tanora`s Segen möge dir fischreiche Gewässer bescheren und dir auf hoher See stets Schutz bieten.", "Tanora`s bless may bring you waters full of fish and guard you at sea."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end