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
-- PiratesAttack, id 82
-- controll the pirates attack in .base.seafaring

local common = require("base.common")
local seafaring = require("base.seafaring")
module("lte.piratesattack", package.seeall)

function addEffect(Effect,User)               				

end

function callEffect(Effect,User)
	local theQuestStatus=User:getQuestProgress(662)
--User:inform("queststatus"..theQuestStatus,"queststatus"..theQuestStatus)
	if theQuestStatus == 6 then
		seafaring.piratesTimeWarning(User)
	end 

	if theQuestStatus >= 30 and User:getQuestProgress(663) == 1 then
		return false
	end

	if theQuestStatus < 31 and User:getQuestProgress(663) == 1 then
		if not seafaring.piratesPiratesAreThere(User) then
			seafaring.piratesPiratesKill(User,seafaring.previousselected,seafaring.travlerslist[User.name])
			return false
		else
			for d=1,2 do
				local checkDoor = world:getItemOnField(seafaring.pirateDoors[d])
				if checkDoor.id == 3318 then
					seafaring.piratesGeorgeBackstabRocks(User)
					return false
				end
			end
		end
	end

	if theQuestStatus < 31 and User:getQuestProgress(663) == 0 then
		seafaring.piratesFight(User)
		User:setQuestProgress(663,1)
	end

	if theQuestStatus > 0 then 
		User:setQuestProgress(662,theQuestStatus-1) --cooling!
	else
		if seafaring.piratesPiratesAreThere(User) then
			seafaring.piratesPiratesRule(User)
		end
		return false
	end

	Effect.nextCalled = 100 --Effect gets called each 10 seconds
	return true
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
