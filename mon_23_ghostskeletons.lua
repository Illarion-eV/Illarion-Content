dofile("mon_drop.lua");
dofile("mon_lookat.lua");
dofile("mon_quests.lua");
require("base.messages");

function ini(Monster)

init=true;
iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me gackert bösartig.", "#me cackles softly.");
msgs:addMessage("#me haucht die Worte: 'Ihr werdet sterrrrrrben.'", "#me wheezes the words: 'You will dieee.'");
msgs:addMessage("#me hüpft auf und ab während er schwebt.", "#me bobs up and down as it floats.");
msgs:addMessage("#me keucht erzürnt.", "#me wheezes angrily.");
msgs:addMessage("#me öffnet weit seinen Mund als wolle er etwas essen, heraus kommt jedoch nur ein knarrender Ton.", "#me opens its mouth wide as if to eat, but only a creaking sound follows.");
msgs:addMessage("#me stößt einen hohen und lautet Ton aus.", "#me releases a piercing and haunting shriek.");
msgs:addMessage("#me verströmt eine tödliche kälte.", "#me emanates a deathly chill.");
msgs:addMessage("#me zischt etwas unverständliches.", "#me hisses words incomprehensibly.");
msgs:addMessage("#me zischt: 'Betretet Chergas Reich!'", "#me hisses: 'Enter Cherga's realm!'.");
msgs:addMessage("Der Schatten erwartet dich!", "Shadow followsss.");
msgs:addMessage("Die Dunkelheit wartet.", "Darrrkness awaitsss.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:get_mon_type();
    if (MonID==233) then
        return ( SuddenWarp(Monster,Enemy,true) or CastMonMagic(Monster,Enemy,8,{250,1000},{{4,5},{9,5},{51,5}},{},40,1,{25,40}) );
    elseif (MonID == 235) then
        return EvilLook( Monster, Enemy );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:get_mon_type();
    if DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==233) then
        return ( CastHealing( Monster, 3, {2000,2500}, 8, {16, 13}, 40 ) or CastMonMagic(Monster,Enemy,5,{2000,3000},{{4,5},{9,5},{51,5}},{},40,1,{45,60}) );
    elseif (MonID == 235) then
        return EvilLook( Monster, Enemy );
    else
        return false
    end
end

function EvilLook( monster, enemy )
    if (math.random(15) ~= 1) then
        return false;
    end

    if not base.common.IsLookingAt( enemy, monster.pos ) then
        return false;
    end

    base.common.TalkNLS( monster, CCharacter.say,
    "#me blickt "..enemy.name.." mit einem bösen Blick an.",
    "#me gives "..enemy.name.." an evil look." );

    base.common.InformNLS( enemy,
    "Der Blick es Skelettes fährt dir ins Mark und lähmt kurz deine Glieder.",
    "The gaze of the skeleton goes to the core and freezes your limps a moment." );

    enemy.movepoints = enemy.movepoints - math.random( 10, 20 );
    monster.movepoints = monster.movepoints - 5;
    return true;
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

            checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    ClearDropping();
    local MonID=Monster:get_mon_type();
    if (MonID==231) then --Shadow Skeleton, Level: 4, Armourtype: -, Weapontype: puncture (wrestling)

        --Category 1: Armor

        local done=AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw ruby
        if not done then done=AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw bluestone
        if not done then done=AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=AddDropItem(256,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald

        --Category 2: Special loot

        local done=AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --ruby
        if not done then done=AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Weapon

        local done=AddDropItem(189,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --dagger
        if not done then done=AddDropItem(27,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --simple dagger
        if not done then done=AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger
        if not done then done=AddDropItem(389,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --silvered dagger
        if not done then done=AddDropItem(2671,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --magic dagger

        --Category 4: Perma Loot
        AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==232) then --Poltergeist, Level: 4, Armourtype: -, Weapontype: concussion (wrestling)

        --Category 1: Armor

        local done=AddDropItem(251,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw amethyst
        if not done then done=AddDropItem(256,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald
        if not done then done=AddDropItem(255,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw ruby
        if not done then done=AddDropItem(254,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw diamond
        if not done then done=AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz

        --Category 2: Special loot

        local done=AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=AddDropItem(45,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald
        if not done then done=AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --diamond
        if not done then done=AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz

        --Category 3: Weapon

        local done=AddDropItem(2664,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --club
        if not done then done=AddDropItem(231,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=AddDropItem(231,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star
        if not done then done=AddDropItem(2737,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star
        if not done then done=AddDropItem(226,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --warhammer

        --Category 4: Perma Loot
        AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==233) then --Shadow Skeleton Mage, Level: 4, Armourtype: -, Weapontype: concussion

        --Category 1: Armor

        local done=AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw emerald
        if not done then done=AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=AddDropItem(253,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw bluestone
        if not done then done=AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=AddDropItem(254,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw diamond

        --Category 2: Special loot

        local done=AddDropItem(45,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --emerald
        if not done then done=AddDropItem(283,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --diamond

        --Category 3: Weapon

        local done=AddDropItem(57,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple mage's staff
        if not done then done=AddDropItem(76,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --mage's staff
        if not done then done=AddDropItem(208,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ornate mage's staff
        if not done then done=AddDropItem(2664,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --club
        if not done then done=AddDropItem(39,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --skull staff

        --Category 4: Perma Loot
        AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins


    elseif (MonID==234) then --Shadow Skeleton Warrior, Level: 5, Armourtype: -, Weapontype: slashing

        --Category 1: Armor

        local done=AddDropItem(254,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw diamond
        if not done then done=AddDropItem(252,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw blackstone
        if not done then done=AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw amethyst
        if not done then done=AddDropItem(253,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw bluestone

        --Category 2: Special loot

        local done=AddDropItem(285,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --diamond
        if not done then done=AddDropItem(283,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --blackstone
        if not done then done=AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bluestone

        --Category 3: Weapon

        local done=AddDropItem(2701,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --longsword
        if not done then done=AddDropItem(78,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --short sword
        if not done then done=AddDropItem(2660,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --dwarven axe
        if not done then done=AddDropItem(2788,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --snake sword
        if not done then done=AddDropItem(1,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --serinjah sword

        --Category 4: Perma Loot
        AddDropItem(3076,math.random(6,18),100,333,0,4); --copper coins


    elseif (MonID==235) then --Evil Shadow Skeleton, Level: 4, Armourtype: -, Weapontype: puncture (wrestling)

        --Category 1: Armor

        local done=AddDropItem(257,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw topaz
        if not done then done=AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw bluestone
        if not done then done=AddDropItem(251,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw amethyst
        if not done then done=AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw blackstone
        if not done then done=AddDropItem(255,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw ruby

        --Category 2: Special loot

        local done=AddDropItem(198,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --topaz
        if not done then done=AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --bluestone
        if not done then done=AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --blackstone
        if not done then done=AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby

        --Category 3: Weapon

        local done=AddDropItem(190,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ornate dagger
        if not done then done=AddDropItem(2740,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --red dagger
        if not done then done=AddDropItem(297,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --golden dagger
        if not done then done=AddDropItem(444,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --merinium plated dagger
        if not done then done=AddDropItem(2742,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --fire dagger

        --Category 4: Perma Loot
        AddDropItem(3076,math.random(3,9),100,333,0,4); --copper coins

    elseif (MonID==236) then
        -- Drops
    elseif (MonID==237) then
        --Drops
    elseif (MonID==238) then
        --Drops
    elseif (MonID==239) then
        --Drops
    else
        --Drops
    end
    Dropping(Monster);
end