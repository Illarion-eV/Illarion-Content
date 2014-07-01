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
require("questsystem.base")
module("questsystem.hagar_coin.trigger2", package.seeall)

local QUEST_NUMBER = 10001
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 5

local POSITION = position(439, 284, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "Du liest: Such etwa 20 Schritt weiter östlich die Tanne beim Wasser."
local LOOKAT_TEXT_EN = "You read: Search for the fir tree about 20 steps in the east that stands at the water."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then
	
	base.lookat.SetSpecialDescription(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	
	questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return base.lookat.GenerateLookAt(PLAYER, item, base.lookat.NONE)
  end

  return false
end

