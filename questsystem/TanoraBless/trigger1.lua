require("questsystem.base")
module("questsystem.TanoraBless.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 15

local POSITION = position(630, 594, 0)
local RADIUS = 10
local LOOKAT_TEXT_DE = "So nah an Tanora`s Altar hörst du das brechen der Wellen noch intensiver. Das rauschen des Wassers hört sich an wie eine leise Melodie die beruhigend auf dich wirkt."
local LOOKAT_TEXT_EN = "So close at tanora`s altar you can hear the breaking of the waves more intense.  The swoosh of the waves sounds like a gently melody that acts on you in a comforting way."

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