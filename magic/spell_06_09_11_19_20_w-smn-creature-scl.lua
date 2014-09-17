--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- SUMMON AGRESSIVE CREATURE
-- Rune 6 & 9 & 11 & 19 & 20 LUK TAUR IRA FHAN LEV
-- INSERT INTO spells VALUES (2^5+2^8+2^10+2^18+2^19,0,'m_06_09_11_19_29_write-summon-creature-scroll.lua');
-- Spruchrollen Zauber
-- Beschwörungs Zauber

local common = require("base.common")
local basics = require("magic.base.basics")
module("magic.spell_06_09_11_19_20_write-summon-creature-scroll", package.seeall)

function InitSpell() -- Spell Grundeinstellungen
    Difficult=75;
    NeededSkill="desicio";

    Runes="LUK TAUR IRA FHAN LEV";

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
    basics.SetRaceBoni(0,1.00); --human
    basics.SetRaceBoni(1,0.70); --dwarf
    basics.SetRaceBoni(2,0.75); --halfling
    basics.SetRaceBoni(3,1.25); --elf
    basics.SetRaceBoni(4,0.60); --orc
    basics.SetRaceBoni(5,0.65); --lizardman
    basics.SetRaceBoni(6,1.10); --gnome
    basics.SetRaceBoni(7,1.45); --fairy
    basics.SetRaceBoni(8,1.15); --goblin
    basics.SetRaceBoni(9,0.20); --troll
    basics.SetRaceBoni(10,1.00);--mumie
    basics.SetRaceBoni(11,1.05);--skeleton
    basics.SetRaceBoni(12,1.15);--beholder
    basics.SetRaceBoni(13,1.00);--cloud
    basics.SetRaceBoni(14,1.00);--healer
    basics.SetRaceBoni(15,1.00);--buyer
    basics.SetRaceBoni(16,1.00);--seller
    basics.SetRaceBoni(17,0.20);--insects
    basics.SetRaceBoni(18,0.20);--sheep
    basics.SetRaceBoni(19,0.20);--spider
    basics.SetRaceBoni(20,1.50);--demonskeleton
    basics.SetRaceBoni(21,0.20);--rotworm
    basics.SetRaceBoni(22,2.00);--bigdemon
    basics.SetRaceBoni(23,0.20);--scorpion
    basics.SetRaceBoni(24,0.20);--pig
    basics.SetRaceBoni(25,1.00);--invisible
    basics.SetRaceBoni(26,1.20);--skull
    basics.SetRaceBoni(27,0.20);--wasp
    basics.SetRaceBoni(28,0.50);--foresttroll
    basics.SetRaceBoni(29,1.80);--shadowskeleton
    basics.SetRaceBoni(30,0.20);--stonegolem
    basics.SetRaceBoni(31,1.00);--mgoblin
    basics.SetRaceBoni(32,0.30);--gnoll
    basics.SetRaceBoni(33,0.85);--dragon
    basics.SetRaceBoni(34,1.00);--mdrow
    basics.SetRaceBoni(35,1.00);--fdrow
    basics.SetRaceBoni(36,1.80);--lesserdemon
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
    basics.InitializeHelpList();
    if ( ltstate == nil or ltstate == Action.success or timeToCast == 0 ) then
        local CasterVal=basics.CasterValue(Caster);
        local HPChange=CalcAttribChange(minHPNeeded,maxHPNeeded,CasterVal);
        local FPChange=CalcAttribChange(minFPNeeded,maxFPNeeded,CasterVal);
        local APChange=CalcAttribChange(minAPNeeded,maxAPNeeded,CasterVal);
        local MPChange=CalcAttribChange(minMPNeeded,maxMPNeeded,CasterVal);
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
                        -- basics.SayRunes(Caster);
                        if (LuaAnd(Caster:getQuestProgress(24),1) == 0 ) then
                            --Caster:learn(3,NeededSkill,3,math.max(0,math.min(100,CasterVal+30)));
							--Replace with new learn function, see learn.lua 
                        end

			-- Variablen setzen
			--
			parchment=nil;
			itemL=nil;
			itemR=nil;
			ash=nil;
			diamond=nil;

			--quality setzen

                        -- Meine Hände
                        itemL = Caster:getItemAt(5);
                        itemR = Caster:getItemAt(6);

                     -- Stufe 1: Streue Asche auf die offene Pergamentrolle
			local successStepOne = true;

                        -- Wo ist die offene Pergamentrolle, haben wir überhaupt eine?
                        if ( (itemL.id == 3109) and (itemL.data~=600) ) then
                            parchment = itemL;
                        elseif ( (itemR.id == 3109) and (itemL.data~=600) ) then
                            parchment = itemR;
                        else
                            successStepOne = false;
                        end

			-- Und was ist überhaupt mit der Asche?
			--

			if  (itemL.id == 314) then
                            ash = itemL;
                        elseif (itemR.id == 314) then
                            ash = itemR;
                        else
			    if ( (ash~=nil) and ((ash.quality==101) or (ash.quality==111) or (ash.quality==171) or (ash.quality==211) or (ash.quality==231)) ) then
                            	successStepOne = true;
			    else
			    	successStepOne = false;
			    end
                        end

		    -- Stufe 2: Schriftrolle versiegeln
		    	local successStepTwo = true;

			-- Wo ist die angefangene Pergamentrolle, haben wir eine und ist es auch die richtige?
			Caster:inform("moep->start");
			if ( (itemL.id == 3109) and (itemL.data==600) ) then
			    Caster:inform("moep->Scroll links");
			    parchment = itemL;
			elseif ( (itemR.id == 3109) and (itemR.data==600) ) then
			    Caster:inform("moep->Scroll rechts");
			    parchment = itemR;
			else
			    successStepTwo = false;
			end

			-- Und ist auch der Diamant zu versiegeln da?
			if (itemL.id == 285) then
			    Caster:inform("moep->Stein links");
			    diamond = itemL;
			elseif (itemR.id == 285) then
			    Caster:inform("moep->Stein rechts");
			    diamond = itemR;
                        else
                            successStepTwo = false;
                        end

                        if successStepOne then
                            world:erase( ash, 1 );
			    parchment.quality=ash.quality;
			    parchment.data=600;

			    world:changeItem(parchment);

			    world:gfx(Effect,Caster.pos);
			    world:makeSound(SFX,Caster.pos);

			elseif successStepTwo then
			    world:erase( diamond,1 );

			    parchment.quality=parchment.quality;
			    world:swap(parchment, 3110, parchment.quality);

			    world:gfx(Effect,Caster.pos);
			    world:makeSound(SFX,Caster.pos);
			else
			    common.InformNLS(Caster,"Ein leichter Windstoß fährt über dich hinweg.","You feel some wind passing by.");
			end

                    else
                        common.InformNLS(Caster,"Der Spruch gelingt nicht.","The spell fails.");
                    end
                else
                    common.InformNLS(Caster,"Nicht genügend Mana.","Not enough mana.");
                end
            else
                common.InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end
        else
            common.InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end
    elseif ( ltstate == Action.none ) then
        local CasterVal=basics.CasterValue(Caster);
        local HPChange=CalcAttribChange(minHPNeeded,maxHPNeeded,CasterVal);
        local FPChange=CalcAttribChange(minFPNeeded,maxFPNeeded,CasterVal);
        local APChange=CalcAttribChange(minAPNeeded,maxAPNeeded,CasterVal);
        local MPChange=CalcAttribChange(minMPNeeded,maxMPNeeded,CasterVal);
        local PPCaused=CalcAttribChange(minPPCaused,maxPPCaused,CasterVal);
        if CheckAttrib(Caster,"hitpoints",HPChange) then
            if CheckAttrib(Caster,"foodlevel",FPChange) then
                if CheckAttrib(Caster,"mana",MPChange) then
                   Caster:startAction( timeToCast, timeGfxEffect, timeRptGfxEffect, timeSndEffect, timeRptSndEffect);
                   Caster:talk(Character.say, "#me beginnt mit einer mystischen Formel.", "#me starts with a mystical formula.")
                else
                    common.InformNLS(Caster,"Nicht genügend Mana.","Not enough mana.");
                end;
            else
                common.InformNLS(Caster,"Du hast Hunger und kannst dich nicht konzentrieren.","You are hungry and can't concentrate.");
            end;
        else
            InformNLS(Caster,"Du würdest es nicht überleben, jetzt diesen Spruch zu sprechen.","You die if you cast this spell now.");
        end;
    elseif ( ltstate == Action.abort ) then
        Caster:talk(Character.say, "#me stoppt apprupt mit dem Zaubern.", "#me abruptly stops casting.")
    end
end
