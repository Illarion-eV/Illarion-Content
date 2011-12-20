require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger64", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 169
local POSTCONDITION_QUESTSTATE = 73

local POSITION = position(251, 291, -6)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Du findest eine Notiz 'Gefunden, gut! Bringe mir nun einen Schinken. Iradona'"
local LOOKAT_TEXT_EN = "You find a note 'Found, good! Bring me ham now. Iradona'"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Schlachte ein Schwein deiner Wahl, räuchere das Fleisch und bringe den so erstellten Schinken zu Iradona.", "Slaughter a pig of your choice, smoke the meat and bring the produced ham to Iradona."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end