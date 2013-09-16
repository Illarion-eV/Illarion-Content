-- PiratesAttack, id 82
-- controll the pirates attack in .base.seafaring

require("base.common")
require("base.seafaring")
module("lte.piratesattack", package.seeall)

function addEffect(Effect,User)               				

end

function callEffect(Effect,User)
	local theQuestStatus=User:getQuestProgress(662)
--User:inform("queststatus"..theQuestStatus,"queststatus"..theQuestStatus)
	if theQuestStatus == 6 then
		base.seafaring.piratesTimeWarning(User)
	end 

	if theQuestStatus >= 30 and User:getQuestProgress(663) == 1 then
		return false
	end

	if theQuestStatus < 31 and User:getQuestProgress(663) == 1 then
		if not base.seafaring.piratesPiratesAreThere(User) then
			base.seafaring.piratesPiratesKill(User,base.seafaring.previousselected,base.seafaring.travlerslist[User.name])
			return false
		else
			for d=1,2 do
				local checkDoor = world:getItemOnField(base.seafaring.pirateDoors[d])
				if checkDoor.id == 3318 then
					base.seafaring.piratesGeorgeBackstabRocks(User)
					return false
				end
			end
		end
	end

	if theQuestStatus < 31 and User:getQuestProgress(663) == 0 then
		base.seafaring.piratesFight(User)
		User:setQuestProgress(663,1)
	end

	if theQuestStatus > 0 then 
		User:setQuestProgress(662,theQuestStatus-1) --cooling!
	else
		if base.seafaring.piratesPiratesAreThere(User) then
			base.seafaring.piratesPiratesRule(User)
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
