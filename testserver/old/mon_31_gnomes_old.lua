require("base.common")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_31_gnomes", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("Dieses Monster wird mit NewIllarion abgeschafft. Bitte für Ersatz sorgen, um die Zahl der Bossmonster und die Balance der Monsterdrops beibehalten zu können!", "This monster will be discontinued with NewIllarion. Please create a replacement to maintain the number of boss monsters and the balance of drops!");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
    
    return false
end

function throwMolotov(Monster,Enemy)
    if (math.random(1,30)==1) and (Monster.pos.z==Enemy.pos.z) then --does not throw very often, half the frequency of casting monsters
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

        Monster.fightpoints=Monster.fightpoints-25;
        Monster:talkLanguage( Character.say, Player.german, "#me schmeißt eine weiße Flasche nach "..Enemy.name..".");
        Monster:talkLanguage( Character.say, Player.english, "#me tosses a white bottle at "..Enemy.name..".");
        return false;
    end
    return true;
end

function HitChar(Posi,Hitpoints)
    if world:isCharacterOnField(Posi) then world:getCharacterOnField(Posi):increaseAttrib("hitpoints",-Hitpoints) end;
end;

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==314 or MonID == 324) then
        return ( throwMolotov(Monster,Enemy) == true );
    else
	    return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

	
    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();
    if (MonID==311) then --Gnome, Level: 3, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(526,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --studded leather gloves
        if not done then done=monster.base.drop.AddDropItem(366,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --light hunting armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(431,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --wax
        if not done then done=monster.base.drop.AddDropItem(43,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --candles
        if not done then done=monster.base.drop.AddDropItem(429,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --candle mould
        if not done then done=monster.base.drop.AddDropItem(2529,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --honeycombs
        if not done then done=monster.base.drop.AddDropItem(50,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --thread

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(1266,10,20,(100*math.random(2,3)+math.random(22,33)),0,3); --stones
        if not done then done=monster.base.drop.AddDropItem(89,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --sling
        if not done then done=monster.base.drop.AddDropItem(2645,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --throwing axe
        if not done then done=monster.base.drop.AddDropItem(293,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --throwing spear
        if not done then done=monster.base.drop.AddDropItem(294,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --throwing star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(2,6),100,333,0,4); --copper coins


    elseif (MonID==312) then --Gnome Warrior, Level: 4, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(526,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --studded leather gloves
        if not done then done=monster.base.drop.AddDropItem(186,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --round metal shield
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(366,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --full leatherarmor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(737,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --chisel
        if not done then done=monster.base.drop.AddDropItem(23,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --hammer
        if not done then done=monster.base.drop.AddDropItem(733,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(1265,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --stone

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(76,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --short sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(2658,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --broadsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==313) then --Gnome Champion, Level: 4, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2287,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --albarian soldier's helmet
        if not done then done=monster.base.drop.AddDropItem(2194,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2367,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --albarian noble's armor
        if not done then done=monster.base.drop.AddDropItem(18,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --light metal shield
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2744,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --pipe
        if not done then done=monster.base.drop.AddDropItem(58,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --mortar
        if not done then done=monster.base.drop.AddDropItem(2183,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --clay mug
        if not done then done=monster.base.drop.AddDropItem(2184,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --clay cup
        if not done then done=monster.base.drop.AddDropItem(2185,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --wooden cup

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2701,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --longsword
        if not done then done=monster.base.drop.AddDropItem(1,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(76,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --short sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(85,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==314) then --Gnome Technician, Level: 4, Armourtype: cloth, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(196,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --grey coat
        if not done then done=monster.base.drop.AddDropItem(2295,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(2380,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --blue coat
        if not done then done=monster.base.drop.AddDropItem(828,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --blue hat with feather
        if not done then done=monster.base.drop.AddDropItem(182,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --black shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(122,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --finesmithing hammer
        if not done then done=monster.base.drop.AddDropItem(23,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --hammer
        if not done then done=monster.base.drop.AddDropItem(2710,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --mould
        if not done then done=monster.base.drop.AddDropItem(2140,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --tongs
        if not done then done=monster.base.drop.AddDropItem(2751,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --crucible pincers

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2946,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --battleaxe
        if not done then done=monster.base.drop.AddDropItem(445,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --wooden sword
        if not done then done=monster.base.drop.AddDropItem(2642,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --orc axe
        if not done then done=monster.base.drop.AddDropItem(2711,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --barbarian axe
        if not done then done=monster.base.drop.AddDropItem(78,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --short sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==315) then --Gnome King, Level: 5, Armourtype: cloth, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2384,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --black coat
        if not done then done=monster.base.drop.AddDropItem(2295,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(196,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --grey coat
        if not done then done=monster.base.drop.AddDropItem(459,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red trousers
        if not done then done=monster.base.drop.AddDropItem(826,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black trousers

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(225,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --crown
        if not done then done=monster.base.drop.AddDropItem(224,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden goblet
        if not done then done=monster.base.drop.AddDropItem(2571,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --merinium ingot
        if not done then done=monster.base.drop.AddDropItem(235,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=monster.base.drop.AddDropItem(336,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --mirror

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(88,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --long axe
        if not done then done=monster.base.drop.AddDropItem(2723,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --executioner's axe
        if not done then done=monster.base.drop.AddDropItem(77,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --halberd
        if not done then done=monster.base.drop.AddDropItem(204,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bastard sword
        if not done then done=monster.base.drop.AddDropItem(383,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --waraxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,333,0,4); --copper coins

    elseif (MonID==316) then
        -- Drops
    elseif (MonID==317) then
        --Drops
    elseif (MonID==318) then
        --Drops
    elseif (MonID==319) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
