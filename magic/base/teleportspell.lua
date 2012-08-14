require("magic.base.basics");
module("magic.base.teleportspell")

function DoTeleSpell(Caster, TargetPos, ltstate)
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
        local message = string.gsub( TimeEffects.msg[Player.german], "{PP}", genderMsg[Player.german] );
        --Caster:talkLanguage( Character.say,  Player.german, message );
        message = string.gsub( TimeEffects.msg[Player.english], "{PP}", genderMsg[Player.english] );
        --Caster:talkLanguage( Character.say, Player.english, message );
        Caster:startAction( base.common.Limit( TimeEffects.delay + GemBonis.Time, 0 ), TimeEffects.gfx.id, TimeEffects.gfx.time, TimeEffects.sfx.id, TimeEffects.sfx.time);
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

    local drift = base.common.Limit( base.common.Scale( Teleport.Drift.minSkill, Teleport.Drift.maxSkill, CasterVal ), 0 );

    if drift > 0 then
        drift = math.random( 0, drift );
        local phi = math.random()*2;
        TargetPos = position( math.floor(TargetPos.x+drift*math.sin( phi * math.pi )), math.floor(TargetPos.y+drift*math.cos( phi * math.pi )), TargetPos.z );
    end

    magic.base.basics.performGFX(  Teleport.StartLocation.gfx, Caster.pos );
    magic.base.basics.performSFX(  Teleport.StartLocation.sfx, Caster.pos );

    local oldPos = base.common.CopyPosition( Caster.pos );
    Caster:warp( TargetPos );
    if not equapos( TargetPos, Caster.pos ) then
        Caster:warp( oldPos );
    end

    if not equapos( oldPos, Caster.pos ) then
        magic.base.basics.performGFX( Teleport.TargetLocation.gfx, Caster.pos );
        magic.base.basics.performSFX( Teleport.TargetLocation.sfx, Caster.pos );
    end

    if (LuaAnd(Caster:getQuestProgress(24),1) ~= 0 ) then
        return;
    end

    --Caster:learn( 3, Skill.name, 2, Skill.max );
	--Replace with new learn function, see learn.lua 
end

function CastMagic(Caster,counter,param, ltstate)
    DoTeleSpell(Caster,base.common.GetFrontPosition( Caster ), ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter,counter,param, ltstate)
    base.common.InformNLS( Caster,
    "Es ist nicht sinnvoll sich auf ein anderes Lebewesen zu teleportieren.",
    "Its not useful to teleport on another entity" );
end

function CastMagicOnField(Caster,Targetpos,counter,param, ltstate)
    DoTeleSpell(Caster,Targetpos, ltstate);
end

function CastMagicOnItem(Caster,TargetItem,counter,param, ltstate)
    DoTeleSpell(Caster,TargetItem.pos, ltstate);
end
