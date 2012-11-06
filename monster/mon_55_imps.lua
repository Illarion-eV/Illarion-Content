require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_55_imps", package.seeall)


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
	
	local MonID=Monster:getMonsterType();
    
	if (MonID==553) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{500,1500},{{4,5},{2,4}},{},40,1,{35,50}) );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)
	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end
    
	if (MonID==553) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{500,1500},{{4,5},{2,4}},{},40,1,{35,50}) );
    else
        return false;
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

if (MonID==551) then --Imp, Level: 3, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(526,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --studded leather gloves
        if not done then done=monster.base.drop.AddDropItem(186,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --round metal shield
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(366,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --full leatherarmor

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(737,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --chisel
        if not done then done=monster.base.drop.AddDropItem(23,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --hammer
        if not done then done=monster.base.drop.AddDropItem(733,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(1266,20,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --stone

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(76,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --short sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(2658,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --broadsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins


    elseif (MonID==552) then --Jack of all Imps, Level: 4, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wooden shield
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(53,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather boots

        --Category 2: Plants

        local done=monster.base.drop.AddDropItem(133,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --sun herb
        if not done then done=monster.base.drop.AddDropItem(134,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --fourleafed oneberry
        if not done then done=monster.base.drop.AddDropItem(135,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --yellow weed
        if not done then done=monster.base.drop.AddDropItem(136,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --anger berry
        if not done then done=monster.base.drop.AddDropItem(137,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --flamegoblet blossom

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(56,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --bough
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2786,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --branch
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==553) then --Cursed Imp, Level: 4, Armourtype: cloth, Weapontype: distance

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(189,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger
        if not done then done=monster.base.drop.AddDropItem(389,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --silvered dagger
        if not done then done=monster.base.drop.AddDropItem(2671,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --magic dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
