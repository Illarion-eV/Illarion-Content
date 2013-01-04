require("questsystem.base")
module("questsystem.Gravestone.trigger8", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 39
local POSTCONDITION_QUESTSTATE = 54

local POSITION = position(605, 344, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Die Inschrieft lautet. reiH thur yraM euS. In ewiger Liebe William Daloir."
local LOOKAT_TEXT_EN = "The inscription says. ereH stser yraM euS. In eternal love William Daloir."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

	base.lookat.SetSpecialDescription(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
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