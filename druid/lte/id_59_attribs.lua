-- LTE für das Druidensystem
-- by Falk
require("base.common")

module("druid.lte.id_59_attribs", package.seeall)

-- INSERT INTO longtimeeffects VALUES (59, 'druids_attribs', 'druid.lte.id_59_attribs');

attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
bottomBorder = 1;

function addEffect(Effect, User)               -- Nur beim ersten Aufruf
 
end

function callEffect(Effect,User)               -- Effekt wird ausgeführt
    
	findCounter,counterBlack = Effect:findValue("counterRed")
    if findCounter then 
	   if counterRed >= 1 then
	        
			counterRed = counterRed - 1; -- reduce of the effect counter
		    Effect:addValue("counterRed",counterRed)
	        
           	if counterRed == 0 then	--
			    -- the effect counter is down to zero; remove effect
			    for i=1,8 do
				    find_i,attrib_i = Effect:findValue(""..attribList[i])
				    if find_i then
					    attribValue = attrib_i - 5 
	                    User:increaseAttrib(attrib,-attribValue);
	                end
	            end
				
				base.common.InformNLS( User, "Du fühlst, dass der Trank seine Wirkung verliert.", "You feel that the potion looses its effect.");
	        end
	    else
		   findCooldown,cooldownRed = Effect:findValue("cooldownRed")
		   if findCooldown then
				if cooldownRed <= 0 then
				   return false
			   else 
				   cooldownRed = cooldownRed - 1;
				   Effect:addValue("cooldownBlack",cooldownRed)
				end
		    end
		end
    end
   Effect.nextCalled = 50
   return true

end

function removeEffect(Effect,Character)

end

function loadEffect(Effect,Character)
    findCounter,counterRed = Effect:findValue("counterRed")	
	if findCounter then	
	   if counterRed > 0 then -- check if the actual effect is still active
	
	        for i=1,8 do
			    find_i,attrib_i = Effect:findValue(""..attribList[i])
				if find_i then
					User:increaseAttrib(attribList[i],attrib_i - 5)
				end	
	            
	        end
	    end
	end
	
	find, cntEffects = Effect:findValue("effects");
    if not find or cntEffects == 0 then
        return false;
    end
end
