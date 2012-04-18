require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_53_zombies", package.seeall)


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

if (MonID==531) then --Walking Dead, Level: 5, Armourtype: heavy, Weapontype: puncture

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(324,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --bucket 
        if not done then done=monster.base.drop.AddDropItem(92,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(67,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --rubin amulet
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(4,5)+math.random(44,55)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --pott ash

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --blackstone

        --Category 3: More Special Loot

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --copperd dagger
        if not done then done=monster.base.drop.AddDropItem(826,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --grey trousers

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,773,0,4); --copper coins


    elseif (MonID==532) then --Limping Zombie, Level: 5, Armourtype: midium, Weapontype: concussion

        --Category 1: Speical Loot

        local done=monster.base.drop.AddDropItem(2445,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --small wooden shield
        if not done then done=monster.base.drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=monster.base.drop.AddDropItem(62,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --emerald amulet
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(4,5)+math.random(44,55)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(283,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --blackstone
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bluestone

        --Category 3: Mainly rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(235,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --gold ring
        if not done then done=monster.base.drop.AddDropItem(826,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --black trousers

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,773,0,4); --copper coins


    elseif (MonID==533) then --Zombie, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(324,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --chain helmet
        if not done then done=monster.base.drop.AddDropItem(164,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --big empty bottle
        if not done then done=monster.base.drop.AddDropItem(71,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --bluestone amulet
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(5,6)+math.random(55,66)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(2745,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --parchment

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --bluestone
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blackstone 
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald
		
        --Category 3: Mainly rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,773,0,4); --copper coins
		
		elseif (MonID==534) then --Zombiegiant, Level: 7, Armourtype: medium, Weapontype: concussion

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --rope
        if not done then done=monster.base.drop.AddDropItem(155,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(192,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --blackstone

        --Category 2: Armor

        local done=monster.base.drop.AddDropItem(53,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --leather boots
        if not done then done=monster.base.drop.AddDropItem(366,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(324,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --chain helmet

        --Category 3: Mianly weapons

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(77,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --halberd
        if not done then done=monster.base.drop.AddDropItem(124,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --gilded battleaxe
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(77,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --hardwood greaves

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(1,3),100,773,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
