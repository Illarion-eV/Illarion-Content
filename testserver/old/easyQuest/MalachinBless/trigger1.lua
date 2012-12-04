require("questsystem.base")
module("questsystem.MalachinBless.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 15

local POSITION = position(137, 678, 1)
local RADIUS = 15
local LOOKAT_TEXT_DE = "Du tritts näher an den Altar, betest ein Gebet und überlegst welche Opfergabe du zu Malachin`s  Ehren erbringen könntest. "
local LOOKAT_TEXT_EN = "You step closer to the altar, you say a prayer and you consider what oblation at  Malachin`s honor you could provide."

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