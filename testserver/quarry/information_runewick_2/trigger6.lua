require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_2.trigger6", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 123
local POSTCONDITION_QUESTSTATE = 132

local POSITION = position(904, 772, 5)
local RADIUS = 0

function UseItem(PLAYER, item, ltstate)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    PLAYER:inform(TEXT_DE, TEXT_EN)
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end


-- local TEXT_DE = TEXT -- German Use Text -- Deutscher Text beim Benutzen
-- local TEXT_EN = TEXT -- English Use Text -- Englischer Text beim Benutzen


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Auf der Pergamentrolle ist das Wort 'Eibental' zulesen. Es scheint nun Zeit zurück zu Numila zu gehen und ihr das genannte Wort zu nennen.", "The word 'Yewdale' appears on the pell. It seems to be time to go back to Numila now and to tell her the noted word."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end