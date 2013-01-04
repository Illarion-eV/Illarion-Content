-- fireSpitting, id 60

require("base.common")
module("lte.fireSpitting", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character) 
    
	local findSecondTime, sceondTime = Effect:findValue("secondTime")
    if not findSecondTime then
	    Character:inform("Hitze erfüllt dein Inneres und in deinem Magen fängt es zu kochen an.",
		            "Your inner body is heating up and it seems to start boiling in your stomach.")
        Character:talkLanguage(Character.say, Player.german, "#me's Gesicht färbt sich knallrot.")
		Character:talkLanguage(Character.say, Player.english, "#me's face turns bright red.")
        Effect:addValue("secondTime",1)	
	    Effect.nextCalled = 50
		return true
	else
		Character:inform("Heiß und kochend steigt es deine Kehle hinauf und plötzlich...",
		            "Hot and boiling it's coming up your throat and suddenly...")
        Character:talkLanguage(Character.say, Player.german, "#me spuckt Feuer aus seinem Mund raus.")
		Character:talkLanguage(Character.say, Player.english, "#me spits fire out of his mouth.")
        local findQuality, quality = Effect:findValue("quality")
		local spitFire = function(posi) 
		    if world:isCharacterOnField(posi) then
			    local char = world:getCharacterOnField(posi)
				char:inform("Du wirst von einer Flamme erwischt! Aua!","You are hit by fire! Ouch!",Character.highPriority)
			    char:increaseAttrib("hitpoints",-(200*quality))
			end	
		    world:gfx(10,posi)
			world:gfx(36,posi)			
		end
		base.common.CreateLine(base.common.GetFrontPosition(Character), base.common.GetFrontPosition(Character, 3+quality), spawnFire)
        return false
    end
end

function removeEffect(Effect,Character)

end

function loadEffect(Effect,Character)                  			

end