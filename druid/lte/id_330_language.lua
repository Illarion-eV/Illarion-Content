-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und temporï¿½res Sprachverstï¿½ndnis

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
--Effect wird ausgefï¿½hrt
--Character:inform("debug func callEffect")
--Erst einmal kommt der Rundenzï¿½hler  

  find,zaehler = Effect:findValue("zaehler")
  if find then
     zaehler = zaehler -1
     if zaehler <0 then zaehler=0 end     
     Effect:addValue("zaehler", zaehler)

     Effect.nextCalled = 10 
     --nï¿½chster Aufruf in 1 Sekunde 
     --Hier jetzt die Aktionen, die pro Runde passieren sollen

     getAction(Character,Effect,zaehler)
     -- Ende der Aktionen, es folgt noch etwas Verwaltung       
     if zaehler == 0 then
     -- das war die letzte Runde        
        return false
     else
        return true
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
	Character:increaseSkill(skillGroup,skillName,(-newSkill+oldSkill)) -- ergibt wahrscheinlich noch falsche Werte
     
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