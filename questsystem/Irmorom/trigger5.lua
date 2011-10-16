require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.Irmorom.trigger5", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 16
local POSTCONDITION_QUESTSTATE = 3

local POSITION = position(312, 232, 1)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Du liest:"
local LOOKAT_TEXT_EN = "You read:"

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Hail Irmorom. Ehre dem Gott des Handels und Handwerks. Geheiligt sei dein Name und dein Reich. Unseren Handel schütze und unser Bier segne.", "Hail Irmorom. Honor to the god of trading and  crafting. Hollowed be Thy name and Thy kingdom. Guard our trade and bless our beer."):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Führe uns in ein goldenes und ruhmreiches Zeitalter. Dein ist der Hammer und die Kraft. Hail Irmorom", "Lead us to a golden and glory age. Thy is the hammer and the strength. Hail Irmorom "):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end