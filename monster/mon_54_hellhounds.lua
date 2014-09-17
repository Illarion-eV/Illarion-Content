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
local gems = require("item.gems")
local drop = require("monster.base.drop")
local lookat = require("monster.base.lookat")
local quests = require("monster.base.quests")
local messages = require("base.messages")
local kills = require("monster.base.kills")
local arena = require("base.arena")
module("monster.mon_54_hellhounds", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me hat Schaum vor dem Mund.", "#me foams at the mouth.");

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

if (MonID==541) then --Crippled Deamonbeast, Level: 6, Armourtype: heavy, Weapontype: slashing

        --Category 1: Special Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --entrails
        if not done then done=drop.AddDropItem(255,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --topas amulet
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --obsidian
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --topaz

        --Category 2: Special Loot

        local done=drop.AddDropItem(197,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --amethyst
        if not done then done=drop.AddDropItem(285,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond
        if not done then done=drop.AddDropItem(79,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst amulet
        if not done then done=drop.AddDropItem(62,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald amulet
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=drop.AddDropItem(284,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --sapphire
        if not done then done=drop.AddDropItem(46,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby
        if not done then done=drop.AddDropItem(67,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --rubin amulet
        if not done then done=drop.AddDropItem(2553,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --pure fire
        if not done then done=drop.AddDropItem(762,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==542) then --Deamonbeast, Level: 7, Armourtype: midium, Weapontype: puncture

        --Category 1: Speical Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --entrails
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz amulett

        --Category 2: Special Loot

        local done=drop.AddDropItem(198,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --topaz
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --topaz amulet
        if not done then done=drop.AddDropItem(71,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire amulet
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --emerald

        --Category 3: More Special Loot

        local done=drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(67,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --rubin amulet
        if not done then done=drop.AddDropItem(2553,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --pure fire
        if not done then done=drop.AddDropItem(762,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==543) then --Giant Deamonbeast, Level: 7, Armourtype: medium, Weapontype: concussion

        --Category 1: Special Loot

        local done=drop.AddDropItem(63,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --entrails
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz
        if not done then done=drop.AddDropItem(83,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --topaz amulet
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --obsidian

        --Category 2: Special Loot

        local done=drop.AddDropItem(284,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --sapphire
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(222,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --amulet
        if not done then done=drop.AddDropItem(82,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --obsidian amulet
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire

        --Category 3: More Special Loot

        local done=drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --ruby
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.RUBY),1,1,999,gems.getMagicGemData(1),3); end --magical ruby
        if not done then done=drop.AddDropItem(2553,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --pure fire
        if not done then done=drop.AddDropItem(762,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sulfur weed

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
