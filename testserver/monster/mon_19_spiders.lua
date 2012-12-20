require("item.gems")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_19_spiders", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bewegt alle ihre Beine näher zu ihrem Körper.", "#me moves all of its legs closer to its body.");
msgs:addMessage("#me fährt sich mit den Vorderbeinen über ihren Kopf.", "#me touches its head with its forelegs.");
msgs:addMessage("#me faucht angriffslustig.", "#me spits aggressively.");
msgs:addMessage("#me gibt ein paar zischende Laute von sich.", "#me does some frizzling noises.");
msgs:addMessage("#me hält zwei Beine schützend vor ihrem Gesicht.", "#me holds two legs up protectively.");
msgs:addMessage("#me krabbelt schnell umher.", "#me crawls around quickly.");
msgs:addMessage("#me schüttelt ein Netz von einem ihrer Beine ab, in dem es sich verfangen hatte.", "#me shakes a web off one of its legs, where it had become entangled.");
msgs:addMessage("#me schüttelt ihren Körper etwas.", "#me shakes its head a little.");
msgs:addMessage("#me zieht beim Laufen einige Spinnennetze mit sich.", "#me tugs as it walks a cobweb with it.");
msgs:addMessage("#mes Beine machen knackende Geräusche auf dem Boden.", "#me's legs make cracking sounds as they touch the ground.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==195) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{8,5}},{},40,1) == true );
    else
        return false;
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
    elseif (MonID==195) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{8,5}},{},40,1) == true );
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
   if (MonID==191) then --Rekrap Retep, Level: 5, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(277,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --topaz ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==192) then --Pitservant, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Raw Gems + cutted gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --diamond

        --Category 2: Raw Gems + cutted gems + rings

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(282,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw emeerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw ruby

        --Category 3: Gems + rings

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==193) then --Tarantula, Level: 6, Armourtype: heavy, Weapontype: puncture

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw diamond

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --diamond ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==195) then --Spider Queen, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(254,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw sapphire

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(197,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(item.gems.getMagicGemId(item.gems.RUBY),1,1,999,item.gems.getMagicGemData(1),2); end --magic ruby
        if not done then done=monster.base.drop.AddDropItem(item.gems.getMagicGemId(item.gems.OBSIDIAN),1,1,999,item.gems.getMagicGemData(1),2); end --magic obsidian
        if not done then done=monster.base.drop.AddDropItem(item.gems.getMagicGemId(item.gems.SAPPHIRE),1,1,999,item.gems.getMagicGemData(1),2); end --magic sapphire

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sapphire ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins
		
		
		elseif (MonID==196) then --Small Spider Level: 2, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw ruby

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --ruby

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(10,30),100,333,0,4); --copper coins

    elseif (MonID==194) then
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
