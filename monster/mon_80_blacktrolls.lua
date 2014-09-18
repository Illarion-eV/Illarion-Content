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
local monstermagic = require("monster.base.monstermagic")
local base = require("monster.base.base")
local drop = require("monster.base.drop")
local lookat = require("monster.base.lookat")
local quests = require("monster.base.quests")
local messages = require("base.messages")
local kills = require("monster.base.kills")
local arena = require("base.arena")
module("monster.mon_80_blacktrolls", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
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
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
	else
		return false;
	end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if arena.isArenaMonster(Monster) then
        return
    end


    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    drop.ClearDropping();
    local MonID=Monster:getMonsterType();
    if (MonID==801) then --Mountain Troll, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(367,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --short leather legs
        if not done then done=drop.AddDropItem(20,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --large metal shield
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leatherarmor
        if not done then done=drop.AddDropItem(697,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --fur boots

        --Category 2: Special loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=drop.AddDropItem(733,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --stone block
        if not done then done=drop.AddDropItem(2588,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --bricks
        if not done then done=drop.AddDropItem(1266,20,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --stone
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond

        --Category 3: Weapon

        local done=drop.AddDropItem(230,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --mace
        if not done then done=drop.AddDropItem(237,20,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --bolt
        if not done then done=drop.AddDropItem(2664,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=drop.AddDropItem(56,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --bough
        if not done then done=drop.AddDropItem(2737,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --morning star

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==802) then --Mountain Troll Archer, Level: 6, Armourtype: light, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(366,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --leather legs
        if not done then done=drop.AddDropItem(53,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --light hunting armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --full leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --light blue breastplate

        --Category 2: Special loot

        local done=drop.AddDropItem(735,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --raw stone
        if not done then done=drop.AddDropItem(733,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --stone block
        if not done then done=drop.AddDropItem(2588,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --bricks
        if not done then done=drop.AddDropItem(26,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --clay
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --raw ruby

        --Category 3: Weapon

        local done=drop.AddDropItem(237,20,20,(100*math.random(5,6)+math.random(55,66)),0,3); --bolt
        if not done then done=drop.AddDropItem(549,20,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --poisoned arrows
        if not done then done=drop.AddDropItem(2708,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --longbow
        if not done then done=drop.AddDropItem(65,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --short bow
        if not done then done=drop.AddDropItem(2708,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --long bow

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
