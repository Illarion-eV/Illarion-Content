require("magic.base.basics");
module("magic.base.gfxspell")

function DoGFXSpell(Caster, TargetPos, ltstate)
    if not ltstate then
        return false;
    end
    Hitted_already = {};
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

    local SpellRadius=CalcEffectRadius(CalcRadius(),CasterVal);

    HittedPosition = {};
    if (Caster.pos == TargetPos) and TargetEffects and (TargetEffects.minSkill.hitpoints < 0 or TargetEffects.minSkill.foodpoints < 0 or TargetEffects.minSkill.actionpoints < 0 or TargetEffects.minSkill.manapoints < 0 or TargetEffects.minSkill.poison > 0 ) then
        table.insert(HittedPosition, base.common.GetFrontPosition( Caster ) );
    else
        table.insert(HittedPosition, base.common.CopyPosition(TargetPos) );
    end
    if ( SpellEffects.Line ~= nil and ( ( SpellEffects.Line.gfx ~= nil and SpellEffects.Line.gfx ~= 0 ) or ( SpellEffects.Line.sfx ~= nil and SpellEffects.Line.sfx ~= 0 ) ) ) or Settings.FirstInLine or Settings.AllInLine then
        base.common.CreateLine(Caster.pos,TargetPos,function( currPos )
            if ( Caster.pos == currPos ) then
                return true;
            end
            if not Settings.FirstInLine or not world:isCharacterOnField( currPos ) then
                if SpellEffects.line.gfx and SpellEffects.line.gfx ~= 0 then
                    world:gfx( SpellEffects.line.gfx, currPos );
                end
                if SpellEffects.line.sfx and SpellEffects.line.sfx ~= 0 then
                    world:makeSound( SpellEffects.line.sfx, currPos );
                end
                return true;
            end

            if not Settings.AllInLine then
                HittedPosition[1] = base.common.CopyPosition(currPos);
                return false;
            else
                table.insert(HittedPosition, base.common.CopyPosition(currPos) );
            end
            return true;
        end );
    end

    local HittedSomeone = false;
    local retVal = false;

    local reduce = 0;
    for k, HitPosi in pairs(HittedPosition) do
        retVal = HitOnPosition( Caster, CasterVal, HitPosi, 1-reduce, 0 );
        if not HittedSomeone then
            HittedSomeone = retVal;
        end
        if SpellRadius > 0 then
            for i=1,SpellRadius do
                base.common.CreateCircle(HitPosi,i,function( posi )
                    local retVal = HitOnPosition( Caster, CasterVal, posi, 1-0.15*i-reduce, i );
                    if not HittedSomeone then
                        HittedSomeone = retVal;
                    end
                end );
            end
        end
        reduce = reduce - 0.15;
    end

    if (LuaAnd(Caster:getQuestProgress(24),1) ~= 0 ) then
        return;
    end

    if HittedSomeone then
        --Caster:learn( 3, Skill.name, 2, Skill.max );
		--Replace with new learn function, see learn.lua 
    end
end

function HitOnPosition( Caster, CasterValue, posi, percent, radius )
    local showEffects = false;
    showEffects = removeItemFromMap(SpellEffects[radius].removeItem, posi, magic.base.basics.CasterValue );
    if not world:isCharacterOnField(posi) then
        if SpellEffects[radius] ~= nil and ( showEffects or not SpellEffects.justAtHit ) then
            magic.base.basics.performGFX( SpellEffects[radius].gfx, posi );
            magic.base.basics.performSFX( SpellEffects[radius].sfx, posi );
        end
        return showEffects;
    end

    local HitChar  = world:getCharacterOnField( posi );

    if Hitted_already[HitChar.id] then
        return true;
    else
        Hitted_already[HitChar.id] = true;
    end

    local MagicRes;
    if TargetEffects and (TargetEffects.minSkill.hitpoints < 0 or TargetEffects.minSkill.foodpoints < 0 or TargetEffects.minSkill.actionpoints < 0 or TargetEffects.minSkill.manapoints < 0 or TargetEffects.minSkill.poison > 0 ) then
        MagicRes = magic.base.basics.MagicResistence( HitChar );
    else
        MagicRes = 0;
    end

    if ( MagicRes <= magic.base.basics.CasterValue ) then
        showEffects = TargetHitting( Caster, HitChar, magic.base.basics.CasterValue, MagicRes, percent );
        if SpellEffects[radius] ~= nil and ( showEffects or not SpellEffects.justAtHit ) then
            magic.base.basics.performGFX( SpellEffects[radius].gfx, posi );
            magic.base.basics.performSFX( SpellEffects[radius].sfx, posi );
        end
    elseif ( MagicRes > magic.base.basics.CasterValue * 2 ) then
        showEffects = TargetHitting( Caster, Caster, magic.base.basics.CasterValue, magic.base.basics.MagicResistence( Caster ), percent );
        world:gfx( 10, posi );
        if SpellEffects[radius] ~= nil and ( showEffects or not SpellEffects.justAtHit ) then
            magic.base.basics.performGFX( SpellEffects[radius].gfx, Caster.pos );
            magic.base.basics.performSFX( SpellEffects[radius].sfx, Caster.pos );
        end
        base.common.InformNLS( Caster,
        "Dein Ziel ist derart resistent gegen Magie das dein Zauber auf dich zurückgeworfen wird.",
        "Your target is that resistent against magic that your spell returns to you." );
    else
        world:gfx( 10, posi );
    end

    return true;
end

function TargetHitting( Caster, Target, CasterValue, Resistance, Percent)
    if not TargetEffects then
        return false;
    end
    if (Percent == nil) then
        Percent = 1;
    end

    if (Target:increaseAttrib("hitpoints",0) == 0) then
        return false;
    end

    local Value = (magic.base.basics.CasterValue - Resistance)*Percent;

    if TargetEffects.minSkill.hitpoints and TargetEffects.maxSkill.hitpoints then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.hitpoints, TargetEffects.maxSkill.hitpoints, Value));
        if (AttribEffect~=0) then
            local oldHP = Target:increaseAttrib("hitpoints", 0 );
            if( oldHP > 1 and oldHP+AttribEffect < 2 and Target:getType()~=1 ) then
                Target:increaseAttrib("hitpoints", 1 - oldHP );
                local CharOffsetX = base.common.Limit(Caster.pos.x - Target.pos.x,-1,1);
                local CharOffsetY = base.common.Limit(Caster.pos.y - Target.pos.y,-1,1);
                local newPos = position( Target.pos.x + CharOffsetX, Target.pos.y + CharOffsetY, Target.pos.z );
                Target:warp( newPos );
                Target:talkLanguage( Character.say, Player.german,  "#me stolpert zurück und geht zu Boden." );
                Target:talkLanguage( Character.say, Player.english, "#me stumbles back and falls to the ground." );
                base.common.ParalyseCharacter(Target, 7, false, true);

                local reg_found, reg_effect = Target.effects:find(2);
                if reg_found then
                    reg_effect:addValue( "no_reg", 20 );
                end
            else
                Target:increaseAttrib("hitpoints",AttribEffect);
            end
        end
    end

    if TargetEffects.minSkill.foodpoints and TargetEffects.maxSkill.foodpoints then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.foodpoints, TargetEffects.maxSkill.foodpoints, Value));
        if (AttribEffect~=0) then
            while( AttribEffect ~= 0 ) do
                Target:increaseAttrib( "foodlevel", Limit(AttribEffect,-10000,10000) );
                AttribEffect = AttribEffect - base.common.Limit(AttribEffect,-10000,10000);
            end
        end
    end

    if TargetEffects.minSkill.manapoints and TargetEffects.maxSkill.manapoints then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.manapoints, TargetEffects.maxSkill.manapoints, Value));
        if (AttribEffect~=0) then
            Target:increaseAttrib("mana",AttribEffect);
        end
    end

    if TargetEffects.minSkill.poison and TargetEffects.maxSkill.poison then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.poison, TargetEffects.maxSkill.poison, Value));
        if (AttribEffect~=0) then
		Caster:inform("poison: "..AttribEffect);
            Target:setPoisonValue( Target:getPoisonValue() + AttribEffect );
        end
    end

    if TargetEffects.minSkill.actionpoints and TargetEffects.maxSkill.actionpoints then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.actionpoints, TargetEffects.maxSkill.actionpoints, Value));
        if (AttribEffect~=0) then
            Target.movepoints = Target.movepoints + AttribEffect;
        end
    end

    if TargetEffects.minSkill.posoffset and TargetEffects.maxSkill.posoffset then
        local AttribEffect = math.floor(base.common.Scale(TargetEffects.minSkill.posoffset, TargetEffects.maxSkill.posoffset, Value));
        if (AttribEffect~=0) and Target:getType() ~= 2 then
            local phi;
            if ( Caster.id == Target.id ) then
                phi = math.random()*2;
            else
                phi = base.common.GetPhi( Caster.pos, Target.pos );
            end
            local NewPos = position( math.floor(Target.pos.x+AttribEffect*math.cos( phi )), math.floor(Target.pos.y+AttribEffect*math.sin( phi )), Target.pos.z );
            Target:warp( NewPos );
        end
    end

    if (LuaAnd(Target:getQuestProgress(24),1) ~= 0 ) then
        return true;
    end

    if ( Caster.id == Target.id ) then
        return true;
    end

    if (magic.base.basics.MaximalMagicResistance( Target ) > Target:getSkill(Skill.magicResistance)) then
        --Target:learn(3,"magic resistance",2,100);
		--Replace with new learn function, see learn.lua 
    end
    return true;
end

function removeItemFromMap( ItemData, Target, CasterVal )
    if not ItemData then
        return false;
    end
    if not world:isItemOnField( Target ) then
        return false;
    end

    local theItem = world:getItemOnField( Target );

    if theItem.wear == 255 then
        return false;
    end

    if (ItemData.minSkill and ItemData.maxSkill) then
        CasterVal = base.common.Limit( CasterVal, 0, 100 );
        local chance = base.common.Scale( ItemData.minSkill.chance, ItemData.maxSkill.chance, CasterVal );

        if (math.random(100) > chance) then
            return false;
        end
    end

    local found = false;
    if ( type(ItemData.id) == "table" ) then
        for i,id in pairs(ItemData.id) do
            if id == theItem.id then
                found = true;
            end
        end
    else
        if ItemData.id == theItem.id then
            found = true;
        end
    end

    if not found then
        return false;
    end

    if ItemData.killIllusions and theItem.quality == 100 then
        world:erase( theItem, theItem.number );
        return true;
    end

    local qual = base.common.Round( base.common.Scale( ItemData.minSkill.quality, ItemData.maxSkill.quality, CasterVal ) );
    local data = base.common.Round( base.common.Scale( ItemData.minSkill.data,    ItemData.maxSkill.data,    CasterVal ) );
    local wear = base.common.Round( base.common.Scale( ItemData.minSkill.wear,    ItemData.maxSkill.wear,    CasterVal ) );
    local numb = base.common.Round( base.common.Scale( ItemData.minSkill.number,  ItemData.maxSkill.number,  CasterVal ) );

    if ( qual == 0 ) and ( data == 0 ) and ( wear == 0 ) and ( numb == 0 ) then
        world:erase( theItem, theItem.number );
        return true;
    end

    if (qual ~= 0 ) then
        if ( theItem.quality + qual > 101 ) then
            theItem.quality = theItem.quality + qual;
        else
            world:erase( theItem, theItem.number );
            return true;
        end
    end

    if (data ~= 0 ) then
        if ( tonumber(theItem:getData("magicData")) + data > -1 ) then
            theItem:setData("magicData", tonumber(theItem:getData("magicData")) + data);
        else
            world:erase( theItem, theItem.number );
            return true;
        end
    end

    if (wear ~= 0 ) then
        if ( theItem.wear + wear > -1 ) then
            theItem.wear = theItem.wear + wear;
        else
            world:erase( theItem, theItem.number );
            return true;
        end
    end

    if (numb ~= 0 ) then
        if ( theItem.number + numb > 0 ) then
            theItem.number = theItem.number + numb;
        else
            world:erase( theItem, theItem.number );
            return true;
        end
    end

    world:changeItem( theItem );
    return true;
end

function CalcRadius()
    local Radius = 0;
    repeat
        if (SpellEffects[Radius+1] == nil) then
            return Radius;
        end
        Radius = Radius + 1;
    until( false );
end

function CalcEffectRadius(Radius,CasterTry)
    return base.common.Limit( math.floor( Radius * CasterTry / Skill.max + GemBonis.Radius ), 0, Radius );
end

function CastMagic(Caster,ltstate)
    DoGFXSpell(Caster,Caster.pos, ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
    if TargetCharacter then
        DoGFXSpell(Caster, TargetCharacter.pos, ltstate);
    else
        CastMagic(Caster,ltstate);
    end
end

function CastMagicOnField(Caster,Targetpos, ltstate)
    DoGFXSpell(Caster,Targetpos, ltstate);
end

function CastMagicOnItem(Caster,TargetItem, ltstate)
    DoGFXSpell(Caster,TargetItem.pos,ltstate );
end
