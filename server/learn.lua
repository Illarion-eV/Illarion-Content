require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

--[[
Call: Character:learn(skill,movePoints,opponent,leadAttrib);

skill: Name of the skill as skill key, e.g. Skill.mining
movePoints: The amount of movePoints or time (1/10s), required by the action, as integer. Do NOT fill in 0, every action relevant for skillgain HAS TO take some time.
opponent: In case the action requires a minimum skill, fill it in here as integer. If the action should only yield skillgain up to a certain level, fill in this level-20. Otherwise, fill in 100.
leadAttrib: The value of the lead attribute as integer. You find the mandatory(!) definition of lead attributes here: 

Example: Character:learn(Skill.mining,2,20,100,Character:increaseAttrib("constitution",0));
]]

function learn( user, skill, actionPoints, opponent, leadAttrib )

	if (leadAttrib == nil) then
		debug("Missing lead attribute. Applying default value.");
		leadAttrib = getLeadAttrib(user,skill);
	end;
	
	user:inform("learn called: skill: "..skill.." AP: "..actionPoints.." opponent: "..opponent);
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
                user:increaseMinorSkill(skill,minorIncrease); --minimum of 10 actions of 50AP for a swirlie at 5% activity
            else
     			user:increaseMinorSkill(skill,minorIncrease);
				base.common.InformNLS(user,"[Levelaufstieg] Deine Fertigkeit '"..skill.."' steigt von "..skillValue.." auf "..(skillValue+1).."!",
					"[Level up] Your skill '"..skill.."' advanced from "..skillValue.." to "..(skillValue+1).."!");
				world:gfx(13,user.pos); --swirly!           
		    end

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

function getLeadAttrib(Char, Skill)


    if iniLed==nil then
        leadAtt={};
        leadAtt[Skill.tailoring]="dexterity"
        leadAtt[Skill.alchemy]="perception"
        leadAtt[Skill.tactics]="perception"
        leadAtt[Skill.farming]="constitution"
        leadAtt[Skill.poisoning]="perception"
        leadAtt[Skill.harp]="dexterity"
        leadAtt[Skill.woodcutting]="constitution"
        leadAtt[Skill.smithing]="dexterity"
        leadAtt[Skill.punctureWeapons]="agility"
        leadAtt[Skill.horn]="dexterity"
        leadAtt[Skill.distanceWeapons]="perception"
        leadAtt[Skill.gemcutting]="dexterity"
        leadAtt[Skill.slashingWeapons]="strength"
        --leadAtt[Skill.magicResistance]="essence"
        leadAtt[Skill.carpentry]="dexterity"
        leadAtt[Skill.cooking]="dexterity"
        leadAtt[Skill.goldsmithing]="dexterity"
        leadAtt[Skill.concussionWeapons]="strength"
        leadAtt[Skill.flute]="dexterity"
        leadAtt[Skill.parry]="agility"
        leadAtt[Skill.lute]="dexterity"
        leadAtt[Skill.dodge]="agility"
        leadAtt[Skill.herblore]="constitution"
        leadAtt[Skill.mining]="constitution"
        leadAtt[Skill.smithing]="dexterity"
        leadAtt[Skill.glassBlowing]="dexterity"
        leadAtt[Skill.fishing]="constitution"
        leadAtt[Skill.wrestling]="strength"
        iniLed=1;
    end

    if lAttrib~=nil then
        return Char:increaseAttrib(lAttrib,0);
    end
    return 5;
end