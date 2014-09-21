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
module("monster.mon_65_redbonedragons", package.seeall)

function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me knurrt.", "#me growls.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    return monstermagic.FireBreath(Monster, Enemy, 359)
end

function enemyOnSight(Monster,Enemy)

	local MonID=Monster:getMonsterType();
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
        return ( FireBreath(Monster,Enemy) == true );
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
    if (MonID==651) then --Undead Firedragon, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Special Loot

        local done=drop.AddDropItem(450,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --amethyst powder
        if not done then done=drop.AddDropItem(446,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --sapphire powder
        if not done then done=drop.AddDropItem(236,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --gold ingot
        if not done then done=drop.AddDropItem(2745,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --parchment
        if not done then done=drop.AddDropItem(447,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby powder

        --Category 2: Gems

        local done=drop.AddDropItem(284,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --sapphire
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --diamond
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --obsidian

        --Category 3: Rings

        local done=drop.AddDropItem(279,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --sapphire ring
        if not done then done=drop.AddDropItem(281,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=drop.AddDropItem(280,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --diamond ring
        if not done then done=drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
