require("handler.sendmessagetoplayer")
require("questsystem.base")
require("base.lookat")
require("base.common")
module("questsystem.Geld_in_Hecke.trigger1", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 14
local POSTCONDITION_QUESTSTATE = 2

local POSITION = position(685, 316, 0)
local RADIUS = 5
local LOOKAT_TEXT_DE = "Ganz unten auf dem Boden des Fasses siehst du eine Notiz, die folgendes besagt: \"Das Geld liegt wie immer in der Hecke.\""
local LOOKAT_TEXT_EN = "On the very bottom of the barrel is a hidden note. You can read the following: \"The money is as always in the hedge!\""

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh und suche in der Hecke nicht weit von hier.", "Go and seach in the hedge not far from here."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end