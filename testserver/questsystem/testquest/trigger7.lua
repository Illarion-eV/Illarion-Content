require("handler.sendmessagetoplayer")
require("handler.createitem")
require("questsystem.base")
module("questsystem.testquest.trigger7", package.seeall)

local QUEST_NUMBER = 11111
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(879, 759, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "du kannst was lesen"
local LOOKAT_TEXT_EN = "you can read something"

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
  if player:getPlayerLanguage() == Player.german then
    world:itemInform(player, item, textDe)
  else
    world:itemInform(player, item, textEn)
  end
end


function HANDLER(PLAYER)
    handler.createitem.createItem(position(876, 756, 0), 74, 999, 1):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "funkt", "works"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end