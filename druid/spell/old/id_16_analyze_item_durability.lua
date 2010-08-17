--ds_druidspell_16.lua / 2. Rune des Meisters
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_16_analyze_item_durability", package.seeall)

-- INSERT INTO spells VALUES (2^15,3,'druid.spell.id_16_analyze_item_durability');

function unitDecleration()
  if firsttime == nil then
    ListDE = {}
    ListEN = {}    
    ListDE ={"marode", "schlechte", "mäßige", "unauffällige", "brauchbare", "gute", "sehr gute", "hervorragende", "überragende"}
    ListEN ={"ramshackle","bad","undistinguished","modest","usable","good", "very good","excellent","superior" }
    firsttime = 1
  end
end

function CastMagic(Caster,counter,param,ltstate)
--Caster:inform("debug #16.1")  
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param,ltstate)
--Caster:inform("debug #16.2")    
end

function CastMagicOnField(Caster,Targetpos,counter,param,ltstate)
--Caster:inform("debug #16.3")    
end

function CastMagicOnItem(Caster,TargetItem,counter,param,ltstate)
--Caster:inform("debug #16.4")  
--Haltbarkeit eines Items feststellen
  unitDecleration()
  ergebnis = TargetItem.quality - (math.floor(TargetItem.quality/100)*100) 
  ergebnis = math.floor(ergebnis/10)+1
  --Caster:inform("ergebnis: "..ergebnis) 

  base.common.InformNLS( Caster,
                "#b|0|0|die Prüfung ergibt eine "..ListDE[ergebnis].." Haltbarkeit",
                "#b|0|0|this inspection results a "..ListEN[ergebnis].." durability" )

end
