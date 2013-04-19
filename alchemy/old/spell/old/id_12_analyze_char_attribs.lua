--ds_druidspell_12.lua / 5. Rune des Gesellen
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_12_analyze_char_attribs", package.seeall)

-- INSERT INTO spells VALUES (2^11,3,'druid.spell.id_12_analyze_char_attribs');

function initTerms()
  --Einrichten der Textbausteine
  if firsttime == nil then 
    Term_1DE = {} 
    Term_1EN = {}  
    Term_2DE = {} 
    Term_2EN = {} 
    Term_3 = {}               
    Term_1DE = {"Ketzer ","Sünder ","Laie ","Novize ","Bruder ","Priester ","Abt ","Bischof ","Prior ","Heiliger "}
    Term_1EN = {"heretic ","sinner ","layman ","novice ","brother ","priest ","abbot ","bishop ","prior ","saint "}
    Term_2DE = {"der Kraft","des Willens","der Sinne","des Wissens","des Fleisches","des Windes","des Diebes","des Geistes"}  
    Term_2EN = {"of power","of will","of senses","of wit","of endurance","of the wind","of thieves","of soul"}           
    Term_3 = {"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"}
    firsttime = 1
  end  
end

function CastMagic(Caster,ltstate)
--Caster:inform("debug #12.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
--Caster:inform("debug #12.2")
	if Caster:getSkill("exquirere")>math.random(100) then	 
	  --Abfrage der Primärattribute
	  initTerms()
	  textDE = ""
	  textEN = ""
	  for i = 1, table.getn(Term_3) do
	    tt = math.floor(TargetCharacter:increaseAttrib(Term_3[i],0)/2) 
	    if tt > 10 then tt = 10 elseif tt <1 then tt = 1 end 
	    textDE = textDE..Term_1DE[tt]..Term_2DE[i].."\n"
	    textEN = textEN..Term_1EN[tt]..Term_2EN[i].."\n"    
	  end  
	  if Caster:getPlayerLanguage() == 0 then
	    Caster:inform("#b|0|0|"..textDE)
	  else
	    Caster:inform("#b|0|0|"..textEN)
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

function CastMagicOnField(Caster,Targetpos,ltstate)
--Caster:inform("debug #12.3")    
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
--Caster:inform("debug #12.4")    
end
