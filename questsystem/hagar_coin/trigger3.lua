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
local createplayeritem = require("handler.createplayeritem")
local base = require("questsystem.base")
module("questsystem.hagar_coin.trigger3", package.seeall)

local QUEST_NUMBER = 10001
local PRECONDITION_QUESTSTATE = 5
local POSTCONDITION_QUESTSTATE = 8

local POSITION = position(462, 285, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "In einem kleinen Astloch findest du eine Münze..."
local LOOKAT_TEXT_EN = "In a small hole, you find a coin..."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
	base.lookat.SetSpecialDescription(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	
    
createplayeritem.createPlayerItem(PLAYER, 3077, 999, 10):execute()
    
    base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return base.lookat.GenerateLookAt(PLAYER, item, base.lookat.NONE)
  end

  return false
end

