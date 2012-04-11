module("triggerfield.enduranceCave", package.seeall)

require("quest.enduranceCave")

-- INSERT INTO triggerfields VALUES (1,1,0,'enduranceCave');
-- INSERT INTO triggerfields VALUES (20,3,-15,'enduranceCave');
-- INSERT INTO triggerfields VALUES (30,3,-15,'enduranceCave');
-- INSERT INTO triggerfields VALUES (38,5,-15,'enduranceCave');
-- INSERT INTO triggerfields VALUES (38,10,-15,'enduranceCave');
-- INSERT INTO triggerfields VALUES (38,15,-15,'enduranceCave');

function MoveToField(character)
	
	if equapos(character.pos,position(1,1,0)) then
	character:warp(7,8,-15);
	PlayerInCave, t_dest = quest.enduranceCave.InCave(User);
		if (PlayerInCave) then
		gate = t_dest;
		end
	
		if equapos(character.pos,
				position (20,3,-15) 
				or position (30, 3, -15),
				or position (38,5,-15), 
				or position (38,10,-15), 
				or position(38,15,-15))
		then
			if gate ~= nil then
	
			local dest = position( gate[ 1 ], gate[ 2 ], gate[ 3 ] );
				world:makeSound( 4, dest )
                
				world:gfx( 41, User.pos )
				character:warp( dest );
				world:gfx( 41, User.pos )
			end
		end
	end
end