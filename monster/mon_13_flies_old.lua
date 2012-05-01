require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("quest.aquest28");    --the quest file for the Farmer ques
module("monster.mon_13_flies", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bewegen sich in der Luft auf und ab.", "#me hang in the air bobbing up and down.");
msgs:addMessage("#me brummen einfach herum, wie es Insekten mit Flügeln so tun.", "#me's simple buzzing drone leads one to consider the life of a winged insect.");
msgs:addMessage("#me fliegen ziellos vor und zurück.", "#me fly back and forth aimlessly.");
msgs:addMessage("#me kreisen wild umher.", "#me spin furiously.");
msgs:addMessage("#me landen auf der Erde und bleiben dort nur für einen Augenblick.", "#me land on the ground for a moment");
msgs:addMessage("#me schwirren umher.", "#me buzz around.");
msgs:addMessage("#me sind auf Streifzug.", "#me prowl around.");
msgs:addMessage("Bzzzzz!", "Bzzzzz!");
msgs:addMessage("Summ, summ.", "Buzz, buzz.");

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

    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

	local NoDrop=Monster:getSkill("no drop pls")
	if NoDrop >= 10 then
	return;
	end
	
    if killer[Monster.id] ~= nil then   -- last one who attacked

        murderer=getCharForId(killer[Monster.id]); -- get hold of character struct
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();
    if (MonID==131) then
        -- Drops
    elseif (MonID==132) then
        -- Drops
    elseif (MonID==133) then
        player_list = world:getPlayersInRangeOf(Monster.pos, 5);
        if (player_list[1]~=nil) then
            User = getCharForId(player_list[1].id);  --create a save copy of the char struct
			--User:inform("blub, monster dead");
			local cow, task, counter = quest.aquest28.split_questdata(User);
			counter = counter - 1;
			task = 0; --reset task
			quest.aquest28.glue_questdata(User, cow,task,counter); --put the quest data with changes together

			aquest28Effect = LongTimeEffect(32,100); -- create new effect and initialize with nextcalled = 1s
			User.effects:addEffect(aquest28Effect); -- add effect #3         2
		end
		--Drops
    elseif (MonID==134) then
        --Drops
    elseif (MonID==135) then
        --Drops
    elseif (MonID==136) then
        -- Drops
    elseif (MonID==137) then
        --Drops
    elseif (MonID==138) then
        --Drops
    elseif (MonID==139) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
