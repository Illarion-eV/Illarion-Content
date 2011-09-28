require("base.common")
require("base.messages")

module("monster.base.drop", package.seeall)

function ClearDropping()
    SelItemValue={};
    Catsdone={};
end

function AddDropItem(ItemID,Amount,Prob,Qual,DataValue,Category)
    if( Amount == nil ) then
        return false;
    elseif (Amount>0) then
        if (Catsdone[Category]~=true) then
            Catsdone[Category]=true;
            gesProb=0;
            CatTry=math.random(100);
        end
        if ((CatTry>gesProb) and (CatTry<=gesProb+Prob)) then
            if (Qual < 101) then
                Qual = Qual + 100;
            end
            table.insert(SelItemValue,{ItemID,Amount,Qual,DataValue});
            return true;
        end
        gesProb=gesProb+Prob;
    end
    return false;
end

function Dropping(Char)
    if ((dropped == nil) or (dropped ~= Char.id)) then
        dropped = Char.id;
        first = true
    elseif (dropped == Char.id) then
        first = false;
    end

    if first then
        if (table.getn(SelItemValue)>0) then
            for i,values in pairs(SelItemValue) do
                if ( values[1] ~= nil ) and ( values[2] ~= nil ) and ( values[3] ~= nil ) and ( values[4] ~= nil ) then
                    Item=world:createItemFromId(values[1],values[2],Char.pos,true,values[3],values[4]);
					-- values[1]==3076 etc., values[2]=anzahl
                end
            end
        end
        if FirstThief then
            if (StealAmmG[Char.id]~=nil and StealAmmG[Char.id]>0) then
                world:createItemFromId(61,StealAmmG[Char.id],Char.pos,true,333,0);
                StealAmmG[Char.id]=nil;
            end;
            if (StealAmmS[Char.id]~=nil and StealAmmS[Char.id]>0) then
                world:createItemFromId(3077,StealAmmS[Char.id],Char.pos,true,333,0);
                StealAmmS[Monster.id]=nil;
            end
            if (StealAmmK[Char.id]~=nil and StealAmmK[Char.id]>0) then
                world:createItemFromId(3076,StealAmmK[Char.id],Char.pos,true,333,0);
                StealAmmK[Char.id]=nil;
            end
        end
        local checkItems = {61,293,294,64,549,322,237,1266,3076,3077};
        for i,CheckItemItemid in pairs(checkItems) do
            ItemCnt = Char:countItem(CheckItemItemid);
            if (ItemCnt > 0) then
                world:createItemFromId(CheckItemItemid,ItemCnt,Char.pos,true,222,0);
            end
        end
    end
end

function SpellResistence( Char )
    local CWil   = Char:increaseAttrib("willpower",0);
    local CEss   = Char:increaseAttrib("essence",0);
    local CSkill = Char:getSkill("magic resistance") ;
    CSkill = base.common.Limit( CSkill, 0, MaximalMagicResistance( Char ) );

    local ResTry=base.common.Limit(CSkill * ( ( CEss*3 + CWil*2 ) / 63 ), 0, 100 );

    return base.common.Limit( math.floor( ResTry * math.random(8,12)/10 ), 0, 100 );
end

function LearnMagicResistance( Char )
    if (MaximalMagicResistance( Char ) > Char:getSkill("magic resistance")) then
        --Char:learn(3,"magic resistance",2,100);
		--Replace with new learn function, see learn.lua 
    end
end

function MaximalMagicResistance( Char )
    local maxMagicResist = 1.4 * ( Char:increaseAttrib("intelligence",0) + ( Char:increaseAttrib("willpower",0) * 1.75 ) + ( Char:increaseAttrib("essence",0) * 2 ) ) + 5;
    return base.common.Limit( maxMagicResist, 0, 100 );
end

function CastLargeAreaMagic( monster, rndTry, LoadupRounds, LoadupEffect, DamageRange, Range, Effect, AP, CastingTry )
    if (loadingMonsters == nil) then
        loadingMonsters = {};
    end;

    if (loadingMonsters[monster.id] ~= nil) then
        if ( loadingMonsters[monster.id] ~= LoadupRounds ) then
            loadingMonsters[monster.id] = loadingMonsters[monster.id] + 1;
            if ( LoadupEffect[1] > 0 ) then
                world:gfx( LoadupEffect[1], monster.pos );
            end;
            if ( LoadupEffect[2] > 0 ) then
                world:makeSound( LoadupEffect[2], monster.pos );
            end;
            monster.movepoints = monster.movepoints - AP;
            return true;
        end
    elseif (math.random(1,rndTry)==1) then
        loadingMonsters[monster.id] = 1;

        if ( LoadupRounds > 0 ) then
            if ( LoadupEffect[1] > 0 ) then
                world:gfx( LoadupEffect[1], monster.pos );
            end;
            if ( LoadupEffect[2] > 0 ) then
                world:makeSound( LoadupEffect[2], monster.pos );
            end;
            monster.movepoints = monster.movepoints - AP;
            return true;
        end
    else
        return false;
    end

    loadingMonsters[monster.id] = nil;

    local targets = world:getPlayersInRangeOf( monster.pos, Range );
    local CastTry = 0;
    local Damage = 0;
    for i,target in pairs(targets) do
        local CastTry = math.random(CastingTry[1],CastingTry[2]) - SpellResistence( target );
        CastTry = ( CastTry - CastingTry[1] ) / ( CastingTry[2] - CastingTry[1] ) * 100;
        local Damage = base.common.ScaleUnlimited( DamageRange[1], DamageRange[2], CastTry );
        if Damage > 0 then
            target:increaseAttrib("hitpoints",-Damage);
            LearnMagicResistance( target );
            if ( Effect[1] > 0 ) then
                world:gfx(Effect[1],target.pos);
            end
        else
            if ( Effect[1] > 0 ) then
                world:gfx(12,target.pos);
            end
        end
        if ( Effect[2] > 0 ) then
            world:makeSound(Effect[2],target.pos);
        end
    end
    return true;
end

function CastMonMagic(Monster,Enemy,rndTry,DamageRange,Effect,Item,AP,LineOfFlight,CastingTry)
    if (math.random(1,rndTry)==1) and (Monster.pos.z==Enemy.pos.z) then
        local EffectTry=math.random(1,table.getn(Effect)+table.getn(Item));
        if ( EffectTry > table.getn(Effect) ) then
            base.common.CreateLine(Monster.pos,Enemy.pos, function( targetPos )
                if world:isCharacterOnField( targetPos ) then
                    if world:isItemOnField( targetPos ) then
                        local foundItem = world:getItemOnField( targetPos );
                        if ( foundItem.id == Item[EffectTry-table.getn(Effect)][1] ) then
                            foundItem.quality = math.min( Item[EffectTry-table.getn(Effect)][3], foundItem.quality + Item[EffectTry-table.getn(Effect)][2] );
                            return false;
                        end
                    end
                    world:createItemFromId(Item[EffectTry-table.getn(Effect)][1],1,targetPos,true,math.random(Item[EffectTry-table.getn(Effect)][2],Item[EffectTry-table.getn(Effect)][3]),Item[EffectTry-table.getn(Effect)][4]);
                    if ( Item[EffectTry-table.getn(Effect)][5] > 0 ) then
                        world:makeSound(Item[EffectTry-table.getn(Effect)][5],targetPos);
                    end
                    return false;
                end
                world:gfx( LineOfFlight, targetPos );
                return true;
            end );
            base.common.TalkNLS( Monster, Character.say,
            "#me murmelt eine mystische Formel.",
            "#me mumbles a mystical formula.");
            Monster.movepoints=Monster.movepoints-AP;
            return true;
        else
            base.common.CreateLine(Monster.pos,Enemy.pos, function( targetPos )
                if world:isCharacterOnField( targetPos ) then
                    local Enemy = world:getCharacterOnField( targetPos );
                    local CastTry = math.random(CastingTry[1],CastingTry[2]) - SpellResistence( Enemy );
                    CastTry = ( CastTry - CastingTry[1] ) / ( CastingTry[2] - CastingTry[1] ) * 100;
                    local Damage = base.common.ScaleUnlimited( DamageRange[1], DamageRange[2], CastTry );
                    if Damage > 0 then
                        Enemy:increaseAttrib("hitpoints",-Damage);
                        LearnMagicResistance( Enemy );
                        if ( Effect[EffectTry][1] > 0 ) then
                            world:gfx(Effect[EffectTry][1],targetPos);
                        end
                    else
                        if ( Effect[EffectTry][1] > 0 ) then
                            world:gfx(12,targetPos);
                        end
                    end
                    if ( Effect[EffectTry][2] > 0 ) then
                        world:makeSound(Effect[EffectTry][2],targetPos);
                    end
                    return false;
                end;
                world:gfx( LineOfFlight, targetPos );
                return true;
            end );
            base.common.TalkNLS( Monster, Character.say,
            "#me murmelt eine mystische Formel.",
            "#me mumbles a mystical formula.");
            Monster.movepoints=Monster.movepoints-AP;
            return true;
        end
    end
    return false;
end

function CastHealing( Caster, rndTry, HealAmmount, Range, Effect, AP )
    if (math.random(1,rndTry)~=1) then
        return false;
    end

    -- Look for my friends
    local other_monsters = world:getMonstersInRangeOf( Caster.pos, Range );
    if table.getn( other_monsters ) == 0 then
        return false;
    end

    -- Scan Monsters and select wounded
    local monsters_in_need = {};
    for i, monster in pairs(other_monsters) do
        if ( monster:increaseAttrib("hitpoints", 0 ) < 10000 ) then
            table.insert( monsters_in_need, i );
        end
    end

    if table.getn( monsters_in_need ) == 0 then
        return false;
    end

    -- Select monster to help
    local selected_monster = math.random( 1, table.getn( monsters_in_need ) );

    other_monsters[ selected_monster ]:increaseAttrib( "hitpoints", math.random( HealAmmount[1], HealAmmount[2] ) );

    if Effect[1] ~= 0 and Effect[1] ~= nil then
        world:gfx( Effect[1], other_monsters[ selected_monster ].pos );
    end
    if Effect[2] ~= 0 and Effect[2] ~= nil then
        world:makeSound( Effect[2], other_monsters[ selected_monster ].pos );
    end

    other_monsters[ selected_monster ].movepoints = other_monsters[ selected_monster ].movepoints - AP;

    base.common.TalkNLS( Monster, Character.say,
    "#me murmelt eine mystische Formel und wird von einem warmen Leuchten umgeben.",
    "#me mumbles a mystical formula and gets surrounded by a warm glowing.");
    return true;
end

function CastParalyze( Caster, Enemy, rndTry, APPunishment, Range, Effect, AP ,CastingTry )
    if (math.random(1,rndTry)==1) and (Monster.pos.z==Enemy.pos.z) then
        local CastTry = math.random(CastingTry[1],CastingTry[2]) - SpellResistence( Enemy );
        CastTry = ( CastTry - CastingTry[1] ) / ( CastingTry[2] - CastingTry[1] ) * 100;
        local Damage = base.common.ScaleUnlimited( APPunishment[1], APPunishment[2], CastTry );
        if Damage > 0 then
            Enemy.movepoints = Enemy.movepoints - Damage;
            LearnMagicResistance( Enemy );
            if ( Effect[EffectTry][1] > 0 ) then
                world:gfx(Effect[EffectTry][1],targetPos);
            end
        else
            if ( Effect[EffectTry][1] > 0 ) then
                world:gfx(12,targetPos);
            end
        end
        if ( Effect[EffectTry][2] > 0 ) then
            world:makeSound(Effect[EffectTry][2],targetPos);
        end
        return true;
    end
    return false;
end

function Stealing(Monster,Enemy)

--The code below sucks balls. It is simply... bullshit that thieves steal all your gold while you hack on 'em with a warhammer of doom. 
--Estralis

--[[
    if not FirstThief then
        StealAmmG={};
        StealAmmS={};
        StealAmmK={};
        FirstThief=true;
    end
    if (math.random(1,20)==1) then
	    if (true) then
	        local StealSomething=false;
	        local kcoins=Enemy:countItem(3076);
	        local scoins=Enemy:countItem(3077);
	        local gcoins=Enemy:countItem(61);
	        if (StealAmmG[Monster.id]==nil) then StealAmmG[Monster.id]=0 end
	        if (StealAmmS[Monster.id]==nil) then StealAmmS[Monster.id]=0 end
	        if (StealAmmK[Monster.id]==nil) then StealAmmK[Monster.id]=0 end
	        if (gcoins>0) then
	            StealSomething=true;
	            Steal=math.random(1,gcoins);
	            StealAmmG[Monster.id]=StealAmmG[Monster.id]+Steal;
	            Enemy:eraseItem(61,Steal);
	        elseif (scoins>0) then
	            StealSomething=true;
	            Steal=math.random(1,scoins);
	            StealAmmS[Monster.id]=StealAmmS[Monster.id]+Steal;
	            Enemy:eraseItem(3077,Steal);
	        elseif (kcoins>0) then
	            StealSomething=true;
	            Steal=math.random(1,kcoins);
	            StealAmmK[Monster.id]=StealAmmK[Monster.id]+Steal;
	            Enemy:eraseItem(3076,Steal);
	        end
	        if StealSomething then
	            base.common.InformNLS( Enemy,
	                "Der Bandit greift mit einem schnellen Griff nach deinem Geld und schnappt sich ein paar Münzen",
	                "The bandit makes a quick grab at your money and takes some coins." );
	            Monster.movepoints=Monster.movepoints-10;
	            return true;
	        end
	    end
	end
	]]
    return false;
end

function CastMonster(Monster,Enemy,rndTry,monsters,AP)
    --if (math.random(1,rndTry)~=1) then
    --    return false;
    --end

    world:createMonster(1,position(Monster.pos.x,Monster.pos.y+1,Monster.pos.z),20);
--[[
    local XPos=math.random(-2,2);
    local YPos=math.random(-2,2);

    if (XPos==0 and YPos==0) then YPos=-1 end
    local SpawnPos=position(Monster.pos.x+XPos,Monster.pos.y+YPos,Monster.pos.z);

    if (world:isCharacterOnField(SpawnPos)) then
        return false;
    end

    local selectedMonsterIndex = math.random(1,table.getn(monsters));
    local selectedMonsterId = monsters[selectedMonsterIndex];

    world:createMonster(selectedMonsterId,SpawnPos,-15);

    if (world:isCharacterOnField(SpawnPos)) then
        local SpawnMonster = world:getCharacterOnField(SpawnPos);
        world:gfx(41,SpawnMonster.pos);
    end

    world:gfx(41,SpawnMonster.pos);
    Monster.movepoints=Monster.movepoints-AP;
    base.common.TalkNLS( Monster, Character.say,
    "#me murmelt eine mystische Formel.",
    "#me mumbles a mystical formula.");
    --]]
    return true;
end

function SuddenWarp(Monster,Enemy,showGFX)
    if (math.random(10) == 1) then
        local XOffset = math.random(-5,5);
        local YOffset = math.random(-5,5);
        if (math.sqrt((XOffset*XOffset) + (YOffset*YOffset)) < 2) then
            XOffset = 2;
        end
        if showGFX then world:gfx(41,Monster.pos) end;
        Monster:warp(position(Enemy.pos.x+XOffset,Enemy.pos.y+YOffset,Enemy.pos.z));
        if showGFX then world:gfx(41,Monster.pos) end;
        Monster.movepoints = Monster.movepoints - 10;
        return true;
    end
    return false;
end

function DefaultSlowdown( monster )
    if (math.random(1,30)==1) then
        monster.movepoints = monster.movepoints - 40;
        return true;
    end
    return false;
end

--Addition by Estralis: A function that makes a monster speak a random message

function MonsterRandomTalk(Monster,msgs)

    if (math.random(1,300) == 1 ) then --once each 5 minutes (300) in average a message is spoken
        
        Monster:increaseSkill(1,"common language",100-Monster:getSkill("common language")); --if the monster could not talk, it can talk now

        germanMessage, englishMessage = msgs:getRandomMessage(); --choses a random message
        base.common.TalkNLS( Monster, Character.say, germanMessage, englishMessage ); --does the talking in both languages

    end

end
