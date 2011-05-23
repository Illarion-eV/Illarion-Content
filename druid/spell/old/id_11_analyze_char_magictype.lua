--ds_druidspell_11.lua / 4. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_11_analyze_char_magictype", package.seeall)

-- INSERT INTO spells VALUES (2^10,3,'druid.spell.id_11_analyze_char_magictype');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #11.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #11.2")
	if Caster:getSkill("exquirere")>math.random(100) then	
		--Feststellung der Magieklasse von TI
		klassenDE = {"Magie","Priester","Barde","Druide"}
		klassenEN = {"mage","priest","bard","druid"}
		local magieklasse=TargetCharacter:getMagicType() 
		textDE="Magiezugehörigkeit: "..klassenDE[magieklasse+1]
		textEN="Magic classification: "..klassenEN[magieklasse+1]
		if Caster:getPlayerLanguage() == 0 then
			Caster:inform("#b|0|0|"..textDE)
		else
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

function CastMagicOnField(Caster,TargetPos,counter,param,ltstate)
--Caster:inform("debug #11.3")  
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #11.4")    
end
