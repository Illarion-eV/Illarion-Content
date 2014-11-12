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
local init = nil



function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me gackert.", "#me cackles.");

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

if (MonID==931) then --Contaminated Ratchild, Level: 3, Armourtype: cloth, Weapontype: distance

        --Category 1: Armor

        local done=drop.AddDropItem(697,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --fur boots
        if not done then done=drop.AddDropItem(367,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --short leather legs
        if not done then done=drop.AddDropItem(826,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --black trousers
        if not done then done=drop.AddDropItem(364,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --light hunting armor
        if not done then done=drop.AddDropItem(819,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --black tunic

        --Category 2: Special Loot

        local done=drop.AddDropItem(46,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --ruby
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(2934,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --lambmeat
        if not done then done=drop.AddDropItem(333,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --horn
        if not done then done=drop.AddDropItem(1858,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --goblet

        --Category 3: Weapons

        local done=drop.AddDropItem(190,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --ornate dagger
        if not done then done=drop.AddDropItem(27,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --simple dagger
        if not done then done=drop.AddDropItem(2668,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned simple dagger
        if not done then done=drop.AddDropItem(2672,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned dagger
        if not done then done=drop.AddDropItem(2689,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --poisoned ornate dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins


    elseif (MonID==932) then --Contaminated Ratman, Level: 4, Armourtype: cloth, Weapontype: dagger

        --Category 1: Armor

        local done=drop.AddDropItem(17,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --wooden shield
        if not done then done=drop.AddDropItem(2112,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short chain trousers
        if not done then done=drop.AddDropItem(824,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green trousers
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(817,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --green tunic

        --Category 2: Special Loot

        local done=drop.AddDropItem(285,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --diamond
        if not done then done=drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=drop.AddDropItem(307,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pork
        if not done then done=drop.AddDropItem(90,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --flut
        if not done then done=drop.AddDropItem(2495,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --pan

        --Category 3: Weapons

        local done=drop.AddDropItem(27,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --simple dagger
        if not done then done=drop.AddDropItem(189,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --dagger
        if not done then done=drop.AddDropItem(2672,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --poisoned dagger
        if not done then done=drop.AddDropItem(2675,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --rapier
        if not done then done=drop.AddDropItem(2740,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --red dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

