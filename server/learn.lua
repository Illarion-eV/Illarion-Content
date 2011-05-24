require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

--[[
Aufruf: Character:learn(skill,skillGroup,movePoints,opponent,leadAttribute);

skill: Name des Skills als string, z.B. "mining"
skillGroup: Gruppe, in der der Skill sich befindet als Integer (z.B. 2 für crafting).  
movePoints: Die movePoints, die von der Handlung erfordert/abgezogen werden als Integer. NICHT 0 eintragen, denn jede skillrelevante Handlung MUSS einen Zeitbedarf haben.
opponent: Falls die Handlung einen Mindestskill aufweißt, diesen hier als Integer eintragen. Falls eine Handlung nur bis zu einem gewissen Skillwert einen Lernerfolg bringen soll, diesen Wert-20 hier eintragen. Ansonsten 100 eintragen.
leadAttribute: Den Wert des Leitattributes als Integer eintragen. Die Festlegung der Leitattribute ist hier zu finden: viewtopic.php?p=643700#p643700

Beispiel: Character:learn("mining",2,20,100,Character:increaseAttrib("constitution",0));
]]

function learn( user, skill, skillGroup, actionPoints, opponent, leadAttrib )

    --TEMPORARY SOLUTION TO CATCH NEW PLAYERS
	if user:getMentalCapacity() < 1999 then --Mental Capacity CANNOT drop below 1999 -> New player. However, new players should start with a higher value
	    user:increaseMentalCapacity(2000000); --Maybe reduce to 200000 for brand new players. This is for existing players.
		base.common.TempInformNLS(user,"[Skillsystem] Mental Capacity zwangsangepasst!","[Skill system] Adjustment of mental capacity enforced.");
	end
	--TEMPORARY SOLUTION END

    --Learning speed - Change here if you're unhappy with the learning speed. Skillgain scales in a linear way.
	scalingFactor=1000; --Here, you can mod the learning speed. Higher value=faster ;-)
	
	--Constants - Do not change unless you know exactly what you're doing!
	amplification=100; --An 'abritrary' value that governs the 'resolution' of the MC function.
	lowerBorder=0.5*amplification/0.00025; --below 0.5% of time spent online, no additional bonus is granted
	normalMC=10*lowerBorder; --A 'normal' player invests 10x the time (=5%) into skill related actions
	normalAP=50; --How many movepoints does a 'normal' action take? Default=50
	--Constants - end
	
    skillValue=user:getSkill(skill);
	minorSkill=user:getMinorSkill(skill); --made that one up, dunno how to access the minor skill from lua
	MCvalue=math.max(lowerBorder,user:getMentalCapacity()); --below 0.5% of time spent online, no additional bonus is granted

    if skillValue<opponent+20 then --you only learn when your skill is lower than the skill of the opponent +20

        chanceForSkillGain=(100-skillValue);
	
        if math.random(0,99)<chanceForSkillGain then --Success?

            MCfactor=normalMC/(math.max(MCvalue,1)); --5% of time spent online is considered "normal" -> MCfactor is 1
            attributeFactor=0.5+0.5*(leadAttrib/10); --0.5 to 1.5, depending on attribute
			actionpointFactor=(actionPoints/normalAP); --An action with 50AP is "normal"
			minorIncrease=math.min(10000,math.floor(scalingFactor*attributeFactor*actionpointFactor*MCfactor));
            user:inform("Success! minorIncrease="..minorIncrease..".");
			user:inform("scalingFactor: "..scalingFactor..", attributeFactor: "..attributeFactor..", actionpointFactor: "..actionpointFactor..", MCFactor: "..MCfactor.."!");

            if minorSkill+minorIncrease<10000 then
                user:increaseMinorSkill(skillGroup,skill,minorIncrease); --minimum of 10 actions of 50AP for a swirlie at 5% activity
            else
     			user:increaseMinorSkill(skillGroup,skill,minorIncrease);
				base.common.TempInformNLS(user,"[Levelaufstieg] Deine Fertigkeit steigt von "..skillValue.." auf "..(skillValue+1).."!","[Level up] Your skill '"..skill.."' advanced from "..skillValue.." to "..(skillValue+1).."!");
            end
        else
		    user:inform("No skill gained.");
		end
        user:increaseMentalCapacity(amplification*actionPoints);
    end
end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function reduceMC( user )

    if user:idleTime() < 300 then --Has the user done any action or spoken anything within the last five minutes?
     	user:increaseMentalCapacity(-1*math.floor(user:getMentalCapacity()*0.00025+0.5)); --reduce MC-points by 0.025%, rounded correctly.
	end
	
end
