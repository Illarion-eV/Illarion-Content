require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.IrmoromBless.trigger4", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 29
local POSTCONDITION_QUESTSTATE = 31

local POSITION = position(312, 232, 1)
local RADIUS = 2

function UseItem(PLAYER, item, ltstate)
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
    handler.createeffect.createEffect(position(312, 232, 1), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Irmoroms Segen schenkt dir neue Kraft, Zuversicht und Mut.", "Irmoroms bless gives you strength, confidence and courage."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end