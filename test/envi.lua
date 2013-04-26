-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');

module("test.envi", package.seeall)




function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if math.random(0,99)< 10  and char:increaseAttrib("hitpoints",0)>0 then --Chance of 10% and Hitpoints above 0
        	world:gfx(41,position(10,10,0));
        	world:createMonster(101,position(10,10,0),0); --another mummy
        	world:gfx(41,position(10,11,0));
        	world:createMonster(152,position(10,11,0),0); --smelly mummy
		world:gfx(41,position(10,12,0));
        	world:createMonster(172,position(10,12,0),0); --mummified temple servant
		world:gfx(41,position(10,13,0));
        	world:createMonster(701,position(10,13,0),0); --Cherga's servant
	else
			char:warp(position(8,16,0))
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);			
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);
			char:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
			world:makeSound(25,char.pos);			
			world:gfx(13,char.pos);
			world:makeSound(25,char.pos);
			char:increaseAttrib("hitpoints", -500)
		return; 
	end

end


