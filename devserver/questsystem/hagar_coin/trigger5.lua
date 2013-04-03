require("questsystem.base")
module("questsystem.hagar_coin.trigger5", package.seeall)

local QUEST_NUMBER = 10001
local PRECONDITION_QUESTSTATE = 10
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(439, 284, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Du liest: Such etwa 20 Schritt weiter östlich die Tanne beim Wasser."
local LOOKAT_TEXT_EN = "You read: Search for the fir tree about 20 steps in the east that stands at the water."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
	base.lookat.SetSpecialDescription(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	world:itemInform(PLAYER,item,base.lookat.GenerateLookAt(PLAYER, item, base.lookat.NONE));
    
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

