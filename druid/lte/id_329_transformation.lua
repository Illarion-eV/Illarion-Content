-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und Rückwandlung bei Verwandlungen
require("base.common")

module("druid.lte.id_329_transformation", package.seeall)

-- INSERT INTO longtimeeffects VALUES (329, 'druids_transformation', 'druid.lte.id_329_transformation');

function getAction(Character,Effect,Runde)
	--Hier die eigentlichen Aktionen eintragen  
end
  
function addEffect(Effect, Character)               -- Nur beim ersten Aufruf
	--Character:inform("debug func addEffect")
end

function callEffect(Effect,Character)                  -- Effect wird ausgeführt
--Character:inform("debug func callEffect")
--Erst einmal kommt der Rundenzähler  
	find,zaehler = Effect:findValue("zaehler")
	if find then
		zaehler = zaehler -1
		if zaehler <0 then 
			zaehler=0 
		end
		Effect:addValue("zaehler", zaehler)
		--Character:inform("Runde "..zaehler) 
		Effect.nextCalled = 10  -- nächster Aufruf in 1 Sekunde 
		--Hier jetzt die Aktionen, die pro Runde passieren sollen
		getAction(Character,Effect,zaehler)

		--Ende der Aktionen, es folgt noch etwas Verwaltung       
		if zaehler == 0 then 
			--das war die letzte Runde        
        	return false
     	else
        	return true
     	end
	end
end

function removeEffect(Effect,Character)         
	--Character:inform("debug func removeEffect") 
	find,old_race = Effect:findValue("old_race")
	if find then
		--Rückverwandlung in die alte Rasse
		Character:setAttrib("racetyp",old_race)      
	else
		Character:inform("LTE-Error 1: please call dev")     
	end
	world:gfx(45,Character.pos)  
end

function loadEffect(Effect,Character) -- wenn der Charakter erneut einloggt
	--Character:inform("debug func loadEffect") 
	find,zaehler = Effect:findValue("zaehler")
	if not find then 
		Character:inform("LTE-Error 2: please call dev")
	else
		found, new_race = Effect:findValue("new_race")
		if found then
			Character:setAttrib("racetyp",new_race) 
		else
		Character:inform("LTE-Error 21: please call dev")
		end 
	end    
end
