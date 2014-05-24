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
require("base.common");
require("base.messages");
require("monster.base.base")
require("monster.base.drop")
require("monster.base.kills")
require("monster.base.lookat")
require("monster.base.monstermagic")
require("monster.base.quests")

module("monster.mon_37_cows", package.seeall)

function ini(Monster)

    init = true;
    monster.base.quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = base.messages.Messages();

    -- XXX: Not called for friendly monsters at all
    msgs:addMessage("#me muht.", "#me moos.");
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

    if (MonID==371 or MonID==381 or MonID==382) then --cow

        monster.base.drop.AddDropItem(333,1,50,333,0,2); --horn
        monster.base.drop.AddDropItem(2940,1,50,333,0,3); --steak
        monster.base.drop.AddDropItem(69,1,100,333,0,1); --leather

    end
    monster.base.drop.Dropping(Monster);
end
