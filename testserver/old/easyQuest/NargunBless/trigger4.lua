require("handler.sendmessage")
require("handler.createeffect")
require("questsystem.base")
module("questsystem.NargunBless.trigger4", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 15
local POSTCONDITION_QUESTSTATE = 17

local POSITION = position(255, 293, -5)
local RADIUS = 2

function UseItem(PLAYER, item, ltstate)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    --informNLS(PLAYER, TEXT_DE, TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function informNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    player:inform(player, item, textDe)
  else
    player:inform(player, item, textEn)
  end
end

-- local TEXT_DE = TEXT -- German Use Text -- Deutscher Text beim Benutzen
-- local TEXT_EN = TEXT -- English Use Text -- Englischer Text beim Benutzen


function HANDLER(PLAYER)
    handler.createeffect.createEffect(position(255, 293, -5), 7):execute()
    handler.sendmessage.sendMessage(position(255, 293, -5), "Ein starker Wind taucht auf und fegt all den Staub vom Altar direkt in den Raum und in dein Gesicht. Du hörst ein schallendes Gelächter.", "A strong wind appears and sweeps all the dust off the altar forthright into the room and your face. You can hear a guffaw.", 15):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end