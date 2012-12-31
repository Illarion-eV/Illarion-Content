require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_92_redratmans", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = base.messages.Messages();
msgs:addMessage("#me cackles.", "#me gackert.");

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

if (MonID==921) then --Sewerrat, Level: 2, Armourtype: cloth, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(697,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --fur boots
        if not done then done=monster.base.drop.AddDropItem(19,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --metal shield
        if not done then done=monster.base.drop.AddDropItem(2113,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --fur trousers
        if not done then done=monster.base.drop.AddDropItem(364,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --full leatherarmor

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(333,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --horn
        if not done then done=monster.base.drop.AddDropItem(92,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(306,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --ham
        if not done then done=monster.base.drop.AddDropItem(97,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --bag
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --golden goblet

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(78,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --short sword
        if not done then done=monster.base.drop.AddDropItem(445,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --wooden sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(2701,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(10,30),100,773,0,4); --copper coins


    elseif (MonID==922) then --Giant Sewerrat, Level: 3, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --leather shoes
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --light hunting armor
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --green tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(2183,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --clay mug
        if not done then done=monster.base.drop.AddDropItem(332,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --harp
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --golden goblet

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(230,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --mace
        if not done then done=monster.base.drop.AddDropItem(2664,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(2786,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --branch
        if not done then done=monster.base.drop.AddDropItem(56,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --bough

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
