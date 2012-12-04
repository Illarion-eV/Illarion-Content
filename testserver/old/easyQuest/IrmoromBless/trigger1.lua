require("questsystem.base")
module("questsystem.IrmoromBless.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 29

local POSITION = position(312, 232, 1)
local RADIUS = 20
local LOOKAT_TEXT_DE = "Du erblickst einen Hammer und eine Axt, eingemeißelt in Stein vorne am Altar. Du hälst kurz inne als du ein leises grummeliges flüstern vernimmst. Hat da etwa jemand nach Bier verlangt?"
local LOOKAT_TEXT_EN = "You see a hammer and an axe  engraved in stone in front of the altar. You pause for a moment as you hear a low mumbling voice. Did someone really yearned for beer?"

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