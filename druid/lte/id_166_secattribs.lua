-- LTE für das Druidensystem
-- by Falk
-- complete new version by Merung

module("druid.lte.id_166_secattribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (166, 'druids_secattribs', 'druid.lte.id_166_secattribs');

function addEffect(Effect, User)               -- we start with adding the effect
	--User:inform("debug func addEffect")
end

function callEffect(Effect,User) 

    findCounter,counterPink = Effect:findValue("counterpink")
    findHitpoints,hitpointsIncrease = Effect:findValue("hitpointsIncrease")
    findMana,manaIncrease = Effect:findValue("manaIncrease")
    findFoodlevel,foodlevelIncrease = Effect:findValue("foodlevelIncrease")
    findPoisonvalue,poisonvalueIncrease = Effect:findValue("poisonvalueIncrease")
    
	if findCounter then 
       counterPink = counterPink - 1;
       if counterPink <0 then 
	      counterPink=0; 
    
	   end
       
	   Effect:addValue("counterPink",counterPink)
   
       if findHitpoints then
          User:increaseAttrib("hitpoints",hitpointsIncrease);
       end
       if findMana then   
          User:increaseAttrib("mana",manaIncrease);
       end
       if findFoodlevel then
          User:increaseAttrib("foodlevel",foodlevelIncrease);
       end
       if findPoisonvalue then    
	      poisonvalueIncrease = base.common.Limit( (User:getPoisonValue() + poisonvalueIncrease) , 0, 10000 ); 
	      User:setPoisonValue( poisonvalueIncrease );
	   end
	
	   Effect.nextCalled = 50
	
	   if counterPink == 0 then
	      return false
	   else 
         return true
	   end
   end
end

function loadEffect(Effect, User)

end

function removeEffect(Effect,User)         
User:inform("effekt entfernen");
end