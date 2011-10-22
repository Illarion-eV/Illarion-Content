require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Sirani.trigger7", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 59
local POSTCONDITION_QUESTSTATE = 17

local POSITION = position(176, 761, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Du kniest nieder und sprichst ein Gebet. Deine Opfergabe wurde von Sirani mit Freude angenommen."
local LOOKAT_TEXT_EN = "You knee down and you say a prayer. Sirani has received  your oblation with joy."

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
    handler.createeffect.createEffect(position(176, 761, 0), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du fühlst eine wohlige Wärme und Liebe  in dir aufsteigen als du Sirani´s Segen empfängst.", "You feel a comforting warmth and love rising inside you as you receive Sirani`s blessing."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end