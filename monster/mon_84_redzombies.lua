require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_84_redzombies", package.seeall)


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
	
	if (MonID==842) then
	return ( monster.base.drop.CastMonster(Monster,Enemy,15,{611, 1031},40) );
	else 
		return false
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
    else
        return false
    end
	
	if (MonID==842) then
	return ( monster.base.drop.CastMonster(Monster,Enemy,15,{611, 1031},40) );
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

if (MonID==841) then --Coffinguard, Level: 4, Armourtype: heavy, Weapontype: concussion

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --rope
        if not done then done=monster.base.drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),1,1); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --blackstone

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(79,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(235,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --gold ring
        if not done then done=monster.base.drop.AddDropItem(2363,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --nightplate
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2378,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --black cult robe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,773,0,4); --copper coins


    elseif (MonID==842) then --Undead Warlock, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Speical Loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --rope
        if not done then done=monster.base.drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leather armor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(194,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black robe

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(79,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst amulet

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(2701,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --longsword
        if not done then done=monster.base.drop.AddDropItem(209,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(2378,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --black cult robe
        if not done then done=monster.base.drop.AddDropItem(2655,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned broadsword
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
