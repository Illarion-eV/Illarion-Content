require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
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

	base.lookat.SetSpecialName(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	world:itemInform(PLAYER,Item,base.lookat.GenerateLookAt(PLAYER, Item, base.lookat.NONE));
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function HANDLER(PLAYER)
    handler.createplayeritem.createPlayerItem(PLAYER, 3077, 999, 25):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du findest an einem Zweig ein kleines Beutelchen das einige Silbermünzen enthält!", "Attached to a branch, you find a small bag containing some silvercoins."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end