require("magic.base.basics");
module("magic.base.itemspell")

function DoItemSpell(Caster, TargetPos, ltstate)
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

    if Spot then
        if Spot.item and createItemOnMap( Spot.item, TargetPos, CasterVal ) then
            magic.base.basics.performGFX( Spot.gfx, TargetPos );
            magic.base.basics.performSFX( Spot.sfx, TargetPos );
        end
    end

    if Wall then
        base.common.CreateTangentLine( Caster.pos, TargetPos, math.floor(base.common.Scale( Wall.minSkill.armlength, Wall.maxSkill.armlength, CasterVal )), function(posi)
            if Wall.item and createItemOnMap( Wall.item, posi, CasterVal ) then
                magic.base.basics.performGFX( Wall.gfx, posi );
                magic.base.basics.performSFX( Wall.sfx, posi );
            end
        end );
    end

    if Circle then
        base.common.CreateCircle( Caster.pos, Caster:distanceMetricToPosition( TargetPos ), function(posi)
            if Circle.item and createItemOnMap( Circle.item, posi, CasterVal ) then
                magic.base.basics.performGFX( Circle.gfx, posi );
                magic.base.basics.performSFX( Circle.sfx, posi );
            end
        end );
    end

    if (LuaAnd(Caster:getQuestProgress(24),1) ~= 0 ) then
        return;
    end

    --Caster:learn( 3, Skill.name, 2, Skill.max );
	--Replace with new learn function, see learn.lua 
end


function createItemOnMap( ItemData, Target, CasterVal )
    if world:isCharacterOnField( Target ) then
        local TargetChar = world:getCharacterOnField( Target );
        CasterVal = CasterVal - magic.base.basics.MagicResistence( TargetChar );

        if (CasterVal < 0) then
            world:gfx( 10, Target );
            return false;
        end
    end
    CasterVal = base.common.Limit( CasterVal, 0, 100 );
    local chance = base.common.Scale( ItemData.minSkill.chance, ItemData.maxSkill.chance, CasterVal );

    if (math.random(100) > chance) then
        return false;
    end

    local qual = base.common.Scale( ItemData.minSkill.quality, ItemData.maxSkill.quality, CasterVal );
    local data = base.common.Scale( ItemData.minSkill.data,    ItemData.maxSkill.data,    CasterVal );
    local wear = base.common.Scale( ItemData.minSkill.wear,    ItemData.maxSkill.wear,    CasterVal );
    local numb = base.common.Scale( ItemData.minSkill.number,  ItemData.maxSkill.number,  CasterVal );
    local itemid = ItemData.id;
    if ( type(ItemData.id) == "table" ) then
        itemid = ItemData.id[ math.random( 1, table.getn( ItemData.id ) ) ];
    end

    world:createItemFromId( itemid, numb, Target, true, qual, data );
    local TempItem = world:getItemOnField( Target );
    if (TempItem.id == ItemData.id) then
        TempItem.wear = wear;
        world:changeItem( TempItem );
    end
    return true;
end

function removeItemFromMap( ItemData, Target, CasterVal )
    if not world:isItemOnField( Target ) then
        return false;
    end

    local theItem = world:getItemOnField( Target );

    CasterVal = base.common.Limit( CasterVal, 0, 100 );
    local chance = base.common.Scale( ItemData.minSkill.chance, ItemData.maxSkill.chance, CasterVal );

    if (math.random(100) > chance) then
        return false;
    end

    local found = false;
    if ( type(ItemData.id) == "table" ) then
        for i,id in ItemData.id do
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

    local qual = base.common.Scale( ItemData.minSkill.quality, ItemData.maxSkill.quality, CasterVal );
    local data = base.common.Scale( ItemData.minSkill.data,    ItemData.maxSkill.data,    CasterVal );
    local wear = base.common.Scale( ItemData.minSkill.wear,    ItemData.maxSkill.wear,    CasterVal );
    local numb = base.common.Scale( ItemData.minSkill.number,  ItemData.maxSkill.number,  CasterVal );

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

function CastMagic(Caster, ltstate)
    DoItemSpell(Caster,base.common.GetFrontPosition(Caster), ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter, ltstate)
    if TargetCharacter then
        DoItemSpell(Caster, TargetCharacter.pos, ltstate);
    else
        CastMagic(Caster,ltstate);
    end
end

function CastMagicOnField(Caster,Targetpos, ltstate)
    DoItemSpell(Caster,Targetpos, ltstate);
end

function CastMagicOnItem(Caster,TargetItem, ltstate)
    DoItemSpell(Caster,TargetItem.pos, ltstate);
end
