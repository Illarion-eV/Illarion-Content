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
require("monster.base.base")
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("monster.base.kills")
require("base.arena")
module("monster.mon_29_animals", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

end

function onSpawn(thisPig)
	if thisPig:getMonsterType()==241 or thisPig:getMonsterType()==251 or thisPig:getMonsterType()==252 or thisPig:getMonsterType()==253 then
    var=60;
    red,green,blue=thisPig:getSkinColor();
    red=math.min(255,red-var+math.random(2*var));
    green=math.min(255,green-var+math.random(2*var));
    blue=math.min(255,blue-var+math.random(2*var));
    thisPig:setSkinColor(red,green,blue);
	end
end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

	if monster.base.base.isMonsterArcherInRange(Monster, Enemy) then
		return true
	end

	if monster.base.base.isMonsterInRange(Monster, Enemy) then
        return true;
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


    if (MonID==181 or MonID==182) then --sheep

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2934,1,50,333,0,2); --lamb meat
        monster.base.drop.AddDropItem(170,1,100,333,0,3); --wool
		
    elseif (MonID==371 or MonID==381 or MonID==382) then --cow

        monster.base.drop.AddDropItem(333,1,50,333,0,2); --horn
        monster.base.drop.AddDropItem(2940,1,50,333,0,3); --steak
		monster.base.drop.AddDropItem(69,1,100,333,0,1); --leather

	elseif (MonID==241 or MonID==251 or MonID==252 or MonID==253) then --pig

        monster.base.drop.AddDropItem(63,1,50,333,0,2); --entrails
        monster.base.drop.AddDropItem(307,1,50,333,0,3); --pork
        monster.base.drop.AddDropItem(69,1,100,333,0,1); --leather

	elseif (MonID==581 or MonID==582 or MonID==583 or MonID==584 or MonID==951 or MonID==961 or MonID==962 or MonID==971 or MonID==972) then --dog

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur

	elseif (MonID==591 or MonID==592 or MonID==593 or MonID==594 or MonID==981 or MonID==991 or MonID==1001 or MonID==1011) then --beetle

        monster.base.drop.AddDropItem(251,1,4,333,0,1); --raw amethyst
		monster.base.drop.AddDropItem(252,1,3,333,0,1); --raw obsidian
        monster.base.drop.AddDropItem(253,1,3,333,0,1); --raw sapphire
		monster.base.drop.AddDropItem(254,1,1,333,0,1); --raw diamond
		monster.base.drop.AddDropItem(255,1,4,333,0,1); --raw ruby
		monster.base.drop.AddDropItem(256,1,2,333,0,1); --raw emerald
		monster.base.drop.AddDropItem(257,1,2,333,0,1); --raw topaz
        monster.base.drop.AddDropItem(1266,math.random(5,10),100,333,0,2); --stone

	elseif (MonID==601 or MonID==602 or MonID==603 or MonID==604 or MonID==1021 or MonID==1022) then --fox

        monster.base.drop.AddDropItem(63,1,50,333,0,1); --entrails
        monster.base.drop.AddDropItem(2586,1,100,333,0,2); --fur

	elseif (MonID==621 or MonID==622 or MonID==1061 or MonID==1071 or MonID==1081) then --chicken
        
		monster.base.drop.AddDropItem(63,1,100,333,0,1); --entrails
		monster.base.drop.AddDropItem(1150,1,50,333,0,2); --white egg
		monster.base.drop.AddDropItem(1151,1,50,333,0,3); --chicken meat
		--monster.base.drop.AddDropItem(1149,math.random(1,3),50,333,0,4); --brown egg
		
    end
    monster.base.drop.Dropping(Monster);
end
