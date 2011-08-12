require("questsystem.base")
module("LookAtItem", package.seeall)

local QUEST_NUMBER = 0
local POSITION = position(0,0,0)
local LOOKAT_TEXT_DE = ""
local LOOKAT_TEXT_EN = ""
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 0

function LookAtItem(player, item)
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and item.pos == POSITION then
    itemInformNLS(player, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
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
