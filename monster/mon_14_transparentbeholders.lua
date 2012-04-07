require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_14_transparentbeholders", package.seeall)

--To do: Random Messages

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
	
	local MonID=Monster:getMonsterType();
    if (MonID==143) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,15,{611,1031,1051},40) );
    else
        return false;
	end
	
end



function enemyOnSight(Monster,Enemy)
    if init==nil then
        ini(Monster);
        firstWP={};
    end
	
	local MonID=Monster:getMonsterType();
    if (MonID==143) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,15,{611,1031,1051},40) );
    else
        return false;
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

    if killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();

    if (MonID==141) then --Ghost Eye, Level: 4, Armourtype: light, Weapontype: concussion

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(3,4)+math.random(33,4)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(251,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw diamond

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(280,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --topaz ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==142) then --Unholy Ghost Eye', Level: 5, Armourtype: light, Weapontype: puncture

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw blackstone

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(283,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,333,0,4); --copper coins
        
        
        elseif (MonID==143) then --Horrible Ghost Eye, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(253,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw blackstone

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --blackstone

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(281,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins
        
        -- Drops
    elseif (MonID==144) then
        --Drops
    elseif (MonID==145) then
        --Drops
    elseif (MonID==146) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
