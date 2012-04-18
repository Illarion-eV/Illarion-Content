require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_72_blackmummies", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.");
msgs:addMessage("#me ist mit Wunden übersäht", "#me is littered with wounds.");
msgs:addMessage("#me macht ächzende Geräusche.", "#me makes groaning noises.");
msgs:addMessage("#me spuckt etwas Blut auf den Boden.", "#me spits out some blood.");
msgs:addMessage("#me starrt ins Leere.", "#me stares into oblivion.");
msgs:addMessage("#me stöhnt unter Schmerzen.", "#me moans with pain.");
msgs:addMessage("#me torkelt.", "#me staggers.");
msgs:addMessage("#me wackelt etwas unsicher.", "#me is a bit unsteady on its feet.");
msgs:addMessage("Hiiirne!", "Braaains!");
msgs:addMessage("Komm... zu... uns...", "Join... us...");
msgs:addMessage("#me fährt sich mit einer klauenhaften Hand murmelnd über den pilzbefallenen Kopf, ehe er ein schlürfendes Geräusch von sich gibt.", "#me runs with claw-like hands over its fungus-stricken head as it makes a shuffling noise.");
msgs:addMessage("#me weist einige schwere Wunden auf, weshalb er nur schwerfällig vorwärts kommt. Als er allerdings die zerfallende Nase reckt, scheint mehr 'Leben' in ihn zurückzukehren.", "#me has severe wounds, it moves very slowly. But as it stretches its disintegrating nose, more 'life' seems to come back into it.");
msgs:addMessage("#me tropft dicklicher Speichel aus dem Mundwinkel und seine milchigen Augen starren trübsinnig drein, während ihm unverständliche Worte entfläuchen.", "#me drops syrupy saliva from its mouth and its eyes stare gloomily as it speaks unintelligible words.");
msgs:addMessage("#me stöhnt schwer und beugt sich vornüber, eine schwarze Flüssigkeit zu Boden spuckend. Danach richtet er sich wieder auf und haftet den Blick gebannt auf das Opfer.", "#me groans heavily and leans forward, spitting a black liquid on the floor. Then it straightens up and affixes its eyes on the victim.");

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

if (MonID==721) then --Forgotten Mummy, Level: 6, Armourtype: medium, Weapontype: distance

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(194,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --black robe
        if not done then done=monster.base.drop.AddDropItem(195,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --yellow robe
        if not done then done=monster.base.drop.AddDropItem(822,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --yellow trousers
        if not done then done=monster.base.drop.AddDropItem(34,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --black trousers
        if not done then done=monster.base.drop.AddDropItem(827,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --white trousers

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --entrails
        if not done then done=monster.base.drop.AddDropItem(2952,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --plate
        if not done then done=monster.base.drop.AddDropItem(2183,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --clay mug
        if not done then done=monster.base.drop.AddDropItem(58,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --morter
        if not done then done=monster.base.drop.AddDropItem(2031,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --plate

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(209,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
