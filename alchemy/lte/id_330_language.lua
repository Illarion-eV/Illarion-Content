-- LTE für das Druidensystem
-- by Falk
-- reworked by Merung

require("base.common")

module("alchemy.lte.id_330_language", package.seeall)

-- INSERT INTO longtimeeffects VALUES (330, 'alchemy_language', 'alchemy.lte.id_330_language');

ListLanguages={"human language","dwarf language","elf language","lizard language","orc language","halfling language","fairy language","gnome language","goblin language","ancient language"}

function addEffect(Effect, User)               				
--Nur beim ersten Aufruf
--User:inform("debug func addEffect") 	
end

function callEffect(Effect,User)                  			
	findCounter,counterWhite = Effect:findValue("counterWhite")
    if findCounter then
	    if counterWhite >= 1 then
		
		   if findCounter then
		      counterWhite = counterWhite - 1;
	          Effect:addValue("counterWhite",counterWhite)
	       end
		
		   if counterWhite == 0 then
		        find,languageId = Effect:findValue("languageId")
				skillName = ListLanguages[languageId]
				find,oldSkill = Effect:findValue( "oldSkill")          
                find,newSkill = Effect:findValue( "newSkill")
			  
				--original skill level
				User:increaseSkill(1,skillName,(-(newSkill-oldSkill))) -- ergibt wahrscheinlich noch falsche Werte
            end
	   end
	end
    Effect.nextCalled = 50
	return true
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
