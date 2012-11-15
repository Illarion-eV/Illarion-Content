require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_66_transparentbonedragons", package.seeall)

function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages


end

function ShapeDrehen(Shape)
    retShape={};
    for i=1,5 do
        retShape[i]={Shape[5][i],Shape[4][i],Shape[3][i],Shape[2][i],Shape[1][i]};
    end
    return retShape
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    return ( FireBreath(Monster,Enemy) == true );
end

function enemyOnSight(Monster,Enemy)
    local MonID=Monster:getMonsterType();

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    else
        return ( FireBreath(Monster,Enemy) == true );
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
    if (MonID==661) then --Nightmare Dragon, Level: 8, Armourtype: medium, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(451,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --topaz powder
        if not done then done=monster.base.drop.AddDropItem(448,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --emerald powder
        if not done then done=monster.base.drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(446,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --bluestone powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),{magicalRuby="1"},2); end --magic ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
