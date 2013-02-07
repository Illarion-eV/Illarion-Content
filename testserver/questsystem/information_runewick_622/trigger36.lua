require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
require("base.lookat")
require("base.common")
module("questsystem.information_runewick_622.trigger36", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 233
local POSTCONDITION_QUESTSTATE = 243

local POSITION = position(848, 705, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Hier scheint etwas versteckt zu sein. Nach einer kurzen Suche entdeckst du eine Rüstung die nun dir gehört."
local LOOKAT_TEXT_EN = "There seems something hidden. After a short search you find an armour which belongs to you now."

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
    handler.createplayeritem.createPlayerItem(PLAYER, 101, 333, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "[Quest Hinweis] Du hast eine Rüstung gefunden. Gehe nun zurück zu Numila um einen weiteren Auftrag zu erhalten.", "[Quest Hint] You have received an armour. Go back to Numila to get a further task."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end