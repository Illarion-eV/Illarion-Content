--ds_druidspell_19.lua / 5. Rune des Meisters
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_19_analyze_item_wear", package.seeall)

-- INSERT INTO spells VALUES (2^18,3,'druid.spell.id_19_analyze_item_wear');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #19.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #19.2")    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #19.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
  --Caster:inform("debug #19.4")  
  --Anzeige von Item-Verrottung

--base.common.InformNLS( Caster, 
--"Dieser Gegenstand verrottet in "..TargetItem.wear.." druidischen Zerfallseinheiten", 
--"This item rots within "..TargetItem.wear.." druid rotting-units"); -- das kann man schöner formulieren
  textDE="Dieser Gegenstand verrottet in "..TargetItem.wear.." druidischen Zerfallseinheiten"
  textEN="This item rots within "..TargetItem.wear.." druid rotting-units"
	if Caster:getPlayerLanguage() == 0 then
		Caster:inform("#b|0|0|"..textDE)
	else
		Caster:inform("#b|0|0|"..textEN)
	end
  	
end
