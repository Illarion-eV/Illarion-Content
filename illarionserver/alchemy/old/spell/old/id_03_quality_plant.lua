--ds_druidspell_03.lua / 3. Rune des Lehrlings
--Druidensystem
--Falk
 
require("base.common")
require("druid.base.alchemy")

module("druid.spell.id_03_quality_plant", package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^2,3,'druid.spell.id_03_quality_plant');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #03.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #03.2") 
 
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #03.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param)
--Caster:inform("debug #03.4")
--Analyse einer Pflanze (Qualität)

  if (IsThatAPlant(TargetItem) == true) then
    qualstat = math.floor(TargetItem.quality/100)
             
    textDE= "Diese Pflanze hat eine "..qListDe[qualstat].." Qualität"
    textEN= "This plant has a "..qListEn[qualstat].." quality"

    if Caster:getPlayerLanguage() == 0 then
    	Caster:inform("#b|0|0|"..textDE)
  	else
    	Caster:inform("#b|0|0|"..textEN)
  	end

  	--Caster:learn(6,"vegetabilistia",3,100)
	--Replace with new learn function, see learn.lua 
                      
  else
    base.common.InformNLS(Caster,   
        "Das ist keine Heilpflanze",
        "This is not a medicinal plant")   
  end  
end
