require("base.common")

module("triggerfield.salavesh_fireballtrap", package.seeall)

--This script shoots a fireball down the hall in the "Errant Crusade" quest map
--Can be used with various triggerfields, players shall "abuse" this to fight the monsters down there

function MoveToField(User)

    if User:get_type() == 0 then --only player characters trigger the triggerfield
	    
		base.common.TempInformNLS(User,"Ein Feuerball schieﬂt aus einem kleinen Loch in der Wand die Halle entlang!","A firewall is shot from a small hole in the wall down the hallway!"); --sending a message
        
		x=User.pos.x; --The x-coordinate of the triggerfield
		
		for i=399,415 do --replace with proper coordinates
		
		    target=world:getCharacterOnField(position(x,i,-3)); --replace with proper coordinates
			
		    if target ~= nil then --there is someone!
			
				world:gfx(9,position(x,i,-3)); --Fireball!
				world:makeSound(5,position(x,i,-3)); --BOOM!
			    target:increaseAttrib("hitpoints",math.random(-2500,-1000)); --damaging the target
                return; --got one, bailing out.
				
			else
			
				world:gfx(10,position(x,i,-3)); --Smokecloud!
				
			end
			
		end --next tile
		
	    --No one got hit! Fireball hits the other wall
	    world:gfx(9,position(x,415,-3)); --Fireball!
	    wordl:makeSound(5,position(x,415,-3)); --BOOM!
	
    end
end

