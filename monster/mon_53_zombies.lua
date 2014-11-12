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

local M = {}

function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.");
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

if (MonID==531) then --Walking Dead, Level: 5, Armourtype: heavy, Weapontype: puncture

        --Category 1: Special Loot

        local done=drop.AddDropItem(324,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --bucket
        if not done then done=drop.AddDropItem(92,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --oil lamp
        if not done then done=drop.AddDropItem(67,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --rubin amulet
        if not done then done=drop.AddDropItem(505,1,1,599,treasure.createMapData(),1); end --treasure map
        if not done then done=drop.AddDropItem(314,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --potash

        --Category 2: Gems

        local done=drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=drop.AddDropItem(285,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian

        --Category 3: More Special Loot

        local done=drop.AddDropItem(68,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --ruby ring
        if not done then done=drop.AddDropItem(278,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(279,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(398,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --copperd dagger
        if not done then done=drop.AddDropItem(826,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --grey trousers

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins


    elseif (MonID==532) then --Limping Zombie, Level: 5, Armourtype: midium, Weapontype: concussion

        --Category 1: Speical Loot

        local done=drop.AddDropItem(2445,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --small wooden shield
        if not done then done=drop.AddDropItem(53,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --leather boots
        if not done then done=drop.AddDropItem(62,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --emerald amulet
        if not done then done=drop.AddDropItem(505,1,1,599,treasure.createMapData(),1); end --treasure map
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --ruby

        --Category 2: Gems

        local done=drop.AddDropItem(283,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --obsidian
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire

        --Category 3: Mainly rings

        local done=drop.AddDropItem(281,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --emerald ring
        if not done then done=drop.AddDropItem(279,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(278,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(235,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --gold ring
        if not done then done=drop.AddDropItem(826,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --black trousers

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins


    elseif (MonID==533) then --Zombie, Level: 6, Armourtype: light, Weapontype: slashing

        --Category 1: Special Loot

        local done=drop.AddDropItem(324,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --chain helmet
        if not done then done=drop.AddDropItem(164,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --big empty bottle
        if not done then done=drop.AddDropItem(71,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --sapphire amulet
        if not done then done=drop.AddDropItem(505,1,1,699,treasure.createMapData(),1); end --treasure map
        if not done then done=drop.AddDropItem(2745,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --parchment

        --Category 2: Gems

        local done=drop.AddDropItem(284,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --sapphire
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --emerald

        --Category 3: Mainly rings

        local done=drop.AddDropItem(282,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --topaz ring
        if not done then done=drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(279,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(1,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --serinjah sword
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --ruby ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,773,0,4); --silver coins

		elseif (MonID==534) then --Zombiegiant, Level: 7, Armourtype: medium, Weapontype: concussion

        --Category 1: Special Loot

        local done=drop.AddDropItem(2760,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --rope
        if not done then done=drop.AddDropItem(155,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --sibanac
        if not done then done=drop.AddDropItem(192,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --amethyst
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --ruby
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --obsidian

        --Category 2: Armor

        local done=drop.AddDropItem(53,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --leather boots
        if not done then done=drop.AddDropItem(366,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --leather legs
        if not done then done=drop.AddDropItem(363,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --leather scale armor
        if not done then done=drop.AddDropItem(365,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --light hunting armor
        if not done then done=drop.AddDropItem(324,1,1,(100*math.random(6,7)+math.random(66,77)),0,2); end --chain helmet

        --Category 3: Mianly weapons

        local done=drop.AddDropItem(2664,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --club
        if not done then done=drop.AddDropItem(77,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --halberd
        if not done then done=drop.AddDropItem(124,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --gilded battleaxe
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --mace
        if not done then done=drop.AddDropItem(77,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --hardwood greaves

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,773,0,4); --silver coins

    end
    drop.Dropping(Monster);
end

return M

