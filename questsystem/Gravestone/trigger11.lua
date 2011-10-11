require("handler.sendmessagetoplayer")
require("handler.createitem")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Gravestone.trigger11", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 58
local POSTCONDITION_QUESTSTATE = 97

local POSITION = position(605, 344, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Die Namen am Grabstein, von Mary Sue und William Daloir, leuchten für einen Moment auf."
local LOOKAT_TEXT_EN = "The names on the gravestone of Mary Sue and William Daloir brighten up for a moment."

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
    handler.createeffect.createEffect(position(605, 344, 0), 44):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du erblickst einen funkelnden Rubinring der nun an Stelle der Firnisblüte erscheint. Ein Ring als Symbol der Ewigkeit.", "You see a shiny ruby ring which appears in place of where the firnis blossom has been. A ring  a symbol of eternity."):execute()
    handler.createitem.createItem(position(605, 344, 0), 68, 990, 1):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end