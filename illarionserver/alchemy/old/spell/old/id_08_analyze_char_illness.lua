--ds_druidspell_08.lua / 1. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_08_analyze_char_illness", package.seeall)

-- INSERT INTO spells VALUES (2^7,3,'druid.spell.id_08_analyze_char_illness');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #08.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #08.2")
	if Caster:getSkill("exquirere")>math.random(100) then	
		--Krankheitsstatur "illness" abfragen
		if TargetCharacter:increaseAttrib("illness",0) ~= 0 then
		  	
		--  Caster:inform("#b|0|0|Der Patient ist erkrankt, woran auch immer")
		    textDE="Der Patient ist erkrankt, woran auch immer"
		    textEN="The patient has become diseased, whatever about"
		    if Caster:getPlayerLanguage() == 0 then
		    	Caster:inform("#b|0|0|"..textDE)
		  	else
		    	Caster:inform("#b|0|0|"..textEN)
		  	end
		  	
		else
		
		--  Caster:inform("#b|0|0|Kein Befund, offenbar bumperlg'sund")
		    textDE="Kein Befund, offenbar bumperlg'sund"
		    textEN="No finding, fit as a fiddle"
		    if Caster:getPlayerLanguage() == 0 then
		    	Caster:inform("#b|0|0|"..textDE)
		  	else
		    	Caster:inform("#b|0|0|"..textEN)
		  	end 
		  	      
		end
	  
	    --Caster:learn(6,"sanitas",3,100)
		--Replace with new learn function, see learn.lua 
	    
	else
    base.common.InformNLS( Caster,
        "Deine Fähigkeiten reichen noch nicht aus.",
        "Your abilities do not last out yet."
    );		
	end			  	 
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #08.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #08.4")    
end
