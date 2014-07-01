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
module("questsystem.Gravestone.trigger8", package.seeall)

local QUEST_NUMBER = 10000
local PRECONDITION_QUESTSTATE = 39
local POSTCONDITION_QUESTSTATE = 54
local ADDITIONAL_QUESTSTATE = 88

local POSITION = position(605, 344, 0)
local RADIUS = 1
local LOOKAT_TEXT_DE = "Die Inschrieft lautet. reiH thur yraM euS. In ewiger Liebe William Daloir."
local LOOKAT_TEXT_EN = "The inscription says. ereH stser yraM euS. In eternal love William Daloir."

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and PLAYER:getQuestProgress(QUEST_NUMBER) < ADDITIONAL_QUESTSTATE then

	base.lookat.SetSpecialDescription(item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)
	
    
    HANDLER(PLAYER)
    
    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return lookat.GenerateLookAt(PLAYER, item, base.lookat.NONE)
  end

  return false
end

function HANDLER(PLAYER)
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end