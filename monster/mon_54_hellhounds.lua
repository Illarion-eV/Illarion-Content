require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_54_hellhounds", package.seeall)


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

if (MonID==541) then --Crippled Deamonbeast, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --entrails 
        if not done then done=monster.base.drop.AddDropItem(255,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --topas amulet
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --topaz 

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(285,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(79,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst amulet
        if not done then done=monster.base.drop.AddDropItem(62,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald amulet
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --bluestone
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(67,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --rubin amulet
        if not done then done=monster.base.drop.AddDropItem(2553,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --pure fire
        if not done then done=monster.base.drop.AddDropItem(762,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur


    elseif (MonID==542) then --Deamonbeast, Level: 7, Armourtype: midium, Weapontype: puncture

        --Category 1: Speical Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --entrails
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz amulett

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald 
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(71,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --bluestone amulet
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(67,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --rubin amulet
        if not done then done=monster.base.drop.AddDropItem(2553,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --pure fire
        if not done then done=monster.base.drop.AddDropItem(762,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur


    elseif (MonID==543) then --Giant Deamonbeast, Level: 7, Armourtype: medium, Weapontype: concussion

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --entrails
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz
        if not done then done=monster.base.drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --blackstone

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(222,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --amulet
        if not done then done=monster.base.drop.AddDropItem(82,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --blackstone amulet 
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --bluestone

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),1,3); end --magical ruby
        if not done then done=monster.base.drop.AddDropItem(2553,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --pure fire
        if not done then done=monster.base.drop.AddDropItem(762,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,773,0,4); --fur

    end
    monster.base.drop.Dropping(Monster);
end
