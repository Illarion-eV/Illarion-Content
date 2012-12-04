require("handler.sendmessagetoplayer")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.AdronBless.trigger4", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 4

local POSITION = position(734, 312, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = ""
local LOOKAT_TEXT_EN = ""

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
    handler.createeffect.createEffect(position(734, 312, 0), 53):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Euphorisch nimmt Adron deine Gabe an. Gesegnet sei deine Weinernte und dein Wein. Möge dir ein hervorragendes Erntejahr beschert sein.", "Adron takes your oblation with euphoria. Blessed be your wine crop and your wine. May it bring you a banner year for crops."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end