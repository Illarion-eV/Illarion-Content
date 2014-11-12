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
msgs:addMessage("#me gackert.", "#me cackles.");

end

function M.enemyNear(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	if (MonID==942) then
		return drop.CastMonMagic(Monster,Enemy,7,{250-750},{{6,5},{3,5}},{},40,1,{35,50})
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
	elseif (MonID==942) then
		return drop.CastMonMagic(Monster,Enemy,7,{250-750},{{6,5},{3,5}},{},40,1,{35,50})
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

if (MonID==941) then --Crazy Rat Alchemist, Level: 2, Armourtype: cloth, Weapontype: slashing

        --Category 1: Armor

        local done=drop.AddDropItem(53,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --leather boots
        if not done then done=drop.AddDropItem(48,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --leather gloves
        if not done then done=drop.AddDropItem(825,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --red trousers
        if not done then done=drop.AddDropItem(363,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --leather scale armor
        if not done then done=drop.AddDropItem(814,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --blue tunic

        --Category 2: Special Loot

        local done=drop.AddDropItem(198,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --topaz
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --emerald
        if not done then done=drop.AddDropItem(355,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --salmon
        if not done then done=drop.AddDropItem(97,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --bag
        if not done then done=drop.AddDropItem(2935,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --soup bowl

        --Category 3: Weapons

        local done=drop.AddDropItem(189,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --dagger
        if not done then done=drop.AddDropItem(27,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --simple dagger
        if not done then done=drop.AddDropItem(2645,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --throwing axe
        if not done then done=drop.AddDropItem(2658,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --broadsword
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --mace

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(10,30),100,773,0,4); --copper coins


    elseif (MonID==942) then --Ratpriest, Level: 3, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(2194,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --short hardwood greaves
        if not done then done=drop.AddDropItem(366,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather legs
        if not done then done=drop.AddDropItem(821,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --blue trousers
        if not done then done=drop.AddDropItem(2363,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --nightplate
        if not done then done=drop.AddDropItem(809,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --grey tunic

        --Category 2: Special Loot

        local done=drop.AddDropItem(284,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --sapphire
        if not done then done=drop.AddDropItem(198,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz
        if not done then done=drop.AddDropItem(73,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --trout
        if not done then done=drop.AddDropItem(2952,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --plate
        if not done then done=drop.AddDropItem(2184,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --clay cup

        --Category 3: Weapons

        local done=drop.AddDropItem(40,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --cleric's staff
        if not done then done=drop.AddDropItem(76,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --mage's staff
        if not done then done=drop.AddDropItem(1044,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --ornate mage's staff
        if not done then done=drop.AddDropItem(39,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --skull staff
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --mace

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

