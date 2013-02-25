require("base.common")

module("server.learn", package.seeall)

-- called by the server when user:learn(...) is issued by a script

--[[
Call: Character:learn(skill, movePoints, learnLimit);

skill: Name of the skill as skill key, e.g. Character.mining
movePoints: The amount of movePoints or time (1/10s), required by the action, as integer. Do NOT fill in 0, every action relevant for skillgain HAS TO take some time.
learnLimit: Maximum skill level the user can reach with the triggering action.

]]

function learn(user, skill, actionPoints, learnLimit)
	
	leadAttrib = getLeadAttrib(user,skill); --reading the lead attribute
	local skillName = user:getSkillName(skill) --reading the skill
	
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

    if skillValue<learnLimit and skillValue<100 then --you only learn when your skill is lower than the skill of the learnLimit and your skill is <100

        chanceForSkillGain=(100-skillValue);
	
        if math.random(0,99)<chanceForSkillGain then --Success?

            MCfactor=normalMC/(math.max(MCvalue,1)); --5% of time spent online is considered "normal" -> MCfactor is 1
            attributeFactor=math.min(1.5,(0.5+0.5*(leadAttrib/10))); --0.5 to 1.5, depending on attribute, limited to 1.5 (no bonus for insane attributes, balancing!)
			actionpointFactor=(actionPoints/normalAP); --An action with 50AP is "normal"
			minorIncrease=math.floor(scalingFactor*attributeFactor*actionpointFactor*MCfactor);
            
			--[[
			--If you want to debug... But there is no bug here!
			
			if isTestserver() then
			    user:inform("actionPoints="..actionPoints..", MCfactor="..MCfactor..", attributeFactor="..attributeFactor..", actionpointFactor="..actionpointFactor..", minorIncrease="..minorIncrease.."!");
			end]]
			
			while minorIncrease>0 do --for the rare case that an action results in two swirlies, we have this loop
			
                realIncrease=math.min(minorIncrease,10000) -- to prevent overflow, we cannot gain more than one level per action anyway
				
                if minorSkill+realIncrease<10000 then
                    user:increaseMinorSkill(skill,realIncrease); --minimum of 10 actions of 50AP for a swirlie at 5% activity
					
                else
				    skillValue=user:getSkill(skill); --reading the skill points
     			    user:increaseMinorSkill(skill,realIncrease); --this is why we do all this grinding!
										
					if user:getType() == 0 then --Only players get informs and swirlies! Strangely, monsters also learn, but meh.
					-- Looks like the client handles such stuff now...
                    end						
		        end
			
			minorIncrease=minorIncrease-10000;
			
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
  local leadAttribName = base.common.GetLeadAttributeName(Skill);
  if leadAttribName~=nil then
    return Char:increaseAttrib(leadAttribName,0);
  end
  return 10; --No way, 10 should be default. Why did you return 5? ~Estralis
end
