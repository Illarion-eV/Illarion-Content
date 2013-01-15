--ds_druidspell_14.lua / 7. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_14_analyze_char_hands", package.seeall)

-- INSERT INTO spells VALUES (2^13,3,'druid.spell.id_14_analyze_char_hands');

function CastMagic(Caster,ltstate)
--Caster:inform("debug #14.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
	--Caster:inform("debug #14.2")	
	if Caster:getSkill("exquirere")>math.random(100) then	

	--Feststellung, was TC in den Händen hält
	  lH=TargetCharacter:getItemAt(5)
	  rH=TargetCharacter:getItemAt(6)
		if Caster:getPlayerLanguage() == 0 then
			leftHand=world:getItemName(lH.id,0)
			rightHand=world:getItemName(rH.id,0)		
			textDE="In der linken Hand:\n"..leftHand.."\nIn der rechten Hand:\n"..rightHand
			Caster:inform("#b|0|0|"..textDE)
		else
			leftHand=world:getItemName(lH.id,1)
			rightHand=world:getItemName(rH.id,1)		
			textEN="At the left hand:\n"..leftHand.."\nAt the right hand:\n"..rightHand	
			Caster:inform("#b|0|0|"..textEN)
		end 
		
	  	--Caster:learn(6,"ars magica",3,100)
        --Replace with new learn function, see learn.lua 		
	else
    base.common.InformNLS( Caster,
        "Deine Fähigkeiten reichen noch nicht aus.",
        "Your abilities do not last out yet."
    );		
	end  	    
end

function CastMagicOnField(Caster,Targetpos,ltstate)
--Caster:inform("debug #14.3")    
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
--Caster:inform("debug #14.4")
end
