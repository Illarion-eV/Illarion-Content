--ds_druidspell_15.lua / 1. Rune des Meisters
--Druidensystem
--Falk

require("base.common")

module("druid.spell.id_15_analyze_item_quality", package.seeall)

-- INSERT INTO spells VALUES (2^14,3,'druid.spell.id_15_analyze_item_quality');

function unitDecleration()
  if firsttime == nil then
    ListDE = {}
    ListEN = {}
    ListDE ={"marode", "schlechte", "mäßige", "unauffällige", "brauchbare", "gute", "sehr gute", "hervorragende", "überragende"}
    ListEN ={"ramshackle","bad","undistinguished","modest","usable","good", "very good","excellent","superior" }
    firsttime = 1
  end
end

function CastMagic(Caster,ltstate)
--Caster:inform("debug #15.1") 
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
--Caster:inform("debug #15.2")    
end

function CastMagicOnField(Caster,Targetpos,ltstate)
--Caster:inform("debug #15.3")
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
--Caster:inform("debug #15.4") 
  --Quality eines Items feststellen
  unitDecleration()
  ergebnis = math.floor(TargetItem.quality/100)
  base.common.InformNLS( Caster,
                "#b|0|0|die Prüfung ergibt eine "..ListDE[ergebnis].." Qualität",
                "#b|0|0|this inspection results a "..ListEN[ergebnis].." quality" )
end
