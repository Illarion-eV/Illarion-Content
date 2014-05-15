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

require("base.arena")
require("base.messages");
require("monster.base.base")
require("monster.base.drop")
require("monster.base.kills")
require("monster.base.lookat")
require("monster.base.monstermagic")
require("monster.base.quests")

module("monster.mon_111_rats", package.seeall)


function ini(Monster)

    init=true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = base.messages.Messages();
    msgs:addMessage("#me knurrt.", "#me growls.");
    msgs:addMessage("#me quiekt.", "#me squeaks.");
    msgs:addMessage("#me ist mit Läusen und anderen Parasiten übersät.", "#me is covered with lice and other parasites.");
    msgs:addMessage("#me knabbert an Unrat.", "#me gnaws on rubbish.");
    msgs:addMessage("#me schaut dich herausfordernd an.", "#me looks at you provokingly.");
    msgs:addMessage("#me schnüffelt und schnuppert an allem.", "#me sniffs and smells at everything.");
    msgs:addMessage("#me zeigt seine scharfen Fangzähne.", "#me bares its sharp fangs.");
    msgs:addMessage("#me leckt sich nervös die Krallen.", "#me licks nervously at its claws.");
    msgs:addMessage("#me peitscht nervös mit dem Schwanz.", "#me nervously whips its tail.");
    msgs:addMessage("#me faucht aggressiv.", "#me hisses agressively.");
end

function enemyNear(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while
    end

    return false
end

function enemyOnSight(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while

    if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
        return true
    end

    if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
    end
end

function onAttacked(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end


    if killer and killer[Monster.id] ~= nil then

        murderer = getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer, Monster);
            killer[Monster.id] = nil;
            murderer = nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID = Monster:getMonsterType();

    if (MonID == 1111) then --Rat, lvl1

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur

    elseif (MonID == 1112) then --Small Rat, lvl1

        monster.base.drop.AddDropItem(63,1,100,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,50,333,0,2); --fur

    elseif (MonID == 1113) then --Agressive Rat, lvl2

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur
        monster.base.drop.AddDropItem(259,1,10,333,0,3); --grain
        monster.base.drop.AddDropItem(314,1,10,333,0,3); --potash

    elseif (MonID == 1114) then --Muskrat, lvl2

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur
        monster.base.drop.AddDropItem(259,1,10,333,0,3); --grain
        monster.base.drop.AddDropItem(314,1,10,333,0,3); --potash

    elseif (MonID == 1115) then --Plague Rat, lvl3

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(69,1,100,333,0,2); --raw leather
        monster.base.drop.AddDropItem(170,1,10,333,0,3); --wool
        monster.base.drop.AddDropItem(26,1,10,333,0,3); --clay
        monster.base.drop.AddDropItem(391,1,10,333,0,3); --torch

    elseif (MonID == 1116) then --Sewer Rat, lvl3

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur
        monster.base.drop.AddDropItem(170,1,10,333,0,3); --wool
        monster.base.drop.AddDropItem(191,1,10,333,0,3); --roll
        monster.base.drop.AddDropItem(2745,1,10,333,0,3); --parchment

    end
    monster.base.drop.Dropping(Monster);
end
