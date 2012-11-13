require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_74_transparentskeletons", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me fehlt bei genauerer Betrachtung wohl der Unterkiefer.", "#me is missing its lower jaw on closer inspection.");
msgs:addMessage("#me greift nach oben zu seinem eigenen Schädel und verdreht ihn mit einem lauten, knackenden Geräusch.", "#me reaches up, grabs it's own skull and twists, making a loud cracking noise.");
msgs:addMessage("#me grinst wie ein Narr.", "#me grins like a fool.");
msgs:addMessage("#me hebt seine Waffe in die Höhe und klappert mit den Zähnen.", "#me raises his weapon and rattles with its tooth.");
msgs:addMessage("#me kichert still, die Schultern schwanken und knacken.", "#me cackles silently, shoulders heaving and creaking.");
msgs:addMessage("#me klappert, die Knochen rasseln.", "#me clatters, bones rattling.");
msgs:addMessage("#me klappt seinen Kiefer zu um bösartig zu grinsen.", "#me snaps its jaw shut, grinning wickedly.");
msgs:addMessage("#me kriecht qualvoll über den Boden..", "#me shuffles painfully across the floor.");
msgs:addMessage("#me macht langsame und mühsame Schritte... Click...clack...click...clack...", "#me takes slow, tedious steps... Click...clack...click...clack...");
msgs:addMessage("#me schlurft vorwärts, Gelenke knarren und knacken.", "#me shambles forward, joints clicking and creaking...");
msgs:addMessage("#me schwingt eine uralte Waffe, verrostet und verbeult.", "#me brandishes an ancient weapon, rusted and battered.");
msgs:addMessage("#me schwingt gewaltsam seine verfallene Waffe.", "#me swings its decayed weapon violently.");
msgs:addMessage("#me streckt eine knochige Hand aus.", "#me reaches out a bony hand.");
msgs:addMessage("#me taumelt, beinahe zusammenstürzend.", "#me staggers, nearly toppling over.");
msgs:addMessage("#mes Kiefer öffnet sich zu einem lautlosen Schrei.", "#me's jaw swivels in a silent scream...");
msgs:addMessage("#mes Knochen schlagen klappernd und rasselnd aneinander.", "#me's bones clinks clacking and rattling together.");
msgs:addMessage("#mes Kopf hängt herab, leere Augenhöhlen starren geradeaus.", "#me's head lolls around, empty eye sockets staring.");

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

    if (MonID==741) then --Phantom Skeleton, Level: 5, Armourtype: heavy, Weapontype: slashing

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(254,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw bluestone

        --Category 2: Cutted gems

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --blackstone
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bluestone

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2701,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --longsword
        if not done then done=monster.base.drop.AddDropItem(78,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --short sword
        if not done then done=monster.base.drop.AddDropItem(2660,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --dwarven axe
        if not done then done=monster.base.drop.AddDropItem(2788,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --snake sword
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --serinjah sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==742) then --Bone Schemes, Level: 6, Armourtype: medium, Weapontype: conussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2114,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short fur trousers
        if not done then done=monster.base.drop.AddDropItem(2448,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --legionaire's tower shield 
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(697,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(69,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --raw leather
        if not done then done=monster.base.drop.AddDropItem(3051,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --sausage
        if not done then done=monster.base.drop.AddDropItem(2922,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --sausage dish
        if not done then done=monster.base.drop.AddDropItem(2543,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --conifer wood board
        if not done then done=monster.base.drop.AddDropItem(3,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --conifer wood

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(230,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(226,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --warhammer

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==743) then --Bone Ghost, Level: 7, Armourtype: heavy, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(548,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --mage robe
        if not done then done=monster.base.drop.AddDropItem(547,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --novice mage robe
        if not done then done=monster.base.drop.AddDropItem(558,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --master mage robe
        if not done then done=monster.base.drop.AddDropItem(370,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --colourful wizard hat
        if not done then done=monster.base.drop.AddDropItem(358,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --red wizard hat

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --bluestone ring
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --pot ash
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --golden goblet
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(6,7)+math.random(66,77)),1,2); end --magic diamond

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(190,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --blackstone ring
        if not done then done=monster.base.drop.AddDropItem(189,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --topas ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==744) then --Phantom Archer, Level: 6, Armourtype: medium, Weapontype: distance

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

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,20,20,(100*math.random(5,6)+math.random(55,66)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(293,10,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --throwing spear
        if not done then done=monster.base.drop.AddDropItem(322,10,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --wind arrows
        if not done then done=monster.base.drop.AddDropItem(2708,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --long bow
        if not done then done=monster.base.drop.AddDropItem(2714,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --hunting bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
