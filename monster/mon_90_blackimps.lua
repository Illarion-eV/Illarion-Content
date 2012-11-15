require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_90_blackimps", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

end

function enemyNear(Monster,Enemy)
	local MonID=Monster:getMonsterType();
	
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
	if (MonID==553) then
		return ( monster.base.drop.CastMonster(Monster,Enemy,15,{622, 611, 881},40) );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)
	local MonID=Monster:getMonsterType();
	
    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    end
	
	if (MonID==553) then
		return ( monster.base.drop.CastMonster(Monster,Enemy,15,{622, 611, 881},40) );
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

if (MonID==901) then --Shadow Wimp, Level: 4, Armourtype: heavy, Weapontype: distance

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(194,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --black robe
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green tunic
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(189,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --dagger
        if not done then done=monster.base.drop.AddDropItem(277,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(2668,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned simple dagger
        if not done then done=monster.base.drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==902) then --Shadow Imp, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(389,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --silvered dagger
        if not done then done=monster.base.drop.AddDropItem(2668,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned simple dagger
        if not done then done=monster.base.drop.AddDropItem(2671,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --magic dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins


    elseif (MonID==903) then --Shadow Dancer, Level: 6, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --wooeden shield
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(53,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --leather
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --green tunic

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(2740,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --red dagger
        if not done then done=monster.base.drop.AddDropItem(2668,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned simple dagger
        if not done then done=monster.base.drop.AddDropItem(444,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --merinium plated dagger
        if not done then done=monster.base.drop.AddDropItem(2672,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --magic dagger
        if not done then done=monster.base.drop.AddDropItem(2742,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --fire dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,773,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
