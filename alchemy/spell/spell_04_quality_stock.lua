--spell_04_quality_stock.lua / Rune 2
--Druidensystem
-- Original by Falk
-- Edited by Blay09

require("base.common")
module("druid.spell.spell_04_quality_stock", package.seeall)

-- INSERT INTO spells VALUES (2^4,3,'druid.spell.spell_04_quality_stock');

function CastMagic(Caster,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Kräutersood benutzen.", "You have to use this quality analyzing spell with a herbage brooth.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Kräutersood benutzen.", "You have to use this quality analyzing spell with a herbage brooth.");
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Kräutersood benutzen.", "You have to use this quality analyzing spell with a herbage brooth.");
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
	--Analyse eines Sudes auf Quality 
	if TargetItem.id == 331 and TargetItem.data ~=0 then
		qualstat = math.floor(TargetItem.quality/100)
		textDE = "Dieser Sud hat eine "..qListDe[qualstat].." Qualität."
		textEN = "This stock has a "..qListEn[qualstat].." quality."
		base.common.InformNLS(Caster, textDE, textEN);
		--Caster:learn(6,"exquirere",3,100)
		--Replace with new learn function, see learn.lua 
	else
		base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Kräutersood benutzen.", "You have to use this quality analyzing spell with a herbage brooth.");  
	end     
end
