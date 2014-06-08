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
require("base.messages");
require("monster.base.kills")
require("base.arena")
require("base.messages");
module("monster.mon_0_humans", package.seeall)

function onSpawn(theHuman)

	local mySex = math.random(0,1);

    local var=20; -- variation of color, +/- var
    local baseR=245;  -- baseRed
	local baseG=200;  -- baseGreen
	local baseB=150;  -- baseBlue
    local red = math.min(255, baseR + math.random(-var, var));
    local green = math.min(255, baseG + math.random(-var, var));
    local blue = math.min(255, baseB + math.random(-var, var));
    local myHair = {};
    myHair[0] = {1,2,3};    -- list of possible hair IDs
    myHair[1] = {1,4,7};
	local myBeard = {};
	myBeard[0] = {1,3,4,5,6,8}  -- list of possible beard IDs
	myBeard[1] = {0}
    local hairBlonde = {210,200,10} -- Blonde hair Red,Green,Blue
	local hairBlack = {10,10,10} -- Black hair Red,Green,Blue
	local hairRed = {205,30,30} -- Red hair Red,Green,Blue
	local hairBrunet = {90,50,10} -- Brunet hair Red,Green,Blue
	local hairColors = {hairBlonde, hairBlack, hairRed, hairBrunet}
	local myHairColor = hairColors[math.random(#hairColors)]
	theHuman:setAttrib("sex",mySex);
    theHuman:setSkinColor(red,green,blue);
    theHuman:setHair( myHair[mySex][math.random(#myHair[mySex])] );
    theHuman:setHairColor(myHairColor[1], myHairColor[2], myHairColor[3] );
	theHuman:setBeard(myBeard[mySex][math.random(#myBeard[mySex])]);
 end

function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();

msgs:addMessage("#me flucht vor sich hin.", "#me swears to himself.");
msgs:addMessage("#me grinst siegessicher.", "#me grins, certain of success.");
msgs:addMessage("#me ist in Schweiß gebadet.", "#me is bathed in sweat.");
msgs:addMessage("#me lacht laut.", "#me laughs.");
msgs:addMessage("#me spuckt auf den Boden.", "#me spits at the ground.");
msgs:addMessage("#me tippelt hin und her.", "#me hops on the spot.");
msgs:addMessage("Achtung! Alarm!", "Careful! Alert!");
msgs:addMessage("Das war's!", "That does it!");
msgs:addMessage("Die Leute werden auch immer schwächer!", "People get weaker every day!");
msgs:addMessage("Dieses Gebiet gehört mir!", "This area belongs to me!");
msgs:addMessage("Ein Drache ist nichts gegen mich!", "A dragon is nothing compared to me!");
msgs:addMessage("Fressen oder gefressen werden, so läuft das.", "Kill or be killed, that's the way it is");
msgs:addMessage("Für die Götter!", "For the gods!");
msgs:addMessage("Geld oder Leben!", "Money or life!");
msgs:addMessage("Heute ist ein guter Tag zum Töten.", "This day is a good day for killing.");
msgs:addMessage("Ich bin der Stärkste!", "I am the strongest!");
msgs:addMessage("Ich zerquetsche jeden Feind wie 'ne kleine Fee!", "I crush every enemy like a little fairy!");
msgs:addMessage("Niemand wird mich je besiegen!", "No one will ever defeat me!");
msgs:addMessage("Rollende Köpfe sind immer eine schöne Abwechslung.", "Rolling heads are always welcome.");
msgs:addMessage("Verboten!", "Verboten!");
msgs:addMessage("Wer wagt es mich zu stören?", "Who dares to bother me?");

end

function enemyNear(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    if (MonID==3) then
        return ( monster.base.monstermagic.SuddenWarp(Monster, Enemy) );
    elseif (MonID==4) then
        return ( monster.base.monstermagic.CastMonster(Monster, {101, 111}) );
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
    elseif (MonID==3) then
        return ( monster.base.monstermagic.CastFireball(Monster, Enemy, {1000, 2000}, {50, 60}) or monster.base.monstermagic.CastHealing(Monster, {2000, 3500}) );
    elseif (MonID==4) then
        return ( monster.base.monstermagic.CastMonster(Monster, {101, 111}) );
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

    if (MonID==1) then --Human, Level: 5, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2441,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --salkamaerian paladin's helmet
        if not done then done=monster.base.drop.AddDropItem(2194,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(2365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --salkamaerian officer's armor
        if not done then done=monster.base.drop.AddDropItem(2360,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --Lor-Angur guardian's armor
        if not done then done=monster.base.drop.AddDropItem(19,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --metal shield

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(81,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --berries
        if not done then done=monster.base.drop.AddDropItem(302,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --cherries
        if not done then done=monster.base.drop.AddDropItem(80,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --banana
        if not done then done=monster.base.drop.AddDropItem(151,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --strawberries
        if not done then done=monster.base.drop.AddDropItem(15,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --apple

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(1,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(25,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(2757,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(2658,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --broad sword
        if not done then done=monster.base.drop.AddDropItem(78,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --short sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==2) then --Human Warrior, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(530,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --albarian steel gloves
        if not done then done=monster.base.drop.AddDropItem(186,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --round metal shield
        if not done then done=monster.base.drop.AddDropItem(699,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --salkamaerian steel boots
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(4,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2183,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --clay mug
        if not done then done=monster.base.drop.AddDropItem(97,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --bag
        if not done then done=monster.base.drop.AddDropItem(2760,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --rope
        if not done then done=monster.base.drop.AddDropItem(306,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --ham
        if not done then done=monster.base.drop.AddDropItem(62,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --amulet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2658,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --broad sword
        if not done then done=monster.base.drop.AddDropItem(2757,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --scimitar
        if not done then done=monster.base.drop.AddDropItem(2701,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --longsword
        if not done then done=monster.base.drop.AddDropItem(84,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --coppered longsword
        if not done then done=monster.base.drop.AddDropItem(1,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah sword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==3) then --Human Mage, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(815,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --yellow tunic
        if not done then done=monster.base.drop.AddDropItem(458,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow shirt
        if not done then done=monster.base.drop.AddDropItem(195,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow robe
        if not done then done=monster.base.drop.AddDropItem(820,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --white tunic
        if not done then done=monster.base.drop.AddDropItem(2378,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --blackcult robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2745,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --parchment
        if not done then done=monster.base.drop.AddDropItem(164,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --big empty bottle
        if not done then done=monster.base.drop.AddDropItem(463,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --quill
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(279,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire ring

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(57,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(1044,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(39,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --skull staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==4) then --Human Necromancer, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(461,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --blue trousers
        if not done then done=monster.base.drop.AddDropItem(181,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue shirt
        if not done then done=monster.base.drop.AddDropItem(2419,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red priest robe
        if not done then done=monster.base.drop.AddDropItem(2420,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black priest robe
        if not done then done=monster.base.drop.AddDropItem(2416,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --brown priest robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --insides
        if not done then done=monster.base.drop.AddDropItem(314,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --potash
        if not done then done=monster.base.drop.AddDropItem(278,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian ring
        if not done then done=monster.base.drop.AddDropItem(2746,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --razor blade
        if not done then done=monster.base.drop.AddDropItem(223,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --goblet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(39,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --skull staff
        if not done then done=monster.base.drop.AddDropItem(40,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(57,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==5) then --Human Thief, Level: 4, Armourtype: light, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(527,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --serinjah leather gloves
        if not done then done=monster.base.drop.AddDropItem(697,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --fur boots
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(79,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst amulet
        if not done then done=monster.base.drop.AddDropItem(277,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst ring
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --golden goblet

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(27,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple dagger
        if not done then done=monster.base.drop.AddDropItem(189,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --dagger
        if not done then done=monster.base.drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=monster.base.drop.AddDropItem(190,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --ornate dagger
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
