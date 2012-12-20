require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger56", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 158
local POSTCONDITION_QUESTSTATE = 90

local POSITION = position(905, 824, 2)
local RADIUS = 8
local LOOKAT_TEXT_DE = "Eine große, alterslose Frau hebt ihren Finger als gäbe sie einen Rat. In ihrer anderen Hand hält sie einige Bücher und Schriftrollen."
local LOOKAT_TEXT_EN = "A tall and ageless woman rises one of her fingers as she has to mention her advice. In her other hand she holds some books and scrolls."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh zurück zu Elsil und teile ihr mit wie alt die Frau die die Statue symbolisiert wirkt.", "Go to Elesil and tell her the age of the woman, symbolised by the statue."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end