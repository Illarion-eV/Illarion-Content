-- LTE für das Druidensystem
-- by Falk
-- reworked by Merung

require("base.common")

module("alchemy.lte.id_330_language", package.seeall)

-- INSERT INTO longtimeeffects VALUES (330, 'alchemy_language', 'alchemy.lte.id_330_language');

local ListLanguages={Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}

function addEffect(Effect, User)               				
--Nur beim ersten Aufruf
--User:inform("debug func addEffect") 	
end

function callEffect(Effect,User)                  			
	base.common.InformNLS( User, "Du fühlst, dass der Sprachtrank seine Wirkung verliert.", "You feel that the language potion looses its effect.")
	return false
end

function removeEffect(Effect,User)
	--[[
	local find,languageId = Effect:findValue("languageId")
	local skillName = ListLanguages[languageId]
	local find,oldSkill = Effect:findValue( "oldSkill")          
	local find,newSkill = Effect:findValue( "newSkill")

	--original skill level
	User:increaseSkill(skillName,(-(newSkill-oldSkill))) ]]
end

function loadEffect(Effect,User)                  			

end
