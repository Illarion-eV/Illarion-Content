require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.hagar_coin.trigger3", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 5
local POSTCONDITION_QUESTSTATE = 8

local POSITION = position(462, 285, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "In einem kleinen Astloch findest du eine Münze..."
local LOOKAT_TEXT_EN = "In a small hole, you find a coin..."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    
handler.createplayeritem.createPlayerItem(PLAYER, 3077, 999, 1):execute()
    
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
