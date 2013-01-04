require("questsystem.base")
module("questsystem.hagar_coin.trigger1", package.seeall)

local QUEST_NUMBER = 999
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 3

local NPC_TRIGGER_DE = "quest"
local NPC_TRIGGER_EN = "quest"
local NPC_REPLY_DE = "Psst... Ich habe da etwas munkeln gehört von einer Botschaft, die in eine Kiefer eingeritzt wurde... etwas südöstlich vom Tor zu Galmair, in der Nähe des Wassers."
local NPC_REPLY_EN = "Psst... I heard rumors about something that was carved into a pine tree, in the southeast of the gate to Galmair, near the water."

--function receiveText(type, text, player)
function receiveText(thisNPC, texttype, text, player)
	debug("text: "..text)
	debug("player: "..player.name)
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
