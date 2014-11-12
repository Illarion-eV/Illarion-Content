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
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.");

end

function M.enemyNear(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

	if (MonID==842) then
		return ( monstermagic.CastMonster(Monster, {611, 1031}) );
	else
		return false
	end
end

function M.enemyOnSight(Monster,Enemy)

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
	elseif (MonID==842) then
		return ( monstermagic.CastMonster(Monster, {611, 1031}) );
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

if (MonID==841) then --Coffinguard, Level: 4, Armourtype: heavy, Weapontype: concussion

        --Category 1: Special Loot

        local done=drop.AddDropItem(2760,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --rope
        if not done then done=drop.AddDropItem(155,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --sibanac
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --amethyst
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --obsidian

        --Category 2: Special Loot

        local done=drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst ring
        if not done then done=drop.AddDropItem(79,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald

        --Category 3: Special Loot

        local done=drop.AddDropItem(277,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --amethyst ring
        if not done then done=drop.AddDropItem(235,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --gold ring
        if not done then done=drop.AddDropItem(2363,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --nightplate
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --mace
        if not done then done=drop.AddDropItem(2378,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --black cult robe

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins


    elseif (MonID==842) then --Undead Warlock, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Speical Loot

        local done=drop.AddDropItem(2760,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --rope
        if not done then done=drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --half leather armor
        if not done then done=drop.AddDropItem(2407,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --light blue breastplate
        if not done then done=drop.AddDropItem(194,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --black robe

        --Category 2: Special Loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=drop.AddDropItem(79,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst amulet

        --Category 3: More Special Loot

        local done=drop.AddDropItem(2701,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --longsword
        if not done then done=drop.AddDropItem(209,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --elven mage's staff
        if not done then done=drop.AddDropItem(2378,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --black cult robe
        if not done then done=drop.AddDropItem(2655,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned broadsword
        if not done then done=drop.AddDropItem(398,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --coppered dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

