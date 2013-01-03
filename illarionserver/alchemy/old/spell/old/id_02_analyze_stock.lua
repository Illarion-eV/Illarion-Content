-- ds_druidspell_02.lua / 2. Rune des Lehrlings
--Druidensystem
--Falk

require("base.common")
require("druid.base.alchemy")

module("druid.spell.id_02_analyze_stock", package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^1,3,'druid.spell.id_01_analyze_plant');

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #02.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #02.2") 
 
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #02.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param)
  --Analyse eines Sudes (nur 1 Wert)  
  --Caster:inform("debug #02.4") 

  if TargetItem.id == 331 then
    dataZList = SplitBottleData(Caster,TargetItem.data)
    i = math.random(table.getn(dataZList))
    textDE= "Dieser Sud enthält "..wirkung_de[dataZList[i]].." "..wirkstoff[i]
    textEN= "This stock contains "..wirkung_en[dataZList[i]].." "..wirkstoff[i] 

    if Caster:getPlayerLanguage() == 0 then
      Caster:inform("#b|0|0|"..textDE)
    else
      Caster:inform("#b|0|0|"..textEN)
    end 
      --Caster:learn(6,"exquirere",3,100)
	  --Replace with new learn function, see learn.lua 

  else
    base.common.InformNLS(Caster,   
    "Das ist kein Kräutersud","This is not a stock")       		         
  end
end
