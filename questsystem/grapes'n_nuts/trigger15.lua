require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
module("questsystem.grapes'n_nuts.trigger15", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 28
local POSTCONDITION_QUESTSTATE = 20

local POSITION = position(376, 250, 0)
local RADIUS = 1

function UseItem( PLAYER, item, TargetItem, counter, Param, ltstate )
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    --informNLS(PLAYER, TEXT_DE, TEXT_EN)
    
handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "You unlock the chest and besides the mix of grapes and nuts you find some coins.", "Du schliesst die Kiste auf und findest neben der Trauben-Nuss-Mischung noch einige Münzen."):execute()
handler.createplayeritem.createPlayerItem(PLAYER, 388, 333, 9):execute()
handler.createplayeritem.createPlayerItem(PLAYER, 759, 333, 9):execute()
handler.createplayeritem.createPlayerItem(PLAYER, 3077, 333, 3):execute()
handler.createplayeritem.createPlayerItem(PLAYER, 3076, 33, 56):execute()
    
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
