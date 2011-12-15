require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.Amboss.trigger2", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 3

local POSITION = position(311, 231, 1)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Du hast den Amboss berührt."
local LOOKAT_TEXT_EN = "You have touched the ambos."

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
    handler.createeffect.createEffect(position(311, 231, 1), 31):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Plötzlich leuchtet dieser kurz auf und eine Inschrift wird sichtbar.", " Suddenly it start to glow and an inscription appears."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end