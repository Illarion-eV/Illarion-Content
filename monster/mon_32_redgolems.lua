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
msgs:addMessage("#mes imposante Erscheinung wirft einen finsteren Schatten und der Boden erbebt mit jedem Schritt.", "#me's colossal presence casts an eclipsing shadow and shakes the ground with each step.");
msgs:addMessage("#me mag einem diamantgleichen Bollwerk aus Fels und Stein gleichen, aber jene mit scharfen Blick können den eingelassenen Herzstein in der Brust des Wächters ausmachen.", "#me's adamantine bulwark of rocks and gems may seem impervious, but those with a keen eye might notice the crystalline heart-stone embedded in the guardian's chest.");
msgs:addMessage("#me stampft mit einer solchen Geschwindigkeit auf den Boden, dass die Erschütterung tiefe Risse hinterläßt.", "#me pounds the ground with such velocity that tremors split and crack across the ground.");
msgs:addMessage("#mes kehliges Grollen durchdringt Ohr und Mark wie eine kreischender Schleifstein.", "#me's guttural roar pierces the ear like an amplified grindstone.");
msgs:addMessage("#me steht rücksichtslos in seinem Hoheitsgebiet Wache, jene, die die Fäden der Natur ergründet haben, machen abstruse Managewebe als Anstiftung seiner Wut aus.", "#me ruthlessly guards its territory, those clairvoyant to the threads of nature may sense the abstruse webs of mana inciting its rage.");
msgs:addMessage("#me richtet seine diamantenen Augen ganz und gar auf sein Ziel,  vollkommens sich der Beseitigung der Eindringlingen hingebend.", "#me trains its diamond eyes on its target utterly enraptured with eliminating intruders.");
msgs:addMessage("#me bewegt sich mit einer solchen Heftigkeit, dass der Steine Scherben aus dem Boden bröckeln.", "#me moves with such ferocity that shards of gems and rocks crumble to the ground.");
msgs:addMessage("#me schlägt seine steinernen Fäuste zusammen, den Boden mit Fragmenten von Edelsteinen und rohem Fels bedeckend.", "#me smashes its stone fists together littering the ground with fragments of precious jewels and raw stone.");
msgs:addMessage("#me hinterlässt beim herumtrampeln tiefe Erdpfurchen und widerhallendes Beben.", "#me leaves behind hollow pits and reverberating tremors as it tramples around.");
msgs:addMessage("#me hebt seine imposanten Fäuste und stößt einen donnernden Kriegsschrei aus, der die Erde beben lässt.", "#me raises its enormous fist and yells a terrifying warcry that makes the ground quake.");

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
if (MonID==321) then --Lavagolem, Level: 5, Armourtype: heavy, Weapontype: slashing

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby

        --Category 2: Gems

        local done=drop.AddDropItem(198,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --topaz
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(733,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --stone block
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby

        --Category 3: Special Loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --gold ingot
        if not done then done=drop.AddDropItem(733,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --stone block
        if not done then done=drop.AddDropItem(22,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --iron ore
        if not done then done=drop.AddDropItem(2536,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --copper ore
        if not done then done=drop.AddDropItem(1266,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --stone

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

