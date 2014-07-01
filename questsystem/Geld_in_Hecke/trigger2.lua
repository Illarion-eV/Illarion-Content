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
require("handler.sendmessagetoplayer")
require("handler.createplayeritem")
require("questsystem.base")
require("base.lookat")
require("base.common")
module("questsystem.Geld_in_Hecke.trigger2", package.seeall)

local QUEST_NUMBER = 700
local PRECONDITION_QUESTSTATE = 2
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(675, 329, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = ""
local LOOKAT_TEXT_EN = ""

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

    HANDLER(PLAYER)

    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  local lookAt = base.lookat.GenerateLookAt(player, item)
  lookAt.description = base.common.GetNLS(player, textDe, textEn)
  return lookAt
end


function HANDLER(PLAYER)
    handler.createplayeritem.createPlayerItem(PLAYER, 3077, 999, 25):execute()
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du findest an einem Zweig ein kleines Beutelchen das einige Silbermünzen enthält!", "Attached to a branch, you find a small bag containing some silvercoins."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end