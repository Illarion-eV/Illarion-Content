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
local M = {}


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me knurrt.", "#me growls.");
end

function M.enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    return false
end

function M.enemyOnSight(Monster,Enemy)

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
        return false
    end
end

function M.onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function M.onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function M.onDeath(Monster)

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

if (MonID==871) then --Crippled Swampbeast, Level: 3, Armourtype: light, Weapontype: puncture

        --Category 1: Special Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --entrails
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --topas amulet
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --obsidian
        if not done then done=drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame

        --Category 2: Special Loot

        local done=drop.AddDropItem(197,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --amethyst
        if not done then done=drop.AddDropItem(285,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=drop.AddDropItem(222,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amulet
        if not done then done=drop.AddDropItem(62,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald amulet
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=drop.AddDropItem(284,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --sapphire
        if not done then done=drop.AddDropItem(46,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --diamond
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --obsidian
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins


    elseif (MonID==872) then --Swampbeast, Level: 4, Armourtype: medium, Weapontype: slashing

        --Category 1: Speical Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --entrails
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --ruby
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz
        if not done then done=drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame

        --Category 2: Special Loot

        local done=drop.AddDropItem(198,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --topaz
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz amulet
        if not done then done=drop.AddDropItem(71,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire amulet
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby

        --Category 3: More Special Loot

        local done=drop.AddDropItem(46,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ruby
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --emerald
        if not done then done=drop.AddDropItem(67,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rubin amulet
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --topaz amulet

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==873) then --Giant Swampbeast, Level: 5, Armourtype: heavy, Weapontype: concussion

        --Category 1: Special Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --entrails
        if not done then done=drop.AddDropItem(255,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --topaz
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --topaz amulet
        if not done then done=drop.AddDropItem(359,1,1,(100*math.random(1,1)+math.random(11,11)),0,1); end --flame

        --Category 2: Special Loot

        local done=drop.AddDropItem(284,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --sapphire
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(222,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amulet
        if not done then done=drop.AddDropItem(82,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian amulet
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire

        --Category 3: More Special Loot

        local done=drop.AddDropItem(46,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --ruby
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(222,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amulet
        if not done then done=drop.AddDropItem(2553,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --pure fire

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

