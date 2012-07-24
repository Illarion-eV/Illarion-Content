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

function callEffect(Effect,User)   
--User:inform("debug func callEffect")
    
	findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then 
	  
	   if counterBlack >= 1 then 
		  
		  -- info that the effect will be removed soon
		   if counterBlack == 2 then 
		        base.common.InformNLS( User,
                "Du spührst, wie ein Schauer über deinen Körper streicht. Deine Verwandlung wird nicht mehr lange andauern.",
                "Shortly, you feel a chill on your skin. Your transformation won't last a long time anymore."
                       );
		   end
		  
		  counterBlack = counterBlack - 1; -- reduce of the effect counter
		  Effect:addValue("counterBlack",counterBlack)
		  
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    findOnlyRace, OnlyRace = Effect:findValue("OnlyRace")
			    if findOnlyRace then
				    if OnlyRace == 0 then
					
					  findOld_sex, old_sex = Effect:findValue("old_sex")
					  if findOld_sex then
						 User:setAttrib("sex",old_sex)
					  else
						 User:inform("LTE-Error 1: please call dev") 
					  end
					  
					  findOld_hair, old_hair = Effect:findValue("old_hair")
					  if findOld_hair then
						 User:setHair(old_hair)
					  else
						 User:inform("LTE-Error 2: please call dev") 
					  end
					  
					  findOld_beard, old_beard = Effect:findValue("old_beard")
					  if findOld_beard then
						 User:setBeard(old_beard)
					  else
						 User:inform("LTE-Error 3: please call dev") 
					  end
					  
					  findOld_skincolor1, old_skincolor1 = Effect:findValue("old_skincolor1")
					  findOld_skincolor2, old_skincolor2 = Effect:findValue("old_skincolor2")
					  findOld_skincolor3, old_skincolor3 = Effect:findValue("old_skincolor3")
					  if findOld_skincolor1 then
							if findOld_skincolor2 then
								if findOld_skincolor3 then
								   User:setSkinColor(old_skincolor1,old_skincolor2,old_skincolor3)
							   else
								  User:inform("LTE-Error 4: please call dev")
							   end
						   else
							  User:inform("LTE-Error 5: please call dev")
						   end
					   else
						  User:inform("LTE-Error 6: please call dev")
					   end 
						 
					  findOld_haircolor1, old_haircolor1 = Effect:findValue("old_haircolor1")
					  findOld_haircolor2, old_haircolor2 = Effect:findValue("old_haircolor2")
					  findOld_haircolor3, old_haircolor3 = Effect:findValue("old_haircolor3")
					  if findOld_haircolor1 then
							if findOld_haircolor2 then
								if findOld_haircolor3 then
								   User:setHairColor(old_haircolor1,old_haircolor2,old_haircolor3)
							   else
								  User:inform("LTE-Error 7: please call dev")
							   end
						   else
							  User:inform("LTE-Error 8: please call dev")
						   end
					   else
						  User:inform("LTE-Error 9: please call dev")
					   end     
				      
			
						findOld_race, old_race = Effect:findValue("old_race")	
						if findOld_race then
						   User:setAttrib("racetyp",old_race)
					   else
						   User:inform("LTE-Error 10: please call dev") 
					   end
					   
					   findOld_height, old_height = Effect:findValue("old_height")
					   if findOld_race then
						  User:setAttrib("body_height",old_height) 
					   else
						  User:inform("LTE-Error 11: please call dev") 
					   end
			       end
			   else
			     User:inform("LTE-Error 12: please call dev") 
			   end
			end
	   else
		   
		   findCooldown,cooldownBlack = Effect:findValue("cooldownBlack")
		   if findCooldown then
				if cooldownBlack <= 0 then
				   return false
			   else 
				   cooldownBlack = cooldownBlack - 1;
				   Effect:addValue("cooldownBlack",cooldownBlack)
				end
		   else
		      User:inform("LTE-Error 13: please call dev") 
		   end
	   end   
   else
     User:inform("LTE-Error 14: please call dev") 
   end

   Effect.nextCalled = 50
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
					 User:inform("LTE-Error 15: please call dev") 
				  end
				  
				  findNew_hair, new_hair = Effect:findValue("new_hair")
				  if findNew_hair then
					 User:setHair(new_hair)
				  else
					 User:inform("LTE-Error 16: please call dev") 
				  end
				  
				  findNew_beard, new_beard = Effect:findValue("new_beard")
				  if findNew_beard then
					 User:setBeard(new_beard)
				  else
					 User:inform("LTE-Error 17: please call dev") 
				  end
				  
				  findNew_skincolor1, new_skincolor1 = Effect:findValue("new_skincolor1")
				  findNew_skincolor2, new_skincolor2 = Effect:findValue("new_skincolor2")
				  findNew_skincolor3, new_skincolor3 = Effect:findValue("new_skincolor3")
				  if findNew_skincolor1 then
					    if findNew_skincolor2 then
						    if findNew_skincolor3 then
							   User:setSkinColor(new_skincolor1,new_skincolor2,new_skincolor3)
					       else
					          User:inform("LTE-Error 18: please call dev")
					       end
					   else
					      User:inform("LTE-Error 19: please call dev")
					   end
				   else
					  User:inform("LTE-Error 20: please call dev")
				   end 
					 
				  findNew_haircolor1, new_haircolor1 = Effect:findValue("new_haircolor1")
				  findNew_haircolor2, new_haircolor2 = Effect:findValue("new_haircolor2")
				  findNew_haircolor3, new_haircolor3 = Effect:findValue("new_haircolor3")
				  if findNew_haircolor1 then
					    if findNew_haircolor2 then
						    if findNew_haircolor3 then
							   User:setSkinColor(new_haircolor1,new_haircolor2,new_haircolor3)
					       else
					          User:inform("LTE-Error 21: please call dev")
					       end
					   else
					      User:inform("LTE-Error 22: please call dev")
					   end
				   else
					  User:inform("LTE-Error 23: please call dev")
				   end 
			   
			   end  
		   else
			  User:inform("LTE-Error 24: please call dev")       
		   end      
			
		   findNew_race, new_race = Effect:findValue("new_race")	
		   if findNew_race then
			  User:setAttrib("racetyp",new_race)
		   else
			  User:inform("LTE-Error 25: please call dev") 
		   end

		   findNew_height, new_height = Effect:findValue("new_height")
		   if findNew_race then
			  User:setAttrib("body_height",new_height) 
		   else
			  User:inform("LTE-Error 26: please call dev") 
		   end
       end 
   else	   
     User:inform("LTE-Error 27: please call dev")    
   end 
end  