-- LTE für das Druidensystem
-- by Falk
-- complete new version by Merung

module("druid.lte.id_166_secattribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (166, 'druids_secattribs', 'druid.lte.id_166_secattribs');

function addEffect(Effect, User)               -- we start with adding the effect
	--User:inform("debug func addEffect")
end

function callEffect(Effect,User) 

    findCounter,counterPink = Effect:findValue("counterPink")
    findCooldown,cooldownPink = Effect:findValue("cooldownPink")
	
	findHitpoints,hitpointsIncrease = Effect:findValue("hitpointsIncrease")
    findMana,manaIncrease = Effect:findValue("manaIncrease")
    findFoodlevel,foodlevelIncrease = Effect:findValue("foodlevelIncrease")
    findPoisonvalue,poisonvalueIncrease = Effect:findValue("poisonvalueIncrease")
    
	if findCounter then 
       if counterPink > 0 then
       
	       if findHitpoints then
              User:increaseAttrib("hitpoints",hitpointsIncrease);
           end
           if findMana then   
              User:increaseAttrib("mana",manaIncrease);
           end
           if findFoodlevel then
              foodlevelIncrease = base.common.Limit( (User:increaseAttrib("foodlevel",0) + foodlevelIncrease) , 0 , 60000 );
			  User:setAttrib("foodlevel",foodlevelIncrease);
           end
           if findPoisonvalue then    
	          poisonvalueIncrease = base.common.Limit( (User:getPoisonValue() + poisonvalueIncrease) , 0, 10000 ); 
	          User:setPoisonValue( poisonvalueIncrease );
	       end
	      
	       if findCounter then
		      counterPink = counterPink - 1;
	          Effect:addValue("counterPink",counterPink)
	       end
	       
	   elseif findCooldown then
          if cooldownPink < 1 then
	         return false
	      else 
             cooldownPink = cooldownPink - 1;
             Effect:addValue("cooldownPink",cooldownPink)
			end
       end
   end
  Effect.nextCalled = 50
  return true
end

function loadEffect(Effect, User)
    
end	

function removeEffect(Effect,User)         

end