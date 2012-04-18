require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_88_redhellhounds", package.seeall)


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

if (MonID==881) then --Bloodhunter, Level: 2, Armourtype: cloth, Weapontype: concussion

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --entrails 
        if not done then done=monster.base.drop.AddDropItem(254,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw diamonds
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --topas amulet
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame 

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(285,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --bluestone
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --emerald
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur


    elseif (MonID==882) then --Monstrosity, Level: 3, Armourtype: light, Weapontype: puncture

        --Category 1: Speical Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --entrails
        if not done then done=monster.base.drop.AddDropItem(257,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --ruby
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --topaz
        if not done then done=monster.base.drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald 
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --ruby

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz amulet

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur


    elseif (MonID==883) then --Bloodsniffler, Level: 4, Armourtype: light, Weapontype: slashing

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --entrails
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(79,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst amulet 
        if not done then done=monster.base.drop.AddDropItem(71,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone amulet

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --blackstone

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur

    end
    monster.base.drop.Dropping(Monster);
end
