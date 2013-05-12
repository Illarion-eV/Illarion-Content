-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');
require("base.common")
require("base.factions");
module("test.envi", package.seeall)




function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if math.random(0,99)< 100  and char:increaseAttrib("hitpoints",0)>0 then --Chance of 10% and Hitpoints above
		char:inform("Hui!", "Hui!")
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
		if base.factions.getMembership(char) == 2 then
			if world:getMonstersInRangeOf(position(8,12,0), 20) then
			char:increaseAttrib("hitpoints", -10000)
			char:inform("Fertig!", "Done!")
			end
		elseif base.factions.getMembership(char) == 0 then
		char:inform("Ohoh, ein Hinterhalt für Vogelfreie!", "Ohoh, an ambush for outlaws!")
		else
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush!")
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

