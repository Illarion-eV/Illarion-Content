require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_69_goldenbonedragons", package.seeall)

function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = base.messages.Messages();
msgs:addMessage("#me knurrt.", "#me growls.");
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
	return false;
end

function enemyOnSight(Monster,Enemy)
    local MonID=Monster:getMonsterType();

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true;
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
    if (MonID==691) then --Golden Bonedragon, Level: 8, Armourtype: medium, Weapontype: slashing

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(451,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --topaz powder
        if not done then done=monster.base.drop.AddDropItem(449,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --obsidian powder
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(446,1,1,(100*math.random(7,8)+math.random(77,88)),1,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(30,90),100,333,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
