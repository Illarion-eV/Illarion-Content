require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_8_wolfs")


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
base.messages.msgs:addMessage("#me bleibt steifbeinig und aufgerichtet stehen.", "#me stands stiff legged and tall.");
base.messages.msgs:addMessage("#me duckt sich, bereit anzugreifen.", "#me crouches, ready to strike.");
base.messages.msgs:addMessage("#me hat Schaum vor dem Maul.", "#me foams at the mouth.");
base.messages.msgs:addMessage("#me hebt seinen Kopf und heult.", "#me raises its head and howls.");
base.messages.msgs:addMessage("#me kläfft laut.", "#me barks loudly.");
base.messages.msgs:addMessage("#me knirscht mit den Zähnen.", "#me gnashes its teeth.");
base.messages.msgs:addMessage("#me knurrt, das Geräusch ist kaum hörbar.", "#me growls, the noise barely audible.");
base.messages.msgs:addMessage("#me krümmt seinen Rücken.", "#me arches its back.");
base.messages.msgs:addMessage("#me lässt ein böses Knurren hören.", "#me lets out a vicious snarl.");
base.messages.msgs:addMessage("#me stellt seine Ohren auf.", "#me's ears perk up.");
base.messages.msgs:addMessage("#me bleckt die Zähne.", "#me bares its teeth.");
base.messages.msgs:addMessage("#mes Fell sträubt sich.", "#me's fur bristles");
base.messages.msgs:addMessage("#mes Schwanz streckt sich hinter seinem Körper gerade aus.", "#me's tail extends straight out from its body.");

end


function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

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

    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    monster.base.drop.AddDropItem(63,1,50,333,0,1); --inners
    monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur
    monster.base.drop.Dropping(Monster);
end