--ds_druidspell_9.lua / 2. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druids.spells.09_analyze_char_poison", package.seeall)

-- INSERT INTO spells VALUES (2^8,3,'druids.spells.09_analyze_char_poison');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #09.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #09.2")
	if Caster:getSkill("exquirere")>math.random(100) then	 
		--TargetChar auf "PoisonValue" abpr�fen
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
    Caster:learn(6,"sanitas",3,100)
	else
    base.common.InformNLS( Caster,
        "Deine F�higkeiten reichen noch nicht aus.",
        "Your abilities do not last out yet."
    );	
	end	    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #09.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #09.4")    
end
