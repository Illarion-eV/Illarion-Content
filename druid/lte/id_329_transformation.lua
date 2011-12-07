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
    User:inform("oneA")
	findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then
	  User:inform("one")
	   User:inform(""..counterBlack)
	   if counterBlack > 0 then
		  
		  counterBlack = counterBlack - 1; -- reduce of the effect counter
		  Effect:addValue("counterBlack",counterBlack)
		   User:inform("oneB")
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    findOnlyRace, OnlyRace = Effect:findValue("OnlyRace")
			    if findOnlyRace then
				    if OnlyRace == 0 then
					User:inform("oneBB")
					  findOld_sex, old_sex = Effect:findValue("old_sex")
					  if findOld_sex then
						 User:setAttrib("sex",old_sex)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end
					  User:inform("oneC")
					  findOld_hair, old_hair = Effect:findValue("old_hair")
					  if findOld_hair then
						 User:setHair(old_hair)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end
					  
					  findOld_beard, old_beard = Effect:findValue("old_beard")
					  if findOld_beard then
						 User:setBeard(old_beard)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end
					  
					  findOld_skincolor, old_skincolor = Effect:findValue("old_skincolor")
					  if findOld_skincolor then
						 User:setSkinColor(old_skincolor)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end
					  
					  findOld_haircolor, old_haircolor = Effect:findValue("old_haircolor")
					  if findOld_haircolor then
						 User:setHairColor(old_haircolor)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end    
				   end
			
			        findNew_race, new_race = Effect:findValue("new_race")	
		            if findNew_race then
			           User:setAttrib("racetyp",new_race)
		           else
			           User:inform("LTE-Error 1: please call dev") 
		           end
                   User:inform("two")
		           -- findNew_height, new_height = Effect:findValue("new_height")
		           --if findNew_race then
			          --User:setAttrib("body_height",new_height) 
		           --else
			          --User:inform("LTE-Error 1: please call dev") 
		           --end
			   else
			     User:inform("LTE-Error 1: please call dev") 
			   end
			end
	        
	   else
		   
		   findCooldown,cooldownBlack = Effect:findValue("cooldownBlack")
		   if findCooldown then
				if cooldownBlack <= 0 then
				   User:inform("return false")
				   return false
			   else 
				   cooldownBlack = cooldownBlack - 1;
				   User:inform("cooldown - 1 = "..cooldownBlack)
				   Effect:addValue("cooldownBlack",cooldownBlack)
				end
		   else
		      User:inform("LTE-Error 1: please call dev") 
		   end
	   end   
   else
     User:inform("LTE-Error 1: please call dev") 
   end

   Effect.nextCalled = 50
   User:inform("return true")
   return true
end

function removeEffect(Effect,USer)         
	
end

function loadEffect(Effect,User)
    findCounter,counterBlack = Effect:findValue("counterBlack")	
	if findCounter then	
	   if counterBlack > 0 then -- check if the actual effect is still active
		
			findOnlyRace, OnlyRace = Effect:findValue("OnlyRace")
			if findOnlyRace then
			   if OnlyRace == 0 then
				  
				  findNew_sex, new_sex = Effect:findValue("new_sex")
				  if findNew_sex then
					 User:setAttrib("sex",new_sex)
				  else
					 User:inform("LTE-Error 1: please call dev") 
				  end
				  
				  findNew_hair, new_hair = Effect:findValue("new_hair")
				  if findNew_hair then
					 User:setHair(new_hair)
				  else
					 User:inform("LTE-Error 1: please call dev") 
				  end
				  
				  findNew_beard, new_beard = Effect:findValue("new_beard")
				  if findNew_beard then
					 User:setBeard(new_beard)
				  else
					 User:inform("LTE-Error 1: please call dev") 
				  end
				  
				  findNew_skincolor, new_skincolor = Effect:findValue("new_skincolor")
				  if findNew_skincolor then
					 User:setSkinColor(new_skincolor)
				  else
					 User:inform("LTE-Error 1: please call dev") 
				  end
				  
				  findNew_haircolor, new_haircolor = Effect:findValue("new_haircolor")
				  if findNew_haircolor then
					 User:setHairColor(new_haircolor)
				  else
					 User:inform("LTE-Error 1: please call dev") 
				  end
			   end  
		   else
			  User:inform("LTE-Error 1: please call dev")       
		   end      
			
		   findNew_race, new_race = Effect:findValue("new_race")	
		   if findNew_race then
			  User:setAttrib("racetyp",new_race)
		   else
			  User:inform("LTE-Error 1: please call dev") 
		   end

		   -- findNew_height, new_height = Effect:findValue("new_height")
		   --if findNew_race then
			  --User:setAttrib("body_height",new_height) 
		   --else
			  --User:inform("LTE-Error 1: please call dev") 
		   --end
       end
   else	   
     User:inform("LTE-Error 1: please call dev")    
   end
end