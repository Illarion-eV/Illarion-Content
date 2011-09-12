-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und Rückwandlung bei Verwandlungen
require("base.common")

module("druid.lte.id_329_transformation", package.seeall)

-- INSERT INTO longtimeeffects VALUES (329, 'druids_transformation', 'druid.lte.id_329_transformation');

function getAction(User,Effect,Runde)
	--Hier die eigentlichen Aktionen eintragen  
end
  
function addEffect(Effect, User)               -- Nur beim ersten Aufruf
	--User:inform("debug func addEffect")
end

function callEffect(Effect,User)                  -- Effect wird ausgeführt
--User:inform("debug func callEffect")
--Erst einmal kommt der Rundenzähler  
	findCounter,counterPink = Effect:findValue("counterPink")
    findCooldown,cooldownPink = Effect:findValue("cooldownPink")
	
	if findCounter then
	    if counterBlack > 0 then
		
		   if findCounter then
		      counterBlack = counterBlack - 1;
	          Effect:addValue("counterBlack",counterBlack)
	       end
		
		   if counterBlack == 0 then
		        find,old_race = Effect:findValue("old_race")
	            if find then
		         -- transformation back into the old race
		          User:setAttrib("racetyp",old_race)      
	            else
		          User:inform("LTE-Error 1: please call dev")     
	            end
	            world:gfx(45,User.pos)  
		    end
		
		   if findCooldown then
                if cooldownBlack < 1 then
	               return false
	           else 
                   cooldownBlack = cooldownBlack - 1;
                   Effect:addValue("cooldownBlack",cooldownBlack)
			       Effect.nextCalled = 50
			       return true
	           end
		   end
       end
	end
end

function removeEffect(Effect,USer)         
	
end

function loadEffect(Effect,User) -- wenn der Charakter erneut einloggt
	found, new_race = Effect:findValue("new_race")
	if found then
		User:setAttrib("racetyp",new_race) 
	else
	User:inform("LTE-Error 21: please call dev")
	end 
end    
