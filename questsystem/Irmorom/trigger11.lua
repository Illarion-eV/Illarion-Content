require("handler.createitem")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Irmorom.trigger11", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 35
local POSTCONDITION_QUESTSTATE = 30

local POSITION = position(312, 232, 1)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Voller Ehrfurcht blickst du auf den Altar und erblickst ein Geschenk."
local LOOKAT_TEXT_EN = "With awe you look at the altar and you notice a gift."

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