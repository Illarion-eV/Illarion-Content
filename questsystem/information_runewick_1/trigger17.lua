require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger17", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 84
local POSTCONDITION_QUESTSTATE = 84

local POSITION = position(958, 788, 0)
local RADIUS = 15
local LOOKAT_TEXT_DE = "Die linke S�ule tr�gt offensichtlich ein Feuerelement."
local LOOKAT_TEXT_EN = "The left column bears an element of fire obviously."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zur�ck zu Elsil und teile ihr mit welches Element du gefunden hast.", "Go to Elesil and tell her the kind of element you found."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end