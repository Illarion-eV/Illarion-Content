--ds_druidspell_05.lua / 5. Rune des Lehrlings
--Druidensystem
--Falk

require("base.common")
module("druid.spell.id_05_quality_stock", package.seeall)

-- INSERT INTO spells VALUES (2^4,3,'druid.spell.id_05_quality_stock');

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
    
--  base.common.InformNLS(Caster,
--     "#b|0|0|Dieser Sud hat eine "..qListDe[qualstat].." Qualität",
--     "#b|0|0|This stock has a "..qListEn[qualstat].." quality")
    textDE="Dieser Sud hat eine "..qListDe[qualstat].." Qualität"
    textEN="This stock has a "..qListEn[qualstat].." quality"
    if Caster:getPlayerLanguage() == 0 then
    	Caster:inform("#b|0|0|"..textDE)
  	else
    	Caster:inform("#b|0|0|"..textEN)
  	end

  	--Caster:learn(6,"exquirere",3,100)
  	--Replace with new learn function, see learn.lua 
	
  else
    base.common.InformNLS(Caster,
       "Das ist kein Pflanzensud",
       "This is no stock")      
  end     
end
