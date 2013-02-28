-- LTE für das Druidensystem
-- by Falk
-- complete new version by Merung

module("alchemy.lte.id_166_secattribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (166, 'alchemy_secattribs', 'alchemy.lte.id_166_secattribs');

function addEffect(Effect, User)               -- we start with adding the effect
	--User:inform("debug func addEffect")
end

function callEffect(Effect,User) 
    local findCounter,counterPink = Effect:findValue("counterPink")
    
	local findHitpointsIn,hitpointsIncrease = Effect:findValue("hitpointsIncrease")
    local findManaIn,manaIncrease = Effect:findValue("manaIncrease")
    local findFoodlevelIn,foodlevelIncrease = Effect:findValue("foodlevelIncrease")
    local findPoisonvalueIn,poisonvalueIncrease = Effect:findValue("poisonvalueIncrease")
	
	local findHitpointsDe,hitpointsDecrease = Effect:findValue("hitpointsDecrease")
    local findManaDe,manaDecrease = Effect:findValue("manaDecrease")
    local findFoodlevelDe,foodlevelDecrease = Effect:findValue("foodlevelDecrease")
    local findPoisonvalueDe,poisonvalueDecrease = Effect:findValue("poisonvalueDecrease")
    
	if findCounter then 
       if counterPink > 0 then
           if findHitpointsIn then
              User:increaseAttrib("hitpoints",hitpointsIncrease);
           end
           if findManaIn then   
              User:increaseAttrib("mana",manaIncrease);
           end
           if findFoodlevelIn then
              User:increase("foodlevel",foodlevelIncrease);
           end
           if findPoisonvalueIn then    
	          poisonvalueIncrease = base.common.Limit( (User:getPoisonValue() - poisonvalueIncrease) , 0, 10000 ); 
	          User:setPoisonValue( poisonvalueIncrease );
	       end
	      
		   if findHitpointsDe then
              User:increaseAttrib("hitpoints",-hitpointsDecrease);
           end
           if findManaDe then   
              User:increaseAttrib("mana",-manaDecrease);
           end
           if findFoodlevelDe then
              User:increase("foodlevel",-foodlevelDecrease);
           end
           if findPoisonvalueDe then    
	          poisonvalueDecrease = base.common.Limit( (User:getPoisonValue() + poisonvalueDecrease) , 0, 10000 ); 
	          User:setPoisonValue( poisonvalueDecrease );
	       end
		  
		   if findCounter then
		      counterPink = counterPink - 1;
	          Effect:addValue("counterPink",counterPink)
	       end
	       
		   if counterPink <= 0 then
		        world:gfx(45,User.pos)
				base.common.InformNLS(User,"Die Wirkungsphase des Heiltranks endet.","The effect phase of the healing potion ends.")
				return false
	       end
       end
   end
  Effect.nextCalled = 70
  return true
end

function loadEffect(Effect, User)
    
end	

function removeEffect(Effect,User)         

end