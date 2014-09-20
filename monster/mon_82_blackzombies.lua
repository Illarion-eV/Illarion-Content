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
local treasure = require("base.treasure")
module("monster.mon_82_blackzombies", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.");
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
        return false
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

if (MonID==821) then --Bog Body, Level: 4, Armourtype: light, Weapontype: slashing

        --Category 1: Special Loot

        local done=drop.AddDropItem(2760,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --rope
        if not done then done=drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz amulet
        if not done then done=drop.AddDropItem(53,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --leather boots
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --topaz

        --Category 2: Gems

        local done=drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Special Loot

        local done=drop.AddDropItem(1,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --serinjah sword
        if not done then done=drop.AddDropItem(19,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --metal shield
        if not done then done=drop.AddDropItem(2655,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned broadsword
        if not done then done=drop.AddDropItem(297,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --gilded dagger
        if not done then done=drop.AddDropItem(326,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --steel boots

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==822) then --Ragged Bog Body, Level: 3, Armourtype: light, Weapontype: slashing

        --Category 1: Speical Loot

        local done=drop.AddDropItem(324,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --bucket
        if not done then done=drop.AddDropItem(92,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --oil lamp
        if not done then done=drop.AddDropItem(67,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --rubin amulet
        if not done then done=drop.AddDropItem(505,1,1,299,treasure.createMapData(),1); end --treasure map
        if not done then done=drop.AddDropItem(314,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --potash

        --Category 2: Gems

        local done=drop.AddDropItem(198,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --topaz
        if not done then done=drop.AddDropItem(285,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian

        --Category 3: Special Loot

        local done=drop.AddDropItem(2701,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --longsword
        if not done then done=drop.AddDropItem(17,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --mosiac shield
        if not done then done=drop.AddDropItem(445,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --wooden sword
        if not done then done=drop.AddDropItem(398,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --copperd dagger
        if not done then done=drop.AddDropItem(823,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --grey trousers

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);
end
