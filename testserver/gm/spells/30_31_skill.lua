-- GM Runenkombination 30 + 31 / 1610612736 / ***

-- INSERT INTO spells VALUES (2^29+2^30,0,'gm_30_31.lua');

-- GM Spell zum ad-hoc Skillverändern
-- DOES NOT WORK ANYMORE!!!

-- Syntax:
-- [modus] [skill] [value]

-- modus:
-- increase (anheben)
-- decrease (absenken)
-- set (setzen)
-- skill:
-- skill name
-- Value:
-- Value of increase,decrease or set
require("gm.base.log")

module("gm.spells.30_31_skill", package.seeall)

--[[
INSERT INTO spells VALUES (2^29 + 2^30,0,'gm.spells.30_31_skill');
INSERT INTO spells VALUES (2^29 + 2^30,1,'gm.spells.30_31_skill');
INSERT INTO spells VALUES (2^29 + 2^30,2,'gm.spells.30_31_skill');
INSERT INTO spells VALUES (2^29 + 2^30,3,'gm.spells.30_31_skill');
]]

function CastMagic(Caster)
    SkillChange(Caster,Caster);
end

function CastMagicOnCharacter(Caster,TargetCharacter)
    SkillChange(Caster,TargetCharacter);
end

function SkillChange(Caster,TargetChar)
    local modus=0;
    if (string.find(Caster.lastSpokenText,"[Ii]ncrease")~=nil) then
        modus=1;
    elseif (string.find(Caster.lastSpokenText,"[Dd]ecrease")~=nil) then
        modus=2;
    elseif (string.find(Caster.lastSpokenText,"[Ss][Ee][Tt]")~=nil) then
        modus=3;
    end
    if (modus~=0) then
        local firststring=""
        if (modus==1) then firststring="increase";
        elseif (modus==2) then firststring="decrease";
        else firststring="set";
        end
        a,b,skillname,group,value=string.find(Caster.lastSpokenText,firststring.." (.+) (%d) (%d+)");
        if (skillname~=nil and skillname~="" and value~="0" and value~=nil and group~=nil) then
            local ChangeValue=value+1-1;
            local SkillGroup=group+1-1;
            local oldValue = TargetChar:getSkill(skillname);
            if (modus==1) then
                TargetChar:increaseSkill(SkillGroup,skillname,ChangeValue);
            elseif (modus==2) then
                TargetChar:increaseSkill(SkillGroup,skillname,-ChangeValue);
            elseif (modus==3) then
                TargetChar:increaseSkill(SkillGroup,skillname,-(TargetChar:getSkill(skillname)-ChangeValue));
            end
            Caster:inform("Value of "..skillname.." set to "..TargetChar:getSkill(skillname));
            TargetChar:inform("Value of "..skillname.." changed by "..Caster.name);
            gm.base.log.Write(User, User.name .. "(" .. User.id .. ") changed skill " .. skillname .. " of " .. TargetChar.name .. "(" .. TargetChar.id .. ") from " .. oldValue .. " to " .. TargetChar:getSkill(skillname));
        end
    else
        Caster:inform("[modus] [skillname] [group] [value]");
        Caster:inform("Groups: 1=Language, 2=Craftsmanship, 3=Magic, 4=Other, 5=Fighting, 6=Druid, 7=Priest, 8=Bard");
        Caster:inform("Mods: increase, decrease, set");
    end
end
