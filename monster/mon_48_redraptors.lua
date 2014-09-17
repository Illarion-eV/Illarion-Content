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
module("monster.mon_48_redraptors", package.seeall)


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

if (MonID==524) then --Fireraptor, Level: 6, Armourtype: medium, Weapontype: puncture

        --Category 1: Plants

        local done=drop.AddDropItem(133,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --sun herb
        if not done then done=drop.AddDropItem(144,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --virgins weed
        if not done then done=drop.AddDropItem(157,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --rotten tree bark
        if not done then done=drop.AddDropItem(159,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --toadstool
        if not done then done=drop.AddDropItem(145,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --heath flower

        --Category 2: Plants

        local done=drop.AddDropItem(145,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --heath flower
        if not done then done=drop.AddDropItem(157,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --bulbsponge mushroom
        if not done then done=drop.AddDropItem(158,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --red head
        if not done then done=drop.AddDropItem(160,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --herder's mushroom
        if not done then done=drop.AddDropItem(161,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --black thistle

        --Category 3: More plants

        local done=drop.AddDropItem(134,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --fourleafed oneberry
        if not done then done=drop.AddDropItem(135,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --yellow weed
        if not done then done=drop.AddDropItem(152,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --life root
        if not done then done=drop.AddDropItem(758,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --liveblood
        if not done then done=drop.AddDropItem(764,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --daydevil

        --Category 4: Perma Loot
        drop.AddDropItem(63,math.random(1,1),100,333,0,4); --entrails
    end
    drop.Dropping(Monster);
end
