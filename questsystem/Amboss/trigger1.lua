require("handler.createeffect")
require("questsystem.base")
module("questsystem.Amboss.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(312, 231, 1)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Hail Irmorom. Geheiligt sei dein Name und dein Reich. Unseren Handel schütze und unser Bier segne."
local LOOKAT_TEXT_EN = "Hail Irmorom. Holowed be Thy name and thy Kingdom. Guard our trade and bless our beer."

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
    handler.createeffect.createEffect(position(312, 231, 1), 46):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end