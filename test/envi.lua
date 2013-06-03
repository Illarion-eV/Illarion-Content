-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');
-- INSERT INTO triggerfields VALUES (8,16,0,'test.envi');
-- INSERT INTO triggerfields VALUES (9,16,0,'test.envi');

-- INSERT INTO triggerfields VALUES (479,250,0,'triggerfield.galmair_bridges_660');
-- INSERT INTO triggerfields VALUES (479,249,0,'triggerfield.galmair_bridges_660');
-- INSERT INTO triggerfields VALUES (474,247,0,'triggerfield.galmair_bridges_660');
-- INSERT INTO triggerfields VALUES (498,201,0,'triggerfield.galmair_bridges_660');
-- INSERT INTO triggerfields VALUES (497,201,0,'triggerfield.galmair_bridges_660');
-- INSERT INTO triggerfields VALUES (496,207,0,'triggerfield.galmair_bridges_660');
require("base.common")
require("base.factions");
require("lte.deathaftertime");
require("lte.createaftertime");
require("lte.longterm_cooldown");
require("server.standardfighting");
module("test.envi", package.seeall)


--[[

lights={};
lights[1]={46,53};

function MoveToField(char)
	local createItemX=math.random(3,6);
	local i=0;
	repeat
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		createItemID=0;
		char:inform("null", "nill")
		elseif math.random(1,100) < 0 then
		createItemID=0;
		char:inform("null, kein Glück", "nill, bad luck")
		char:setQuestProgress(661,math.random(60,100)) --lte set
		else
		createItemID=1;
		char:inform("one", "one")
		char:setQuestProgress(661,math.random(60,100)) --lte set
	end
		createItemAmount=1;
--		createItemAmount=math.random(2,6);
		createItemX=math.random(5,15);
		createItemY=math.random(5,15);
		createItemZ=0;
		createItemQual=333;
		createAfter=math.random(1,20);
		createGfx=lights[1][math.random(1,table.getn(lights[1]))];
		createSound=0;

		local i=i+1;
		base.character.CreateAfterTime (char,createItemID,createItemAmount,createItemX,createItemY,createItemZ,createItemQual,createAfter,createGfx,crateSound)

	until (i==createItemX)
end ]]--


lights={};
lights[1]={46,53};

function MoveToField(char)
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		createItemID=0;
		char:inform("null", "nill")
		elseif math.random(1,100) < 0 then
		createItemID=0;
		char:inform("null, kein Glück", "nill, bad luck")
		char:setQuestProgress(661,math.random(60,100)) --lte set
		else
		createItemID=1;
		char:inform("one", "one")
		char:setQuestProgress(661,math.random(60,100)) --lte set
	end
		createItemAmount=1;
		createItemX=math.random(5,15);
		createItemY=math.random(5,15);
		createItemZ=0;
		createItemQual=333;
		createAfter=math.random(1,20);
		createGfx=lights[1][math.random(1,table.getn(lights[1]))];
		createSound=0;

--		base.character.CreateAfterTime (char,createItemID,createItemAmount,createItemX,createItemY,createItemZ,createItemQual,createAfter,createGfx,crateSound)
--		posOfItem = position(createItemX,createItemY,createItemZ)
		posOfItem = position(12,12,0)		
--		world:createItemFromId(createItemID,createItemAmount,posOfItem,true,createItemQual)
		world:createItemFromId( 51, 1, position(12,12,0), true, 999, 0)
end

--[[
lights={};
lights[1]={46,53};

function MoveToField(char)
	x=math.random(5,10);
	i=0;
	repeat
		i=i+1;
		world:gfx(lights[1][math.random(1,table.getn(lights[1]))],position(math.random(5,15),math.random(5,15),0));
	until (i==x)
end ]]--


--[[
function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		world:makeSound(??,char.pos);
	end	
end ]]--


--[[

    monster={}; ---monster, numbers are archers -> excluded currently
    monster[1]={1,2,3,4,5}; --human
    monster[2]={11,12,13,14}; --dwarf 15
    monster[3]={21,22,23,24}; --halfling 25
    monster[4]={31,32,33,34}; --elf 35
    monster[5]={41,42,43,45}; --orc 44
    monster[6]={51,53,53,54,55}; -- lizard 
    monster[7]={91,92,93,95,791,792,801,812}; -- troll 94,802,811
    monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
    monster[9]={111,112,113,114,115}; --skeleton
    monster[10]={921,922,932,941,942}; --rats 931
    monster[11]={891,892,893,901,902,903}; --Imp
    monster[12]={782,783}; --golden skeleton 784
    monster[13]={301,311,321,331,341}; --golem 
    monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
    monster[15]={62,63,64,65}; -- drow 61
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
		char:inform("fighter", "fighter")
		else
		fighter = 0
		char:inform("nonfighter", "nonfighter")
	end
	if base.factions.getMembership(char) == 3 then
		chance = 101
		char:inform("chance 20", "chance 20")
		else
		chance = 101
		char:inform("chance 5", "chance 5")
	end

	if math.random(1,100)< chance  and char:increaseAttrib("hitpoints",0)>8000 then --Chance of 10% and Hitpoints above 8000
		if base.factions.getMembership(char) ~= 3 and (char:getSkill(Character.parry)<=30) or  base.factions.getMembership(char) ~= 3 and fighter ~= 1  then --Newbie and non-fighter protection for non-Galmairian
		char:inform("not cool enough", "not cool enough")
		return
		end
		shutup = 0 --player should get message later
		luckybunch = 0 --we will see if there are galmairians here later
		if (char:getSkill(Character.parry)<=70) then --check of skills of fighter
			level = math.random(1,11) --selection of lower monsters for average fighter
			else
			level = math.random(1,16) --selection of all monsters for good fighter
			end
		local enemy1 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy2 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy3 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy4 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy5 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy6 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy7 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy8 = monster[level][math.random(1,table.getn(monster[level]))]
		world:gfx(41,position(5,5,0));
        	world:createMonster(enemy1,position(5,5,0),0);
		world:gfx(41,position(5,6,0));
        	world:createMonster(enemy2,position(5,6,0),0);
		world:gfx(46,position(4,5,0));
        	world:createMonster(enemy3,position(4,5,0),0);
		world:gfx(46,position(4,6,0));
        	world:createMonster(enemy4,position(4,6,0),0);
		world:gfx(53,position(6,5,0));
        	world:createMonster(enemy5,position(6,5,0),0);
		world:gfx(53,position(6,6,0));
        	world:createMonster(enemy6,position(6,6,0),0);
		world:gfx(53,position(8,16,0));
        	world:createMonster(enemy7,position(8,16,0),0);
		world:gfx(53,position(9,16,0));
        	world:createMonster(enemy8,position(9,16,0),0); --don't remove this one, it triggers the next function
		char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!") --message for player
		char:setQuestProgress(660,math.random(300,600)) --lte set
	end
--		char:inform("missed chance", "missed chance")	--for testing, remove it later
		char:setQuestProgress(660,math.random(300,600)) --lte set
end




function MoveFromField(char)
	if char:getType() ~= Character.player then
		local test = world:getPlayersInRangeOf(char.pos, 10);
		for i,player in ipairs(test) do
		if base.factions.getMembership(player) == 3 then
			world:gfx(53,position(10,10,0));
			base.character.DeathAfterTime(char,math.random(10,20),0,1)
			player:inform("Bevor du auch noch reagieren kannst, schießen Pfeile an dir vorbei und töten deine Widersacher. Du blickst in die Richtung von wo die Pfeile kamen und siehst die Wachen auf der Stadtmauer von Galmair dir mit ihren Armbrüste zuwinken. Gut, dass du dem Don deine Steuern zahlst und er dich beschützt!", "Even before you are able to react, arrows shouting around you and take down your enemies. You look into the direction of the orgin of the arrows and see guards on the town wall of Galmair waving to you with their crossbows. Good you have paid your taxes to the Don and he protects you!")
			local monsters = world:getMonstersInRangeOf(player.pos, 30);
			--player:inform("Danke2!", "Thanks2!")
			for i,mon in ipairs(monsters) do
			--player:inform("Danke3!", "Thanks3!")
			--	mon:increaseAttrib("hitpoints", -10000)
				base.character.DeathAfterTime(mon,math.random(10,20),0,33)
			        server.standardfighting.DropMuchBlood(mon.pos);
			--player:inform("Danke4!", "Thanks4!")
			end
			return
		else
			world:gfx(2,position(11,11,0));
			player:inform("Du wirfst einen Blick zur Stadtmauer von Galmair und siehst die Wachen dort wie sie dich und dein Schicksal beobachten. Was, wenn du nur dem Don deine Steuern zahlen würdest?", "You look to the town wall of Galmair and see guards on the wall watching your faith. What if you would pay your taxes to the Don?")	
		end
		end	
	else
	return
	end
end ]]--

----------------------------------------

--[[function Init()
    if InitDone then
        return
    end
    monster={};
    monster[1]={921,922,931,932,941,942}; 
    monster[2]={1,2,3,4,5}; 
    monster[3]={201,202,203,204,205}; 
	InitDone = true;
end

function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if char:getQuestProgress(660) ~= 0 then --
		return
	end
	if math.random(0,99)< 100  and char:increaseAttrib("hitpoints",0)>0 then --Chance of 10% and Hitpoints above
		if base.factions.getMembership(char) ~= 3 and (char:getSkill(Character.parry)<=30) then
		return
		end
    		Init(); --Initialising
		local level = math.random(1,3)
		local enemy1 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy2 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy3 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy4 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy5 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy6 = monster[level][math.random(1,table.getn(monster[level]))]
		local enemy7 = monster[level][math.random(1,table.getn(monster[level]))]
		world:gfx(41,position(5,5,0));
        	world:createMonster(enemy1,position(5,5,0),0);
		world:gfx(41,position(5,6,0));
        	world:createMonster(enemy2,position(5,6,0),0);
		world:gfx(46,position(4,5,0));
        	world:createMonster(enemy3,position(4,5,0),0);
		world:gfx(46,position(4,6,0));
        	world:createMonster(enemy4,position(4,6,0),0);
		world:gfx(53,position(6,5,0));
        	world:createMonster(enemy5,position(6,5,0),0);
		world:gfx(53,position(6,6,0));
        	world:createMonster(enemy6,position(6,6,0),0);
--		world:gfx(53,position(8,16,0));
--        	world:createMonster(942,position(8,16,0),0);
		world:gfx(53,position(9,16,0));
        	world:createMonster(enemy7,position(9,16,0),0);
		char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!")
		char:setQuestProgress(660,1)
	end ]]--
--[[	if base.factions.getMembership(char) == 2 then
			char:inform("funkt1!", "funkt1!")
			local monsters = world:getMonstersInRangeOf(char.pos, 30);
			char:inform("funkt2!", "funkt2!")
			for i,mon in ipairs(monsters) do
			char:inform("funkt3!", "funkt3!")
			--	mon:increaseAttrib("hitpoints", -10000)
				base.character.DeathAfterTime(mon,10,51,1)
			char:inform("funkt4!", "funkt4!")
			end
		elseif base.factions.getMembership(char) == 0 then
		char:inform("Ohoh, ein Hinterhalt für Vogelfreie!", "Ohoh, an ambush for outlaws!")
		world:gfx(53,position(10,10,0)); 
		world:gfx(2,position(11,11,0));
		world:gfx(46,position(10,10,0));
		else
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush!")
	end ]]--
--[[	else
			char:warp(position(8,16,0))
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);
			char:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
			world:makeSound(25,char.pos);			
			world:gfx(13,char.pos);
			char:increaseAttrib("hitpoints", -5000)
	end 
		char:inform("missed chance", "missed chance")
end]]--

--[[
function MoveFromField(char)
	if char:getType() ~= Character.player then
		local test = world:getPlayersInRangeOf(char.pos, 10);
		for i,player in ipairs(test) do
		if base.factions.getMembership(player) == 2 then
			world:gfx(53,position(10,10,0));
			char:increaseAttrib("hitpoints", -10000)
			player:inform("Danke1!", "Thanks1!")
			return
		else
			world:gfx(2,position(11,11,0));
			player:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush!")	
		end
		end	
	else
		char:inform("Nix!", "Nix!")
	end
end
]]--

--[[
function MoveFromField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if base.factions.getMembership(char) == 2 then
			char:inform("funkt1!", "funkt1!")
			local monsters = world:getMonstersInRangeOf(char.pos, 30);
			char:inform("funkt2!", "funkt2!")
			for i,mon in ipairs(monsters) do
			char:inform("funkt3!", "funkt3!")
				mon:increaseAttrib("hitpoints", -10000)
			char:inform("funkt4!", "funkt4!")
			end
		elseif base.factions.getMembership(char) == 0 then
		char:inform("Ohoh, ein Hinterhalt für Vogelfreie!", "Ohoh, an ambush for outlaws!")
		world:gfx(53,position(10,10,0)); 
		world:gfx(2,position(11,11,0));
		world:gfx(46,position(10,10,0));
		else
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush!")
		end
end
]]--
