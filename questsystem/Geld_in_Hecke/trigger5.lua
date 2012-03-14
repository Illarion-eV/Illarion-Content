require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.Geld_in_Hecke.trigger5", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 2
local POSTCONDITION_QUESTSTATE = 2

local POSITION = position(682, 319, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Ganz unten auf dem Boden des Fasses siehst du eine Notiz liegen, die besagt: \"Das Geld liegt wie immer im Versteck in der Hecke!\""
local LOOKAT_TEXT_EN = "On the very bottom of the barrel is a note hidden. It says: \"The money is as always in the hedge!\""

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh und suche im der Hecke nicht weit von hier.", "Go and seach in the hedge not far from here."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end