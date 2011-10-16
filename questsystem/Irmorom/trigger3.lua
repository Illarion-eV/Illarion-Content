require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Irmorom.trigger3", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 9
local POSTCONDITION_QUESTSTATE = 4

local POSITION = position(312, 232, 1)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Du blickst auf den Altar voller Erfurcht."
local LOOKAT_TEXT_EN = "You look at the altar with awe."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du fühlst eine wohlige Wärme in dir aufkommen.", "You feel a comforting warmth coming up."):execute()
    handler.createeffect.createEffect(position(312, 232, 1), 53):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end