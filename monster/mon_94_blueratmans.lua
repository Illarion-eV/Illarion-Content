require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_94_blueratmans", package.seeall)


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
	if (MonID==942) then
		return monster.base.drop.CastMonMagic(Monster,Enemy,7,{250-750},{{6,5},{3,5}},{},40,1,{35,50})
	else
		return false
	end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    end
	if (MonID==942) then
		return monster.base.drop.CastMonMagic(Monster,Enemy,7,{250-750},{{6,5},{3,5}},{},40,1,{35,50})
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

if (MonID==941) then --Crazy Rat Alchemist, Level: 2, Armourtype: cloth, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(53,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --leather boots
        if not done then done=monster.base.drop.AddDropItem(48,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --leather gloves
        if not done then done=monster.base.drop.AddDropItem(825,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --red trousers
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(814,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --blue tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(355,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --salmon
        if not done then done=monster.base.drop.AddDropItem(97,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --bag
        if not done then done=monster.base.drop.AddDropItem(2935,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --soup bowl

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(189,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(2663,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --dull dwarfen axe
        if not done then done=monster.base.drop.AddDropItem(2652,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --dull broadsword
        if not done then done=monster.base.drop.AddDropItem(2728,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --dull mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,773,0,4); --copper coins


    elseif (MonID==942) then --Ratpriest, Level: 3, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2194,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(366,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(821,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --blue trousers
        if not done then done=monster.base.drop.AddDropItem(2363,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --nightplate
        if not done then done=monster.base.drop.AddDropItem(809,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --grey tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(73,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --trout
        if not done then done=monster.base.drop.AddDropItem(2952,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --plate
        if not done then done=monster.base.drop.AddDropItem(2184,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --clay cup

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(208,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --skull staff
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(2,6),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
