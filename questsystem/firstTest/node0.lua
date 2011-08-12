require("questsystem.base")
module("questsystem.firstTest.node0", package.seeall)

local QUEST_NUMBER = 10000
local NPC_TRIGGER_DE = "quest"
local NPC_TRIGGER_EN = "quest"
local NPC_REPLY_DE = "Ich habe eine Aufgabe für dich, bitte fang den Hamster der meine Vorräte frisst! Sag mir wenn du fertig bist."
local NPC_REPLY_EN = "I have a task for you, please catch the hamster eating my supplies! Tell me when you are done."
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 1

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
