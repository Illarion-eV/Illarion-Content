module("triggerfield.enduranceCave", package.seeall)

require("quest.enduranceCave")

-- INSERT INTO triggerfields VALUES (1,1,0,'triggerfield.enduranceCave');
-- INSERT INTO triggerfields VALUES (20,3,-15,'triggerfield.enduranceCave');
-- INSERT INTO triggerfields VALUES (30,3,-15,'triggerfield.enduranceCave');
-- INSERT INTO triggerfields VALUES (38,5,-15,'triggerfield.enduranceCave');
-- INSERT INTO triggerfields VALUES (38,10,-15,'triggerfield.enduranceCave');
-- INSERT INTO triggerfields VALUES (38,15,-15,'triggerfield.enduranceCave');

function MoveToField(User)
	
	if User.pos == (position(1,1,0)) then
	User:forceWarp(position(7,8,-15));
	local language = User:getPlayerLanguage();
		if language == 1 then
		User:inform("You are warped into a strange room. The fireball in the middle looks strange to you.")
		else
		User:inform("Du wirst in einen seltsamen Raum teleportiert. Die Feuerkugel in dessen Mitte sieht seltsam aus.")
		end
	end
	
	if User.pos == (position(20,3,-15))
				or User.pos == (position  (30, 3, -15))
				or User.pos == (position  (38,5,-15)) 
				or User.pos == (position  (38,10,-15)) 
				or User.pos == (position (38,15,-15))	then
				
	local PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
	local gate = t_dest;
		if (PlayerInCave) then
		gate = t_dest;
	
	
		
			if gate ~= nil then
	
			local dest = position( gate[ 1 ], gate[ 2 ], gate[ 3 ] );
				world:makeSound( 4, dest )
                
				world:gfx( 41, User.pos )
				User:warp( dest );
				world:gfx( 41, User.pos )
			end
		end
	end
end