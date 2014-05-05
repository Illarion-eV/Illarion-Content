--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
require("monster.base.monstermagic")
require("monster.base.base")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("monster.base.kills")
require("base.arena")
require("base.messages");
module("monster.mon_5_lizards", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me bewegt sich flink auf und ab.", "#me moves up and down in an agile manner.");
msgs:addMessage("#me faucht agressiv.", "#me spits aggressively.");
msgs:addMessage("#me schüttelt einige Schuppen von seinem Rücken.", "#me loses some scales off his back.");
msgs:addMessage("#me zischt etwas unverständliches.", "#me hisses something unintelligible.");
msgs:addMessage("#mes Schwanz bewegt sich scheinbar unkontrolliert hin und her.", "#me's tail moves rapidly in a back and forth motion");
msgs:addMessage("Ich rieche Ärger...", "I smell trouble...");
msgs:addMessage("Sssssssss...", "Sssssssss...");
msgs:addMessage("Unssere Feinde sollen die Macht des Wassssssers zu spüren bekommen!", "Our enemiessss ssshould feel the power of water!");
msgs:addMessage("Unssere Rassssse wird überleben!", "Our race will sssssurvive!");
msgs:addMessage("Zshhel-pheey-arrr sssteht mir bei!", "Zshhel-pheey-arrr sssstands by me!");
msgs:addMessage("#me flüstert leise: 'Grossse Mutter, bereite mir ein Bad in deinem Tempel, ich werde bald zu dir stossssen!'.", "#me whispers: 'Great mother, prepare a bath for me in your templesss. I will sssoon come to yousss.'.");
msgs:addMessage("#me schlägt mit dem Schwanz drohend auf den Boden und zeigt seine spitzen Zähne, die gelben Augen sind zu schmalen Schlitzen verzogen.", "#me slams his tail on the ground and bares his sharp teeth. The yellow eyes are squinted to slits.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==53) then
        return ( monster.base.monstermagic.SuddenWarp(Monster,Enemy) or monster.base.drop.CastMonMagic(Monster,Enemy,6,{1200,2400},{{3,5},{6,5}},{},40,1,{25,60}) );
    elseif (MonID==54) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,3000},{{16,0},{37,0}},{{360,320,500,0,1}},40,0,{25,60}) == true or monster.base.drop.CastMonMagic(Monster,Enemy,6,{1200,2400},{{37,5}},{},40,1,{25,60}));
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

	monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end


    if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==53) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,6,{1500,3000},{{4,5}},{},40,1,{25,60}) or monster.base.drop.CastHealing( Monster, 4, {2000,3500}, 8, {16, 13}, 40 ) or monster.base.drop.CastParalyze( Monster, Enemy, 5, {-10,-20}, 5, {6,1}, 10 ,{25,60} ) );
    elseif (MonID==54) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,5,{2000,3000},{{16,0},{37,0}},{{360,320,500,0,0}},40,0,{35,50}) == true );
    else
        return false;
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

    if base.arena.isArenaMonster(Monster) then
        return
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
    local MonID=Monster:getMonsterType();
   if (MonID==51) then --Lizard, Level: 5, Armourtype: medium, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2193,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2448,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --legionaire's tower shield
        if not done then done=monster.base.drop.AddDropItem(696,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --lizard armor
        if not done then done=monster.base.drop.AddDropItem(2360,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --Lor-Angur guardian's armor
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(355,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --salmon
        if not done then done=monster.base.drop.AddDropItem(73,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --trout
        if not done then done=monster.base.drop.AddDropItem(556,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --salmon dish
        if not done then done=monster.base.drop.AddDropItem(2459,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --fish filet dish
        if not done then done=monster.base.drop.AddDropItem(72,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --fishing rod

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(231,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --mace
        if not done then done=monster.base.drop.AddDropItem(2664,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(226,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --warhammer

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==52) then --Lizard Temple Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2117,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short red steel greaves
        if not done then done=monster.base.drop.AddDropItem(94,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --pot helmet
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --albarian steel plate
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(2393,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --heavy plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(51,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --bucket
        if not done then done=monster.base.drop.AddDropItem(92,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --oil lamp
        if not done then done=monster.base.drop.AddDropItem(390,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --lamp oil
        if not done then done=monster.base.drop.AddDropItem(355,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --salmon
        if not done then done=monster.base.drop.AddDropItem(73,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --trout

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(88,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --long axe
        if not done then done=monster.base.drop.AddDropItem(77,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --halberd
        if not done then done=monster.base.drop.AddDropItem(204,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --bastard sword
        if not done then done=monster.base.drop.AddDropItem(2731,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --two handed sword
        if not done then done=monster.base.drop.AddDropItem(383,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --waraxe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==53) then --Lizard Mage, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(831,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green hat with feather
        if not done then done=monster.base.drop.AddDropItem(181,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue shirt
        if not done then done=monster.base.drop.AddDropItem(195,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow robe
        if not done then done=monster.base.drop.AddDropItem(2377,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red mage robe
        if not done then done=monster.base.drop.AddDropItem(821,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue trousers

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2745,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --parchment
        if not done then done=monster.base.drop.AddDropItem(463,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --quill
        if not done then done=monster.base.drop.AddDropItem(72,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --fishing rod
        if not done then done=monster.base.drop.AddDropItem(355,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --salmon
        if not done then done=monster.base.drop.AddDropItem(73,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --trout

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(1044,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==54) then --Lizard Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(809,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --grey doublet
        if not done then done=monster.base.drop.AddDropItem(182,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --black shirt
        if not done then done=monster.base.drop.AddDropItem(368,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow priest robe
        if not done then done=monster.base.drop.AddDropItem(824,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --green trousers
        if not done then done=monster.base.drop.AddDropItem(2418,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --grey priest robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(71,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --sapphire amulet
        if not done then done=monster.base.drop.AddDropItem(43,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --candles
        if not done then done=monster.base.drop.AddDropItem(556,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --salmon dish
        if not done then done=monster.base.drop.AddDropItem(2459,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --fish filet dish
        if not done then done=monster.base.drop.AddDropItem(51,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bucket

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(230,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(226,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --warhammer
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==55) then --Lizard Thief, Level: 4, Armourtype: light, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(53,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --leather boots
        if not done then done=monster.base.drop.AddDropItem(366,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather legs
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --full leatherarmor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(284,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --sapphire
        if not done then done=monster.base.drop.AddDropItem(71,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire amulet
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(1858,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --goblet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(27,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple dagger
        if not done then done=monster.base.drop.AddDropItem(189,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --dagger
        if not done then done=monster.base.drop.AddDropItem(2740,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --red dagger
        if not done then done=monster.base.drop.AddDropItem(190,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ornate dagger
        if not done then done=monster.base.drop.AddDropItem(444,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --merinium plated dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins

    elseif (MonID==56) then
        -- Drops
    elseif (MonID==57) then
        --Drops
    elseif (MonID==58) then
        --Drops
    elseif (MonID==59) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
