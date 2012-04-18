require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_24_ogres", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bleckt die von Fleischstückchen bedeckten Zähne.", "#me bares his teeth, which are piled with chunks of flesh.");
msgs:addMessage("#me brüllt etwas in einer unverständlichen Sprache.", "#me growls something in an inscrutable tongue.");
msgs:addMessage("#me gibt ein Geräusch von sich, das einem Grunzen ähnelt.", "#me makes a noise similar to a grunt.");
msgs:addMessage("#me murmelt ein Gebet.", "#me murmurs a prayer.");
msgs:addMessage("#me neigt bedrohlich den Kopf und damit die spitzen Hörner.", "#me lowers the head, his horns look threatening.");
msgs:addMessage("#me schwingt seine Keule.", "#me swings his club.");
msgs:addMessage("#me zieht die Nase hoch.", "#me sniffs deeply.");
msgs:addMessage("#me’s Knochenschmuck klappert laut als er baumelt.", "#me’s bone jewellery dangles and clatters loudly.");
msgs:addMessage("#me bleckt die von Fleischstückchen bedeckten Zähne und kauderwelscht glücklich: 'Mmh… saftich süßes Ding.'.", "#me bares its teeth, covered with pieces of meat: 'Mmm... tasty sweet thing.'.");
msgs:addMessage("#me brüllt etwas in einer unverständlichen Sprache.", "#me yells something in an incomprehensible language.");
msgs:addMessage("#me schlägt mit der Keule auf den Boden, dass der Grund unter den Füßen bebt: 'Niemand so stark wie ich, werde dich jetzt zermalmen und dann deine Knochen abnagen!'", "#me strikes the ground with his mace, shaking the growl: 'No one so strong as I, I will crush you now and then gnaw your bones!'");
msgs:addMessage("#me malt mit einem schlammigen Finger ein krummes Dreieck auf seine Brust: 'Niemand fordert mich, ich wird deine Eingeweide dir ausreißen!'", "#me paints a muddy pattern with crooked fingers on its chest: 'Nobody challenges me, me will rip out your entrails!'");
msgs:addMessage("#me schnauft und kleine grüne Flocken stieben aus seiner Nase, ehe er seine Keule mit einem Röhren erhebt.", "#me snorts and little green flakes scurry out of his nose, before it raises its club with a growl.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==243) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,10,{2000,3000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1) == true );
    else
        return false
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    elseif (MonID==243) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,10,{2000,3000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1) == true );
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
   if (MonID==241) then --Ogre, Level: 6, Armourtype: light, Weapontype: concussion

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
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==242) then --Ogre Warrior, Level: 6, Armourtype: heavy, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2116,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --red steel greaves
        if not done then done=monster.base.drop.AddDropItem(20,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --large metal shield
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --albarian steel plate
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(2393,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --heavy plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2547,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --leather
        if not done then done=monster.base.drop.AddDropItem(2940,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --steak
        if not done then done=monster.base.drop.AddDropItem(557,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --steak dish
        if not done then done=monster.base.drop.AddDropItem(2716,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --apple wood board
        if not done then done=monster.base.drop.AddDropItem(2560,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --apple wood

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2737,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --morning star
        if not done then done=monster.base.drop.AddDropItem(226,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --warhammer
        if not done then done=monster.base.drop.AddDropItem(207,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==243) then --Ogre Shaman, Level: 6, Armourtype: cloth, Weapontype: concussion (wrestling)

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(55,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --green robe
        if not done then done=monster.base.drop.AddDropItem(193,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --blue robe
        if not done then done=monster.base.drop.AddDropItem(2295,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(461,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --blue trousers
        if not done then done=monster.base.drop.AddDropItem(181,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --blue shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(58,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --mortar
        if not done then done=monster.base.drop.AddDropItem(307,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --pork
        if not done then done=monster.base.drop.AddDropItem(2277,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --meat dish
        if not done then done=monster.base.drop.AddDropItem(155,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(2744,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --pipe

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff
        if not done then done=monster.base.drop.AddDropItem(40,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(208,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ornate mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==244) then --Small Ogre, Level: 5, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2114,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short fur trousers
        if not done then done=monster.base.drop.AddDropItem(527,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --serinjah leather gloves
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(97,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --leather bag
        if not done then done=monster.base.drop.AddDropItem(552,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --deer meat
        if not done then done=monster.base.drop.AddDropItem(554,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --venison dish
        if not done then done=monster.base.drop.AddDropItem(545,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --cherry wood board
        if not done then done=monster.base.drop.AddDropItem(543,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --cherry wood

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2723,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --executioner's axe
        if not done then done=monster.base.drop.AddDropItem(88,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --long axe
        if not done then done=monster.base.drop.AddDropItem(77,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --halberd
        if not done then done=monster.base.drop.AddDropItem(383,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --waraxe
        if not done then done=monster.base.drop.AddDropItem(188,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --large waraxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(6,18),100,333,0,4); --copper coins


    elseif (MonID==245) then --Poisonous Ogre, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(95,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --heraldic shield
        if not done then done=monster.base.drop.AddDropItem(697,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots
        if not done then done=monster.base.drop.AddDropItem(362,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leatherarmor
        if not done then done=monster.base.drop.AddDropItem(2113,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur trousers
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2586,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --fur
        if not done then done=monster.base.drop.AddDropItem(2934,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --lamb meat
        if not done then done=monster.base.drop.AddDropItem(559,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --lamb dish
        if not done then done=monster.base.drop.AddDropItem(546,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --naldor wood board
        if not done then done=monster.base.drop.AddDropItem(544,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --naldor wood

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2635,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --poisoned barbarian axe
        if not done then done=monster.base.drop.AddDropItem(2694,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned serinjah sword
        if not done then done=monster.base.drop.AddDropItem(2655,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned broadsword
        if not done then done=monster.base.drop.AddDropItem(2705,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned longsword
        if not done then done=monster.base.drop.AddDropItem(2725,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned executioners axe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins

    elseif (MonID==246) then
        -- Drops
    elseif (MonID==247) then
        --Drops
    elseif (MonID==248) then
        --Drops
    elseif (MonID==249) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
