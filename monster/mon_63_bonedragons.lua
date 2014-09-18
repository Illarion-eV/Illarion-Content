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
module("monster.mon_63_bonedragons", package.seeall)

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

	return false;
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
    if (MonID==631) then --Bone Dragon, Level: 8, Armourtype: medium, Weapontype: concussion

        --Category 1: Special Loot

        local done=drop.AddDropItem(447,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --ruby powder
        if not done then done=drop.AddDropItem(449,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --obsidian powder
        if not done then done=drop.AddDropItem(738,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --dragon egg
        if not done then done=drop.AddDropItem(505,1,1,(100*math.random(7,8)+math.random(77,88)),nil,1); end --treasure map
        if not done then done=drop.AddDropItem(450,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --amethyst powder

        --Category 2: Special loot

        local done=drop.AddDropItem(45,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --emerald
        if not done then done=drop.AddDropItem(285,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --diamond
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --topaz
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.AMETHYST),1,1,999,gems.getMagicGemData(1),2); end --magic amethyst

        --Category 3: Weapon

        local done=drop.AddDropItem(281,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --emerald ring
        if not done then done=drop.AddDropItem(280,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --diamond ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --ruby ring
        if not done then done=drop.AddDropItem(282,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --topaz ring
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --amethyst ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(30,90),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
