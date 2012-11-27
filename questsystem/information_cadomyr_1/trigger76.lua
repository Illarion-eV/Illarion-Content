require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger76", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 158
local POSTCONDITION_QUESTSTATE = 90

local POSITION = position(143, 566, 0)
local RADIUS = 15
local LOOKAT_TEXT_DE = "Ein junger, nobler Krieger mit einer gl�nzenden R�stung scheint mit erhobener Faust den Befehl zum Angriff zu geben."
local LOOKAT_TEXT_EN = "A young and noble warrior wears a shiny armour and seems to gave the order to attack while he raises his fists."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zur�ck zu Frizza und teile ihr mit die Art die Krieger die die Statuen symbolisieren.", "Go to Frizza and tell her the kind of warriors, symbolized by the statues."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end