-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');
require("base.common")
require("base.factions");
module("test.envi", package.seeall)




function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if math.random(0,99)< 100  and char:increaseAttrib("hitpoints",0)>0 then --Chance of 10% and Hitpoints above
		if base.factions.getMembership(char) == 2 then
		char:inform("Yeah!", "Yeah!")
		world:gfx(41,position(5,5,0));
        	world:createMonster(921,position(5,5,0),0);
		world:gfx(41,position(5,6,0));
        	world:createMonster(922,position(5,6,0),0);
		world:gfx(46,position(4,5,0));
        	world:createMonster(931,position(4,5,0),0);
		world:gfx(46,position(4,6,0));
        	world:createMonster(932,position(4,6,0),0);
		world:gfx(53,position(6,5,0));
        	world:createMonster(941,position(6,5,0),0);
		world:gfx(53,position(6,6,0));
        	world:createMonster(942,position(6,6,0),0);
			if world:getMonstersInRangeOf(8,12,0, 2) then
			char:inform("Hui!", "Hui!")
			char:increaseAttrib("hitpoints", -5000)
			else
        		world:gfx(41,position(10,11,0));
			end
		char:inform("Fertig!", "Done!")
		elseif base.factions.getMembership(char) == 3 then
		world:gfx(41,position(8,8,0));
        	world:createMonster(1,position(8,8,0),0);
				local monsters = world:getMonstersInRangeOf(char.pos, 15);
				for _,monster in ipairs(monsters) do
					monster:increaseAttrib("hitpoints", -10000)
				end
		char:inform("Yeah!", "Yeah!")
		else
        	world:gfx(41,position(10,11,0));
		world:gfx(41,position(11,11,0));
        	world:createMonster(101,position(10,11,0),0);
        	world:createMonster(101,position(11,11,0),0);
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush2!")
		world:gfx(41,position(12,12,0));
        	world:createMonster(101,position(12,12,0),0); --mummified temple servant
		world:gfx(41,position(10,13,0));
        	world:createMonster(101,position(10,13,0),0); --Cherga's servant
        	world:gfx(41,position(10,10,0));
        	world:createMonster(101,position(10,10,0),0); --another mummy
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush3!")
			if base.factions.getMembership(char) == 1 then
			char:inform("Hui, du bist aus Cadomyr", "Hui, you are from Cadomyr")
			else
			char:inform("Hui, du bist nicht von Cadomyr", "Hui, you are not from Cadomyr")
			end
		end
	else
			char:warp(position(8,16,0))
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);
			char:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
			world:makeSound(25,char.pos);			
			world:gfx(13,char.pos);
			char:increaseAttrib("hitpoints", -5000)
	end

end

