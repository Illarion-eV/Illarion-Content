--[[
    Open a teleporter gate
    Rune 1 & 15 & 21 & 23
        JUS FHEN ANTH KEL

    Spezial-Spell

    SQL:    INSERT INTO spells VALUES (2^0+2^14+2^20+2^22,0,'m_01_15_21_23_open-tp-gate.lua');
]]

require("magic.base.basics");
module("magic.spell_01_15_21_23_open-tp-gate", package.seeall)
-- setting the filename of the current script. This is needed to exchange them later if needed while runtime
Script = "m_01_15_21_23_open-tp-gate.lua";

-- Skill related spell settings
Skill = {
    ["min"]  =         50,  -- minimal Skillvalue needed to cast the spell
    ["max"]  =        100,  -- maximal Skillvalue of the spell where it reaches its full effect
    ["name"] = "pervestigatio"   -- name of the skill that is needed for this spell
}

-- General Spell settings
Settings = {
    ["Runes"] = "JUS FHEN ANTH KEL",   -- Names of the runes the spell contains of. This is the text spoken when the spell is casted
    ["Range"] = 8,          -- Maximum distance in tiles between the target of the spell and the caster
    ["FirstInLine"] = false  -- Perform a line of flight calculation and hit the first character on this line or the destination the caster pointed at
}

-- Grafik and Sound effects that appear when the spell is casted successfully
SpellEffects = {
    ["gfx"] = 41,        -- Grafic effect that is shown
    ["sfx"] = 4         -- Sound effect that is placed
}

-- Time related effects of the spell
TimeEffects = {
    ["delay"] = 40,         -- Casting delay before the spell is actually casted in 1/10 seconds (while this time the Caster can be interrupted)
    ["gfx"] = {             -- The the graphic effect informations that are used while the casting delay
        ["id"] = 21,        -- The gfx id that is shown while the casting delay
        ["time"] = 10       -- The time in 1/10 seconds that has to pass before the gfx is played a second time
    },
    ["sfx"] = {             -- The sound effect informations that are used while the casting delay
        ["id"] = 0,         -- The id of the sound effect that played while the casting delay
        ["time"] = 0        -- The time in 1/10 seconds that has to pass before the sound effect is played a second time
    },
    ["msg"] = {             -- The messages that are shown before the time delay is started in german and english
        [Player.german ] = "#me beginnt mit einer mystischen Formel.",
        [Player.english] = "#me starts with a mystical formula."
    }
}

-- effects on the caster when he castes the spell, the effects are interpolated linear from minSkill to maxSkill
CasterEffects = {
    ["minSkill"] = {                -- effects that are caused in case the caster has to minimum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -20,   -- increase of the action points
        ["manapoints"]   = -8000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    },
    ["maxSkill"] = {               -- effects that are caused in case the caster has the maximum needed skill
        ["hitpoints"]    =     0,   -- increase of the hitpoints
        ["foodpoints"]   =     0,   -- increase of the foodlevel
        ["actionpoints"] =   -10,   -- increase of the action points
        ["manapoints"]   = -2000,   -- increase of the mana
        ["poison"]       =     0,    -- increase of the poison value
        ["posoffset"]    =     0    -- change the position of the character by this value from the caster away
    }
}

Portal = {
    ["minSkill"] = {
        ["stability"] = 0,
        ["offset"] = 5
    },
    ["maxSkill"] = {
        ["stability"] = 10,
        ["offset"] = -3
    }
}


-- Racial bonis
magic.base.basics.magic.base.basics.initRaceBoni(); -- Init or reset all preset racial boni values

-- make sure that we remember that this is the original script loaded on this spell
if (orgScript == nil) then
    orgScript = Script;
end

function CastMagic(Caster, ltstate)
    DoTeleportSpell(Caster,base.common.GetFrontPosition(Caster), ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter, ltstate)
    DoTeleportSpell(Caster,base.common.GetFrontPosition(TargetCharacter), ltstate);
end

function CastMagicOnField(Caster,Targetpos, ltstate)
    DoTeleportSpell(Caster,Targetpos, ltstate);
end

function CastMagicOnItem(Caster,TargetItem, ltstate)
    DoTeleportSpell(Caster,TargetItem.pos, ltstate);
end

function DoTeleportSpell(Caster,TargetPos, ltstate)
    if ((Caster.lastSpokenText~="JUS FHEN ANTH KEL") and
        (Caster.lastSpokenText~="#me beginnt mit einer mystischen Formel.") and
        (Caster.lastSpokenText~="#me starts with a mystical formula.")) then
        TalkedText=Caster.lastSpokenText;
    end

    if ( ltstate == Action.abort ) then
        Caster:talkLanguage(Character.say, Player.german, "#me stoppt apprupt mit dem Zaubern.");
        Caster:talkLanguage(Character.say, Player.english,"#me abruptly stops casting.");
        return;
    end

    magic.base.basics.loadCorrectDefScript();

    -- Generate the needed
    magic.base.basics.gemBonis( Caster );

    genderMsg = {};
    genderMsg[Player.german], genderMsg[Player.english] = magic.base.basics.GenderMessage( Caster );

    if ( Caster:distanceMetricToPosition(TargetPos) > Settings.Range + GemBonis.Range) then
        base.common.InformNLS( Caster,
        "Du bist zuweit weg um diesen Zauber zu sprechen.",
        "You are too far away to cast this spell." );
        return;
    end

    if not base.common.IsLookingAt( Caster, TargetPos ) then
        base.common.InformNLS( Caster,
        "Du drehst dich auf dein Ziel zu um es in dein Blickfeld zu bekommen.",
        "You turn to your target to get it into your field of vision.");
        base.common.TurnTo( Caster, TargetPos );
    end

    if ( ltstate == Action.none ) then
        Caster:startAction( TimeEffects.delay + GemBonis.Time, TimeEffects.gfx.id, TimeEffects.gfx.time, TimeEffects.sfx.id, TimeEffects.sfx.time);
        local message = string.gsub( TimeEffects.msg[Player.german], "{PP}", genderMsg[Player.german] );
        Caster:talkLanguage( Character.say,  Player.german, message );
        message = string.gsub( TimeEffects.msg[Player.english], "{PP}", genderMsg[Player.english] );
        Caster:talkLanguage( Character.say, Player.english, message );
        return;
    end

    magic.base.basics.SayRunes( Caster );

    local CasterVal=magic.base.basics.CasterValue( Caster );

    if not magic.base.basics.CheckAndReduceRequirements( Caster, CasterVal ) then
        return;
    end

    if not CasterVal then
        base.common.InformNLS( Caster,
        "Es gelingt dir nicht die nötige Konzentration aufzubringen um diesen Zauber zur Entfaltung zu bringen.",
        "You fail to concentrate enought to get this spell to its evolvement." );
        return;
    end


    if not ChoseAndOpenGate(TalkedText,TargetPos, CasterVal, Caster) then
        base.common.InformNLS( Caster,
        "Der Spruch gelingt doch das Portal schliest sich sogleich wieder.",
        "The spell succeeds but the portal closes again instandly.");
    else
        magic.base.basics.performGFX( SpellEffects.gfx, TargetPos );
        magic.base.basics.performSFX( SpellEffects.sfx, TargetPos );
    end

    if (LuaAnd(Caster:getQuestProgress(24),1) ~= 0 ) then
        return;
    end

    --Caster:learn( 3, Skill.name, 2, Skill.max );
	--Replace with new learn function, see learn.lua 
end

function ChoseAndOpenGate(Text,TPos, CasterVal, Caster)
    local GateQual=0;
    if (string.find(Text,"[Tt]roll.*[Bb]ane")~=nil) then
        if (string.find(Text,"[Ll]ibrary")~=nil or string.find(Text,"[Bb]ibliothek")~=nil) then
            if (string.find(Text,"[Tt]op")~=nil or string.find(Text,"[Dd]ach")~=nil) then
                GateQual=24;
            else
                GateQual=23;
            end
        elseif (string.find(Text,"[Ww]orkshop")~=nil or string.find(Text,"[Ww]erkstatt")~=nil) then
            GateQual=29;
        elseif (string.find(Text,"[Ee]liza")~=nil or string.find(Text,"[Ss]hop")~=nil or string.find(Text,"[Ll]aden")~=nil) then
            GateQual=25;
        elseif (string.find(Text,"[Mm]arket.*[Pp]lace")~=nil or string.find(Text,"[Mm]arkt.*[Pp]latz")~=nil) then
            GateQual=26;
        elseif (string.find(Text,"[Tt]avern")~=nil) then
            if (string.find(Text,"[Tt]op")~=nil or string.find(Text,"[Dd]ach")~=nil) then
                GateQual=28;
            else
                GateQual=27;
            end
        elseif (string.find(Text,"[Ii]nn")~=nil or string.find(Text,"[Gg]ast")~=nil) then
            if (string.find(Text,"[Tt]op")~=nil or string.find(Text,"[Dd]ach")~=nil) then
                GateQual=31;
            else
                GateQual=30;
            end
        elseif (string.find(Text,"[Aa]rena")~=nil) then
            GateQual=73;
        else
            GateQual=1;
        end
    elseif (string.find(Text,"[Ll]ighthouse")~=nil or string.find(Text,"[Ll]euchtturm")~=nil) then
        GateQual=2;
    elseif (string.find(Text,"[Ee]ldan.*[Mm]onastery")~=nil or string.find(Text,"[Ee]ldan.*[Kk]loster")~=nil) then
        GateQual=3;
    elseif (string.find(Text,"[Hh]arbor")~=nil or string.find(Text,"[Hh]afen")~=nil) then
        GateQual=4;
    elseif (string.find(Text,"[Gg]reen.*[Bb]riar")~=nil) then
        GateQual=5;
    elseif (string.find(Text,"[Tt]ol.*[Vv]anima")~=nil) then
    	if (string.find(Text,"[Gg]arten")~=nil or string.find(Text,"[Gg]arden")~=nil) then
	    GateQual=60;
	else
            GateQual=6;
	end
    elseif (string.find(Text,"[Mm]eeting")~=nil or string.find(Text,"[Tt]reff")~=nil) then
        GateQual=57;
    elseif (string.find(Text,"[Vv]arshikar")~=nil) then
        GateQual=7;
    elseif (string.find(Text,"[Ss]il[bv]erbrand")~=nil) then
        GateQual=8;
    elseif (string.find(Text,"[Gg]r[ea][uy].+[Rr]ose")~=nil) then
        if (string.find(Text,"[Cc]astle")~=nil or string.find(Text,"[Bb]urg")~=nil) then
            if (string.find(Text,"[Tt]op")~=nil or string.find(Text,"[Dd]ach")~=nil) then
                GateQual=9;
            else
                GateQual=56;
            end
        end
    elseif (string.find(Text,"[Tt]emple.*[Rr]uin")~=nil) then
        GateQual=10;
    elseif (string.find(Text,"[Gg]raveyard")~=nil or string.find(Text,"[Ff]riedhof")~=nil) then
        GateQual=11;
    elseif (string.find(Text,"[Oo]asis")~=nil or string.find(Text,"[Oo]ase")~=nil) then
        GateQual=12;
    elseif (string.find(Text,"[Ss]irani")~=nil) then
        if (string.find(Text,"[Ii]sland")~=nil or string.find(Text,"[Ii]nsel")~=nil) then
            GateQual=13;
        elseif (string.find(Text,"[Hh]ug")~=nil or string.find(Text,"[Bb]ucht")~=nil) then
            GateQual=14;
        end;
    elseif (string.find(Text,"[Zz]elphia")~=nil) then
        GateQual=15;
    elseif (string.find(Text,"[Ss]wamp")~=nil or string.find(Text,"[Ss][uü]mpf")~=nil) then
        GateQual=16;
    elseif (string.find(Text,"[Aa]dron")~=nil) then
        GateQual=17;
    elseif (string.find(Text,"[Mm]ountain")~=nil or string.find(Text,"[Bb]erg")~=nil or string.find(Text,"[Gg]ebirg")~=nil) then
        if (string.find(Text,"[Cc]opper")~=nil or string.find(Text,"[Kk]upfer")~=nil) then
            GateQual=18;
        elseif (string.find(Text,"[Oo]r[ck]")~=nil) then
	    if (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=20;
	    elseif (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
	        GateQual=68;
	    elseif (string.find(Text,"[Ww]est")~=nil) then
	        GateQual=69;
	    end
        elseif (string.find(Text,"[Oo]g[er]+")~=nil) then
	    if  (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
	    	GateQual=70;
	    elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
            	GateQual=71;
	    elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
	    	GateQual=72;
	    elseif (string.find(Text,"[Ww]est")~=nil) then
	    	GateQual=22;
	    end
        end;
    elseif (string.find(Text,"[Kk]umdah.*[Dd]esert")~=nil or string.find(Text,"[Kk]umdah.*[Ww]üste")~=nil) then
        GateQual=19;
    elseif (string.find(Text,"[Bb]loodskull")~=nil) then
        GateQual=21;
    elseif (string.find(Text,"[Ww]ood")~=nil or string.find(Text,"[Ff]orest")~=nil or string.find(Text,"[Ww][aä]ld")~=nil) then
        if (string.find(Text,"[Tt]roll")~=nil) then
            if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
                GateQual=32;
            elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
                GateQual=33;
            elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=34;
            elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=35;
            end
        elseif (string.find(Text,"[Ss]kelet")~=nil) then
            if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
                GateQual=36;
            elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
                GateQual=37;
            elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=38;
            elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=39;
            end
        elseif (string.find(Text,"[Ss]outhern")~=nil or string.find(Text,"[Ss]üdlich")~=nil) then
            if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
                GateQual=40;
            elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
                GateQual=41;
	    elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=43;
            elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=42;
            end
        elseif (string.find(Text,"[Nn]orthern")~=nil or string.find(Text,"[Nn]ördlich")~=nil) then
            if (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=46;
            elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
                GateQual=45;
            elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=47;
	    elseif (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
	        GateQual=44;
            end
        elseif (string.find(Text,"[Bb]riar")~=nil) then
            if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
                GateQual=48;
            elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
                GateQual=49;
            elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=50;
            elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=51;
            end
        elseif (string.find(Text,"[Ee]astern")~=nil or string.find(Text,"[Öö]stlich")~=nil) then
            if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
                GateQual=52;
            elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
                GateQual=54;
	    elseif (string.find(Text,"[Ww]est")~=nil) then
                GateQual=55;
	    elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
	        GateQual=53;
            end
	elseif (string.find(Text,"[Ww]estern")~=nil or string.find(Text,"[Ww]estlich")~=nil) then
	    if (string.find(Text,"[Nn]orth")~=nil or string.find(Text,"[Nn]ord")~=nil) then
	    	GateQual=63;
	    elseif (string.find(Text,"[Ss]outh")~=nil or string.find(Text,"[Ss]üd")~=nil) then
		GateQual=65;
	    elseif (string.find(Text,"[Ee]ast")~=nil or string.find(Text,"[Oo]st")~=nil) then
		GateQual=64;
	    elseif (string.find(Text,"[Ww]est")~=nil) then
		GateQual=66;
	    end

	end
    elseif (string.find(Text,"[Ff]armer")~=nil) then
        GateQual=58;
    elseif (string.find(Text,"[Mm]agic")~=nil or string.find(Text,"[Mm]agisch")~=nil or string.find(Text,"[Aa][ck]adem[iy]e*")~=nil) then
        GateQual=59;
    elseif (string.find(Text,"[Hh]ellbriar")~=nil) then
    	GateQual=61;
    elseif (string.find(Text,"[Zz]zyathis")~=nil) then
        GateQual=62;
    elseif (string.find(Text,"[Cc]aelum")~=nil) then
    	GateQual=67;
    elseif (string.find(Text,"[Gg]oblin Isle")~=nil) or string.find(Text,"[Gg]oblin Insel")~=nil then
    	GateQual=74;
    elseif (string.find(Text,"[Ss]ecret [Pp]lace")~=nil) then
    	GateQual=75;
	elseif (string.find(Text,"[Ii]rundar [Oo]utside")~=nil) then
		GateQual=90;	
	elseif (string.find(Text,"[Ii]rundar [Mm]arketplace")~=nil) then
        GateQual=91;
    elseif (string.find(Text,"[Ii]rundar [Cc]astle")~=nil) then
        GateQual=92;
    elseif (string.find(Text,"[Ii]rundar [Ll]abyrinth")~=nil) then
        GateQual=93;
	elseif (string.find(Text,"[Ii]rundar [Ww]ell")~=nil) then
        GateQual=94;
    end

    if (GateQual==0) then
        return false;
    end
	
    local stability = base.common.Limit( base.common.Round( base.common.Scale( Portal.minSkill.stability, Portal.maxSkill.stability, CasterVal ) ), 0, 9 );
    local offset    = base.common.Limit( base.common.Round( base.common.Scale( Portal.minSkill.offset,    Portal.maxSkill.offset,    CasterVal ) ), 0, 5 );

    if (stability == 0) then
        return false;
    end

    -- Irundar just for admins
    if (GateQual > 89) and (GateQual < 95) then
        if not (Caster:isAdmin()) then
            return false;
        end
	else
		GateQual = GateQual + math.random( -offset, offset );
	    GateQual = base.common.Limit( GateQual, 1, 75 );
    end



    if (world:isCharacterOnField(TPos)) then
        return false;
    end

    world:createItemFromId(10,1,TPos,true,stability*100+33,GateQual);
    return true;
end
