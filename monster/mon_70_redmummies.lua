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
msgs:addMessage("#me ist mit Wunden übersäht", "#me is littered with wounds.");
msgs:addMessage("#me macht ächzende Geräusche.", "#me makes groaning noises.");
msgs:addMessage("#me spuckt etwas Blut auf den Boden.", "#me spits out some blood.");
msgs:addMessage("#me starrt ins Leere.", "#me stares into oblivion.");
msgs:addMessage("#me stöhnt unter Schmerzen.", "#me moans with pain.");
msgs:addMessage("#me torkelt.", "#me staggers.");
msgs:addMessage("#me wackelt etwas unsicher.", "#me is a bit unsteady on its feet.");
msgs:addMessage("Hiiirne!", "Braaains!");
msgs:addMessage("Komm... zu... uns...", "Join... us...");
msgs:addMessage("#me fährt sich mit einer klauenhaften Hand murmelnd über den pilzbefallenen Kopf, ehe er ein schlürfendes Geräusch von sich gibt.", "#me runs with claw-like hands over its fungus-stricken head as it makes a shuffling noise.");
msgs:addMessage("#me weist einige schwere Wunden auf, weshalb er nur schwerfällig vorwärts kommt. Als er allerdings die zerfallende Nase reckt, scheint mehr 'Leben' in ihn zurückzukehren.", "#me has severe wounds, it moves very slowly. But as it stretches its disintegrating nose, more 'life' seems to come back into it.");
msgs:addMessage("#me tropft dicklicher Speichel aus dem Mundwinkel und seine milchigen Augen starren trübsinnig drein, während ihm unverständliche Worte entfläuchen.", "#me drops syrupy saliva from its mouth and its eyes stare gloomily as it speaks unintelligible words.");
msgs:addMessage("#me stöhnt schwer und beugt sich vornüber, eine schwarze Flüssigkeit zu Boden spuckend. Danach richtet er sich wieder auf und haftet den Blick gebannt auf das Opfer.", "#me groans heavily and leans forward, spitting a black liquid on the floor. Then it straightens up and affixes its eyes on the victim.");

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

if (MonID==701) then --Chergas Servant, Level: 4, Armourtype: heavy, Weapontype: puncture

        --Category 1: Raw gems

        local done=drop.AddDropItem(257,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw topaz
        if not done then done=drop.AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(251,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw amethyst
        if not done then done=drop.AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(255,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw ruby

        --Category 2: Gems

        local done=drop.AddDropItem(63,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --entrails
        if not done then done=drop.AddDropItem(284,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(197,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --amethyst
        if not done then done=drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --obsidian
        if not done then done=drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby

        --Category 3: Weapon

        local done=drop.AddDropItem(190,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ornate dagger
        if not done then done=drop.AddDropItem(2740,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --red dagger
        if not done then done=drop.AddDropItem(297,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --golden dagger
        if not done then done=drop.AddDropItem(444,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --merinium plated dagger
        if not done then done=drop.AddDropItem(2672,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --poisoned dagger

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(30,90),100,333,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

