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
msgs:addMessage("#me fehlt bei genauerer Betrachtung wohl der Unterkiefer.", "#me is missing its lower jaw on closer inspection.");
msgs:addMessage("#me greift nach oben zu seinem eigenen Schädel und verdreht ihn mit einem lauten, knackenden Geräusch.", "#me reaches up, grabs it's own skull and twists, making a loud cracking noise.");
msgs:addMessage("#me grinst wie ein Narr.", "#me grins like a fool.");
msgs:addMessage("#me hebt seine Waffe in die Höhe und klappert mit den Zähnen.", "#me raises his weapon and rattles with its tooth.");
msgs:addMessage("#me kichert still, die Schultern schwanken und knacken.", "#me cackles silently, shoulders heaving and creaking.");
msgs:addMessage("#me klappert, die Knochen rasseln.", "#me clatters, bones rattling.");
msgs:addMessage("#me klappt seinen Kiefer zu um bösartig zu grinsen.", "#me snaps its jaw shut, grinning wickedly.");
msgs:addMessage("#me kriecht qualvoll über den Boden..", "#me shuffles painfully across the floor.");
msgs:addMessage("#me macht langsame und mühsame Schritte... Click...clack...click...clack...", "#me takes slow, tedious steps... Click...clack...click...clack...");
msgs:addMessage("#me schlurft vorwärts, Gelenke knarren und knacken.", "#me shambles forward, joints clicking and creaking...");
msgs:addMessage("#me schwingt eine uralte Waffe, verrostet und verbeult.", "#me brandishes an ancient weapon, rusted and battered.");
msgs:addMessage("#me schwingt gewaltsam seine verfallene Waffe.", "#me swings its decayed weapon violently.");
msgs:addMessage("#me streckt eine knochige Hand aus.", "#me reaches out a bony hand.");
msgs:addMessage("#me taumelt, beinahe zusammenstürzend.", "#me staggers, nearly toppling over.");
msgs:addMessage("#mes Kiefer öffnet sich zu einem lautlosen Schrei.", "#me's jaw swivels in a silent scream...");
msgs:addMessage("#mes Knochen schlagen klappernd und rasselnd aneinander.", "#me's bones clinks clacking and rattling together.");
msgs:addMessage("#mes Kopf hängt herab, leere Augenhöhlen starren geradeaus.", "#me's head lolls around, empty eye sockets staring.");

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

    if (MonID==782) then --Golden Legionnaire, Level: 5, Armourtype: medium, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(2116,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --red steel greaves
        if not done then done=drop.AddDropItem(20,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --large metal shield
        if not done then done=drop.AddDropItem(2287,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --albarian soldier's helmet
        if not done then done=drop.AddDropItem(2364,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --steel plate
        if not done then done=drop.AddDropItem(2393,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --heavy plate armor

        --Category 2: Special Loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nuggets
        if not done then done=drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=drop.AddDropItem(297,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded dagger
        if not done then done=drop.AddDropItem(84,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded longsword
        if not done then done=drop.AddDropItem(124,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded battle axe

        --Category 3: Weapon

        local done=drop.AddDropItem(2737,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --morning star
        if not done then done=drop.AddDropItem(2664,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --club
        if not done then done=drop.AddDropItem(209,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --battle staff
        if not done then done=drop.AddDropItem(226,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --warhammer
        if not done then done=drop.AddDropItem(230,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --mace

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==783) then --Golden Magus, Level: 5, Armourtype: light, Weapontype: concussion

        --Category 1: Armor

        local done=drop.AddDropItem(55,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --green robe
        if not done then done=drop.AddDropItem(193,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue robe
        if not done then done=drop.AddDropItem(2295,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --cloth gloves
        if not done then done=drop.AddDropItem(821,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --lblue trousers
        if not done then done=drop.AddDropItem(814,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --blue tunic

        --Category 2: Special Loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=drop.AddDropItem(297,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --gilded dagger
        if not done then done=drop.AddDropItem(155,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sibanac
        if not done then done=drop.AddDropItem(2744,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --pipe

        --Category 3: Weapon

        local done=drop.AddDropItem(57,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --simple mage's staff
        if not done then done=drop.AddDropItem(76,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --mage's staff
        if not done then done=drop.AddDropItem(39,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --skull staff
        if not done then done=drop.AddDropItem(40,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --cleric's staff
        if not done then done=drop.AddDropItem(1044,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ornate mage's staff

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins


    elseif (MonID==784) then --Golden Archer, Level: 5, Armourtype: heavy, Weapontype: distance

        --Category 1: Raw gems

        local done=drop.AddDropItem(256,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw emerald
        if not done then done=drop.AddDropItem(252,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw obsidian
        if not done then done=drop.AddDropItem(253,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw sapphire
        if not done then done=drop.AddDropItem(257,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw topaz
        if not done then done=drop.AddDropItem(254,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw diamond

        --Category 2: Special Loot

        local done=drop.AddDropItem(234,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --gold nugget
        if not done then done=drop.AddDropItem(235,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --golden ring
        if not done then done=drop.AddDropItem(284,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --sapphire
        if not done then done=drop.AddDropItem(198,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --topaz
        if not done then done=drop.AddDropItem(285,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --diamond

        --Category 3: Weapon

        local done=drop.AddDropItem(64,20,20,(100*math.random(4,5)+math.random(44,55)),0,3); --arrows
        if not done then done=drop.AddDropItem(294,20,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --throwing stars
        if not done then done=drop.AddDropItem(322,10,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --wind arrows
        if not done then done=drop.AddDropItem(2708,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --long bow
        if not done then done=drop.AddDropItem(2714,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --hunting bow

        --Category 4: Perma Loot
        drop.AddDropItem(3076,math.random(60,180),100,333,0,4); --copper coins

    end
    drop.Dropping(Monster);
end

return M

