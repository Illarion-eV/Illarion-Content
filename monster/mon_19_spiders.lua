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
local kills = require("monster.base.kills")
local arena = require("base.arena")
local messages = require("base.messages")
local M = {}


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

function M.enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==195) then
        return ( drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{8,5}},{},40,1,{25,65}) == true );
    else
        return false;
    end
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

    local MonID=Monster:getMonsterType();

	if base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==195) then
        return ( drop.CastMonMagic(Monster,Enemy,5,{2000,4000},{{8,5}},{},40,1,{25,65}) == true );
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
   if (MonID==191) then --Rekrap Retep, Level: 5, Armourtype: medium, Weapontype: slashing

        --Category 1: Raw gems

        local done=drop.AddDropItem(251,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw amethyst
        if not done then done=drop.AddDropItem(256,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz

        --Category 2: Gems

        local done=drop.AddDropItem(197,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --amethyst
        if not done then done=drop.AddDropItem(45,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz

        --Category 3: Rings

        local done=drop.AddDropItem(277,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --amethyst ring
        if not done then done=drop.AddDropItem(281,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby ring
        if not done then done=drop.AddDropItem(280,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --diamond ring
        if not done then done=drop.AddDropItem(282,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --topaz ring

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==192) then --Pitservant, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Raw Gems + cutted gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --amethyst
        if not done then done=drop.AddDropItem(45,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --emerald
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --ruby
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --diamond

        --Category 2: Raw Gems + cutted gems + rings

        local done=drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=drop.AddDropItem(282,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz ring
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw amethyst
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw emeerald
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw ruby

        --Category 3: Gems + rings

        local done=drop.AddDropItem(285,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --diamond
        if not done then done=drop.AddDropItem(198,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --topaz
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amethyst ring
        if not done then done=drop.AddDropItem(281,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --emerald ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby ring

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==193) then --Tarantula, Level: 6, Armourtype: heavy, Weapontype: puncture

        --Category 1: Raw gems

        local done=drop.AddDropItem(256,1,20,(100*math.random(5,6)+math.random(55,66)),0,1); --raw emerald
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(253,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw topaz
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(5,6)+math.random(55,66)),0,1); end --raw diamond

        --Category 2: Gems

        local done=drop.AddDropItem(45,1,20,(100*math.random(5,6)+math.random(55,66)),0,2); --emerald
        if not done then done=drop.AddDropItem(283,1,10,(100*math.random(5,6)+math.random(55,66)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(5,6)+math.random(55,66)),0,2); end --diamond

        --Category 3: Rings

        local done=drop.AddDropItem(281,1,20,(100*math.random(5,6)+math.random(55,66)),0,3); --emerald ring
        if not done then done=drop.AddDropItem(278,1,10,(100*math.random(5,6)+math.random(55,66)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(279,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(282,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --topaz ring
        if not done then done=drop.AddDropItem(280,1,1,(100*math.random(5,6)+math.random(55,66)),0,3); end --diamond ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(2,5),100,333,0,4); --silver coins


    elseif (MonID==195) then --Spider Queen, Level: 7, Armourtype: heavy, Weapontype: slashing

        --Category 1: Raw gems

        local done=drop.AddDropItem(254,1,20,(100*math.random(6,7)+math.random(66,77)),0,1); --raw diamond
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw ruby
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(253,1,1,(100*math.random(6,7)+math.random(66,77)),0,1); end --raw sapphire

        --Category 2: Gems

        local done=drop.AddDropItem(285,1,20,(100*math.random(6,7)+math.random(66,77)),0,2); --diamond
        if not done then done=drop.AddDropItem(197,1,10,(100*math.random(6,7)+math.random(66,77)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.RUBY),1,1,999,gems.getMagicGemData(1),2); end --magic ruby
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.OBSIDIAN),1,1,999,gems.getMagicGemData(1),2); end --magic obsidian
        if not done then done=drop.AddDropItem(gems.getMagicGemId(gems.SAPPHIRE),1,1,999,gems.getMagicGemData(1),2); end --magic sapphire

        --Category 3: Rings

        local done=drop.AddDropItem(280,1,20,(100*math.random(6,7)+math.random(66,77)),0,3); --diamond ring
        if not done then done=drop.AddDropItem(278,1,10,(100*math.random(6,7)+math.random(66,77)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --ruby ring
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --amethyst ring
        if not done then done=drop.AddDropItem(279,1,1,(100*math.random(6,7)+math.random(66,77)),0,3); end --sapphire ring

        --Category 4: Perma Loot
        drop.AddDropItem(3077,math.random(10,30),100,333,0,4); --silver coins


		elseif (MonID==196) then --Small Spider Level: 2, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(256,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw emerald
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --raw ruby

        --Category 2: Gems

        local done=drop.AddDropItem(285,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --diamond
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --ruby

        --Category 3: Rings

        local done=drop.AddDropItem(282,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --emerald ring
        if not done then done=drop.AddDropItem(278,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --obsidian ring
        if not done then done=drop.AddDropItem(277,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sapphire ring
        if not done then done=drop.AddDropItem(280,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --diamond ring
        if not done then done=drop.AddDropItem(68,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --ruby ring

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(10,30),100,333,0,4); --copper coins

    elseif (MonID==194) then
        -- Drops
    elseif (MonID==197) then
        --Drops
    elseif (MonID==198) then
        --Drops
    elseif (MonID==199) then
        --Drops
    else
        --Drops
    end
    drop.Dropping(Monster);
	if MonID==195 then -- spider queen
		DropSpiderEgg(Monster)
	end
end

function DropSpiderEgg(theSpider)

	if Random.uniform(1,3)==1 then

		theSpider:talk(Character.say,"#me explodiert und hinterlässt ein schleimiges Spinnenei.","#me explodes and a slimey spider egg is left behind.")
		world:gfx(8,theSpider.pos)
		local spiderEgg = world:createItemFromId(738,1,theSpider.pos,true,333,nil)
		spiderEgg.wear = 2
		base.lookat.SetSpecialName(spiderEgg, "Spinnenei", "Spider egg")
		spiderEgg:setData("spawnSpiders","true")
		world:changeItem(spiderEgg)
		table.insert(scheduled.itemEffects.SPIDER_EGGS,{itemPosition = position(theSpider.pos.x,theSpider.pos.y,theSpider.pos.z), itemCounter = 0})
		for i=-1,1 do
			for j=-1,1 do
				local slimePosition = position(theSpider.pos.x + i, theSpider.pos.y + j, theSpider.pos.z)
				if not world:isItemOnField(slimePosition) then
					local spiderSlime = world:createItemFromId(3102,1,slimePosition,true,333,nil)
					spiderEgg.wear = 3
					base.lookat.SetSpecialName(spiderSlime, "Spinnenschleim", "Spider slime")
					world:changeItem(spiderSlime)
					if world:isCharacterOnField(slimePosition) then
						local hitChar = world:getCharacterOnField(slimePosition)
						hitChar:inform("Du wirst von ekeligem klebrigem Spinnenschleim getroffen.", "You are hit by disgusting and sticky spider slime.")
					end
				end
			end
		end
	end
end

return M

