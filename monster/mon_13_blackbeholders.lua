require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_13_blackbeholders", package.seeall)

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
    if (MonID==132) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2500,4500},{{2,4},{32,5},{51,5}},{},40,1) == true );
    else
        return false;
    end
end	


function enemyOnSight(Monster,Enemy)
    
	local MonID=Monster:getMonsterType();
	
	if init==nil then
        ini(Monster);
        firstWP={};
    end
	monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true;
	
    elseif (MonID==132) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2500,4500},{{2,4},{32,5},{51,5}},{},40,1) == true );
    else
        return false;
    end
	
return false;
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

	local NoDrop=Monster:getSkill("no drop pls")
	if NoDrop >= 10 then
	return;
	end
	
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

    if (MonID==131) then --Shadow Eye, Level: 7, Armourtype: medium, Weapontype: concussion

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --bluestone

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --topaz ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(1,3),100,333,0,4); --silver coins


    elseif (MonID==132) then --Eye of Darkness, Level: 8, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins
        
        -- Drops
    elseif (MonID==133) then
        --Drops
    elseif (MonID==134) then
        --Drops
    elseif (MonID==135) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end