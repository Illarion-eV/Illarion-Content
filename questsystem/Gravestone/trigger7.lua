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
module("questsystem.Gravestone.trigger7", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 27
local POSTCONDITION_QUESTSTATE = 9

local POSITION = position(605, 344, 0)
local RADIUS = 1

function UseItem(PLAYER, item, ltstate)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
    --informNLS(PLAYER, TEXT_DE, TEXT_EN)
    
    HANDLER(PLAYER)
    
    base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
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


function HANDLER(PLAYER)
    sendmessagetoplayer.sendMessageToPlayer(PLAYER, "Du wischt den Schmutz vom Grabstein und erblickst eine Inschrift.", "You clean off the dirt from the tombstone and an inscription appears."):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end