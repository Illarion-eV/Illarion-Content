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
local sendmessagetoplayer = require("handler.sendmessagetoplayer")
local base = require("questsystem.base")
local lookat = require("base.lookat")
local common = require("base.common")
module("questsystem.Geld_in_Hecke.trigger5", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 2
local POSTCONDITION_QUESTSTATE = 2

local POSITION = position(685, 316, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Ganz unten auf dem Boden des Fasses siehst du eine Notiz, die folgendes besagt: \"Das Geld liegt wie immer in der Hecke.\""
local LOOKAT_TEXT_EN = "On the very bottom of the barrel is a hidden note. You can read the following: \"The money is as always in the hedge!\""

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

   

    HANDLER(PLAYER)

    base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  local lookAt = lookat.GenerateLookAt(player, item)
  lookAt.description = common.GetNLS(player, textDe, textEn)
  return lookAt
end


function HANDLER(PLAYER)
    sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Geh und suche in der Hecke beim Cadomyr Wegschild nicht weit von hier.", "Go and seach in the hedge at the Cadomyr signpost not far from here."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end