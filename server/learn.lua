require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

function learn( user, skill, skillGroup, actionPoints, opponent, leadAttrib )

    scalingFactor=1200; --Here, you can mod the learning speed
    skillValue=user:getSkill(skill);
    minorSkill=user:getMinorSkill(skill); --made that one up, dunno how to access the minor skill from lua
    MCvalue=math.max(200000,user:getMentalCapacity()); --below 0.5% of time spent online, no additional bonus is granted

    if skillValue<opponent+20 then --you only learn when your skill is lower than the skill of the opponent +20

        chanceForSkillGain=(100-skillValue);

        if math.random(0,99)<chanceForSkillGain then --Success?

            MCfactor=2000000/(math.max(MCvalue,1)); --5% of time spent online is considered "normal" -> MCfactor is 1
            attributeFactor=0.5+0.5*(leadAttribute/10); --0.5 to 1.5, depending on attribute
            actionpointFactor=(actionPoints/50); --An action with 50AP is "normal"
            minorIncrease=math.max(10000,math.floor(scalingFactor*attributeFactor*actionpointFactor*MCfactor));

            if minorSkill+minorIncrease<10000 then
                user:increaseMinorSkill(group,skill,minorIncrease); --minimum of 8-9 actions of 50AP for a swirlie at 5% activity
            else
                user:increaseMinorSkill(skillGroup,skill,(minorIncrease-10000));
                user:increaseSkill(skillGroup,skill,1);
                world:gfx(13,user.pos); --swirly!
            end
        end
        user:increaseMentalCapacity(100*actionPoints);
    end
end


-- invoked every 10s on every user; to be used to reduce MC on a regular basis
-- user:idleTime() can be used to get the number of seconds a user has been idle to check for inactivity

function reduceMC( user )

    if user:idleTime() < 300 then --Has the user has done any action or spoken anything within the last five minutes?
     	user:increaseMentalCapacity(-1*math.floor(user:getMentalCapacity()*0.00025+0.5)); --reduce MC-points by 0.025%, rounded correctly.
	end
	
    user:inform("MC: "..user:getMentalCapacity().."!");

end
