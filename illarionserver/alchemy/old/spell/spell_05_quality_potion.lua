--spell_06_quality_potion.lua / Rune 4
--Druidensystem
-- Original by Falk
-- Edited by Blay09

require("base.common")
require("druid.base.alchemy")

module("druid.spell.spell_05_quality_potion", package.seeall, package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^6,3,'druid.spell.spell_06_quality_potion');

function CastMagic(Caster,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Trank benutzen.", "You have to use this quality analyzing spell with a potion.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Trank benutzen.", "You have to use this quality analyzing spell with a potion.");
end

function CastMagicOnField(Caster,Targetpos,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Trank benutzen.", "You have to use this quality analyzing spell with a potion.");
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
	--Analyse eines Trankes auf Quality 
	pList={59,165,166,167,327,328,329,330} 
	for i=1,table.getn(pList) do
		if pList[i] == TargetItem.id then
			qualstat = math.floor(TargetItem.quality/100);
			--Caster:learn(6,"exquirere",3,100);
			--Replace with new learn function, see learn.lua 
			textDE = "Dieser Trank hat eine "..qListDe[qualstat].." Qualität.";
			textEN = "This potion has a "..qListEn[qualstat].." quality.";
			base.common.InformNLS(Caster, textDE, textEN);
			return
		end
	end
	base.common.InformNLS(Caster, "Du musst diesen Qualitätsanalysezauber mit einem Trank benutzen.", "You have to use this quality analyzing spell with a potion.");
end
