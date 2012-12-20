require("questsystem.base")
module("questsystem.hagar_coin.trigger4", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 5
local POSTCONDITION_QUESTSTATE = 10

local POSITION = position(439, 284, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Du liest: Such etwa 20 Schritt weiter östlich die Tanne beim Wasser."
local LOOKAT_TEXT_EN = "You read: Search for the fir tree about 20 steps in the east that stands at the water."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
    
    
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
