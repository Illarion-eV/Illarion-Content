require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.Gravestone.trigger4", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 27
local POSTCONDITION_QUESTSTATE = 39

local POSITION = position(605, 344, 0)
local RADIUS = 1

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du wischt den Schmutz vom Grabstein und erblickst eine Inschrift.", "You clean off the dirt from the tombstone and an inscription appears."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end