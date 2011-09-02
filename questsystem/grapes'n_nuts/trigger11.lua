require("questsystem.base")
module("questsystem.grapes'n_nuts.trigger11", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 28

local NPC_TRIGGER_DE = "auftrag"
local NPC_TRIGGER_EN = "task"
local NPC_REPLY_DE = "Wie gesagt: Gehe nach Süden, und hol mir meine Trauben-Nuss-Mischung aus der Kiste des Glasshändlerorks. Pass auf, dass er Dich nicht bemerkt!"
local NPC_REPLY_EN = "Like I said: Go to the south and get my mix of grapes and nuts from the chest of the orc glass trader. Watch out that he doesn't notice you!"

function receiveText(type, text, player)
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and player:getType() == Character.player
      and string.find(text, getNLS(player, NPC_TRIGGER_DE, NPC_TRIGGER_EN)) then
    thisNPC:talk(Character.say, getNLS(player, NPC_REPLY_DE, NPC_REPLY_EN))
    
    
    questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)

    return true
  end

  return false
end

function getNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    return textDe
  else
    return textEn
  end
end
