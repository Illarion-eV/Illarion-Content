require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_78_goldskeletons", package.seeall)


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

    if (MonID==782) then --Golden Legionnaire, Level: 5, Armourtype: medium, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2116,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --red steel greaves
        if not done then done=monster.base.drop.AddDropItem(20,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --large metal shield
        if not done then done=monster.base.drop.AddDropItem(2287,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --albarian soldier's helmet
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(2393,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --heavy plate armor

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nuggets
        if not done then done=monster.base.drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=monster.base.drop.AddDropItem(297,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded dagger
        if not done then done=monster.base.drop.AddDropItem(84,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded longsword
        if not done then done=monster.base.drop.AddDropItem(124,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded battle axe

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2737,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --morning star
        if not done then done=monster.base.drop.AddDropItem(2664,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(207,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(226,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --warhammer
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==783) then --Golden Magus, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(55,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green robe
        if not done then done=monster.base.drop.AddDropItem(193,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue robe
        if not done then done=monster.base.drop.AddDropItem(2295,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(821,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --lblue trousers
        if not done then done=monster.base.drop.AddDropItem(814,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue tunic

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=monster.base.drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=monster.base.drop.AddDropItem(297,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded dagger
        if not done then done=monster.base.drop.AddDropItem(155,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(2744,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pipe

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --skull staff
        if not done then done=monster.base.drop.AddDropItem(40,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(208,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==784) then --Golden Archer, Level: 5, Armourtype: heavy, Weapontype: distance

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw blackstone
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=monster.base.drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,20,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(294,20,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing stars
        if not done then done=monster.base.drop.AddDropItem(322,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --wind arrows
        if not done then done=monster.base.drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --long bow
        if not done then done=monster.base.drop.AddDropItem(2714,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
