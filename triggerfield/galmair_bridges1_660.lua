-- INSERT INTO triggerfields VALUES (479,250,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (479,249,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (474,247,0,'triggerfield.galmair_bridges1_660');

require("base.common")
require("base.factions");
require("lte.deathaftertime");
require("lte.longterm_cooldown");
module("triggerfield.galmair_bridges1_660", package.seeall)


function Init()
    if InitDone then
        return
    end
    monster={}; ---monster, numbers are archers -> excluded currently
    monster[1]={1,2,3,4,5}; --human
    monster[2]={11,12,13,14}; --dwarf 15
    monster[3]={21,22,23,24}; --halfling 25
    monster[4]={31,32,33,34}; --elf 35
    monster[5]={41,42,43,45}; --orc 44
    monster[6]={51,53,53,54,55}; -- lizard 
    monster[7]={91,92,93,95,791,792,801,811,812}; -- troll 94, 802
    monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
    monster[9]={111,112,113,114,115}; --skeleton
    monster[10]={921,922,931,932,941,942}; --rats
    monster[11]={891,892,893,901,902,903}; --Imp
    monster[12]={782,783}; --golden skeleton 784
    monster[13]={301,311,321,331,341}; --golem 
    monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
    monster[15]={62,63,64,65}; -- drow 61
    monster[16]={201,202,203,204}; --demon skeleton 205 
	InitDone = true;
end

function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if char:getQuestProgress(660) ~= 0 then --lte check
		return
	end
	if math.random(0,99)< 100  and char:increaseAttrib("hitpoints",0)>1000 then --Chance of 10% and Hitpoints above 1000
		if base.factions.getMembership(char) ~= 3 and (char:getSkill(Character.parry)<=30) then --Newbie protection for non-Galmairian
		return
		end
    		Init(); --Initialising monster list
		shutup = 0 --player should get message later
--		if (char:getSkill(Character.parry)<=70) then --check of skills of fighter
--			local level = math.random(1,11) --selection of lower monsters for average fighter
--			else
			local level = math.random(1,16) --selection of all monsters for good fighter
--		end
		char:inform(level)
		local enemy1 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy2 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy3 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy4 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy5 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy6 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy7 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy8 = monster[level][math.random(1,table.getn(monster[level]))]
		world:gfx(41,position(482,248,0));
        	world:createMonster(enemy1,position(482,248,0),0);
		world:gfx(41,position(483,249,0));
        	world:createMonster(enemy2,position(483,249,0),0);
		world:gfx(46,position(483,250,0));
        	world:createMonster(enemy3,position(483,250,0),0);
		world:gfx(46,position(482,251,0));
        	world:createMonster(enemy4,position(482,251,0),0);
		world:gfx(53,position(475,251,0));
        	world:createMonster(enemy5,position(475,251,0),0);
		world:gfx(53,position(474,250,0));
        	world:createMonster(enemy6,position(474,250,0),0);
 		world:gfx(53,position(474,249,0));
         	world:createMonster(enemy7,position(474,249,0),0);
		world:gfx(53,position(474,247,0));
        	world:createMonster(enemy8,position(474,247,0),0);
		char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!") --message for player
		char:setQuestProgress(660,math.random(40,55)) --lte set
	end
--		char:inform("missed chance", "missed chance")	--for testing, remove it later
end


function MoveFromField(char)
	if char:getType() ~= Character.player then --monster start moving
		local hero = world:getPlayersInRangeOf(char.pos, 10); --lets see if there is a player around
		for i,player in ipairs(hero) do
		if base.factions.getMembership(player) == 3 then
			if shutup ~= 0 then --check if player has already got the message
			return
			else
			base.character.DeathAfterTime(char,math.random(10,20),0,1) --kill trigger monster
			player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen auf der Stadtmauer von Galmair dir mit ihren Armbrüste zuwinken. Gut, dass du dem Don deine Steuern zahlst und er dich beschützt!", "Even before you are able to react, arrows shouting around you and take down your enemies. You look into the direction of the orgin of the arrows and see guards on the town wall of Galmair waving to you with their crossbows. Good you have paid your taxes to the Don and he protects you!")	--praise the don message for the player
			shutup = 1 --stop message for player
			local monsters = world:getMonstersInRangeOf(player.pos, 20); --get all monster in player range 
				for i,mon in ipairs(monsters) do
				base.character.DeathAfterTime(mon,math.random(10,20),0,33) --kill all monsters
				end
			return
			end
		elseif shutup ~= 0 then  --check if player has already got the message
			return
			
		else
			player:inform("Du wirfst einen Blick zur Stadtmauer von Galmair und siehst die Wachen dort wie sie dich und dein Schicksal beobachten. Was, wenn du nur dem Don deine Steuern zahlen würdest?", "You look to the town wall of Galmair and see guards on the wall watching your faith. What if you would pay your taxes to the Don?")	--wäähh wrong faction message for the player
			shutup = 1 --stop message for player
		end
		end	
	else
	return
	end
end

