require("questsystem.base")
module("questsystem.Gravestone.trigger12", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 58
local POSTCONDITION_QUESTSTATE = 91

local POSITION = position(305, 344, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Du erschrickst kurz als die Firnisblüte verschwindet. Du bewegst dich langsam weg vom Grab und  machst dich auf den Weg zu William Daloir."
local LOOKAT_TEXT_EN = "You get scared a bit as you see the firnis blossom disappear. You move slowly away and walk back to William Daloir."

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