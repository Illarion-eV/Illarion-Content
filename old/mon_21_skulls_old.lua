require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_21_skulls", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#mes Augenhöhlen flammen mit einem Male vor blauen Flammen auf, die sich schnell über den ganzen Schädel ausbreiten. Sie strahlen eine unheimliche Kälte aus.", "#me's eye sockets suddenly glare up with blue flames which spread quickly across the entire skull. They exude an eerie coldness.");
msgs:addMessage("#mes Unterkiefer klappt runter und eine kurze Stichflamme schiesst zwischen den gefährlich spitzen Zähnen hervor.", "#me's jaw drops and and a short tongue of flames shoots out from between the dangerously sharp teeth.");
msgs:addMessage("#me öffnet sein gewaltiges Maul und ein fürchterliches Lachen schallt aus den Untiefen des Schädels empor.", "#me opens its huge mouth and a terrible laughter echoes from the depths of the skull.");
msgs:addMessage("Ah, sie köpften mich, doch die wahrlich klugen Köpfe sind nicht unterzubringen…hahahaha!", "Ah, they beheaded me, but wisest heads are invincible... hahahaha!");
msgs:addMessage("Achtung, Sterblicher… niemals kopflos handeln.", "Remember, mortal... never lose your head.");
msgs:addMessage("Ihr wagt es, vor mein Antlitz zu treten… ihr bewahrt fürwahr einen kühlen Kopf.", "You dare to face my face... you really need to keep a cool head.");
msgs:addMessage("#me knackt mit dem Kiefer.", "#me clacks its jaw.");
msgs:addMessage("#me singt Unverständliches.", "#me chants unintelligibly.");
msgs:addMessage("#me klappert mit den Zähnen.", "#me rattles its teeth.");
msgs:addMessage("#me stöhnt vor sich hin.", "#me moans to itself.");
msgs:addMessage("#mes Augen, der Fähigkeit zu blinzeln beraubt, sind von einer klebrigen Flüssigkeit erfüllt.", "#me's eyes drip with liquid, unable to blink.");
msgs:addMessage("#me starrt düster drein.", "#me stares forward sadly.");
msgs:addMessage("#mes Augen sind erfüllt von Leid und Boshaftigkeit.", "#me's eyes are filled with suffering and malice.");
msgs:addMessage("#me zischt: 'Lasst mich alleine…'", "#me hisses: 'Leave me…'");
msgs:addMessage("Toood!", "Deaaath...");
msgs:addMessage("Er verbleibt - nichts.", "Nothing... left...");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==214) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,10,{300,500},{{9,5}},{},40,9,{0,40}) == true );
    elseif (MonID==215) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,6,{800,1500},{{9,5}},{},40,9,{20,60}) == true );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)
    local MonID=Monster:getMonsterType();

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==214) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{300,500},{{9,5}},{},40,9,{0,40}) == true );
    elseif (MonID==215) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,4,{800,1900},{{9,5}},{},40,9,{20,60}) == true );
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
    if (MonID==211) then --Skull, Level: 2, Armourtype: medium, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(324,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --chain helmet
        if not done then done=monster.base.drop.AddDropItem(2302,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --gynkese mercenarie's helmet
        if not done then done=monster.base.drop.AddDropItem(7,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --horned helmet
        if not done then done=monster.base.drop.AddDropItem(2290,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --round steel hat
        if not done then done=monster.base.drop.AddDropItem(202,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --steel cap

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw emerald

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --emerald

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,333,0,4); --copper coins


    elseif (MonID==212) then --Evil Skull, Level: 2, Armourtype: light, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(356,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --slouch hat
        if not done then done=monster.base.drop.AddDropItem(7,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --horned helmet
        if not done then done=monster.base.drop.AddDropItem(324,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --chain helmet
        if not done then done=monster.base.drop.AddDropItem(2290,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --round steel hat
        if not done then done=monster.base.drop.AddDropItem(2302,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --gynkese mercenarie's helmet

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw topaz

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,333,0,4); --copper coins


    elseif (MonID==213) then --Skull Ram, Level: 2, Armourtype: heavy, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2290,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --round steel hat
        if not done then done=monster.base.drop.AddDropItem(202,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --steel cap
        if not done then done=monster.base.drop.AddDropItem(324,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --chain helmet
        if not done then done=monster.base.drop.AddDropItem(7,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --horned helmet
        if not done then done=monster.base.drop.AddDropItem(2302,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --gynkese mercenarie's helmet

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw diamond

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --diamond

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,333,0,4); --copper coins


    elseif (MonID==214) then --Skull Mage, Level: 2, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(357,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --blue wizard hat
        if not done then done=monster.base.drop.AddDropItem(358,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --red wizard hat
        if not done then done=monster.base.drop.AddDropItem(7,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --horned helmet
        if not done then done=monster.base.drop.AddDropItem(356,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --slouch hat
        if not done then done=monster.base.drop.AddDropItem(324,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --chain helmet

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --ruby

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(1,3),100,333,0,4); --copper coins


    elseif (MonID==215) then --Fire Spitting Skull, Level: 3, Armourtype: heavy, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(187,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --steel hat
        if not done then done=monster.base.drop.AddDropItem(2290,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --round steel hat
        if not done then done=monster.base.drop.AddDropItem(202,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --steel cap
        if not done then done=monster.base.drop.AddDropItem(324,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --chain helmet
        if not done then done=monster.base.drop.AddDropItem(7,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --horned helmet

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(254,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw diamond
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw sapphire

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --diamond
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --sapphire

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(2,6),100,333,0,4); --copper coins

    elseif (MonID==216) then
        -- Drops
    elseif (MonID==217) then
        --Drops
    elseif (MonID==218) then
        --Drops
    elseif (MonID==219) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
