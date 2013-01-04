require("questsystem.base")
module("questsystem.Gravestone.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 27

local POSITION = position(605, 344, 0)
local RADIUS = 10
local LOOKAT_TEXT_DE = "Du siehst einen alten schmutzigen Grabstein. Mit einem Tuch könntest du den Schmutz abwischen."
local LOOKAT_TEXT_EN = "You see an old tombstone. With a cloth you could clean the dirt away."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

	base.lookat.SetSpecialName(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	world:itemInform(PLAYER,item,base.lookat.GenerateLookAt(PLAYER, item, base.lookat.NONE));
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function HANDLER(PLAYER)
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end