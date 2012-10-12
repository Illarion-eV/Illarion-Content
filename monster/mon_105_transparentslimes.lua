require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_105_transparentslimes", package.seeall)


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

if (MonID==1051) then --Ectoplasm, Level: 1, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(1,1)+math.random(11,11)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --raw emerald

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(1,1)+math.random(11,11)),0,2); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(1,1)+math.random(11,11)),0,2); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(1,1)+math.random(11,11)),0,2); end --diamond

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(26,1,20,(100*math.random(1,1)+math.random(11,11)),0,3); --clay
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(1,1)+math.random(11,11)),0,3); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(1,1)+math.random(11,11)),0,3); end --emerald

        --Category 4: Perma Loot
		--
		
		elseif (MonID==1052) then --Malicious Ectoplasm, Level: 2, Armourtype: cloth, Weapontype: wrestling
		
		--Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw blackstone

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --topaz

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(726,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --coarse sand
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,773,0,4); --copper coins

    elseif (MonID==1053) then --Doomed Ectoplasm, Level: 3, Armourtype: light, Weapontype: puncture

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(26,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --clay
        if not done then done=monster.base.drop.AddDropItem(73,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --trout
        if not done then done=monster.base.drop.AddDropItem(2445,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --small wooden shield
        if not done then done=monster.base.drop.AddDropItem(56,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --bough
        if not done then done=monster.base.drop.AddDropItem(2786,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --branch

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(2,6),100,773,0,4); --copper coins
	
    end
    monster.base.drop.Dropping(Monster);
end
