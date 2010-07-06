--spell_04_quality_stock.lua / Rune 2
--Druidensystem
-- Original by Falk
-- Edited by Blay09

require("base.common")
module("druid.spell.spell_04_quality_stock", package.seeall)

-- INSERT INTO spells VALUES (2^4,3,'druid.spell.spell_04_quality_stock');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #05.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #05.2")  
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #05.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #05.4") 
--Analyse eines Sudes auf Quality 
  if TargetItem.id == 331 and TargetItem.data ~=0 then
    qualstat = math.floor(TargetItem.quality/100)
    
    textDE="Dieser Sud hat eine "..qListDe[qualstat].." Qualität"
    textEN="This stock has a "..qListEn[qualstat].." quality"
    if Caster:getPlayerLanguage() == 0 then
    	Caster:inform("#b|0|0|"..textDE)
  	else
    	Caster:inform("#b|0|0|"..textEN)
  	end

  	Caster:learn(6,"exquirere",3,100)
  	
  else
    base.common.InformNLS(Caster,
       "Das ist kein Pflanzensud.",
       "This is no stock.")      
  end     
end