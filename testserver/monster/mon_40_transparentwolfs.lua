require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_40_transparentwolfs", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bleibt steifbeinig und aufgerichtet stehen.", "#me stands stiff legged and tall.");
msgs:addMessage("#me duckt sich, bereit anzugreifen.", "#me crouches, ready to strike.");
msgs:addMessage("#me hat Schaum vor dem Maul.", "#me foams at the mouth.");
msgs:addMessage("#me hebt seinen Kopf und heult.", "#me raises its head and howls.");
msgs:addMessage("#me kläfft laut.", "#me barks loudly.");
msgs:addMessage("#me knirscht mit den Zähnen.", "#me gnashes its teeth.");
msgs:addMessage("#me knurrt, das Geräusch ist kaum hörbar.", "#me growls, the noise barely audible.");
msgs:addMessage("#me krümmt seinen Rücken.", "#me arches its back.");
msgs:addMessage("#me lässt ein böses Knurren hören.", "#me lets out a vicious snarl.");
msgs:addMessage("#me stellt seine Ohren auf.", "#me's ears perk up.");
msgs:addMessage("#me bleckt die Zähne.", "#me bares its teeth.");
msgs:addMessage("#mes Fell sträubt sich.", "#me's fur bristles");
msgs:addMessage("#mes Schwanz streckt sich hinter seinem Körper gerade aus.", "#me's tail extends straight out from its body.");

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
	
   if (MonID==401) then --Ghostwolf, Level: 4, Armourtype: heavy, Weapontype: distance

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,50,(100*math.random(1,2)+math.random(11,22)),0,1); --entrails
		
        --Category 2: Perma Loot
        monster.base.drop.AddDropItem(2586,math.random(1,1),100,333,0,2); --fur
	end
    monster.base.drop.Dropping(Monster);
end


