require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.IrmoromBless.trigger10", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 29
local POSTCONDITION_QUESTSTATE = 31

local POSITION = position(312, 232, 1)
local RADIUS = 2
local LOOKAT_TEXT_DE = ""
local LOOKAT_TEXT_EN = ""

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

    itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, textDe)
  else
    world:itemInform(player, item, textEn)
  end
end


function HANDLER(PLAYER)
    handler.createeffect.createEffect(position(312, 232, 1), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Irmoroms Segen schenkt dir neue Kraft, Zuversicht und Mut.", "Irmoroms bless gives you strength, confidence and courage."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end