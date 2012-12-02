--spell_03_analyze_stock.lua / Rune 1
--Druidensystem
-- Original by Falk
-- Edited by Blay09

require("base.common")
require("druid.base.alchemy")

module("druid.spell.spell_03_analyze_stock", package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^3,3,'druid.spell.spell_03_analyze_stock');

function CastMagic(Caster,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Kräutersud benutzen.", "You have to use this analyzing spell with a herbage brooth.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Kräutersud benutzen.", "You have to use this analyzing spell with a herbage brooth.");
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Kräutersud benutzen.", "You have to use this analyzing spell with a herbage brooth.");
end

function CastMagicOnItem(Caster,TargetItem,counter,param)
	--Analyse eines Sudes
	if TargetItem.id == 331 then
		dataZList = SplitBottleData(Caster,TargetItem.data)
		local TextDE = "Diese Flasche enthält ";
		local TextEN = "This bottle contains ";
		local anySubstance = false;
		for i = 1,table.getn(dataZList) do
			if dataZList[i]~= 5 then
				anySubstance = true;
				TextDE = TextDE..", "..wirkung_de[dataZList[i]].." "..wirkstoff[i];
				TextEN = TextEN..", "..wirkung_en[dataZList[i]].." "..wirkstoff[i];
			end
		end
    
		if not anySubstance then
			TextDE = TextDE.."nichts.";
			TextEN = TextEN.."nothing.";
		end
		--Caster:learn(6,"exquirere",3,100);
		--Replace with new learn function, see learn.lua 
		base.common.InformNLS(Caster, TextDE, TextEN);
	else
		base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Kräutersud benutzen.", "You have to use this analyzing spell with a herbage brooth.");
	end
end
