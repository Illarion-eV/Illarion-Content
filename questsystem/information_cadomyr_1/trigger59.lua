require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger59", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 158
local POSTCONDITION_QUESTSTATE = 90

local POSITION = position(143, 566, 0)
local RADIUS = 8
local LOOKAT_TEXT_DE = "Ein junger, nobler Krieger mit einer glänzenden aber mit Blut befleckter Rüstung trägt furchtlos einen verwundeten Soldaten auf seinen Schultern."
local LOOKAT_TEXT_EN = "A young and noble warrior wears a shiny armour covered in blood while he carries fearless a wounded soldier at his shoulders."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zurück zu Frizza und teile ihr mit die Art die Krieger die die Statuen symbolisieren.", "Go to Frizza and tell her the kind of warriors, symbolized by the statues."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end