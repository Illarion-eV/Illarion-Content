require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_25_gnolls", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bellt vor Wut.", "#me barks in fury.");
msgs:addMessage("#me fletscht die Zähne.", "#me bares its teeth.");
msgs:addMessage("#me hechelt.", "#me utters a noise, half cackle, half howl.");
msgs:addMessage("#me jault.", "#me howls.");
msgs:addMessage("#me kichert schrill und laut.", "#me cackles with a loud and piercing sound.");
msgs:addMessage("#me kneift seine Augen zusammen.", "#me squints its eyes.");
msgs:addMessage("#me knurrt leise.", "#me snarls quietly.");
msgs:addMessage("#me schnappt.", "#me snaps its jaw.");
msgs:addMessage("#me schnauft laut.", "#me gasps loudly.");
msgs:addMessage("#mes Schwanz sträubt sich.", "#me's tail rises.");
msgs:addMessage("#me zieht die Luft scharf schnüffelnd durch die Nase ein.", "#me breathes through its nose, sniffing.");
msgs:addMessage("#me legt den Kopf in den Nacken und stößt eine Mischung aus Heulen und Gebell hervor.", "#me throws back its head and lets out a mixture of howling and barking.");
msgs:addMessage("#me fährt sich mit seiner rauhen Zunge über die Schnauze, ehe er leise verärgert kläfft.", "#me licks its nose with its rough tongue before it yaps angrily.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==253) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{1000,3000},{{4,5},{9,5},{51,5}},{},40,1) == true );
    else
        return false;
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
    elseif (MonID==253) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{1000,3000},{{4,5},{9,5},{51,5}},{},40,1) == true );
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
    if (MonID==251) then --Gnoll, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(367,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short leather legs
        if not done then done=monster.base.drop.AddDropItem(96,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel tower shield
        if not done then done=monster.base.drop.AddDropItem(48,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --leather gloves
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(552,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --deer meat
        if not done then done=monster.base.drop.AddDropItem(307,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --pork
        if not done then done=monster.base.drop.AddDropItem(553,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --rabbit meat
        if not done then done=monster.base.drop.AddDropItem(2940,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --steak
        if not done then done=monster.base.drop.AddDropItem(2934,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --lamb meat

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(25,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --sabre
        if not done then done=monster.base.drop.AddDropItem(78,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --short sword
        if not done then done=monster.base.drop.AddDropItem(2694,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned serinjahsword
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjahsword
        if not done then done=monster.base.drop.AddDropItem(2778,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==252) then --Gnoll Warrior, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(366,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --leather legs
        if not done then done=monster.base.drop.AddDropItem(916,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --ornate tower shield
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(697,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2586,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --fur
        if not done then done=monster.base.drop.AddDropItem(2547,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --leather
        if not done then done=monster.base.drop.AddDropItem(2746,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --razor blade
        if not done then done=monster.base.drop.AddDropItem(47,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --needle
        if not done then done=monster.base.drop.AddDropItem(50,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --thread

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2757,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --scimitar
        if not done then done=monster.base.drop.AddDropItem(2701,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --longsword
        if not done then done=monster.base.drop.AddDropItem(2658,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --broad sword
        if not done then done=monster.base.drop.AddDropItem(2705,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned longsword
        if not done then done=monster.base.drop.AddDropItem(2655,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned broadsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==253) then --Gnoll Shaman, Level: 6, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(194,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --black robe
        if not done then done=monster.base.drop.AddDropItem(195,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --yellow robe
        if not done then done=monster.base.drop.AddDropItem(822,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --yellow trousers
        if not done then done=monster.base.drop.AddDropItem(34,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --black trousers
        if not done then done=monster.base.drop.AddDropItem(827,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --white trousers

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(58,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --mortar
        if not done then done=monster.base.drop.AddDropItem(2952,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --plate
        if not done then done=monster.base.drop.AddDropItem(2183,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --clay mug
        if not done then done=monster.base.drop.AddDropItem(1001,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --plate
        if not done then done=monster.base.drop.AddDropItem(2031,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --plate

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(209,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==254) then --Gnoll Thief, Level: 5, Armourtype: light, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2113,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --fur trousers
        if not done then done=monster.base.drop.AddDropItem(369,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather shoes
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(83,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(1858,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --goblet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2740,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --red dagger
        if not done then done=monster.base.drop.AddDropItem(2675,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --rapier
        if not done then done=monster.base.drop.AddDropItem(2689,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned ornate dagger
        if not done then done=monster.base.drop.AddDropItem(2672,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned dagger
        if not done then done=monster.base.drop.AddDropItem(2668,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned simple dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,333,0,4); --copper coins


    elseif (MonID==255) then --Gnoll Forester, Level: 6, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2114,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short fur trousers
        if not done then done=monster.base.drop.AddDropItem(697,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(51,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --bucket
        if not done then done=monster.base.drop.AddDropItem(3051,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --sausage
        if not done then done=monster.base.drop.AddDropItem(2935,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --soup bowl
        if not done then done=monster.base.drop.AddDropItem(63,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --entrails
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --raw stone

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,10,20,(100*math.random(5,6)+math.random(55,66)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(2714,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --hunting bow
        if not done then done=monster.base.drop.AddDropItem(2727,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah firebow
        if not done then done=monster.base.drop.AddDropItem(2646,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah rider bow
        if not done then done=monster.base.drop.AddDropItem(2685,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --magical elven bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins

    elseif (MonID==256) then
        -- Drops
    elseif (MonID==257) then
        --Drops
    elseif (MonID==258) then
        --Drops
    elseif (MonID==259) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
