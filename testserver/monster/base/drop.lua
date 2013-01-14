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
                if ( values[1] ~= nil ) and ( values[2] ~= nil ) and ( values[3] ~= nil ) then
				    if values[4] == 0 then
					    values[4] = nil; --catching "old" data values
					end
                    Item=world:createItemFromId(values[1],values[2],Char.pos,true,values[3], values[4]) -- Do not create items with old data
					-- values[1]=ID, values[2]=amount, values[3]=quality, values[4]=data
                end
            end
        end
        local checkItems = {61,293,294,64,549,322,237,1266,3076,3077};
        for i,CheckItemItemid in pairs(checkItems) do
            ItemCnt = Char:countItem(CheckItemItemid);
            if (ItemCnt > 0) then
                world:createItemFromId(CheckItemItemid,ItemCnt,Char.pos,true,222,nil);
            end
        end
    end
end

function SpellResistence( Char )
    local CWil   = Char:increaseAttrib("willpower",0);
    local CEss   = Char:increaseAttrib("essence",0);
    local CSkill = Char:getSkill(Character.magicResistance) ;
    CSkill = base.common.Limit( CSkill, 0, MaximalMagicResistance( Char ) );

    local ResTry=base.common.Limit(CSkill * ( ( CEss*3 + CWil*2 ) / 63 ), 0, 100 );

    return base.common.Limit( math.floor( ResTry * math.random(8,12)/10 ), 0, 100 );
end

function LearnMagicResistance( Char )
    if (MaximalMagicResistance( Char ) > Char:getSkill(Character.magicResistance)) then
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

--[[ function CastMonMagic(
	Monster = The Monster casting
	Enemy = The Target 
	rndTry = 1 : rndTry (number) chance of spell being casted
	DamageRange = { min Dmg, max Dmg}
	Effect = { { EffectGfx, EffectSound} { Effect2} etc. }
	Item = { ID, min qualy,max qualy, data, wear }, {Item2} etc... Creates an item on EnemyPosition (Flamewall, etc.)
	AP = Action Points, reduction of movepoints because of casting
	LineOfFlight = Gfx that is shown on the Line between Monster and Target 1= puff of smoke all the way
	CastingTry = {minSkill, maxSkill} Skillbounds for Monster Casting, influence Damage Output, Sucess against Mag Resi of player etc.]]
	
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

function CastMonster(Monster,Enemy,rndTry,monsters,AP)
    if (math.random(1,rndTry)==1) then
		
	
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

		--if (world:isCharacterOnField(SpawnPos)) then
		--	SpawnMonster = world:getCharacterOnField(SpawnPos);
		--	world:gfx(41,SpawnMonster.pos);
		--end

		world:gfx(41,SpawnPos);
		Monster.movepoints=Monster.movepoints-AP;
		base.common.TalkNLS( Monster, Character.say,
		"#me murmelt eine mystische Formel.",
		"#me mumbles a mystical formula.");
		
		return true;	
	else
	return false;
	end
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
--[[
    vilarion says: outdated, should be removed; monsters are slower than players anyway

    if (math.random(1,30)==1) then
        monster.movepoints = monster.movepoints - 40;
        return true;
    end
--]]
    return false;
end

--Addition by Estralis: A function that makes a monster speak a random message

function MonsterRandomTalk(Monster,msgs)

    if (math.random(1,300) == 1 ) then --once each 5 minutes (300) in average a message is spoken
        
        Monster:increaseSkill(Character.commonLanguage,100-Monster:getSkill(Character.commonLanguage)); --if the monster could not talk, it can talk now

        germanMessage, englishMessage = msgs:getRandomMessage(); --choses a random message
        base.common.TalkNLS( Monster, Character.say, germanMessage, englishMessage ); --does the talking in both languages

    end

end

--Added by Faladrion: Preserving the GynkFire as a throwable monster weapon needs fixing :o

function ThrowMolotov(Monster,Enemy,rndTry,AP)
    if (math.random(1,rndTry)==1) and (Monster.pos.z==Enemy.pos.z) then --does not throw very often, half the frequency of casting monsters
        local hitPos=position( Enemy.pos.x+math.random(-2,2), Enemy.pos.y+math.random(-2,2), Enemy.pos.z );
        local distance = Monster:distanceMetricToPosition( hitPos );
        if ( distance < 3 ) then
            if( math.random(1,2) == 1 ) then
                hitPos.x = ( hitPos.x > 0 and hitPos.x + 3 - distance or hitPos.x - 3 + distance );
            else
                hitPos.y = ( hitPos.y > 0 and hitPos.y + 3 - distance or hitPos.y - 3 + distance );
            end
        end

        local Strength=math.random(55,88);
        local hitpoints;

        world:gfx(36,hitPos);
        HitChar(hitPos,base.common.Scale(3000,6000,Strength));
        world:makeSound(5,hitPos);
        hitpoints = base.common.Scale( 1000, 3000, Strength );
        base.common.CreateCircle( hitPos, 1, function( targetPos )
            world:gfx( 44, targetPos );
            HitChar( targetPos, hitpoints );
        end );
        hitpoints = base.common.Scale( 100, 500, Strength );
        base.common.CreateCircle( hitPos, 2, function( targetPos )
            world:gfx( 9, targetPos );
            HitChar( targetPos, hitpoints );
        end );
        hitpoints = base.common.Scale( 20, 100, Strength );
        base.common.CreateCircle( hitPos, 3, function( targetPos )
            world:gfx( 1, targetPos );
            HitChar( targetPos, hitpoints );
        end );

        Monster.movepoints=Monster.movepoints - AP;
        Monster:talkLanguage( Character.say, Player.german, "#me schmeiﬂt eine weiﬂe Flasche nach "..Enemy.name..".");
        Monster:talkLanguage( Character.say, Player.english, "#me tosses a white bottle at "..Enemy.name..".");
		return false;
    end
    return true;
end

function HitChar(Posi,Hitpoints)
		if world:isCharacterOnField(Posi) then world:getCharacterOnField(Posi):increaseAttrib("hitpoints",-Hitpoints) end;
		end;
        
