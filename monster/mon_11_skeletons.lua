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
require("monster.base.monstermagic")
require("monster.base.base")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("monster.base.kills")
require("base.arena")
require("base.messages");
module("monster.mon_11_skeletons", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
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

function onSpawn(Monster)

	-- weakened lichs turn into a full lich after short period of time
	if Monster:getMonsterType()==117 then
		Monster.effects:addEffect(LongTimeEffect(70,Random.uniform(600,1200)))
	end

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==115) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,8,{900,1000},{{4,5},{9,5},{51,5}},{},40,1,{25,65}) == true );
    else
        return false;
    end

end

function enemyOnSight(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

	monster.base.monstermagic.regeneration(Monster); --if an enemy is around, the monster regenerates slowly
    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

    if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
    elseif (MonID==115) then
        return ( monster.base.monstermagic.CastHealing( Monster, {1500,3000}) or monster.base.drop.CastMonMagic(Monster,Enemy,5,{1000,1700},{{4,5},{9,5},{51,5}},{},40,1,{25,65}));
    else
        return false
    end

end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end


    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);

        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end

    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();

    if (MonID==111) then --Skeleton, Level: 3, Armourtype: medium, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(324,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --chain helmet
        if not done then done=monster.base.drop.AddDropItem(2295,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --cloth gloves
        if not done then done=monster.base.drop.AddDropItem(2367,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --albarian noble's armor
        if not done then done=monster.base.drop.AddDropItem(2445,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --small wooden shield
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(391,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --torch
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(2746,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --razor blade
        if not done then done=monster.base.drop.AddDropItem(223,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --iron goblet
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2664,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --club
        if not done then done=monster.base.drop.AddDropItem(230,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --mace
        if not done then done=monster.base.drop.AddDropItem(231,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(2737,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --morning star
        if not done then done=monster.base.drop.AddDropItem(23,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --hammer

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,333,0,4); --copper coins


    elseif (MonID==112) then --Scruffy Skeleton, Level: 3, Armourtype: medium, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2302,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --gynkese mercenarie's helmet
        if not done then done=monster.base.drop.AddDropItem(2194,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --short hardwood greaves
        if not done then done=monster.base.drop.AddDropItem(917,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --cursed shield
        if not done then done=monster.base.drop.AddDropItem(2360,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --Lor-Angur guardian's armor
        if not done then done=monster.base.drop.AddDropItem(101,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --chain shirt

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(2745,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --parchment
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(6,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --scissors
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --golden goblet
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --sapphire

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(2711,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --barbarian axe
        if not done then done=monster.base.drop.AddDropItem(2946,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --battleaxe
        if not done then done=monster.base.drop.AddDropItem(2723,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --executioner's axe
        if not done then done=monster.base.drop.AddDropItem(88,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --long axe
        if not done then done=monster.base.drop.AddDropItem(2642,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --orc axe

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,333,0,4); --copper coins


    elseif (MonID==113) then --Armored Skeleton, Level: 4, Armourtype: heavy, Weapontype: puncture

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(2290,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --round steel hat
        if not done then done=monster.base.drop.AddDropItem(2112,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --short blue steel greaves
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --albarian steel plate
        if not done then done=monster.base.drop.AddDropItem(2364,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --steel plate
        if not done then done=monster.base.drop.AddDropItem(4,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --plate armor

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(1317,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --bottle
        if not done then done=monster.base.drop.AddDropItem(255,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw rubies
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(190,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --ornate dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(189,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --dagger
        if not done then done=monster.base.drop.AddDropItem(398,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger
        if not done then done=monster.base.drop.AddDropItem(389,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --silvered dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,333,0,4); --copper coins


    elseif (MonID==114) then --Crippled Skeleton, Level: 2, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(7,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --horned helmet
        if not done then done=monster.base.drop.AddDropItem(2445,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --small wooden shield
        if not done then done=monster.base.drop.AddDropItem(363,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --leather scale armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(367,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --short leather legs

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(314,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --potash
        if not done then done=monster.base.drop.AddDropItem(251,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw amethysts
        if not done then done=monster.base.drop.AddDropItem(2647,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --curtlery
        if not done then done=monster.base.drop.AddDropItem(222,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --amulet
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --amethyst

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(1,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --serinjah sword
        if not done then done=monster.base.drop.AddDropItem(78,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --short sword
        if not done then done=monster.base.drop.AddDropItem(445,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --wooden sword
        if not done then done=monster.base.drop.AddDropItem(2711,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --barbarian axe
        if not done then done=monster.base.drop.AddDropItem(25,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --sabre

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(10,30),100,333,0,4); --copper coins


    elseif (MonID==115) then --Mystic Skeleton, Level: 3, Armourtype: cloth, Weapontype: concussion

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(34,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --black trousers
        if not done then done=monster.base.drop.AddDropItem(810,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --green doublet
        if not done then done=monster.base.drop.AddDropItem(816,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --grey tunic
        if not done then done=monster.base.drop.AddDropItem(193,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --blue robe
        if not done then done=monster.base.drop.AddDropItem(194,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --black robe

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(164,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --empty bottle
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(39,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --skull staff
        if not done then done=monster.base.drop.AddDropItem(40,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --cleric's staff
        if not done then done=monster.base.drop.AddDropItem(57,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --simple mage's staff
        if not done then done=monster.base.drop.AddDropItem(2664,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --club
        if not done then done=monster.base.drop.AddDropItem(230,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --mace

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,333,0,4); --copper coins


    elseif (MonID==116) then
        -- Drops
    elseif (MonID==117) then --Weakened Lich

		--[[ Weakened Lich.
		Appears from a pile of bones dropped by a normal lich. That lich hasnt droped anything except this bones.
		You get the loot for the normal lich if you kill that weakened lich. Therefore, this loot is more expensive than
		a monster of this category would normally drop.
		--]]
		--Category 1: Armor

        local done=monster.base.drop.AddDropItem(548,1,20,(100*math.random(7,8)+math.random(77,88)),0,1); --mage robe
        if not done then done=monster.base.drop.AddDropItem(547,1,10,(100*math.random(7,8)+math.random(77,88)),0,1); end --novice mage robe
        if not done then done=monster.base.drop.AddDropItem(558,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --master mage robe
        if not done then done=monster.base.drop.AddDropItem(370,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --colourful wizard hat
        if not done then done=monster.base.drop.AddDropItem(358,1,1,(100*math.random(7,8)+math.random(77,88)),0,1); end --red wizard hat

        --Category 2: Special loot

        local done=monster.base.drop.AddDropItem(280,1,20,(100*math.random(7,8)+math.random(77,88)),0,2); --diamond ring
        if not done then done=monster.base.drop.AddDropItem(279,1,10,(100*math.random(7,8)+math.random(77,88)),0,2); end --sapphire ring
        if not done then done=monster.base.drop.AddDropItem(314,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --potash
        if not done then done=monster.base.drop.AddDropItem(224,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --golden goblet
		if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(7,8)+math.random(77,88)),0,2); end --ruby

        --Category 3: Weapon

        local done=monster.base.drop.AddDropItem(209,1,20,(100*math.random(7,8)+math.random(77,88)),0,3); --battle staff
        if not done then done=monster.base.drop.AddDropItem(1044,1,10,(100*math.random(7,8)+math.random(77,88)),0,3); end --ornate mage's staff
        if not done then done=monster.base.drop.AddDropItem(2551,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --pure air
        if not done then done=monster.base.drop.AddDropItem(2782,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of earth
        if not done then done=monster.base.drop.AddDropItem(2783,1,1,(100*math.random(7,8)+math.random(77,88)),0,3); end --wand of fire

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3077,math.random(30,90),100,333,0,4); --silver coins


    elseif (MonID==118) then
        --Drops
    elseif (MonID==119) then
        --Drops
    else
        --Drops
    end
    monster.base.drop.Dropping(Monster);
end
