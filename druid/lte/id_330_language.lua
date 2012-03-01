-- LTE für das Druidensystem
-- by Falk
-- reworked by Merung

require("base.common")

module("druid.lte.id_330_language", package.seeall)

-- INSERT INTO longtimeeffects VALUES (330, 'druids_language', 'druid.lte.id_330_language');

ListLanguages={"human language","dwarf language","elf language","lizard language","orc language","halfling language","fairy language","gnome language","goblin language","ancient language"}

function addEffect(Effect, User)               				
--Nur beim ersten Aufruf
--User:inform("debug func addEffect") 	
end

function callEffect(Effect,User)                  			
	findCounter,counterWhite = Effect:findValue("counterWhite")
    findCooldown,cooldownWhite = Effect:findValue("cooldownWhite")
	
	if findCounter then
	    if counterWhite >= 1 then
		
		   if findCounter then
		      counterWhite = counterWhite - 1;
	          Effect:addValue("counterWhite",counterWhite)
	          User:inform("counterWhite - 1 = "..counterWhite)
		   end
		
		   if counterWhite == 0 then
		        --SkillID laden 
				find,skillID = Effect:findValue("skillID")
				skillName = ListLanguages[skillID]
					   
				--Alten SkillWert laden           
				find,oldSkill = Effect:findValue( "oldSkill")          

				--Neuen Skillwert laden
				find,newSkill = Effect:findValue( "newSkill")
			  
				--SkillGroup laden
				find,skillGroup = Effect:findValue( "skillGroup")

				--Wiederherstellung des alten Zustand
				User:inform("skillGroup: "..skillGroup)
				User:inform("skillName: "..skillName)
				User:inform("newSkill: "..newSkill)
				User:inform("oldSkill: "..oldSkill)
				User:increaseSkill(skillGroup,skillName,(-(newSkill-oldSkill))) -- ergibt wahrscheinlich noch falsche Werte
     
	        end
	   else
		   if findCooldown then
                if cooldownWhite < 1 then
	               User:inform("return false")
				   return false
	           else 
                   cooldownWhite = cooldownWhite - 1;
                   User:inform("cooldown - 1 = "..cooldownWhite)
				   Effect:addValue("cooldownWhite",cooldownWhite)
			    end
		   end
       end
	end
    Effect.nextCalled = 50
	return true
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			
-- wenn der Character erneut einloggt
-- User:inform("debug func loadEffect") 
  find,zaehler = Effect:findValue("zaehler")
  if not find then 
    User:inform("LTE-Error 330.2: please call dev")
  else
		--SkillName laden 
  	find,skillID = Effect:findValue("skillID")
    if not find then 
    	User:inform("LTE-Error 330.3: please call dev")
  	else  
  	  skillName = ListLanguages[skillID]     
			--Aktuellen (neuen) SkillWert laden           
  		find,newSkill = Effect:findValue( "newSkill")          
  		if not find then 
    		User:inform("LTE-Error 330.4: please call dev")
  		else
				--SkillGroup laden
  			find,skillGroup = Effect:findValue( "skillGroup")
  			if not find then 
    			User:inform("LTE-Error 330.5: please call dev")
  			else    
					-- Wiederherstellung des alten Zustand
					skill = User:getSkill(skillName)
      		User:increaseSkill(skillGroup,skillName,-skill+newSkill)  -- !!! ergibt wahrscheinlich noch falsche Werte
        end
      end 
    end    
  end
end
