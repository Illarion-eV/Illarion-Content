require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_13_blackbeholders", package.seeall)


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
	

function setTarget(Monster, targetList)


    for key,target in pairs(targetList) do                      -- search list for someone
        target:inform("now checking...");
        myTar=target;
        if string.find(target.lastSpokenText,"me")~=nil then    -- who said ".*me.*"
            target:inform("gotcha");
            return key;
        end
    end
--[[
    myTar:inform("check done");
    if (firstWP==nil) then                          -- if there was noone found
        monsterPos=Monster.pos;                                 -- let the monster have WP
        targetPos=position(monsterPos.x+10,monsterPos.y+10,monsterPos.z);
        WPList={targetPos,monsterPos,targetPos,monsterPos};
        Monster.waypoints:addFromList(WPList);
        Monster:setOnRoute(true);
        firstWP=1;
        myTar:inform("habe firstWP in setTarget gesetzt!");
    end
--]]
    return 0;
end

function enemyOnSight(Monster,Enemy)
Enemy:inform("enemyOnSight mit dir gecalled!");
    if init==nil then
        ini(Monster);
        firstWP={};
    end

-- (MARTINS TEST) So, as soon as the monster sees someone, put it on route:

    if (firstWP==nil) then
        monsterPos=Monster.pos;
        targetPos=position(monsterPos.x+10,monsterPos.y+10,monsterPos.z);
        WPList={targetPos,monsterPos,targetPos,monsterPos};
        Monster.waypoints:addFromList(WPList);
        Monster:setOnRoute(true);
        firstWP=1;
        Enemy:inform("habe firstWP gesetzt!");
    end
    
    firstWP=firstWP+1;
    --if firstWP==4 then
        Enemy:inform("neuer durchlauf! "..firstWP[Monster.id]);
        --firstWP=1;
   -- end
    
return false
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

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(6,7)+math.random(66,77)),1,2); end --magic amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --ruby

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring

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
