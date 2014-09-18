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
local showGFX = require("scheduled.showGFX")
module("monster.mon_61_slimes", package.seeall)


function ini(Monster)

init=true;
quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = messages.Messages();
msgs:addMessage("#me blubbert.", "#me bubbles.");
msgs:addMessage("#me brodelt.", "#me seethes.");
msgs:addMessage("#me gurgelt.", "#me gargles.");
msgs:addMessage("#mes amorpher Körper verleibt sich Müll vom Erdboden ein.", "#me's amorph body absorbs some litter of the ground.");
msgs:addMessage("#me richtet sich auf.", "#me rears up.");
msgs:addMessage("#me hinterlässt eine schleimige Spur.", "#me leaves a mucilaginous trail behind.");
msgs:addMessage("#me riecht nach Abfall.", "#me reeks badly.");
msgs:addMessage("#me spuckt Schleimbatzen.", "#me spits out lumps of slime.");
msgs:addMessage("#mes Gestalt wandelt sich in einen Ball.", "#me's shape morphs into a ball.");
msgs:addMessage("#me drückt sich flach auf den Boden.", "#me flattens itself plain to the ground.");
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
	elseif (MonID==553) then
        return ( drop.CastMonMagic(Monster,Enemy,7,{1000,2000},{{4,5}},{},40,1,{35,50}) );
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

if (MonID==611) then --Stinky Slime, Level: 3, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw ruby
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw topaz
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald

        --Category 2: Raw gems + cut gems

        local done=drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw ruby
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald

        --Category 3: Special Loot

        local done=drop.AddDropItem(73,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --trout
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --raw sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --obsidian
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --emerald

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

		elseif (MonID==612) then --Slimey Slime, Level: 3, Armourtype: cloth, Weapontype: wrestling

		--Category 1: Raw gems

        local done=drop.AddDropItem(251,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw amethyst
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw diamond
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw topaz

        --Category 2: Raw gems + cut gems

        local done=drop.AddDropItem(251,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw amethyst
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz

        --Category 3: Special Loot

        local done=drop.AddDropItem(355,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --salmon
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --raw emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --diamond
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    elseif (MonID==613) then --Smouldy Slime, Level: 4, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gens

        local done=drop.AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw emerald
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(253,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw diamond

        --Category 2: Raw gems + cut gems

        local done=drop.AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --raw emerald
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw obsidian
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --diamond

        --Category 3: Special Loot

        local done=drop.AddDropItem(26,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --clay
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --raw obsidian
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --diamond

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins

		 elseif (MonID==614) then --Cauterizing Slime, Level: 5, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby

        --Category 2: Raw gems + cut gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby

        --Category 3: Special Loot

        local done=drop.AddDropItem(726,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --coarse sand
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --raw sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amethyst
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --obsidian
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins

    end
    drop.Dropping(Monster);

	-- Glutinous Seedling
	local foundEffect, Effect = Monster.effects:find(36)
	if foundEffect then
		local find, slimeNumber = Effect:findValue("GlutinousSeedling")
		if find then
			showGFX.SlimeList["Slime"..slimeNumber].Time = world:getTime("unix")
			showGFX.SlimeList["Slime"..slimeNumber].Monster = false
		    local effectRemoved = Monster.effects:removeEffect(36)
		end
	end
	-- Glutinous Seedling end
end
