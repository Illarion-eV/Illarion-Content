require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_19_lesserdemons", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me knurrt bedrohlich.", "#me snarls menacingly.");
msgs:addMessage("#me prustet vor Lachen.", "#me snorts with laughter.");
msgs:addMessage("Das ist dein letzter Tag!", "You shall not live to see another day!");
msgs:addMessage("Dein Schicksal ist besiegelt!", "Your fate is sealed!");
msgs:addMessage("Deine Versuche sind erbärmlich!", "Your attempts are pathetic!");
msgs:addMessage("Die Kammerjäger sind da!", "This is pest control!");
msgs:addMessage("Du widerst mich an!", "You disgust me!");
msgs:addMessage("Erwarte keine Gnade!", "Do not expect mercy!");
msgs:addMessage("Ich werde es kurz machen!", "I shall make this quick!");
msgs:addMessage("Irgendwelche letzten Worte?!", "Any last words?!");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    return ( monster.base.drop.CastMonMagic(Monster,Enemy,10,{},{},{{359,222,555,0,7},{360,222,555,0,7},{372,222,555,0,7}},20,1) == true );
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    else
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,10,{},{},{{359,222,555,0,7},{360,222,555,0,7},{372,222,555,0,7}},20,1) == true );
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

    if (MonID==191) then --Lower Demon, Level: 7, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2367,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --albarian noble's armor
        if not done then done=monster.base.drop.AddDropItem(2291,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --salkamaerian paladin's helmet
        if not done then done=monster.base.drop.AddDropItem(2287,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --albarian  soldier's helmet
        if not done then done=monster.base.drop.AddDropItem(2193,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2284,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --shield of the sky

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(79,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst amulet
        if not done then done=monster.base.drop.AddDropItem(333,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --horn
        if not done then done=monster.base.drop.AddDropItem(2535,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --iron ingot
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(84,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --golden longsword
        if not done then done=monster.base.drop.AddDropItem(98,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --silvered longsword
        if not done then done=monster.base.drop.AddDropItem(2704,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --magical longsword
        if not done then done=monster.base.drop.AddDropItem(85,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --coppered longsword
        if not done then done=monster.base.drop.AddDropItem(123,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --merinium plated longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(1,3),100,333,0,4); --silver coins


    elseif (MonID==192) then --Unholy Alcolyte, Level: 8, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(547,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --novice mage robe
        if not done then done=monster.base.drop.AddDropItem(548,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --mage robe
        if not done then done=monster.base.drop.AddDropItem(558,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --master mage robe
        if not done then done=monster.base.drop.AddDropItem(371,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --expensive wizard hat
        if not done then done=monster.base.drop.AddDropItem(357,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --blue wizard hat

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(67,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby amulet
        if not done then done=monster.base.drop.AddDropItem(336,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --mirror
        if not done then done=monster.base.drop.AddDropItem(2550,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --copper ingot
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(76,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --mage's staff
        if not done then done=monster.base.drop.AddDropItem(57,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(323,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand
        if not done then done=monster.base.drop.AddDropItem(2784,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of water
        if not done then done=monster.base.drop.AddDropItem(2785,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of air

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==193) then --Moshran's Warrior, Level: 8, Armourtype: heavy, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2357,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --shadow plate
        if not done then done=monster.base.drop.AddDropItem(2363,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --nightplate
        if not done then done=monster.base.drop.AddDropItem(184,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --visor helmet
        if not done then done=monster.base.drop.AddDropItem(2111,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --blue steel greaves
        if not done then done=monster.base.drop.AddDropItem(771,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --albarian steel boots

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(62,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --emerald amulet
        if not done then done=monster.base.drop.AddDropItem(391,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --torch
        if not done then done=monster.base.drop.AddDropItem(104,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --silver ingot
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic emerald

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(207,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --battle staff
        if not done then done=monster.base.drop.AddDropItem(226,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --warhammer
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==194) then --Undead Raptor, Level: 8, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2389,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --salkamaerian armor
        if not done then done=monster.base.drop.AddDropItem(2365,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --salkamaerian officer's armor
        if not done then done=monster.base.drop.AddDropItem(2291,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --salkamaerian paladin's helmet
        if not done then done=monster.base.drop.AddDropItem(2194,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2439,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --cloud shield

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(278,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(82,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --obsidian amulet
        if not done then done=monster.base.drop.AddDropItem(92,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(236,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --gold ingot
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic obsidian

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2788,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --snake sword
        if not done then done=monster.base.drop.AddDropItem(2778,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --elven sword
        if not done then done=monster.base.drop.AddDropItem(2693,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --magical serinjah sword
        if not done then done=monster.base.drop.AddDropItem(2654,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --magical broadsword
        if not done then done=monster.base.drop.AddDropItem(2704,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --magical longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==195) then --Lower Demon Mage, Level: 8, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(548,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --mage robe
        if not done then done=monster.base.drop.AddDropItem(558,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --master mage robe
        if not done then done=monster.base.drop.AddDropItem(547,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --novice mage robe
        if not done then done=monster.base.drop.AddDropItem(357,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --blue wizard hat
        if not done then done=monster.base.drop.AddDropItem(358,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --red wizard hat

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(83,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz amulet
        if not done then done=monster.base.drop.AddDropItem(463,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --quill
        if not done then done=monster.base.drop.AddDropItem(2571,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --merinium ingot
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic topaz

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(208,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(207,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(323,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand
        if not done then done=monster.base.drop.AddDropItem(2782,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of earth
        if not done then done=monster.base.drop.AddDropItem(2783,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of fire

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins

    elseif (MonID==196) then
        -- Drops
    elseif (MonID==197) then
        --Drops
    elseif (MonID==198) then
        --Drops
    elseif (MonID==199) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
