require("questsystem.base")
module("questsystem.information_runewick_1.trigger28", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 86
local POSTCONDITION_QUESTSTATE = 94

local POSITION = position(860, 865, 0)
local RADIUS = 0
local LOOKAT_TEXT_DE = "Schön, das Feuer brennt. Geh nun zurück zu Elesil um deine Belohnung zu erhalten."
local LOOKAT_TEXT_EN = "Well, the fire burns. Go back to Elesil now to get your reward.."

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
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end