require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_7_panthers", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me blinzelt mit beiden Augen, lässt seinen Blick jedoch keinen Moment von seinem Ziel abschweifen.", "#me blinks with both eyes still not moving its gaze from its target for even one second.");
msgs:addMessage("#me duckt sich, bereit zum Sprung.", "#me crouches, ready to jump.");
msgs:addMessage("#me faucht angriffslustig und schnellt vorwärts.", "#me hisses aggressively and rushes forward.");
msgs:addMessage("#me ist ein schneller, wendiger und unberechenbarer Gegner, dessen Bewegungen in ihrer Geräuschlosigkeit überraschen.", "#me is a fast, agile and unpredictable enemy, whose movements surprise in their silence.");
msgs:addMessage("#me lässt ein drohendes Grollen tief in seiner Kehle ertönen.", "#me sends out a menacing growl from deep within its throat.");
msgs:addMessage("#me legt murrend die Ohren an.", "#me grumbling flattens its ears.");
msgs:addMessage("#me miaut jammernd, aber der Schmerz scheint ihn eher noch wütender zu machen.", "#me whines, but the pain seems to make it even angrier.");
msgs:addMessage("#me peitscht mit seinem Schwanz duch die Luft.", "#me lashes its tail through the air.");
msgs:addMessage("#me schleicht auf samtigen Pfoten.", "#me sneaks on velvet paws.");
msgs:addMessage("#me springt ohne Vorwarnung, die Zähne zum tödlichen Biss gebleckt.", "#me jumps without warning; fangs prepared for a deadly bite.");
msgs:addMessage("#mes Fell glänzt wie schwarzer Samt, aber sein Schwanz zornig gesträubt wie eine Bürste.", "#me's fur shines like black velvet, but its tail is viciously bristled like a brush.");
msgs:addMessage("#mes weiße Zähne bilden einen scharfen Kontrast zu seinem schwarzen Fell, als er sie fauchend zeigt.", "#me's white teeth contrast hard with its black fur, as it hisses and bares them.");

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

    if killer and killer[Monster.id] ~= nil then

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
