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
module("monster.mon_26_transparentspiders", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = messages.Messages();
msgs:addMessage("#me bewegt alle ihre Beine näher zu ihrem Körper.", "#me moves all of its legs closer to its body.");
msgs:addMessage("#me fährt sich mit den Vorderbeinen über ihren Kopf.", "#me touches its head with its forelegs.");
msgs:addMessage("#me faucht angriffslustig.", "#me spits aggressively.");
msgs:addMessage("#me gibt ein paar zischende Laute von sich.", "#me does some frizzling noises.");
msgs:addMessage("#me hält zwei Beine schützend vor ihrem Gesicht.", "#me holds two legs up protectively.");
msgs:addMessage("#me krabbelt schnell umher.", "#me crawls around quickly.");
msgs:addMessage("#me schüttelt ein Netz von einem ihrer Beine ab, in dem es sich verfangen hatte.", "#me shakes a web off one of its legs, where it had become entangled.");
msgs:addMessage("#me schüttelt ihren Körper etwas.", "#me shakes its head a little.");
msgs:addMessage("#me zieht beim Laufen einige Spinnennetze mit sich.", "#me tugs as it walks a cobweb with it.");
msgs:addMessage("#mes Beine machen knackende Geräusche auf dem Boden.", "#me's legs make cracking sounds as they touch the ground.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==262) then
        return ( drop.CastMonMagic(Monster,Enemy,5,{2500,4000},{{51,5}},{},40,1,{25,65}) == true );
    else
        return false;
    end
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

    local MonID=Monster:getMonsterType();

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==262) then
        return ( drop.CastMonMagic(Monster,Enemy,5,{2500,4000},{{51,5}},{},40,1,{25,65}) == true );
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
   if (MonID==261) then --Nightmarespider, Level: 7, Armourtype: heavy, Weapontype: distance

        --Category 1: Raw gems

        local done=drop.AddDropItem(254,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw diamond
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw emerald

        --Category 2: Gems

        local done=drop.AddDropItem(46,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --ruby
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.TOPAZ),1,1,999,gems.getMagicGemData(1),2); end --magic topaz
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.OBSIDIAN),1,1,999,gems.getMagicGemData(1),2); end --magic obsidian
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.EMERALD),1,1,999,gems.getMagicGemData(1),2); end --magic emerald

        --Category 3: Rings

        local done=drop.AddDropItem(280,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --diamond ring
        if not done then done=drop.AddDropItem(279,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring
        if not done then done=drop.AddDropItem(278,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(281,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --emerald ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


    elseif (MonID==262) then --Soulpain: 8, Armourtype: medium, Weapontype: wrestling

        --Category 1: Raw gems

        local done=drop.AddDropItem(254,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --raw diamond
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(253,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --raw sapphire

        --Category 2: Cutted gems + rings

        local done=drop.AddDropItem(277,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --amethyst ring
        if not done then done=drop.AddDropItem(280,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --diamond ring
        if not done then done=drop.AddDropItem(278,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --obsidian ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby ring
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.EMERALD),1,1,999,gems.getMagicGemData(1),2); end --magic emerald

        --Category 3: Cutted gems + rings

        local done=drop.AddDropItem(283,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --obsidian
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --emerald
        if not done then done=drop.AddDropItem(279,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(280,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --diamond ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(30,90),100,333,0,4); --silver coins

    end
    drop.Dropping(Monster);
end
