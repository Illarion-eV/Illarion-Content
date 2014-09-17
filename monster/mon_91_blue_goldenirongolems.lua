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
module("monster.mon_91_blue_goldenirongolems", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me stampft mit seinen Füßen.", "#me stomps with his feet.");

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

if (MonID==911) then -- Merinium Golem, Level: 9, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=drop.AddDropItem(254,5,20,(100*math.random(8,9)+math.random(88,99)),0,1); --raw diamond
        if not done then done=drop.AddDropItem(252,5,10,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(251,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(253,5,1,(100*math.random(8,9)+math.random(88,99)),0,1); end --raw sapphire

        --Category 2: Gems

        local done=drop.AddDropItem(285,5,20,(100*math.random(8,9)+math.random(88,99)),0,2); --diamond
        if not done then done=drop.AddDropItem(283,5,10,(100*math.random(8,9)+math.random(88,99)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.RUBY),1,1,999,gems.getMagicGemData(1),2); end --magic ruby
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.AMETHYST),1,1,999,gems.getMagicGemData(1),2); end --magic amethyst
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.SAPPHIRE),1,1,999,gems.getMagicGemData(1),2); end --magic sapphire

        --Category 3: Special Loot

        local done=drop.AddDropItem(2534,5,20,(100*math.random(8,9)+math.random(88,99)),0,3); --merinium ore
        if not done then done=drop.AddDropItem(735,5,10,(100*math.random(8,9)+math.random(88,99)),0,3); end --raw stone
        if not done then done=drop.AddDropItem(22,10,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --iron ore
        if not done then done=drop.AddDropItem(2536,10,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --copper ore
        if not done then done=drop.AddDropItem(733,5,1,(100*math.random(8,9)+math.random(88,99)),0,3); end --stone block

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(90,250),100,773,0,4); --silver coins

	elseif (MonID==912) then -- Gold Golem, Level: 8, Armourtype: medium, Weapontype: concussion

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,5,20,(100*math.random(7,8)+math.random(77,88)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,5,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(252,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,5,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw ruby

        --Category 2: Gems

        local done=drop.AddDropItem(198,5,20,(100*math.random(7,8)+math.random(77,88)),0,2); --topaz
        if not done then done=drop.AddDropItem(284,5,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(197,5,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.OBSIDIAN),1,1,999,gems.getMagicGemData(1),2); end --magic obsidian
        if not done then done=drop.AddDropItem(46,5,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby

        --Category 3: Special Loot

        local done=drop.AddDropItem(234,5,20,(100*math.random(7,8)+math.random(77,88)),0,3); --gold nugget
        if not done then done=drop.AddDropItem(733,5,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --stone block
        if not done then done=drop.AddDropItem(22,10,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --iron ore
        if not done then done=drop.AddDropItem(2536,10,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --copper ore
        if not done then done=drop.AddDropItem(1266,20,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --stone

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(30,90),100,773,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
