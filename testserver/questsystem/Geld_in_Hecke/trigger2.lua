require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
require("base.lookat")
require("base.common")
module("questsystem.Geld_in_Hecke.trigger2", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 2
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(675, 329, 0)
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
  local lookAt = base.lookat.GenerateLookAt(player, item)
  lookAt.description = base.common.GetNLS(player, textDe, textEn)
  world:itemInform(player, item, lookAt)
end


function HANDLER(PLAYER)
    handler.createplayeritem.createPlayerItem(PLAYER, 3077, 999, 25):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du findest an einem Zweig ein kleines Beutelchen das einige Silbermünzen enthält!", "Attached to a branch, you find a small bag containing some silvercoins."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end