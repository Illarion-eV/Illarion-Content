-- fireSpitting, id 60

require("base.common")
module("lte.fireSpitting", package.seeall)

function addEffect(Effect, User)               				

end

function callEffect(Effect, User) 
    
	local findSecondTime, sceondTime = Effect:findValue("secondTime")
    if not findSecondTime then
	    User:inform("Hitze erfüllt dein Inneres und in deinem Magen fängt es zu kochen an.",
		            "Your inner body is heating up and it seems to start boiling in your stomach.")
        User:talkLanguage(Character.say, Player.german, "#mes Gesicht färbt sich knallrot.")
		User:talkLanguage(Character.say, Player.english, "#me's face turns bright red.")
        Effect:addValue("secondTime",1)	
	    Effect.nextCalled = 50
		return true
	else
		User:inform("Heiß und kochend steigt es deine Kehle hinauf und plötzlich...",
		            "Hot and boiling it's coming up your throat and suddenly...")
        User:talkLanguage(Character.say, Player.german, "#me spuckt Feuer aus seinem Mund raus.")
		User:talkLanguage(Character.say, Player.english, "#me spits fire out of his mouth.")
        local findQuality, quality = Effect:findValue("quality")
		local spitFire = function(posi) 
		    if world:isCharacterOnField(posi) then
			    local char = world:getCharacterOnField(posi)
				char:inform("Du wirst von einer Flamme erwischt! Aua!","You are hit by fire! Ouch!",Character.highPriority)
			    local damage = 100*quality
				Stiffness = base.common.GetStiffness( char )
				damage = damage - Stiffness
				damage = damage - (char:increaseAttrib("constitution",0)*2)
				base.common.Limit(damage, 100, 900)
				char:increaseAttrib("hitpoints",-damage)
			end	
		    world:gfx(9,posi)
			world:gfx(36,posi)			
		end
		
		base.common.CreateLine(base.common.GetFrontPosition(User), base.common.GetFrontPosition(User, 3+quality), spitFire)
        return false
    end
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end