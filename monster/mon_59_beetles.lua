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

local arena = require("base.arena")
local common = require("base.common")
local messages = require("base.messages")
local base = require("monster.base.base")
local drop = require("monster.base.drop")
local kills = require("monster.base.kills")
local lookat = require("monster.base.lookat")
local monstermagic = require("monster.base.monstermagic")
local quests = require("monster.base.quests")

module("monster.mon_59_beetles", package.seeall)

function ini(Monster)

    init = true;
    quests.iniQuests();
    killer={}; --A list that keeps track of who attacked the monster last

    --Random Messages
    msgs = messages.Messages();

    msgs:addMessage("#me klickt mit den Mundwerkzeugen.", "#me clicks its mouthparts.");
end

function onSpawn(Monster)

    local var = 60;
    local red, green, blue = Monster:getSkinColor();
    red = common.Limit((red + math.random(-var, var)), 0, 255);
    green = common.Limit((green + math.random(-var, var)), 0, 255);
    blue = common.Limit((blue + math.random(-var, var)), 0, 255);
    Monster:setSkinColor(red, green, blue);
end

function enemyNear(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
         drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while
    end

    return false
end

function enemyOnSight(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end

    monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    drop.MonsterRandomTalk(Monster, msgs); --a random message is spoken once in a while

    if base.isMonsterArcherInRange(Monster, Enemy) then
        return true
    end

    if base.isMonsterInRange(Monster, Enemy) then
        return true;
    else
        return false
    end
end

function onAttacked(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster, Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster, Enemy)
    killer[Monster.id] = Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if arena.isArenaMonster(Monster) then
        return
    end
    if killer and killer[Monster.id] ~= nil then

        murderer = getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            quests.checkQuest(murderer, Monster);
            killer[Monster.id] = nil;
            murderer = nil;

        end
    end

    drop.ClearDropping();
    local MonID = Monster:getMonsterType();

    if (MonID==591 or MonID==592 or MonID==593 or MonID==594 or MonID==981 or MonID==991 or MonID==1001 or MonID==1011) then --beetle

        drop.AddDropItem(251,1,4,333,0,1); --raw amethyst
        drop.AddDropItem(252,1,3,333,0,1); --raw obsidian
        drop.AddDropItem(253,1,3,333,0,1); --raw sapphire
        drop.AddDropItem(254,1,1,333,0,1); --raw diamond
        drop.AddDropItem(255,1,4,333,0,1); --raw ruby
        drop.AddDropItem(256,1,2,333,0,1); --raw emerald
        drop.AddDropItem(257,1,2,333,0,1); --raw topaz
        drop.AddDropItem(1266,math.random(5,10),100,333,0,2); --stone

    end
    drop.Dropping(Monster);
end
