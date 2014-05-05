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
module("monster.mon_3_elves", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("Bei der Macht des Waldes!", "By the power of nature!");
msgs:addMessage("Die Götter mögen mir beistehen.", "May the gods be with me.");
msgs:addMessage("#mes Augen blitzen vor verzweifelter Wut auf.", "#me's eyes flash in desperate fury.");
msgs:addMessage("#me bewegt sich mit geschwinden Schritten über den Boden.", "#me moves with wide steps over the ground.");
msgs:addMessage("Oh, welch Schicksal, dass ich eine Waffe gegen euch erheben muss. Verzeiht mir.", "Oh, what fate is this that I have to raise a weapon against you. Forgive me!");
msgs:addMessage("Die Gerechtigkeit wird euch einholen, sei es heute, sei es in hundert Jahren.", "Justice will overcome you, be it now, be it in a hundred years.");
msgs:addMessage("Ich fürchte den Tod nicht, er kann auch eine Erlösung sein, verglichen mit einem Leben in Feigheit.", "I do not fear death, for it is far superior to a life in fear.");
msgs:addMessage("Ihr mögt mich heute niederstrecken, doch wird man meine Taten besingen, wenn der Name eures Volkes bereits vergessen wurde.", "You may slay me today, but my deeds will be sung about when the name of your people will be long forgotten.");
msgs:addMessage("Mein Volk wird Rache an eurem Stamm nehmen bis die siebte Generation eurer Brut vertilgt ist.", "My people will take revenge on your tribe until the seventh generation of your offspring has passed.");
msgs:addMessage("Die, die ihre Hand gegen das unsterbliche Volk erheben, bringen Unheil über sich.", "Those who raise their weapon against the eternal people bring doom upon themselves.");

end

function enemyNear(Monster,Enemy)

    local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

	if (MonID==33) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,15,{252,582,622},30) );
    elseif (MonID==34) then
        return ( monster.base.monstermagic.SuddenWarp(Monster,Enemy) or monster.base.drop.CastMonMagic(Monster,Enemy,6,{1000,2000},{{4,5},{9,5},{51,5}},{},40,1,{25,60}) );
    else
        return false;
    end
end

--

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
	elseif (MonID==33) then
        return ( monster.base.drop.CastMonster(Monster,Enemy,15,{252,582,622},30) );
    elseif (MonID==34) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,3,{1200,2500},{{4,5},{9,5},{51,5}},{},40,1,{25,60}) );
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

   if (MonID==31) then --Elf, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=monster.base.drop.AddDropItem(369,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather shoes
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2457,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --wine glass
        if not done then done=monster.base.drop.AddDropItem(388,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --grapes
        if not done then done=monster.base.drop.AddDropItem(1318,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --elven wine
        if not done then done=monster.base.drop.AddDropItem(2679,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --green dye
        if not done then done=monster.base.drop.AddDropItem(2678,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --black dye

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(65,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --short bow
        if not done then done=monster.base.drop.AddDropItem(2714,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow
        if not done then done=monster.base.drop.AddDropItem(89,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --sling
        if not done then done=monster.base.drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --long bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==32) then --Elven Warrior, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(367,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --short leather legs
        if not done then done=monster.base.drop.AddDropItem(2388,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --red steel shield
        if not done then done=monster.base.drop.AddDropItem(697,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --fur boots
        if not done then done=monster.base.drop.AddDropItem(2399,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light elven armor
        if not done then done=monster.base.drop.AddDropItem(2400,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --magical elven armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(335,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --lute
        if not done then done=monster.base.drop.AddDropItem(90,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --flute
        if not done then done=monster.base.drop.AddDropItem(332,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --harp
        if not done then done=monster.base.drop.AddDropItem(2680,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --blue dye
        if not done then done=monster.base.drop.AddDropItem(2681,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red dye

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(78,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --short sword
        if not done then done=monster.base.drop.AddDropItem(25,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --sabre
        if not done then done=monster.base.drop.AddDropItem(2775,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven rainbow sword
        if not done then done=monster.base.drop.AddDropItem(2778,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --elven sword
        if not done then done=monster.base.drop.AddDropItem(2701,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --longsword

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==33) then --Elven Priest, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(183,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green trousers
        if not done then done=monster.base.drop.AddDropItem(812,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --black doublet
        if not done then done=monster.base.drop.AddDropItem(368,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --yellow priest robe
        if not done then done=monster.base.drop.AddDropItem(2421,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --white priest robe
        if not done then done=monster.base.drop.AddDropItem(825,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red trousers

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2745,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --parchment
        if not done then done=monster.base.drop.AddDropItem(463,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --quill
        if not done then done=monster.base.drop.AddDropItem(2744,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pipe
        if not done then done=monster.base.drop.AddDropItem(164,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --big empty bottle
        if not done then done=monster.base.drop.AddDropItem(2682,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --yellow dye

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(209,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=monster.base.drop.AddDropItem(1044,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(57,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --simple mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==34) then --Elven Mage, Level: 5, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(459,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --red trousers
        if not done then done=monster.base.drop.AddDropItem(180,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --red shirt
        if not done then done=monster.base.drop.AddDropItem(2419,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --red priest robe
        if not done then done=monster.base.drop.AddDropItem(2420,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black priest robe
        if not done then done=monster.base.drop.AddDropItem(2416,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --brown priest robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(63,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --entrails
        if not done then done=monster.base.drop.AddDropItem(2746,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --razor blade
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden goblet
        if not done then done=monster.base.drop.AddDropItem(1840,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --copper goblet
        if not done then done=monster.base.drop.AddDropItem(2683,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --grey dye

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(39,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --skull staff
        if not done then done=monster.base.drop.AddDropItem(40,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(57,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(76,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==35) then --Elven Hunter, Level: 5, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2114,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short fur trousers
        if not done then done=monster.base.drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2934,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --lamb meat
        if not done then done=monster.base.drop.AddDropItem(553,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --rabbit meat
        if not done then done=monster.base.drop.AddDropItem(552,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --deer meat
        if not done then done=monster.base.drop.AddDropItem(307,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pork
        if not done then done=monster.base.drop.AddDropItem(2940,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --steak

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,10,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(2714,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow
        if not done then done=monster.base.drop.AddDropItem(2780,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ebony wood bow
        if not done then done=monster.base.drop.AddDropItem(2685,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --magical elven bow
        if not done then done=monster.base.drop.AddDropItem(2718,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven composite bow

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    elseif (MonID==36) then
        -- Drops
    elseif (MonID==37) then
        --Drops
    elseif (MonID==38) then
        --Drops
    elseif (MonID==39) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
