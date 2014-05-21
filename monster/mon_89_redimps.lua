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
require("base.messages");
require("monster.base.kills")
require("base.arena")
module("monster.mon_89_redimps", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = base.messages.Messages();
msgs:addMessage("#me knurrt.", "#me growls.");
end

function enemyNear(Monster,Enemy)

	local MonID=Monster:getMonsterType();
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	if (MonID==892) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{250,750},{{36,5},{9,5},{38,5}},{},40,1,{35,50}) );
	elseif (MonID==893) then
        return ( monster.base.monstermagic.CastMonster(Monster, {622, 1032}) );
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
	elseif (MonID==892) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{250,750},{{36,5},{9,5},{38,5}},{},40,1,{35,50}) );
	elseif (MonID==893) then
        return ( monster.base.monstermagic.CastMonster(Monster, {622, 1032}) );
    else
        return false;
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


    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();
if (MonID==891) then --Fireimp, Level: 2, Armourtype: light, Weapontype: puncture

        --Category 1: Special Loot

        local done=monster.base.drop.AddDropItem(2760,1,20,(100*math.random(1,2)+math.random(11,22)),0,1); --rope
        if not done then done=monster.base.drop.AddDropItem(155,1,10,(100*math.random(1,2)+math.random(11,22)),0,1); end --sibanac
        if not done then done=monster.base.drop.AddDropItem(55,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --green robe
        if not done then done=monster.base.drop.AddDropItem(817,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --green tunic
        if not done then done=monster.base.drop.AddDropItem(194,1,1,(100*math.random(1,2)+math.random(11,22)),0,1); end --black robe

        --Category 2: Special Loot

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(1,2)+math.random(11,22)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(1,2)+math.random(11,22)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(733,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(735,1,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --raw stone
        if not done then done=monster.base.drop.AddDropItem(1266,20,1,(100*math.random(1,2)+math.random(11,22)),0,2); end --stone

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(189,1,20,(100*math.random(1,2)+math.random(11,22)),0,3); --dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(1,2)+math.random(11,22)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(189,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --dagger
        if not done then done=monster.base.drop.AddDropItem(190,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(2740,1,1,(100*math.random(1,2)+math.random(11,22)),0,3); end --red dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(10,30),100,773,0,4); --copper coins


    elseif (MonID==892) then --Cures Fireimp, Level: 3, Armourtype: light, Weapontype: slashing

        --Category 1: Armor

        local done=monster.base.drop.AddDropItem(17,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --wooden shield
        if not done then done=monster.base.drop.AddDropItem(367,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --short leather legs
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(365,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --half leather armor
        if not done then done=monster.base.drop.AddDropItem(53,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --leather boots

        --Category 2: Plants

        local done=monster.base.drop.AddDropItem(46,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --ruby
        if not done then done=monster.base.drop.AddDropItem(284,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(733,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --stone block
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(64,10,20,(100*math.random(2,3)+math.random(22,33)),0,3); --arrows
        if not done then done=monster.base.drop.AddDropItem(237,5,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --bolts
        if not done then done=monster.base.drop.AddDropItem(56,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --bough
        if not done then done=monster.base.drop.AddDropItem(826,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --black trousers
        if not done then done=monster.base.drop.AddDropItem(823,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --grey trousers

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins


    elseif (MonID==893) then --Mystic Fireimp, Level: 4, Armourtype: cloth, Weapontype: concussion

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw emerald

        --Category 2: Gems

        local done=monster.base.drop.AddDropItem(197,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --amethyst
        if not done then done=monster.base.drop.AddDropItem(46,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --emerald
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --obsidian

        --Category 3: Weapons

        local done=monster.base.drop.AddDropItem(189,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --dagger
        if not done then done=monster.base.drop.AddDropItem(27,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --simple dagger
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --coppered dagger
        if not done then done=monster.base.drop.AddDropItem(389,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --silvered dagger
        if not done then done=monster.base.drop.AddDropItem(2671,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --magic dagger

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
end
