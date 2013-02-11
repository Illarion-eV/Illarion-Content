require("handler.sendmessagetoplayer")
require("questsystem.base")
module("questsystem.information_runewick_622.trigger15", package.seeall)

local QUEST_NUMBER = 622
local PRECONDITION_QUESTSTATE = 154
local POSTCONDITION_QUESTSTATE = 148

local POSITION = position(814, 740, 0)
local RADIUS = 10

function UseItem( PLAYER, item, TargetItem, counter, Param, ltstate )
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
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "[Quest Hinweis] Du wirst zwar noch ein wenig üben müssen, aber man konnte dich gut hören. Gehe nun zu Numila zurück.", "[Quest Hint] You will have to practice more, but there was some noise at least. Go back to Numila now."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end