--ds_druidspell_18.lua / 4. Rune des Meisters
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_18_analyze_item_volume", package.seeall)

-- INSERT INTO spells VALUES (2^17,3,'druid.spell.id_18_analyze_item_volume');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #18.1")     
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #18.2")    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #18.3")        
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #18.4")
  --Anzeige des Item-Volumens
  myItem = world:getItemStats(TargetItem)
  --
--base.common.InformNLS( Caster, 
--"Dieser Gegenstand hat ein Volumen von "..myItem.Volume.." druidischen Volumeneinheiten", 
--"This item has a volume of "..myItem.Volume.." druid volume-units"); -- das kann man schöner formulieren
  
  textDE="Dieser Gegenstand hat ein Volumen von "..myItem.Volume.." druidischen Volumeneinheiten"
  textEN="This item has a volume of "..myItem.Volume.." druid volume-units"
	if Caster:getPlayerLanguage() == 0 then
		Caster:inform("#b|0|0|"..textDE)
	else
		Caster:inform("#b|0|0|"..textEN)
	end
  	
end
