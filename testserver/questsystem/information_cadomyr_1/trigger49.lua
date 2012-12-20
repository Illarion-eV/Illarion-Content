require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger49", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 111
local POSTCONDITION_QUESTSTATE = 111

local POSITION = position(907, 803, -3)
local RADIUS = 5
local LOOKAT_TEXT_DE = "16"
local LOOKAT_TEXT_EN = "16"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Nun gehe zurück zu Frizza und berichte ihr die Nummer.", "Go back to Frizza and tell her the number."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end