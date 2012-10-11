require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_22_greenspiders", package.seeall)


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
	
    --[[local MonID=Monster:getMonsterType();
    if (MonID==211) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{4000,5000},{{8,5}},{},40,1) == true );
    else
        return false;
    end]]
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    --[[local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==211) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{4000,5000},{{8,5}},{},40,1) == true );
    else
        return false
    end]]
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
   if (MonID==221) then --Gynkese Widow, Level: 6, Armourtype: light, Weapontype: puncture

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw bluestone
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw diamond

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --bluestone
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond

        --Category 3: Rings

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --diamond ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==221) then
        -- Drops
    elseif (MonID==222) then
        --Drops
    elseif (MonID==223) then
        --Drops
    elseif (MonID==224) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
