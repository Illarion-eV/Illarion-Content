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
module("monster.mon_79_bluetrolls", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me stampft wütend auf den Boden auf und grollt mit kehliger Stimme.", "#me stomps on the ground in fury, growling deeply");
msgs:addMessage("#me schwingt seine Faust und stößt ein jammerndes Klagen aus.", "#me swings its fist, roaring loudly.");
msgs:addMessage("#me brüllt mit markdurchdringender Stimme.", "#me bellows with a booming voice.");
msgs:addMessage("#mes grüne Augen blitzen vor gnadenloser Bestimmtheit auf, ein Leben zu beenden.", "#me's green eyes flash in unfaltering dedication to end somebody's life.");
msgs:addMessage("Groar!", "Groar!");
msgs:addMessage("#me trampelt mit unaufhaltsamen Schritten umher. Jeder Schritt lässt die Erde zittern.", "#me charges with unstoppable paces. Every step shakes the ground.");
msgs:addMessage("#me hält einen Moment inne und wiegt seinen Kopf hin und her, traurig vor sich hin summend.", "#me hesitates for a moment, cocking its head, humming sadly.");
msgs:addMessage("#mes Muskeln an seinen knorrigen Armen spannen sich, bereit, um Rache zu üben.", "#me flexes its muscles on its huge arms, ready to take revenge.");
msgs:addMessage("#me ist ein gigantischer Troll, dessen weise Augen von dem Anblick unsäglicher Taten müde und traurig geworden sind.", "#me is a giant troll with wise eyes which became sad and tired from witnessing unutterable deeds.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==792) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,6,{1000,2000},{{3,5},{6,5}},{{560,320,500,0,7}},40,1,{30,60}) );
    else
        return false;
    end
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    local MonID=Monster:getMonsterType();

	if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==792) then
        return  (monster.base.monstermagic.CastHealing(Monster, {1000,2000})  or monster.base.drop.CastMonMagic(Monster,Enemy,6,{1000,2000},{{3,5},{6,5}},{{560,320,500,0,7}},40,1,{30,60}));
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
    if (MonID==791) then --Bridge Troll, Level: 4, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wooden shield
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(53,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather boots

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(735,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --raw stone
        if not done then done=monster.base.drop.AddDropItem(733,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(2588,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --bricks
        if not done then done=monster.base.drop.AddDropItem(26,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --clay
        if not done then done=monster.base.drop.AddDropItem(1266,20,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --stone

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(56,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --bough
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(2786,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --branch
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --morning star

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins


    elseif (MonID==792) then --Bridge Troll Shaman, Level: 5, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(183,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green trousers
        if not done then done=monster.base.drop.AddDropItem(814,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue tunic
        if not done then done=monster.base.drop.AddDropItem(55,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --green robe
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --green tunic
        if not done then done=monster.base.drop.AddDropItem(194,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(735,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --raw stone
        if not done then done=monster.base.drop.AddDropItem(733,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(1266,20,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --stone

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(40,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(209,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven mage's staff
        if not done then done=monster.base.drop.AddDropItem(56,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bough
        if not done then done=monster.base.drop.AddDropItem(237,20,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bolt
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
