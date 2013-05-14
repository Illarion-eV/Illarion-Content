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
		char:inform("Oh nein, ein Hinterhalt!", "Oh no, an ambush!")
		char:setQuestProgress(660,math.random(40,55))
	end
		char:inform("missed chance", "missed chance")	--for testing, remove it later
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
			for i,mon in ipairs(monsters) do
				base.character.DeathAfterTime(mon,math.random(10,20),0,33)
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
end

