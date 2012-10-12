require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_9_goblins", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("Dieses Monster wird mit NewIllarion abgeschafft. Bitte für Ersatz sorgen, um die Zahl der Bossmonster und die Balance der Monsterdrops beibehalten zu können!", "This monster will be discontinued with NewIllarion. Please create a replacement to maintain the number of boss monsters and the balance of drops!");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==93) then
        return ( monster.base.drop.SuddenWarp(Monster,Enemy,true) or monster.base.drop.CastMonMagic(Monster,Enemy,8,{500,1000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{25,40}) );
    elseif (MonID==333) then
        return ( monster.base.drop.SuddenWarp(Monster,Enemy,true) or monster.base.drop.SuddenWarp(Monster,Enemy,true) or monster.base.drop.CastMonMagic(Monster,Enemy,15,{500,1000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{25,40}) );
    else
        return false
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==93) then
        return ( monster.base.drop.CastHealing( Monster, 6, {1500,3000}, 8, {16, 13}, 40 ) or monster.base.drop.CastMonMagic(Monster,Enemy,3,{1200,2000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{60,90}) );
    elseif (MonID==333) then
        return ( monster.base.drop.CastHealing( Monster, 3, {1500,3000}, 8, {16, 13}, 40 ) or monster.base.drop.CastMonMagic(Monster,Enemy,6,{1200,2000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{60,90}) );
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
    if (MonID==91) then --Goblin, Level: 3, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --wooden shield
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(356,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --slouch hat
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --light hunting armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(15,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --apple
        if not done then done=monster.base.drop.AddDropItem(80,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --banana
        if not done then done=monster.base.drop.AddDropItem(302,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --cherries
        if not done then done=monster.base.drop.AddDropItem(81,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --berries
        if not done then done=monster.base.drop.AddDropItem(388,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --grapes

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(78,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --short sword
        if not done then done=monster.base.drop.AddDropItem(445,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --wooden sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(2701,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(2,6),100,333,0,4); --copper coins


    elseif (MonID==92) then --Goblin Warrior, Level: 4, Armourtype: medium, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2302,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --gynkese mercenarie's helmet
        if not done then done=monster.base.drop.AddDropItem(2295,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(17,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --wooden shield
        if not done then done=monster.base.drop.AddDropItem(2360,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --Lor-Angur guardian's armor
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(306,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --ham
        if not done then done=monster.base.drop.AddDropItem(97,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bag
        if not done then done=monster.base.drop.AddDropItem(333,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --horn
        if not done then done=monster.base.drop.AddDropItem(92,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --golden goblet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(231,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(23,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --hammer

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==93) then --Goblin Shaman, Level: 4, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(813,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --white doublet
        if not done then done=monster.base.drop.AddDropItem(457,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --green shirt
        if not done then done=monster.base.drop.AddDropItem(819,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --black tunic
        if not done then done=monster.base.drop.AddDropItem(830,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --gray hat with feather
        if not done then done=monster.base.drop.AddDropItem(2378,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --blackcult robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --insides
        if not done then done=monster.base.drop.AddDropItem(50,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --thread
        if not done then done=monster.base.drop.AddDropItem(2935,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --bowl
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pot ash
        if not done then done=monster.base.drop.AddDropItem(391,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --torch

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --skull staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(57,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==94) then --Goblin Hunter, Level: 4, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(48,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --leather gloves
        if not done then done=monster.base.drop.AddDropItem(2114,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short fur trousers
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --full leatherarmor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2586,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --fur
        if not done then done=monster.base.drop.AddDropItem(2547,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --leather
        if not done then done=monster.base.drop.AddDropItem(553,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --rabbit meat
        if not done then done=monster.base.drop.AddDropItem(552,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --deer meat
        if not done then done=monster.base.drop.AddDropItem(2934,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --lamb meat

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(1266,10,20,(100*math.random(3,4)+math.random(33,44)),0,3); --stones
        if not done then done=monster.base.drop.AddDropItem(89,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --sling
        if not done then done=monster.base.drop.AddDropItem(65,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --short bow
        if not done then done=monster.base.drop.AddDropItem(2714,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --hunting bow
        if not done then done=monster.base.drop.AddDropItem(64,10,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --arrows

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==95) then --Goblin Thief, Level: 4, Armourtype: light, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(369,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --leather shoes
        if not done then done=monster.base.drop.AddDropItem(2113,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --fur trousers
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --full leatherarmor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(62,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald amulet
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(225,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --crown

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(27,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple dagger
        if not done then done=monster.base.drop.AddDropItem(189,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --dagger
        if not done then done=monster.base.drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=monster.base.drop.AddDropItem(190,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ornate dagger
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins

    elseif (MonID==96) then
        -- Drops
    elseif (MonID==97) then
        --Drops
    elseif (MonID==98) then
        --Drops
    elseif (MonID==99) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
