--ds_druidspell_01.lua / 1. Rune des Lehrlings
--Druidensystem
--Falk

require("base.common")
require("druid.base.alchemy")
require("druid.base.plants")

module("druid.spell.id_01_analyze_plant", package.seeall)

-- INSERT INTO spells VALUES (2^0,3,'druid.spell.id_01_analyze_plant');

function CastMagic(Caster,ltstate)
	--Caster:inform("debug #01.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
	--Caster:inform("debug #01.2") 
end

function CastMagicOnField(Caster,Targetpos,ltstate)
	--Caster:inform("debug #01.3")    
end

function CastMagicOnItem(Caster,TargetItem)
	--Caster:inform("debug #01.4")
	--Analyse einer Pflanze

	if (IsThatAPlant(TargetItem) == true) then
  
		language = Caster:getPlayerLanguage()
		pflanzenname = world:getItemName(TargetItem.id,language)
    
		-- Manche Pflanzen haben Doppelfunktionen und bekommen eine neue ID
		if TargetItem.data >9000 and TargetItem.data < 9017 then
			dummy = TargetItem.data
			
			for i=1,16 do
				if dummyIDList[i] == dummy then
					if language == 0 then
						pflanzenname = dummyNameListDE[i]
					else
						pflanzenname = dummyNameListEN[i]
					end
				end
			end
		else
			dummy =TargetItem.id
		end
		
		plusWertPos,minusWertPos = SplitPlantData(dummy)

		textDE= pflanzenname.." hat Einfluss auf den Gehalt an "..wirkstoff[plusWertPos].." und "..wirkstoff[minusWertPos].." eines Trankes"
		textEN= pflanzenname.." exert influence to the assay of "..wirkstoff[plusWertPos].." and "..wirkstoff[minusWertPos].." of a potion" 
  
		if Caster:getPlayerLanguage() == 0 then
			Caster:inform("#b|0|0|"..textDE)
		else
			Caster:inform("#b|0|0|"..textEN)
		end
  	
		--Caster:learn(6,"vegetabilistia",3,100)
		--Replace with new learn function, see learn.lua 
  	           
	else
		base.common.InformNLS(Caster,   
		"Das ist keine Heilpflanze","This is not a medicinal plant")   
	end  
end
