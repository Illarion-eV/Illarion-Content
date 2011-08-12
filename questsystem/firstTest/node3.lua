require("questsystem.base")
module("questsystem.firstTest.node3", package.seeall)

local QUEST_NUMBER = 10000
local NPC_TRIGGER_DE = "fertig"
local NPC_TRIGGER_EN = "done"
local NPC_REPLY_DE = "Danke sehr und nun zisch ab!"
local NPC_REPLY_EN = "Thank you and now go away!"
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 0

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
