--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local base = require("questsystem.base")
module("questsystem.hagar_coin.trigger1", package.seeall)

local QUEST_NUMBER = 10001
local PRECONDITION_QUESTSTATE = 0
local POSTCONDITION_QUESTSTATE = 3

local NPC_TRIGGER_DE = "quest"
local NPC_TRIGGER_EN = "quest"
local NPC_REPLY_DE = "Psst... Ich habe da etwas munkeln gehört von einer Botschaft, die in eine Kiefer eingeritzt wurde... etwas südöstlich vom Tor zu Galmair, in der Nähe des Wassers."
local NPC_REPLY_EN = "Psst... I heard rumors about something that was carved into a pine tree, in the southeast of the gate to Galmair, near the water."

function receiveText(thisNPC, texttype, text, player)
  if base.fulfilsPrecondition(player, QUEST_NUMBER, PRECONDITION_QUESTSTATE)
      and player:getType() == Character.player
      and string.find(text, getNLS(player, NPC_TRIGGER_DE, NPC_TRIGGER_EN)) then
	thisNPC:talk(Character.say, getNLS(player, NPC_REPLY_DE, NPC_REPLY_EN))
    
    
    base.setPostcondition(player, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)

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
