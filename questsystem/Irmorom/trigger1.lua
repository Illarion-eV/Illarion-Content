require("handler.createeffect")
require("questsystem.base")
module("questsystem.Irmorom.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 16

local POSITION = position(312, 232, 1)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Du erblickst einen Gebetstext. Eingemeiﬂelt in Stein, vorne am Altar."
local LOOKAT_TEXT_EN = "You see a prayer written in stone in front of the altar. "

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
    handler.createeffect.createEffect(position(312, 232, 1), 51):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end