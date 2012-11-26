require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_93_greenratmans", package.seeall)


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

if (MonID==931) then --Contaminated Ratchild, Level: 3, Armourtype: cloth, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(697,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --fur boots
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(826,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --black trousers
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(819,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --black tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(2934,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --lambmeat
        if not done then done=monster.base.drop.AddDropItem(333,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --horn
        if not done then done=monster.base.drop.AddDropItem(1858,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --goblet

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(190,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --ornate dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(2668,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned simple dagger
        if not done then done=monster.base.drop.AddDropItem(2672,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned dagger
        if not done then done=monster.base.drop.AddDropItem(2689,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned ornate dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins


    elseif (MonID==932) then --Contaminated Ratman, Level: 4, Armourtype: cloth, Weapontype: dagger

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wooden shield
        if not done then done=monster.base.drop.AddDropItem(2112,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short chain trousers
        if not done then done=monster.base.drop.AddDropItem(824,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green trousers
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(307,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pork
        if not done then done=monster.base.drop.AddDropItem(90,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --flut
        if not done then done=monster.base.drop.AddDropItem(2495,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pan

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(27,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple dagger
        if not done then done=monster.base.drop.AddDropItem(2674,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --dull simple dagger
        if not done then done=monster.base.drop.AddDropItem(2672,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned dagger
        if not done then done=monster.base.drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=monster.base.drop.AddDropItem(2740,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --red dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
