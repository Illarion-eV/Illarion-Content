--spell_09_analyze_char_illness.lua / Rune 5
--Druidensystem
-- Original by Falk
-- Edited by Blay09

require("base.common")
module("druid.spell.spell_09_analyze_char_illness", package.seeall)

-- INSERT INTO spells VALUES (2^9,3,'druid.spell.spell_09_analyze_char_illness');

function CastMagic(Caster,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Charakter benutzen.", "You have to use this analyzing spell with a character.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
	--Caster:inform("debug #32.2")
	--TODO: Might need a rework!
	if Caster:getSkill("exquirere")>50 then	 
		--Analyse TargetChar auf Viruskrankheiten  
	  if ft == nil then
	   L = {"Anghenfil Twymyn","Morfa Cwlwm Gwythi","Trolio Caethineb","Corrach Rhithdyb Gwrthwenwyn","Vein-Syndrome","Draig Brech","Sgorpion Epidemig","Blaidd Haint"}
	   G = {"Ork-Fieber","Sumpfkrampf","Trollsucht","Gnom-Wahn","Vein'sches Syndrom","Drachenpocken","Skorpion-Seuche","Wolfspest"}
	   E = {"orc-fever","bog-attack","Troll's rash","gnome-paranoia","Veins'syndrome","dragon's pox","scorpion's pestilence","wolves pest"}
	   ft = 1
	  end
   
		--Analyse TC auf Krankheiten
	  find, myEffect = TargetCharacter.effects:find(167);
	  if find then 
	  --TC ist infiziert  
	    find2,diagnose = myEffect:findValue("illness") 
	    if find2 then
	        textDE="Ein Befund auf "..G[diagnose].." ["..L[diagnose].."].";
	        textEN="Medical result for"..E[diagnose].." ["..L[diagnose].."].";               
			if Caster:getPlayerLanguage() == 0 then
		    	Caster:inform(textDE)
		  	else
		    	Caster:inform(textEN)
		  	end
	  	                          
	    else
	      Caster:inform("Error in 328.1 - please call dev")
	    end
	  else
	  	
			textDE="Keine Virus-Erkrankung festgestellt."
			textEN="No viral infection diagnosed."
			if Caster:getPlayerLanguage() == 0 then
				Caster:inform(textDE)
			else
				Caster:inform(textEN)
			end
      
	  end  
		local poisonval = TargetCharacter:getPoisonValue();
		if(poisonval > 0) then
			local poisonstringde;
			local poisonstringen;
			if(poisonval >= 800) then
				poisonstringde = "starke";
				poisonstringen = "major";
			elseif (poisonval >= 400) then
				poisonstringde = "";
				poisonstringen = "";
			else
				poisonstringde = "schwache";
				poisonstringen = "minor";
			end
			
			base.common.InformNLS(TargetCharacter, "Es liegt eine "..poisonstringde.." Vergiftung vor.", "There is a "..poisonstringen.." intoxication."); 
		else
			
		end
		--Caster:learn(6,"sanitas",3,100)
		--Replace with new learn function, see learn.lua 
		
	else
    base.common.InformNLS( Caster,
        "Deine Fähigkeiten reichen noch nicht aus.",
        "Your abilities do not last out yet."
    );		
	end		    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Charakter benutzen.", "You have to use this analyzing spell with a character.");
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
	base.common.InformNLS(Caster, "Du musst diesen Analysezauber mit einem Charakter benutzen.", "You have to use this analyzing spell with a character.");
end
