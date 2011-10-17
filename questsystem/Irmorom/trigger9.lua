require("handler.createitem")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Irmorom.trigger9", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 17
local POSTCONDITION_QUESTSTATE = 30

local POSITION = position(312, 232, 1)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Deine Opfergabe wurde von Irmorom angenommen. Eine wohlige Wärme breitet sich in dir aus während du Irmorom`s Segen empfängst. "
local LOOKAT_TEXT_EN = "Your oblation is accepted by Irmorom. You feel a comforting warmth coming up as you receive his blessing."

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
    handler.createitem.createItem(position(312, 232, 1), 310, 990, 1):execute()
    handler.createeffect.createEffect(position(312, 232, 1), 53):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end