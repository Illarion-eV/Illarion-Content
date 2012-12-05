require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_7_femaledrows", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me fährt langsam mit ihrer Zunge über ihre Oberlippe.", "#me slowly runs her tongue along her upper lip.");
msgs:addMessage("#me hebt ihre Waffe und küsst sie dann sanft.", "#me raises her weapon and places a gentle kiss upon it.");
msgs:addMessage("#me lacht hysterisch.", "#me laughs hysterically.");
msgs:addMessage("#me schließt ihre Augen und beginnt wie wahnsinnig zu lachen.", "#me closes her eyes and begins to laugh maniacally.");
msgs:addMessage("#me tanzt wild, wie im Rausch, umher, vom krampfhaften Zucken ihres Körpers untermalt.", "#me dances around in a wild frenzy, her body violently pulsating.");
msgs:addMessage("#me wirft ihren Kopf zurück und schreit in Ekstase.", "#me throws her head back and screams in ecstasy.");
msgs:addMessage("#mes Augen rollen nach hinten in ihren Schädel, bis nur noch das Weiße sichtbar bleibt.", "#me's eyes rolls her eyes back, only the whites now visible.");
msgs:addMessage("Ah... ein weiteres Spielzeug für den Blutgott.", "Ah… another toy for the Blood-God.");
msgs:addMessage("Also du suchst nach dem Tod? Ich werde dir deinen Wunsch erfüllen... letzten Endes.", "So it is death you seek? I shall grant your wish... eventually.");
msgs:addMessage("Dein Blut wird meinen Durst stillen.", "Your blood shall quench my thirst.");
msgs:addMessage("Du bist nichts als Fleisch und Knochen, eine Opfergabe für den Blutgott.", "You are but flesh and bone, an offering to the Blood-God.");
msgs:addMessage("Du kennst keine Schmerzen... noch nicht.", "You have not known pain...not yet.");
msgs:addMessage("Ein langsamer Tod ist ein schöner Tod.", "A slow death is a beautiful one.");
msgs:addMessage("Mich hungert nach deinen Schreien.", "I hunger for your scream.");
msgs:addMessage("Moshran! Erfreue dich an unseren Opfern!", "Moshran! Feast upon our victims!");
msgs:addMessage("Schmerzen? Dies ist nichts... dich erwartet eine Ewigkeit in den Händen Moshrans!", "Pain? This is nothing...an eternity at the hands of Moshran awaits you.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    local MonID=Monster:getMonsterType();
    if (MonID==283) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,3,{2000,3000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1) == true );
    elseif (MonID==284) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,8,{101,111},40) == true );
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
    elseif (MonID==283) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,3,{2000,3000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1) == true );
    elseif (MonID==284) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,8,{101,111},40) == true );
    else
        return true;
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
    if (MonID==71) then --Female Drow, Level: 6, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(367,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short leather legs
        if not done then done=monster.base.drop.AddDropItem(697,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots
        if not done then done=monster.base.drop.AddDropItem(2402,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow armor
        if not done then done=monster.base.drop.AddDropItem(2303,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow helmet
        if not done then done=monster.base.drop.AddDropItem(2399,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light elven armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(235,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --gold ring
        if not done then done=monster.base.drop.AddDropItem(234,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --nugget
        if not done then done=monster.base.drop.AddDropItem(174,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red cloth
        if not done then done=monster.base.drop.AddDropItem(175,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --black cloth
        if not done then done=monster.base.drop.AddDropItem(176,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --grey cloth

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,10,20,(100*math.random(5,6)+math.random(55,66)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(2718,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven composite bow
        if not done then done=monster.base.drop.AddDropItem(2739,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --drow bow
        if not done then done=monster.base.drop.AddDropItem(2685,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --magical elven bow
        if not done then done=monster.base.drop.AddDropItem(2714,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --hunting bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==72) then --Female Drow Warrior, Level: 6, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(96,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --steel tower shield
        if not done then done=monster.base.drop.AddDropItem(2286,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --flame helmet
        if not done then done=monster.base.drop.AddDropItem(2402,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow armor
        if not done then done=monster.base.drop.AddDropItem(2303,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --drow helmet
        if not done then done=monster.base.drop.AddDropItem(2403,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --elven silversteel armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --rope
        if not done then done=monster.base.drop.AddDropItem(97,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --bag
        if not done then done=monster.base.drop.AddDropItem(177,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --yellow cloth
        if not done then done=monster.base.drop.AddDropItem(178,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --white cloth
        if not done then done=monster.base.drop.AddDropItem(179,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blue cloth

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2788,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --snake sword
        if not done then done=monster.base.drop.AddDropItem(2655,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned broad sword
        if not done then done=monster.base.drop.AddDropItem(2777,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --drow blade
        if not done then done=monster.base.drop.AddDropItem(2705,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned longsword
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sabre

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==73) then --Female Drow Mage, Level: 6, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(804,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --red dress
        if not done then done=monster.base.drop.AddDropItem(837,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --black red dress
        if not done then done=monster.base.drop.AddDropItem(843,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --red white skirt
        if not done then done=monster.base.drop.AddDropItem(849,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --red yellow heraldic dress
        if not done then done=monster.base.drop.AddDropItem(851,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --black red heraldic dress

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(164,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --big empty bottle
        if not done then done=monster.base.drop.AddDropItem(1317,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --empty bottle
        if not done then done=monster.base.drop.AddDropItem(54,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --green cloth
        if not done then done=monster.base.drop.AddDropItem(174,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red cloth
        if not done then done=monster.base.drop.AddDropItem(175,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --black cloth

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(209,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(57,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(208,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==74) then --Female Drow Priest, Level: 6, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(805,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --black dress
        if not done then done=monster.base.drop.AddDropItem(836,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --black green dress
        if not done then done=monster.base.drop.AddDropItem(844,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --black white skirt
        if not done then done=monster.base.drop.AddDropItem(852,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --white heraldic dress
        if not done then done=monster.base.drop.AddDropItem(838,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --black white dress

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --entrails
        if not done then done=monster.base.drop.AddDropItem(2746,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --razor blade
        if not done then done=monster.base.drop.AddDropItem(176,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --grey cloth
        if not done then done=monster.base.drop.AddDropItem(177,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --yellow cloth
        if not done then done=monster.base.drop.AddDropItem(178,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --white cloth

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(39,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --skull staff
        if not done then done=monster.base.drop.AddDropItem(207,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --battle staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(18,54),100,333,0,4); --copper coins


    elseif (MonID==75) then --Drow Matriarch, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2400,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --magical elven armor
        if not done then done=monster.base.drop.AddDropItem(325,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --steel gloves
        if not done then done=monster.base.drop.AddDropItem(2402,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --drow armor
        if not done then done=monster.base.drop.AddDropItem(2303,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --drow helmet
        if not done then done=monster.base.drop.AddDropItem(2116,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --red steel greaves

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(336,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --mirror
        if not done then done=monster.base.drop.AddDropItem(465,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --diadem
        if not done then done=monster.base.drop.AddDropItem(179,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --blue cloth
        if not done then done=monster.base.drop.AddDropItem(54,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --green cloth
        if not done then done=monster.base.drop.AddDropItem(174,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --red cloth

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2731,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --two handed sword
        if not done then done=monster.base.drop.AddDropItem(204,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bastard sword
        if not done then done=monster.base.drop.AddDropItem(3035,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --drow sword
        if not done then done=monster.base.drop.AddDropItem(2777,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --drow blade
        if not done then done=monster.base.drop.AddDropItem(2626,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --magical waraxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(1,3),100,333,0,4); --silver coins

    elseif (MonID==286) then
        -- Drops
    elseif (MonID==287) then
        --Drops
    elseif (MonID==288) then
        --Drops
    elseif (MonID==289) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
