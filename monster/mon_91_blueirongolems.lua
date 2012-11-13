require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_91_blueirongolems", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

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

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
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

if (MonID==911) then -- Merinium Golem, Level: 9, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(254,5,20,(100*math.random(8,9)+math.random(88,99)),0,1); --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,5,10,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(255,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(251,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw bluestone

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(285,5,20,(100*math.random(8,9)+math.random(88,99)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(283,5,10,(100*math.random(8,9)+math.random(88,99)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(8,9)+math.random(88,99)),{magicalRuby="1"},2); end --magic ruby
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(8,9)+math.random(88,99)),{magicalAmethyst="1"},2); end --magic amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(8,9)+math.random(88,99)),{magicalBluestone="1"},2); end --magic bluestone

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(2534,5,20,(100*math.random(8,9)+math.random(88,99)),0,3); --merinium ore
        if not done then done=monster.base.drop.AddDropItem(735,5,10,(100*math.random(8,9)+math.random(88,99)),0,3); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(22,10,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --iron ore
        if not done then done=monster.base.drop.AddDropItem(2536,10,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --copper ore
        if not done then done=monster.base.drop.AddDropItem(733,5,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --stone block

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(90,250),100,773,0,4); --silver coins
		
    end
    monster.base.drop.Dropping(Monster);
end
