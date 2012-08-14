require("base.common")
module("magic.base.teachspell")

Students = {};

function DoTeachSpell(TeachingChar,StudentChar)

    if (TeachingChar.id == StudentChar.id) then
        base.common.InformNLS(TeachingChar,
        "Du kannst dir nicht selbst Runen beibringen.",
        "You can't teach yourself runes.");
        return;
    end

    if (LuaAnd(StudentChar:getQuestProgress(24),1) ~= 0 ) then
        base.common.InformNLS(TeachingChar,
        "Dein Schüler kann keine Runen lernen.",
        "Your student is not able to learn runes.");
        return;
    end

    if (LuaAnd(TeachingChar:getQuestProgress(24),1) ~= 0 ) then
        base.common.InformNLS(TeachingChar,
        "Du bist nicht in der Lage Runen zu lehren.",
        "You are unable to teach runes.");
        return;
    end

    if (LuaAnd(StudentChar:getMagicFlags(0),2^Rune.value) ~= 0) then
        base.common.InformNLS(TeachingChar,
        "Dein Schüler kennt diese Rune schon.",
        "You student already knows that rune.");
        return;
    end

    if not LTERuneLock( StudentChar ) then
        base.common.InformNLS(TeachingChar,
        "Du kannst diesem Schüler im Augenblick nichts beibringen. Er ist noch nicht bereit dazu.",
        "You can't teach this student anything at the moment. He is not ready yet.");

        base.common.InformNLS(StudentChar,
        "Im Augenblick kannst du keine weiteren Runen lernen. Du bist noch nicht bereit für weitere Runen.",
        "At the moment you can't learn more runes. You are not able yet to learn more.");

        return;
    end

    if Teacher.attribsum then
        if Teacher.attribsum > GetAttributeSum( TeachingChar ) then
            base.common.InformNLS(TeachingChar,
            "Du bist nicht fähig diese Rune zu lehren.",
            "You are not able to teach this rune.");
            return;
        end
    elseif GetAttributeSum( TeachingChar ) < 0 then
        base.common.InformNLS(TeachingChar,
        "Du bist nicht fähig zu lehren.",
        "You are not able to teach.");
        return;
    end

    if Teacher.skill then
        if Teacher.skill.value > GetSkillValue( TeachingChar, Teacher.skill.name ) then
            base.common.InformNLS(TeachingChar,
            "Du bist noch nicht fähig diese Rune zu lehren.",
            "You are not able yet to teach this rune.");
            return;
        end
    end

    if Student.attribsum then
        if Student.attribsum > GetAttributeSum( StudentChar ) then
            base.common.InformNLS(StudentChar,
            "Du bist nicht fähig diese Rune zu lehren.",
            "You are not able to teach this rune.");
            base.common.InformNLS(TeachingChar,
            "Dein Schüler ist nicht fähig diese Rune zu lernen.",
            "Your student ist not able to learn this rune.");
            return;
        end
    elseif GetAttributeSum( StudentChar ) < 0 then
        base.common.InformNLS(StudentChar,
        "Du bist nicht fähig Magie zu erlernen.",
        "You are not able to learn magic.");
        base.common.InformNLS(TeachingChar,
        "Dein Schüler ist nicht fähig Magie zu lernen.",
        "Your student ist not able to learn magic.");
        return;
    end

    if Student.skill then
        if Student.skill.value > GetSkillValue( StudentChar, Student.skill.name ) then
            base.common.InformNLS(StudentChar,
            "Du bist noch nicht fähig diese Rune zu lehren.",
            "You are not able yet to learn this rune.");
            base.common.InformNLS(TeachingChar,
            "Dein Schüler ist noch nicht fähig diese Rune zu lernen.",
            "Your student ist not able yet to learn this rune.");
            return;
        end
    end

    local Language = TeachingChar.activeLanguage;
    TeachingChar.activeLanguage = 10;
    if Rune.name == "BHONA" then
        TeachingChar:talk( Character.whisper, "BHONA" );
    else
        TeachingChar:talk( Character.whisper, Rune.name.." BHONA" );
    end
    TeachingChar.activeLanguage = Language;

    if (Students[TeachingChar.id + StudentChar.id] ~= Rune.value) then
        base.common.InformNLS(TeachingChar,
        "Du konzentrierst dich auf deinen Schüler. Wiederhole deine Worte um ihm die Macht der Rune "..Rune.name.." zu übergeben.",
        "You focus on your student. Repeat your words to give him the power of the rune "..Rune.name..".");
        Students[TeachingChar.id + StudentChar.id] = Rune.value;
        return;
    end

    base.common.InformNLS(TeachingChar,
    "Du gibst deinem Studenten die Kraft der Rune "..Rune.name..".",
    "You give your student the power of the rune "..Rune.name..".");

    base.common.InformNLS(StudentChar,
    "Du fühlst wie die Kraft der Rune "..Rune.name.." deinen Körper durchflutet.",
    "You feel how the power of the rune "..Rune.name.." flows thougth your body.");

    logToFile_magic(os.date()..": "..TeachingChar.name.." gave rune "..Rune.name.." to "..StudentChar.name.."\n");

    LTELockRune( StudentChar );

    StudentChar:teachMagic(0,Rune.value);

    Students[TeachingChar.id + StudentChar.id] = nil;

    if not TeachingRoom( StudentChar.pos ) then
        if Teacher.skill then
            if (Teacher.skill.name~="all") then
                TeachingChar:increaseSkill(3,Teacher.skill.name,-1);
            else
                TeachingChar:increaseSkill(3,"commotio",-1);
                TeachingChar:increaseSkill(3,"transformo",-1);
                TeachingChar:increaseSkill(3,"transfreto",-1);
                TeachingChar:increaseSkill(3,"pervestigatio",-1);
                TeachingChar:increaseSkill(3,"desicio",-1);
            end
        end
    end
end


function logToFile_magic(theString)
    coldLog,errMsg=io.open("/home/martin/teach_magic.txt","a");
    if (coldLog~=nil) then
        coldLog:write(theString);
        coldLog:close();
        return true;
    end
    return false;
end


function LTERuneLock( StudentChar )
    local find, teachEffect = StudentChar.effects:find(22);
    if not find then
        return true;
    end

    local found;
    local RuneIndex;

    found, RuneIndex=teachEffect:findValue("Rune1Index");
    if not found or RuneIndex <= 1 then
        return true;
    end

    found, RuneIndex=teachEffect:findValue("Rune2Index");
    if not found or RuneIndex <= 1 then
        return true;
    end

    return false;
end

function LTELockRune( Char )
    local find, teachEffect = Char.effects:find(22);
    if not find then
        Char.effects:addEffect( LongTimeEffect(22,10) );
        return;
    end

    local waittime=1814400;

	local timestamp=base.common.GetCurrentTimestamp()*3+waittime;

    local found, RuneIndex = teachEffect:findValue("Rune1Index");
    if not found or RuneIndex <= 1 then
        teachEffect:addValue("Rune1Index",timestamp);
        return;
    end

    found, RuneIndex = teachEffect:findValue("Rune2Index");
    if not found or RuneIndex <= 1 then
        teachEffect:addValue("Rune2Index",timestamp);
    end
end

function GetAttributeSum( Char )

	local intbonus, essbonus, willbonus;
	intbonus, essbonus, willbonus = GetAttributeBonus(Char);

    local Int = Char:increaseAttrib("intelligence",0) + intbonus;
    local Ess = Char:increaseAttrib("essence",0) + essbonus;
    local Wil = Char:increaseAttrib("willpower",0) + willbonus;

    if ( Int < 10 ) or ( Ess < 10 ) or ( Wil < 10 ) then
        return -1;
    end

    return Int+Ess+Wil;
end

function GetAttributeBonus(Char)
	local Breast = Char:getItemAt(Character.breast);
	local RTool = Char:getItemAt(Character.right_tool);
	local LTool = Char:getItemAt(Character.left_tool);
	local RRing = Char:getItemAt(Character.finger_right_hand);
	local LRing = Char:getItemAt(Character.finger_left_hand);
	local idx,str,idx2,str2;
	local Int = 0;
	local Ess = 0;
	local Wil = 0;
	
	idx,str,idx2,str2 = base.common.GetBonusFromTool(Breast);
	if(idx == 1) then
		Int = Int + str;
	elseif (idx == 7) then
		Ess = Ess + str;
		Wil = Wil + str;
	end
	if(idx2 == 1) then
		Int = Int + str2;
	elseif (idx2 == 7) then
		Ess = Ess + str2;
		Wil = Wil + str2;
	end
	
	idx,str,idx2,str2 = base.common.GetBonusFromTool(RTool);
	if(idx == 1) then
		Int = Int + str;
	elseif (idx == 7) then
		Ess = Ess + str;
		Wil = Wil + str;
	end
	if(idx2 == 1) then
		Int = Int + str2;
	elseif (idx2 == 7) then
		Ess = Ess + str2;
		Wil = Wil + str2;
	end
	idx,str,idx2,str2 = base.common.GetBonusFromTool(LTool);
	if(idx == 1) then
		Int = Int + str;
	elseif (idx == 7) then
		Ess = Ess + str;
		Wil = Wil + str;
	end
	if(idx2 == 1) then
		Int = Int + str2;
	elseif (idx2 == 7) then
		Ess = Ess + str2;
		Wil = Wil + str2;
	end
	
	idx,str,idx2,str2 = base.common.GetBonusFromTool(RRing);
	if(idx == 1) then
		Int = Int + str;
	elseif (idx == 7) then
		Ess = Ess + str;
		Wil = Wil + str;
	end
	if(idx2 == 1) then
		Int = Int + str2;
	elseif (idx2 == 7) then
		Ess = Ess + str2;
		Wil = Wil + str2;
	end
	idx,str,idx2,str2 = base.common.GetBonusFromTool(LRing);
	if(idx == 1) then
		Int = Int + str;
	elseif (idx == 7) then
		Ess = Ess + str;
		Wil = Wil + str;
	end
	if(idx2 == 1) then
		Int = Int + str2;
	elseif (idx2 == 7) then
		Ess = Ess + str2;
		Wil = Wil + str2;
	end
	
	return Int, Ess, Wil;
end

function GetSkillValue( Char, Skill )
    if ( Skill == "all" ) then
        return Char:getSkill("commotio")+Char:getSkill("transformo")+Char:getSkill("transfreto")+Char:getSkill("pervestigatio")+Char:getSkill("desicio");
    else
        return Char:getSkill( Skill );
    end
end

function TeachingRoom( posi )
    if ((posi.x>=14) and (posi.x<=16) and (posi.y>=3) and (posi.y<=5) and (posi.z==-60)) then
        world:gfx(53,position(12,1,-60));
        world:gfx(53,position(12,7,-60));
        world:gfx(53,position(18,1,-60));
        world:gfx(53,position(18,7,-60));
        return true;
    elseif ((posi.x>=290) and (posi.x<=296) and (posi.y>=-342) and (posi.y<=-336) and (posi.z==-6)) then
        world:gfx(53,position(290,-342,-6));
        world:gfx(53,position(296,-342,-6));
        world:gfx(53,position(296,-336,-6));
        world:gfx(53,position(290,-336,-6));
        return true;
    end;
    return false;
end

function CastMagic(Caster,counter,param, ltstate)
    base.common.InformNLS( Caster,
    "Dieser Zauber hat hier keinen Effekt.",
    "This spell has no effect at all here." );
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param, ltstate)
    if TargetCharacter then
        DoTeachSpell(Caster, TargetCharacter, ltstate);
    else
        CastMagic(Caster,counter,param,ltstate);
    end
end

function CastMagicOnField(Caster,Targetpos,counter,param, ltstate)
    base.common.InformNLS( Caster,
    "Dieser Zauber hat hier keinen Effekt.",
    "This spell has no effect at all here." );
end

function CastMagicOnItem(Caster,TargetItem,counter,param, ltstate)
    base.common.InformNLS( Caster,
    "Dieser Zauber hat hier keinen Effekt.",
    "This spell has no effect at all here." );
end
