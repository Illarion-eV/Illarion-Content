--ds_druidspell_07.lua / 7. Rune des Lehrlings
--Druidensystem
--Falk

require("base.common")
require("druid.base.alchemy")

module("druid.spell.id_07_quality_potion", package.seeall, package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^6,3,'druid.spell.id_07_quality_potion');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #07.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
-- Caster:inform("debug #07.2")  
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #07.3") 
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #07.4") 
--Analyse eines Trankes auf Quality 
  pList={59,165,166,167,327,328,329,330} 
  for i=1,table.getn(pList) do
    if pList[i] == TargetItem.id then
      qualstat = math.floor(TargetItem.quality/100)

	  	--Caster:learn(6,"exquirere",3,100)
		--Replace with new learn function, see learn.lua 
	    
	    textDE="Dieser Trank hat eine "..qListDe[qualstat].." Qualität"
	    textEN="This potion has a "..qListEn[qualstat].." quality"     
	    if Caster:getPlayerLanguage() == 0 then
	    	Caster:inform("#b|0|0|"..textDE)
	  	else
	    	Caster:inform("#b|0|0|"..textEN)
	  	end    
    
    end
  end   
end
