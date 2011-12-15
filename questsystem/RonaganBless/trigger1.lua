require("questsystem.base")
module("questsystem.RonaganBless.trigger1", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 15

local POSITION = position(414, 275, -6)
local RADIUS = 10
local LOOKAT_TEXT_DE = "Du erblickst eine Inschrift die lautet. Durch die Dunkelheit wandernd. Den Schatten suchend. Zu tun, was getan werden muss, um zu überleben. Erbitte ich , oh Ronagan, deinen Schutz."
local LOOKAT_TEXT_EN = "You notice an inscription which says. Rambling through the darkness, searching for the shadows. To do what I have to do, to stay alive. I request, oh Ronagan, your protection."

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