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
module("monster.mon_81_redtrolls", package.seeall)


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
    if (MonID==812) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,6,{1000,2000},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{30,60}) );
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
    elseif (MonID==812) then
        return ( monster.base.monstermagic.CastHealing(Monster, {1000,2000}) or monster.base.drop.CastMonMagic(Monster,Enemy,4,{1000,2500},{{9,5},{36,5},{38,5}},{{359,320,500,0,7}},40,1,{45,70}) );
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
    if (MonID==811) then --Firespitter, Level: 6, Armourtype: medium, Weapontype: distance

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=monster.base.drop.AddDropItem(526,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --studded leather gloves
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leather armor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=monster.base.drop.AddDropItem(283,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(549,20,20,(100*math.random(4,5)+math.random(44,55)),0,3); --poisoned arrows
        if not done then done=monster.base.drop.AddDropItem(237,20,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --bolt
        if not done then done=monster.base.drop.AddDropItem(2727,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --fire hunter's bow
        if not done then done=monster.base.drop.AddDropItem(2645,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing axe
        if not done then done=monster.base.drop.AddDropItem(293,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing spear

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==812) then --Keeperoffire, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(366,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --leather legs
        if not done then done=monster.base.drop.AddDropItem(526,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --studded leather gloves
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --full leather armor
        if not done then done=monster.base.drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=monster.base.drop.AddDropItem(2359,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light mercenary armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(735,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --raw stone
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(64,20,20,(100*math.random(6,7)+math.random(66,77)),0,3); --arrow
        if not done then done=monster.base.drop.AddDropItem(237,10,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --bolt
        if not done then done=monster.base.drop.AddDropItem(2780,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ebeony wood bow
        if not done then done=monster.base.drop.AddDropItem(2727,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --fire hunter's bow
        if not done then done=monster.base.drop.AddDropItem(293,10,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --throwing spear

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins

    end
    monster.base.drop.Dropping(Monster);
end
