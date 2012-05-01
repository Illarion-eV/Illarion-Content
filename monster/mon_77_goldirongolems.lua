require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_77_goldirongolems", package.seeall)


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

if (MonID==912) then -- Gold Golem, Level: 8, Armourtype: medium, Weapontype: concussion

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,5,20,(100*math.random(7,8)+math.random(77,88)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,5,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(251,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(255,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,5,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,5,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,5,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic blackstone
        if not done then done=monster.base.drop.AddDropItem(46,5,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(234,5,20,(100*math.random(7,8)+math.random(77,88)),0,3); --gold nugget
        if not done then done=monster.base.drop.AddDropItem(733,5,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --stone block
        if not done then done=monster.base.drop.AddDropItem(22,10,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --iron ore
        if not done then done=monster.base.drop.AddDropItem(2536,10,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --copper ore
        if not done then done=monster.base.drop.AddDropItem(1266,20,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --stone

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,773,0,4); --silver coins
		
    end
    monster.base.drop.Dropping(Monster);
end
