require("questsystem.base")
module("TalkWithNpc", package.seeall)

local QUEST_NUMBER = 0
local NPC_TRIGGER_DE = ""
local NPC_TRIGGER_EN = ""
local NPC_REPLY_DE = ""
local NPC_REPLY_EN = ""
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 0

function receiveText(type, text, player)
  if questsystem.base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and player.getType == Character.player
      and string.find(text, getNLS(player, NPC_TRIGGER_DE, NPC_TRIGGER_EN)) then
    thisNPC.talk(Character.say, getNLS(player, NPC_REPLY_DE, NPC_REPLY_EN))
    questsystem.base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

local function getNLS(player, textDe, textEn)
  if player:getPlayerLanguage() == Player.german then
    return textDe
  else
    return textEn
  end
end
