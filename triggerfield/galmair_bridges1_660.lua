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
-- INSERT INTO triggerfields VALUES (479,250,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (479,249,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (474,247,0,'triggerfield.galmair_bridges1_660');

require("base.common")
require("base.factions");
require("lte.deathaftertime");
require("lte.longterm_cooldown");
module("triggerfield.galmair_bridges1_660", package.seeall)



    monster={}; ---monster, numbers are archers -> excluded currently
    monster[1]={1,2,3,4,5}; --human
    monster[2]={11,12,13,14}; --dwarf 15
    monster[3]={21,22,23,24}; --halfling 25
    monster[4]={31,32,33,34}; --elf 35
    monster[5]={41,42,43,45}; --orc 44
    monster[6]={51,53,53,54,55}; -- lizard 
    monster[7]={91,92,93,95,791,792,801}; -- troll 94,802,811,812
    monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
    monster[9]={111,112,113,114,115}; --skeleton
    monster[10]={921,922,932,941,942}; --rats 931
    monster[11]={891,892,893,901,902,903}; --Imp
    monster[12]={782,783}; --golden skeleton 784
    monster[13]={301,311,321,331,341}; --golem 
    monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
    monster[15]={62,63,64}; -- drow 61,65
    monster[16]={201,202,203,204}; --demon skeleton 205 


function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if char:getQuestProgress(660) ~= 0 then --lte check
		return
	end
	if (char:getSkill(Character.punctureWeapons)>=40) or (char:getSkill(Character.distanceWeapons)>=40) or (char:getSkill(Character.slashingWeapons)>=40) or (char:getSkill(Character.concussionWeapons)>=40) or (char:getSkill(Character.wrestling)>=40) then --check if we have a non-galmairian fighter
		fighter = 1
		else
		fighter = 0
	end
	if base.factions.getMembership(char) == 3 then --set chance for Galmairians and non-Galmairians
		chance = 20
		else
		chance = 5
	end
	if math.random(1,100)< chance  and char:increaseAttrib("hitpoints",0)>8000 then --Chance of 10% and Hitpoints above 8000
		if base.factions.getMembership(char) ~= 3 and (char:getSkill(Character.parry)<=30) or  base.factions.getMembership(char) ~= 3 and fighter ~= 1  then --Newbie and non-fighter protection for non-Galmairian
			return
		end
		shutup = 0 --player should get message later
		luckybunch = 0 --we will see if there are galmairians here later
		if (char:getSkill(Character.parry)<=80) then --check of skills of fighter
			level = math.random(1,11) --selection of lower monsters for average fighter
			else
			level = math.random(1,16) --selection of all monsters for good fighter
		end
		local enemy1 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy2 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy3 = monster[level][math.random(1,table.getn(monster[level]))]
	--	local enemy4 = monster[level][math.random(1,table.getn(monster[level]))]
	--	local enemy5 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy6 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy7 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy8 = monster[level][math.random(1,table.getn(monster[level]))]
		world:gfx(41,position(482,248,0));
        	world:createMonster(enemy1,position(482,248,0),0);
		world:gfx(41,position(483,249,0));
        	world:createMonster(enemy2,position(483,249,0),0);
		world:gfx(41,position(483,250,0));
        	world:createMonster(enemy3,position(483,250,0),0);
	--[[	world:gfx(41,position(482,251,0));
        	world:createMonster(enemy4,position(482,251,0),0);
		world:gfx(41,position(475,251,0));
        	world:createMonster(enemy5,position(475,251,0),0); ]]--
		world:gfx(41,position(474,250,0));
        	world:createMonster(enemy6,position(474,250,0),0);
 		world:gfx(41,position(474,249,0));
         	world:createMonster(enemy7,position(474,249,0),0);
		world:gfx(41,position(474,247,0));
        	world:createMonster(enemy8,position(474,247,0),0); --don't remove this one, it triggers the next function
		char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!") --message for player
		char:setQuestProgress(660,math.random(300,600)) --lte set
	end
--		char:inform("missed chance", "missed chance")	--for testing, remove it later
		char:setQuestProgress(660,math.random(300,600)) --lte set
end


function MoveFromField(char)
	if shutup ~= 0 then --stop spam
		return
	end
	hero = world:getPlayersInRangeOf(char.pos, 20); --lets see if there is a player around
	for i,player in ipairs(hero) do
		if base.factions.getMembership(player) == 3 then --check if galmairians are there
			luckybunch = 1 --if non-galmairians are together with galmairians
		else
		end
	end
	if char:getType() ~= Character.player then --monster start moving
		for i,player in ipairs(hero) do
			if base.factions.getMembership(player) == 3 then --check if galmairians are there
				base.character.DeathAfterTime(char,math.random(5,10),0,1,true) --kill trigger monster
				player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen auf der Stadtmauer von Galmair dir mit ihren Armbrüsten zuwinken. Gut, dass du dem Don deine Steuern zahlst und er dich beschützt!", "Even before you are able to react, arrows shoot around you and take down your enemies. You look to the direction the arrows originated from and see guards on the town wall of Galmair waving to you with their crossbows. Good, you have paid your taxes to the Don and he protects you!")	--praise the don message for the player
				shutup = 1 --stop spam in the future
				player:setQuestProgress(660,math.random(300,600)) --lte set for all players around
				local monsters = world:getMonstersInRangeOf(player.pos, 35); --get all monster in player range 
				for i,mon in ipairs(monsters) do
					base.character.DeathAfterTime(mon,math.random(5,10),0,33,true) --kill all monsters
				end
				return
			
			elseif luckybunch ~= 0 then -- glamairians are here...lucky you
				player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen auf der Stadtmauer von Galmair euch mit ihren Armbrüsten zuwinken. Gut, dass du jemanden dabei hattest, der dem Don Steuern zahlst und daher beschützt wird vom Don!", "Even before you are able to react, arrows shoot around you and take down your enemies. You look to the direction the arrows originated from and see guards on the town wall of Galmair waving to you with their crossbows. Good, you have someone with you who has paid taxes to the Don and is thus protected by the Don!")	--wäähh wrong faction but together with friends message for the player
				shutup = 1 --stop spam in the future
				player:setQuestProgress(660,math.random(300,600)) --lte set for all players around
			else -- no galmairians are here...bad luck
				player:inform("Du wirfst einen Blick zur Stadtmauer von Galmair und siehst die Wachen dort wie sie dich und dein Schicksal beobachten. Was, wenn du nur dem Don deine Steuern zahlen würdest?", "You look to the town wall of Galmair and see guards on the wall watching your fate. What if you had only paid your taxes to the Don?")	--wäähh wrong faction message for the player
				shutup = 1 --stop spam in the future
				player:setQuestProgress(660,math.random(300,600)) --lte set for all players around
			end
		end	
	else
		return
	end
end

