require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_galmair_1.trigger25", package.seeall)

local QUEST_NUMBER = 631
local PRECONDITION_QUESTSTATE = 331
local POSTCONDITION_QUESTSTATE = 111

local POSITION = position(327, 295, -6)
local RADIUS = 5
local LOOKAT_TEXT_DE = "Nach etwas Zeit erkennst du schlie�lich eine 17."
local LOOKAT_TEXT_EN = "After some time you can recognize a 17."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Nun gehe zur�ck zu Iradona und berichte ihr die Nummer.", "Go back to Iradona and tell her the number."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end