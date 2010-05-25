-- EIGENTELEPORTATION
-- Rune 1 & 9 & 15 & 20 & 23 JUS TAUR KEL ANTH LEV
-- INSERT INTO spells VALUES (2^0+2^8+2^14+2^19+2^22,0,'m_01_09_15_20_23_write-tp-self-scroll.lua');
-- Punkt Zauber
-- Teleport Zauber

dofile("m_basics.lua");

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
    SetRaceBoni(0,1.00); --human
    SetRaceBoni(1,0.70); --dwarf
    SetRaceBoni(2,0.75); --halfling
    SetRaceBoni(3,1.25); --elf
    SetRaceBoni(4,0.60); --orc
    SetRaceBoni(5,0.65); --lizardman
    SetRaceBoni(6,1.10); --gnome
    SetRaceBoni(7,1.45); --fairy
    SetRaceBoni(8,1.15); --goblin
    SetRaceBoni(9,0.20); --troll
    SetRaceBoni(10,1.00);--mumie
    SetRaceBoni(11,1.05);--skeleton
    SetRaceBoni(12,1.15);--beholder
    SetRaceBoni(13,1.00);--cloud
    SetRaceBoni(14,1.00);--healer
    SetRaceBoni(15,1.00);--buyer
    SetRaceBoni(16,1.00);--seller
    SetRaceBoni(17,0.20);--insects
    SetRaceBoni(18,0.20);--sheep
    SetRaceBoni(19,0.20);--spider
    SetRaceBoni(20,1.50);--demonskeleton
    SetRaceBoni(21,0.20);--rotworm
    SetRaceBoni(22,2.00);--bigdemon
    SetRaceBoni(23,0.20);--scorpion
    SetRaceBoni(24,0.20);--pig
    SetRaceBoni(25,1.00);--invisible
    SetRaceBoni(26,1.20);--skull
    SetRaceBoni(27,0.20);--wasp
    SetRaceBoni(28,0.50);--foresttroll
    SetRaceBoni(29,1.80);--shadowskeleton
    SetRaceBoni(30,0.20);--stonegolem
    SetRaceBoni(31,1.00);--mgoblin
    SetRaceBoni(32,0.30);--gnoll
    SetRaceBoni(33,0.85);--dragon
    SetRaceBoni(34,1.00);--mdrow
    SetRaceBoni(35,1.00);--fdrow
    SetRaceBoni(36,1.80);--lesserdemon
end

function CastMagic(Caster,counter,param, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnField(Caster,Targetpos,counter,param, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function CastMagicOnItem(Caster,TargetItem,counter,param, ltstate)
    WriteTeleSpell(Caster, ltstate);
end

function WriteTeleSpell(Caster, ltstate )
    InitSpell();
    InitializeHelpList();
    if ( ltstate == nil or ltstate == Action.success or timeToCast == 0 ) then
        local CasterVal=CasterValue(Caster);
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
                        -- SayRunes(Caster);
                        if (LuaAnd(Caster:getQuestProgress(24),1) == 0 ) then
                            Caster:learn(3,NeededSkill,3,math.max(0,math.min(100,CasterVal+30)));
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
                            InformNLS(Caster,"Ein leichter Windstoß fährt über dich hinweg.","You feel some wind passing by.");
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
                        InformNLS(Caster,"Der Spruch gelingt nicht","The spell fails.");
                    end
                else
                    InformNLS(Caster,"Nicht genügend Mana","Not enough mana.");
                end
            else
                InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end
        else
            InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end
    elseif ( ltstate == Action.none ) then
        local CasterVal=CasterValue(Caster);
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
                   Caster:startAction( timeToCast, timeGfxEffect, timeRptGfxEffect, timeSndEffect, timeRptSndEffect);
                   Caster:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt mit einer mystischen Formel.");
                   Caster:talkLanguage( CCharacter.say, CPlayer.english, "#me starts with a mystical formula.");
                else
                    InformNLS(Caster,"Nicht genügend Mana","Not enough mana");
                end;
            else
                InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end;
        else
            InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end;
    elseif ( ltstate == Action.abort ) then
        Caster:talkLanguage(CCharacter.say, CPlayer.german, "#me stoppt apprupt mit dem Zaubern.");
        Caster:talkLanguage(CCharacter.say, CPlayer.english,"#me abruptly stops casting.");
    end
end
