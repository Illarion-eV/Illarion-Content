require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
module("monster.mon_26_dragons", package.seeall)

function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bringt den Boden mit donnernder Wut zum Beben als er sich mit geschmeidiger Eleganz bewegt.", "#me shakes the ground with thunderous rage as it manoeuvres in its intuitive grace.");
msgs:addMessage("#me gräbt die Krallen seiner Hinterläufe fest in den Boden während er die Luft mit einer seiner Vordertatzen bösartig zerteilt.", "#me firmly plants the jagged talons of its back legs into the ground as it maliciously swipes the air with one of its front claws.");
msgs:addMessage("#me peitscht mit seinem verhornten Schwanz rigoros auf den Boden, diesen mit nachhallenden Erschütterungen böse zurichtend.", "#me savagely lashes its horned tail as it batters the ground with reverberating tremors.");
msgs:addMessage("#me schwenkt seinen Kopf rasend vor und zurück, bevor er erfüllt von Bragons Zorn ein markerschütterndes Gebrüll ausstößt.", "#me swivels its head to and fro maniacally before erupting into a blood-curdling roar of Brägon's wrath.");
msgs:addMessage("#me streckt seine echsenhaften Flügel aus um sich bei jedem Flügelschlag mit unerbittlichen Winböen in unzähmbarer Herrlichkeit aufzubäumen.", "#me expands its wings revealing its glorious majesty with vicious and unrelenting gales of wind sent forth by each flap.");
msgs:addMessage("#mes kühne Augen glimmen mit unnachahmbarer Intensität während er den kleinsten Bewegungen und Geräuschen nachgeht.", "#me's keen eyes smoulder with an unparalleled intensity as it perceives the slightest movements or sounds.");
msgs:addMessage("#mes messerscharfe Zähne blitzen in unzähmbarer Wut bevor er eine giftige, verkohlte Rauchwolke hervorschnaubt, die um seine königliche Erscheinung wabert.", "#me flashes its serrated teeth in feral agitation before snorting a venomous cloud of charred smoke that billows about its regal appearance.");
msgs:addMessage("#mes ungestümes Brüllen füllt die Luft einem Wirbel von heißen Blasen gleich und in seinem Maul beginnt ein feuriger Wirbelwind zu tosen.", "#me's obstreperous roar fills the air in a blistering pother of heat as a fiery inferno comes to life in its mouth.");
msgs:addMessage("#mes Erregung schwillt einer aufbrausenden Welle gleich an während er Kopf und Körper verdreht, um in eine defensive Haltung zu kommen.", "#me's agitation swells like a rising tide as it pivots its neck and torso assuming a defensive posture.");
msgs:addMessage("#mes glühende Augen funkeln mit tödlicher Gewissheit während er vor unbezwingbarer Wut schäumt.", "#me's searing eyes glare with baneful intent as its insurmountable rage seethes.");

end

function FireBreath(Monster,Enemy)
    if (firstBreath==nil) then
        NearBreathShape={};
        NearBreathShape[1]={9,9,9,9,9};
        NearBreathShape[2]={0,9,9,9,0};
        NearBreathShape[3]={0,9,9,9,0};
        NearBreathShape[4]={0,0,9,0,0};
        NearBreathShape[5]={0,0,9,0,0};
        firstBreath=true;
    end
    local retVal=false;
    BreathTry=math.random(1,12);
    if (BreathTry==1) and (Monster.pos.z==Enemy.pos.z) then
        retVal=true;
        Monster.fightpoints=Monster.fightpoints-40;
        if (Monster:distanceMetric(Enemy)<=4) then
            Looking=Monster:getFaceTo()
            if (Looking==0) then
                BreathShape=NearBreathShape;
            elseif (Looking==2) then
                BreathShape=ShapeDrehen(NearBreathShape);
            elseif (Looking==4) then
                BreathShape=ShapeDrehen(ShapeDrehen(NearBreathShape));
            elseif (Looking==6) then
                BreathShape=ShapeDrehen(ShapeDrehen(ShapeDrehen(NearBreathShape)));
            end
            for i=1,5 do
                for k=1,5 do
                    if (Looking==0) then
                        BreathPos=position(Monster.pos.x-3+k,Monster.pos.y-7+i,Monster.pos.z);
                    elseif (Looking==2) then
                        BreathPos=position(Monster.pos.x+k,Monster.pos.y-3+i,Monster.pos.z);
                    elseif (Looking==4) then
                        BreathPos=position(Monster.pos.x-3+k,Monster.pos.y+i,Monster.pos.z);
                    elseif (Looking==6) then
                        BreathPos=position(Monster.pos.x-7+k,Monster.pos.y-3+i,Monster.pos.z);
                    end
                    if (BreathShape[i][k]~=0) then
                        world:gfx(BreathShape[i][k],BreathPos);
                        if (math.random(1,5)==1) then
                            world:createItemFromId(359,1,BreathPos,true,math.random(200,600),0);
                            world:makeSound(5,BreathPos);
                        end
                        if world:isCharacterOnField(BreathPos) then
                            HitChar=world:getCharacterOnField(BreathPos);
                            HitChar:increaseAttrib("hitpoints",-2000)
                        end
                    end
                end
            end
        else
            monster.base.drop.CastMonMagic(Monster,Enemy,1,{2500,2500},{{9,5}},{},0,1)
        end
    end
    growltry=math.random(1,8);
    if (growltry==1) then
        world:makeSound(26,Monster.pos);
    end
    return retVal
end

function ShapeDrehen(Shape)
    retShape={};
    for i=1,5 do
        retShape[i]={Shape[5][i],Shape[4][i],Shape[3][i],Shape[2][i],Shape[1][i]};
    end
    return retShape
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    return ( FireBreath(Monster,Enemy) == true );
end

function enemyOnSight(Monster,Enemy)
    local MonID=Monster:getMonsterType();

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    else
        return ( FireBreath(Monster,Enemy) == true );
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
    if (MonID==261) then --Fire Dragon, Level: 8, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(447,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --ruby powder
        if not done then done=monster.base.drop.AddDropItem(449,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --obsidian powder
        if not done then done=monster.base.drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(450,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --amethyst powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(45,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --emerald
        if not done then done=monster.base.drop.AddDropItem(285,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic amethyst

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(281,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --emerald ring
        if not done then done=monster.base.drop.AddDropItem(280,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --amethyst ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==262) then --Fire Dragon Cub, Level: 7, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(450,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --amethyst powder
        if not done then done=monster.base.drop.AddDropItem(446,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --sapphire powder
        if not done then done=monster.base.drop.AddDropItem(236,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --gold ingot
        if not done then done=monster.base.drop.AddDropItem(2745,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --parchment
        if not done then done=monster.base.drop.AddDropItem(447,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --sapphire
        if not done then done=monster.base.drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --obsidian

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(279,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(281,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(1,3),100,333,0,4); --silver coins


    elseif (MonID==263) then --Big Red Dragon, Level: 8, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(451,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --topaz powder
        if not done then done=monster.base.drop.AddDropItem(448,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --emerald powder
        if not done then done=monster.base.drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(446,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --sapphire powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(198,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(282,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --emerald ring
        if not done then done=monster.base.drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==264) then --Ancient Fire Dragon, Level: 8, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(452,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --diamond powder
        if not done then done=monster.base.drop.AddDropItem(225,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --crown
        if not done then done=monster.base.drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg
        if not done then done=monster.base.drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(449,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --obsidian powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(285,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(7,8)+math.random(77,88)),1,2); end --magic emerald

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(281,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --emerald ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(3,9),100,333,0,4); --silver coins


    elseif (MonID==265) then --Son of Bragon, Level: 9, Armourtype: -, Weapontype: wrestling

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(738,1,20,(100*math.random(8,9)+math.random(88,99)),0,1); --dragon egg
        if not done then done=monster.base.drop.AddDropItem(505,1,10,(100*math.random(8,9)+math.random(88,99)),nil,1); end --treasure map
        if not done then done=monster.base.drop.AddDropItem(448,1,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --emerald powder
        if not done then done=monster.base.drop.AddDropItem(451,1,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --topaz powder
        if not done then done=monster.base.drop.AddDropItem(452,1,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --diamond powder

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(8,9)+math.random(88,99)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(8,9)+math.random(88,99)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(8,9)+math.random(88,99)),1,2); end --magic diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(8,9)+math.random(88,99)),1,2); end --magic topaz
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(8,9)+math.random(88,99)),1,2); end --magic sapphire

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(68,1,20,(100*math.random(8,9)+math.random(88,99)),0,3); --ruby ring
        if not done then done=monster.base.drop.AddDropItem(278,1,10,(100*math.random(8,9)+math.random(88,99)),0,3); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(280,1,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --diamond ring
        if not done then done=monster.base.drop.AddDropItem(282,1,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --topaz ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --sapphire ring

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(9,27),100,333,0,4); --silver coins

    elseif (MonID==266) then
        -- Drops
    elseif (MonID==267) then
        --Drops
    elseif (MonID==268) then
        --Drops
    elseif (MonID==269) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
