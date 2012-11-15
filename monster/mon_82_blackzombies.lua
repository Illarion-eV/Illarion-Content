require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_82_blackzombies", package.seeall)


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

if (MonID==821) then --Bog Body, Level: 4, Armourtype: light, Weapontype: slashing

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --rope
        if not done then done=monster.base.drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(53,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather boots
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(1,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(19,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --metal shield
        if not done then done=monster.base.drop.AddDropItem(2655,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned broadsword
        if not done then done=monster.base.drop.AddDropItem(297,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --gilded dagger
        if not done then done=monster.base.drop.AddDropItem(326,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --steel boots

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==822) then --Ragged Bog Body, Level: 3, Armourtype: light, Weapontype: slashing

        --Category 1: Speical Loot

        local done=monster.base.drop.AddDropItem(324,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --bucket
        if not done then done=monster.base.drop.AddDropItem(92,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(67,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --rubin amulet
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(2,3)+math.random(22,33)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --pott ash

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --blackstone

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(2701,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --longsword
        if not done then done=monster.base.drop.AddDropItem(2447,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --mosiac shield
        if not done then done=monster.base.drop.AddDropItem(445,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --wooden sword
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --copperd dagger
        if not done then done=monster.base.drop.AddDropItem(823,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --grey trousers

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
