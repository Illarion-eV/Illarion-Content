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
-- fireSpitting, id 60

local common = require("base.common")
module("lte.fireSpitting", package.seeall)

function addEffect(Effect, User)               				

end

function callEffect(Effect, User) 
    
	local findSecondTime, sceondTime = Effect:findValue("secondTime")
    if not findSecondTime then
	    User:inform("Hitze erfüllt dein Inneres und in deinem Magen fängt es zu kochen an.",
		            "Your inner body is heating up and it seems to start boiling in your stomach.")
        User:talk(Character.say, "#mes Gesicht färbt sich knallrot.", "#me's face turns bright red.")
        Effect:addValue("secondTime",1)	
	    Effect.nextCalled = 50
		return true
	else
		User:inform("Heiß und kochend steigt es deine Kehle hinauf und plötzlich...",
		            "Hot and boiling it's coming up your throat and suddenly...")
        User:talk(Character.say, "#me spuckt Feuer aus seinem Mund raus.", "#me spits fire out of his mouth.")
        local findQuality, quality = Effect:findValue("quality")
		local spitFire = function(posi) 
		    if world:isCharacterOnField(posi) then
			    local char = world:getCharacterOnField(posi)
				char:inform("Du wirst von einer Flamme erwischt! Aua!","You are hit by fire! Ouch!",Character.highPriority)
			    local damage = 100*quality
				Stiffness = common.GetStiffness( char )
				damage = damage - Stiffness
				damage = damage - (char:increaseAttrib("constitution",0)*2)
				common.Limit(damage, 100, 900)
				char:increaseAttrib("hitpoints",-damage)
			end	
		    world:gfx(9,posi)
			world:gfx(36,posi)			
		end
		spitFire(common.GetFrontPosition(User))
		common.CreateLine(common.GetFrontPosition(User), common.GetFrontPosition(User, quality), spitFire)
        return false
    end
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
