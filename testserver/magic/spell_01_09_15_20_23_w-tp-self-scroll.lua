-- EIGENTELEPORTATION
-- Rune 1 & 9 & 15 & 20 & 23 JUS TAUR KEL ANTH LEV
-- INSERT INTO spells VALUES (2^0+2^8+2^14+2^19+2^22,0,'m_01_09_15_20_23_write-tp-self-scroll.lua');
-- Punkt Zauber
-- Teleport Zauber

require("base.common");
require("magic.base.basics");
module("magic.spell_01_09_15_20_23_write-tp-self-scroll", package.seeall)

function InitSpell() -- Spell Grundeinstellungen
    Difficult=20;
    NeededSkill="transformo";

    Runes="JUS TAUR KEL ANTH LEV";

    Effect=53;
    SFX=4;

    timeToCast=50;
    timeGfxEffect=21;
    timeRptGfxEffect=10;
    timeSndEffect=0;
    timeRptSndEffect=0;

    maxHPNeeded=0;
    minHPNeeded=0;
    maxFPNeeded=0;
    minFPNeeded=0;
    maxAPNeeded=25;
    minAPNeeded=7;
    maxMPNeeded=1500;
    minMPNeeded=500;
    maxPPCaused=0;
    minPPCaused=0;

    SpRange=7;

    maxStrength=90;

    -- RaceID,CasterBoni
    magic.base.basics.SetRaceBoni(0,1.00); --human
    magic.base.basics.SetRaceBoni(1,0.70); --dwarf
    magic.base.basics.SetRaceBoni(2,0.75); --halfling
    magic.base.basics.SetRaceBoni(3,1.25); --elf
    magic.base.basics.SetRaceBoni(4,0.60); --orc
    magic.base.basics.SetRaceBoni(5,0.65); --lizardman
    magic.base.basics.SetRaceBoni(6,1.10); --gnome
    magic.base.basics.SetRaceBoni(7,1.45); --fairy
    magic.base.basics.SetRaceBoni(8,1.15); --goblin
    magic.base.basics.SetRaceBoni(9,0.20); --troll
    magic.base.basics.SetRaceBoni(10,1.00);--mumie
    magic.base.basics.SetRaceBoni(11,1.05);--skeleton
    magic.base.basics.SetRaceBoni(12,1.15);--beholder
    magic.base.basics.SetRaceBoni(13,1.00);--cloud
    magic.base.basics.SetRaceBoni(14,1.00);--healer
    magic.base.basics.SetRaceBoni(15,1.00);--buyer
    magic.base.basics.SetRaceBoni(16,1.00);--seller
    magic.base.basics.SetRaceBoni(17,0.20);--insects
    magic.base.basics.SetRaceBoni(18,0.20);--sheep
    magic.base.basics.SetRaceBoni(19,0.20);--spider
    magic.base.basics.SetRaceBoni(20,1.50);--demonskeleton
    magic.base.basics.SetRaceBoni(21,0.20);--rotworm
    magic.base.basics.SetRaceBoni(22,2.00);--bigdemon
    magic.base.basics.SetRaceBoni(23,0.20);--scorpion
    magic.base.basics.SetRaceBoni(24,0.20);--pig
    magic.base.basics.SetRaceBoni(25,1.00);--invisible
    magic.base.basics.SetRaceBoni(26,1.20);--skull
    magic.base.basics.SetRaceBoni(27,0.20);--wasp
    magic.base.basics.SetRaceBoni(28,0.50);--foresttroll
    magic.base.basics.SetRaceBoni(29,1.80);--shadowskeleton
    magic.base.basics.SetRaceBoni(30,0.20);--stonegolem
    magic.base.basics.SetRaceBoni(31,1.00);--mgoblin
    magic.base.basics.SetRaceBoni(32,0.30);--gnoll
    magic.base.basics.SetRaceBoni(33,0.85);--dragon
    magic.base.basics.SetRaceBoni(34,1.00);--mdrow
    magic.base.basics.SetRaceBoni(35,1.00);--fdrow
    magic.base.basics.SetRaceBoni(36,1.80);--lesserdemon
end

function CastMagic(Caster, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnField(Caster,Targetpos, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnItem(Caster,TargetItem, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function WriteTeleSpell(Caster, ltstate )
    InitSpell();
    magic.base.basics.InitializeHelpList();
    if ( ltstate == nil or ltstate == Action.success or timeToCast == 0 ) then
        local CasterVal=magic.base.basics.CasterValue(Caster);
        --Caster:inform("CasterVal: "..CasterVal);
        local HPChange=CalcAttribChange(minHPNeeded,maxHPNeeded,CasterVal);
        local FPChange=CalcAttribChange(minFPNeeded,maxFPNeeded,CasterVal);
        local APChange=CalcAttribChange(minAPNeeded,maxAPNeeded,CasterVal);
        local MPChange=CalcAttribChange(minMPNeeded,maxMPNeeded,CasterVal);
        --Caster:inform("MPChange: "..MPChange);
        local PPCaused=CalcAttribChange(minPPCaused,maxPPCaused,CasterVal);
        if CheckAttrib(Caster,"hitpoints",HPChange) then
            if CheckAttrib(Caster,"foodlevel",FPChange) then
                if CheckAttrib(Caster,"mana",MPChange) then
                    if (HPChange~=0) then Caster:increaseAttrib("hitpoints",-HPChange) end;
                    if (FPChange~=0) then Caster:increaseAttrib("foodlevel",-FPChange) end;
                    if (MPChange~=0) then Caster:increaseAttrib("mana",-MPChange) end;
                    if (PPCaused~=0) then Caster:increasePoisonValue(PPCaused) end;
                    if (APChange~=0) then Caster.movepoints=Caster.movepoints-APChange end;
                    if (CasterVal>0) then
                        -- magic.base.basics.SayRunes(Caster);
                        if (LuaAnd(Caster:getQuestProgress(24),1) == 0 ) then
                            --Caster:learn(3,NeededSkill,3,math.max(0,math.min(100,CasterVal+30)));
							--Replace with new learn function, see learn.lua 
                        end
                        --quality setzen

                        -- Meine Hände
                        itemL = Caster:getItemAt(5);
                        itemR = Caster:getItemAt(6);

                        -- Wo ist die offene Pergamentrolle, haben wir überhaupt eine?
                        local success = true;
                        if (itemL.id == 3109) then
                            parchment = itemL;
                        elseif (itemR.id == 3109) then
                            parchment = itemR;
                        else
                            base.common.InformNLS(Caster,"Ein leichter Windstoß fährt über dich hinweg.","You feel some wind passing by.");
                            success = false;
                        end;
                        if success then
                            Caster:eraseItem( 3109, 1 );

                            -- Wenn kein Platz mehr, ab auf den Boden. Quality == 2 ist für diesen Spruch reserviert.
                            if ( Caster:createItem( 3110, 1, 102, 0 ) ~= 0 ) then
                               world:createItemFromId( 3110, 1, Caster.pos, true, 102, 0 );
                            end;

                            world:gfx(Effect,Caster.pos);
                            world:makeSound(SFX,Caster.pos);
                        end;
                    else
                        base.common.InformNLS(Caster,"Der Spruch gelingt nicht.","The spell fails.");
                    end
                else
                    base.common.InformNLS(Caster,"Nicht genügend Mana.","Not enough mana.");
                end
            else
                base.common.InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end
        else
            base.common.InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end
    elseif ( ltstate == Action.none ) then
        local CasterVal=magic.base.basics.CasterValue(Caster);
        local HPChange=CalcAttribChange(minHPNeeded,maxHPNeeded,CasterVal);
        local FPChange=CalcAttribChange(minFPNeeded,maxFPNeeded,CasterVal);
        local APChange=CalcAttribChange(minAPNeeded,maxAPNeeded,CasterVal);
        local MPChange=CalcAttribChange(minMPNeeded,maxMPNeeded,CasterVal);
        local PPCaused=CalcAttribChange(minPPCaused,maxPPCaused,CasterVal);
        if CheckAttrib(Caster,"hitpoints",HPChange) then
            if CheckAttrib(Caster,"foodlevel",FPChange) then
                if CheckAttrib(Caster,"mana",MPChange) then
                   Caster:startAction( timeToCast, timeGfxEffect, timeRptGfxEffect, timeSndEffect, timeRptSndEffect);
                   Caster:talkLanguage( Character.say, Player.german, "#me beginnt mit einer mystischen Formel.");
                   Caster:talkLanguage( Character.say, Player.english, "#me starts with a mystical formula.");
                else
                    base.common.InformNLS(Caster,"Nicht genügend Mana","Not enough mana");
                end;
            else
                base.common.InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end;
        else
            base.common.InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end;
    elseif ( ltstate == Action.abort ) then
        Caster:talkLanguage(Character.say, Player.german, "#me stoppt apprupt mit dem Zaubern.");
        Caster:talkLanguage(Character.say, Player.english,"#me abruptly stops casting.");
    end
end
