-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und temporäres Sprachverständnis

require("base.common")

module("druid.lte.id_330_language", package.seeall)

-- INSERT INTO longtimeeffects VALUES (330, 'druids_language', 'druid.lte.id_330_language');

ListLanguages={"human language","dwarf language","elf language","lizard language","orc language","halfling language","fairy language","gnome language","goblin language","ancient language"}

function getAction(Character,Effect,Runde)
--Hier die eigentlichen Aktionen eintragen  
--Beim temp. Sprachskill besteht der Effekt im Verlauf der Zeit
end

function addEffect(Effect, Character)               				
--Nur beim ersten Aufruf
--Character:inform("debug func addEffect") 	
end

function callEffect(Effect,Character)                  			
	findCounter,counterWhite = Effect:findValue("counterWhite")
    findCooldown,cooldownWhite = Effect:findValue("cooldownWhite")
	
	if findCooldown then
	    if counterWhite > 0 then
		
		   if findCounter then
		      counterWhite = counterWhite - 1;
	          Effect:addValue("counterWhite",counterWhite)
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
				Character:increaseSkill(skillGroup,skillName,(-(newSkill-oldSkill))) -- ergibt wahrscheinlich noch falsche Werte
     
	            world:gfx(45,Character.pos) 
		    end
	   end
		   if findCooldown then
                if cooldownWhite < 1 then
	               User:inform("return false")
				   return false
	           else 
                   cooldownWhite = cooldownWhite - 1;
                   User:inform("cooldown - 1 = "..cooldownWhite)
				   Effect:addValue("cooldownBlack",cooldownWhite)
			       Effect.nextCalled = 50
			       User:inform("return true")
				   return true
	           end
		   end
       
	end
end

function removeEffect(Effect,Character)
	--Character:inform("debug func removeEffect")

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
	Character:increaseSkill(skillGroup,skillName,(-(newSkill-oldSkill))) -- ergibt wahrscheinlich noch falsche Werte
     
	world:gfx(45,Character.pos)
  
end

function loadEffect(Effect,Character)                  			
-- wenn der Character erneut einloggt
-- Character:inform("debug func loadEffect") 
  find,zaehler = Effect:findValue("zaehler")
  if not find then 
    Character:inform("LTE-Error 330.2: please call dev")
  else
		--SkillName laden 
  	find,skillID = Effect:findValue("skillID")
    if not find then 
    	Character:inform("LTE-Error 330.3: please call dev")
  	else  
  	  skillName = ListLanguages[skillID]     
			--Aktuellen (neuen) SkillWert laden           
  		find,newSkill = Effect:findValue( "newSkill")          
  		if not find then 
    		Character:inform("LTE-Error 330.4: please call dev")
  		else
				--SkillGroup laden
  			find,skillGroup = Effect:findValue( "skillGroup")
  			if not find then 
    			Character:inform("LTE-Error 330.5: please call dev")
  			else    
					-- Wiederherstellung des alten Zustand
					skill = Character:getSkill(skillName)
      		Character:increaseSkill(skillGroup,skillName,-skill+newSkill)  -- !!! ergibt wahrscheinlich noch falsche Werte
        end
      end 
    end    
  end
end
