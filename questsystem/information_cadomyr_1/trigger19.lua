require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_cadomyr_1.trigger19", package.seeall)

local QUEST_NUMBER = 641
local PRECONDITION_QUESTSTATE = 97
local POSTCONDITION_QUESTSTATE = 100

local POSITION = position(129, 524, 0)
local RADIUS = 15
local LOOKAT_TEXT_DE = "Zur Erinnerung an all jene Opfer dieser sinnlosen Kampagne zwischen Cadomyr und Galmair in 30 BS. Elara und das Feuer des Triumphes sollen diesen rot-wei�en und schwarz-blauen Dummk�pfen helfen ihre KurzsichEin Mann liegt in seinem Bett. Er scheint sehr krank zu sein. Eine junge Frau sitzt neben ihm und h�lt seine Hand. Er reicht ihr eine Krone w�hrend sie in einem beinahe g�ttlichen Sonnenlicht schimmert. Unten rechts steht ein Datum: 32 AS."
local LOOKAT_TEXT_EN = "A man is lying in his bed. He seems very sick. A young woman is sitting next to him and is holding one of his hands. He hands her a crown while she is shimmering in an almost divine sun light. At the bottom right is a date: 32 AS."

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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh nun zur�ck zu Frizza und teile ihr mit die Jahreszahl des Todes von Sir Reginald.", "Go back to Frizza and tell her the year of the death of Sir Reginald."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end