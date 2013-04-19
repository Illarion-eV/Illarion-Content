--ds_druidspell_9.lua / 2. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_09_analyze_char_poison", package.seeall)

-- INSERT INTO spells VALUES (2^8,3,'druid.spell.id_09_analyze_char_poison');

function CastMagic(Caster,ltstate)
--Caster:inform("debug #09.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
--Caster:inform("debug #09.2")
	if Caster:getSkill("exquirere")>math.random(100) then	 
		--TargetChar auf "PoisonValue" abprüfen
	  if TargetCharacter:getPoisonValue() ~= 0 then
	  	
	--  Caster:inform("#b|0|0|Der Patient hat eine Vergiftung, wovon auch immer")  
	    textDE="Der Patient hat eine Vergiftung, wovon auch immer"
	    textEN="The patient has an intoxication, whatever about"
	    if Caster:getPlayerLanguage() == 0 then
	    	Caster:inform("#b|0|0|"..textDE)
	  	else
	    	Caster:inform("#b|0|0|"..textEN)
	  	end
	  
	  else
	  	
	--  Caster:inform("#b|0|0|Keine Vergiftung, offenbar bumperlg'sund")  
	    textDE="Keine Vergiftung, offenbar bumperlg'sund"
	    textEN="Intoxication undiscernible"
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

function CastMagicOnField(Caster,Targetpos,ltstate)
--Caster:inform("debug #09.3")    
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
--Caster:inform("debug #09.4")    
end
