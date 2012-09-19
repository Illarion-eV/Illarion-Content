require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

--[[
Call: Character:learn(skill,skillGroup,movePoints,opponent,leadAttribute);

skill: Name of the skill as string, e.g. "mining"
skillGroup: Group of the skill as integer (e.g. 2 for crafting).  
movePoints: The amount of movePoints or time (1/10s), required by the action, as integer. Do NOT fill in 0, every action relevant for skillgain HAS TO take some time.
opponent: In case the action requires a minimum skill, fill it in here as integer. If the action should only yield skillgain up to a certain level, fill in this level-20. Otherwise, fill in 100.
leadAttribute: The value of the lead attribute as integer. You find the mandatory(!) definition of lead attributes here: http://illarion.org/community/forums/viewtopic.php?p=643700#p643700

Example: Character:learn("mining",2,20,100,Character:increaseAttrib("constitution",0));
]]

function learn( user, skill, skillGroup, actionPoints, opponent, leadAttrib )

    --Learning speed - Change here if you're unhappy with the learning speed. Skillgain scales in a linear way.
	scalingFactor=1000; --Here, you can mod the learning speed. Higher value=faster ;-)
	
	--Constants - Do not change unless you know exactly what you're doing!
	amplification=100; --An 'abritrary' value that governs the 'resolution' of the MC function.
	lowerBorder=0.5*amplification/0.00025; --below 0.5% of time spent online, no additional bonus is granted
	normalMC=10*lowerBorder; --A 'normal' player invests 10x the time (=5%) into skill related actions
	normalAP=50; --How many movepoints does a 'normal' action take? Default=50
	--Constants - end
	
    skillValue=user:getSkill(skill); --reading the skill points
	minorSkill=user:getMinorSkill(skill); --reading the minor skill points; 10000=1 skill point
	MCvalue=math.max(lowerBorder,user:getMentalCapacity()); --below 0.5% of time spent online, no additional bonus is granted

    if skillValue<opponent+20 and skillValue<100 then --you only learn when your skill is lower than the skill of the opponent +20 and your skill is <100

        chanceForSkillGain=(100-skillValue);
	
        if math.random(0,99)<chanceForSkillGain then --Success?

            MCfactor=normalMC/(math.max(MCvalue,1)); --5% of time spent online is considered "normal" -> MCfactor is 1
            attributeFactor=0.5+0.5*(leadAttrib/10); --0.5 to 1.5, depending on attribute
			actionpointFactor=(actionPoints/normalAP); --An action with 50AP is "normal"
			minorIncrease=math.floor(scalingFactor*attributeFactor*actionpointFactor*MCfactor);

            if minorSkill+minorIncrease<10000 then
                user:increaseMinorSkill(skillGroup,skill,minorIncrease); --minimum of 10 actions of 50AP for a swirlie at 5% activity
            else
     			user:increaseMinorSkill(skillGroup,skill,minorIncrease);
				base.common.InformNLS(user,"[Levelaufstieg] Deine Fertigkeit steigt von "..skillValue.." auf "..(user:getSkill(skill)).."!","[Level up] Your skill '"..skill.."' advanced from "..skillValue.." to "..(skillValue+1).."!");
				world:gfx(13,user.pos); --swirly!           
		    end

		end
        user:increaseMentalCapacity(amplification*actionPoints);
    end
end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function reduceMC( user )

    if user:idleTime() < 180 then --Has the user done any action or spoken anything within the last three minutes?
     	user:increaseMentalCapacity(-1*math.floor(user:getMentalCapacity()*0.00025+0.5)); --reduce MC-points by 0.025%, rounded correctly.
	end
	
end
