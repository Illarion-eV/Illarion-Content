require("questsystem.base")
module("questsystem.grapes'n_nuts.trigger25", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 39
local POSTCONDITION_QUESTSTATE = 46

local NPC_TRIGGER_DE = "auftrag"
local NPC_TRIGGER_EN = "task"
local NPC_REPLY_DE = "Du hast mir schon genug geholfen. Noch was kann ich nicht von Dir verlangen."
local NPC_REPLY_EN = "You've already helped me a lot. I really can't ask you for an other favour."

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
