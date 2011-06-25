require("base")
module("firstTest.node1", package.seeall)

local QUEST_NUMBER = 10000
local POSITION = position(681,319, 0)
local LOOKAT_TEXT_DE = "Ein Hamster hat sich durch die Vorräte auf dem Wagen gefressen. Jetzt eben läuft er zur anderen Karre hinüber."
local LOOKAT_TEXT_EN = "A hamster ate almost all supplies on the wagon. Right now he is on his way to the other cart."
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 1

function LookAtItem(player, item)
  if base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    itemInformNLS(player, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

local function itemInformNLS(player, item, textDe, textEn)
  if player:getPlayerLanguage() == CPlayer.german then
    world:itemInform(player, item, textDe)
  else
    world:itemInform(player, item, textEn)
  end
end
