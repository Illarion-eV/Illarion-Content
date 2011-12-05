require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_1.trigger21", package.seeall)

local QUEST_NUMBER = 621
local PRECONDITION_QUESTSTATE = 97
local POSTCONDITION_QUESTSTATE = 100

local POSITION = position(879, 759, 0)
local RADIUS = 5
local LOOKAT_TEXT_DE = "Zur Erinnerung an all jene Opfer dieser sinnlosen Kampagne in 30 BS zwischen Cadomyr und Galmair, welche nicht wiederbelebt werden konnten, weil ihr Körper versteckt wurden. Elara und das Feuer des Triumphes soll diesen Dummköpfen helfen ihre Kurzsichtigkeit zu überkommen."
local LOOKAT_TEXT_EN = "In remembrance of all victims of the mindless campaign in 30 BS between Cadomyr and Galmair who we could not reanimate, because they hid their bodies. Elara and the Fire of Triumph may help those fools from them to overcome their shortsightedness."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zurück zu Elesil und teile ihr mit die Jahreszahl der Kampagne.", "Go back to Elesil and tell her the year of the compaign."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end