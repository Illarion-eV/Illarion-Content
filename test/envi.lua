-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');

module("test.envi", package.seeall)




function MoveToField(char)
	if char:getType() ~= Character.player then
		return
	end
	if math.random(0,99)< 10 then -- riddle has been solved yet; the voice one more time; chance be warped
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);			
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);
			char:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
			world:makeSound(25,char.pos);			
			world:gfx(13,char.pos);
			world:makeSound(25,char.pos);
			char:increaseAttrib("hitpoints", -500)
	else
			char:warp(position(8,16,0))
		return; 
	end

end


