--ds_druidspell_17.lua / 3. Rune des Meisters
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_17_analyze_location", package.seeall)

-- INSERT INTO spells VALUES (2^16,3,'druid.spell.id_17_analyze_location');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #17.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #17.2")    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #17.3")
 
--Weltkoordinaten: 
--Linke obere Ecke    =  -500 / -500
--Rechte untere Ecke  =  456 / 274
--1° Grad = 60' Minuten

   
--Positionsangaben
if Targetpos.x < 0 then 
  text1DE = " westlicher Länge "
  text1EN = " western longitude"
elseif Targetpos.x > 0 then
  text1DE = " östlicher Länge " 
  text1EN = " eastern longitude"   
end  
if Targetpos.y < 0 then 
  text2DE = " nördlicher Breite "
  text2EN = " northern latitude"   
elseif Targetpos.y > 0 then
  text2DE = " südlicher Breite "  
  text2EN = " southern latitude" 
end 

longitude = math.abs(Targetpos.x)
longGrad = math.floor(longitude/60)
longMin = longitude - longGrad*60

latitude = math.abs(Targetpos.y)
latiGrad = math.floor(latitude/60)
latiMin = latitude - latiGrad*60

  if Caster:getPlayerLanguage() == 0 then
    Caster:inform("#b|0|0|"..longGrad.."°, "..longMin.."\' "..text1DE.."\n"..latiGrad.."°, "..latiMin.."\' "..text2DE)
  else
    Caster:inform("#b|0|0|"..longGrad.."°, "..longMin.."\' "..text1EN.."\n"..latiGrad.."°, "..latiMin.."\' "..text2EN)
  end
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #17.4") 
  --Anzeige des Item-Gewichtes 
  myItem = world:getItemStats(TargetItem)

--base.common.InformNLS( Caster, 
--"Dieser Gegenstand hat ein Gewicht von "..myItem.Weight.." druidischen Gewichtseinheiten.", 
--"This item weights "..myItem.Weight.." druid weight-units."); -- das kann man schöner formulieren
	textDE="Dieser Gegenstand hat ein Gewicht von "..myItem.Weight.." druidischen Gewichtseinheiten."
	textEN="This item weights "..myItem.Weight.." druid weight-units."
	if Caster:getPlayerLanguage() == 0 then
		Caster:inform("#b|0|0|"..textDE)
	else
		Caster:inform("#b|0|0|"..textEN)
	end
  	  
end
