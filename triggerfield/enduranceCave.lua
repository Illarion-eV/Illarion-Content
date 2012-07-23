module("triggerfield.enduranceCave", package.seeall)

require("base.common")
require("quest.enduranceCave")

-- INSERT INTO triggerfields VALUES (1,1,0,'triggerfield.enduranceCave');   (Entrance to Dungeon)
-- INSERT INTO triggerfields VALUES (7,8,-15,'triggerfield.enduranceCave');  (Exit From Dungeon)
-- INSERT INTO triggerfields VALUES (20,3,-15,'triggerfield.enduranceCave'); (Portals)
-- INSERT INTO triggerfields VALUES (30,3,-15,'triggerfield.enduranceCave'); (Portals)
-- INSERT INTO triggerfields VALUES (38,5,-15,'triggerfield.enduranceCave'); (Portals)
-- INSERT INTO triggerfields VALUES (38,10,-15,'triggerfield.enduranceCave'); (Portals)
-- INSERT INTO triggerfields VALUES (38,15,-15,'triggerfield.enduranceCave'); (Portals)

function MoveToField(User)
	local language = User:getPlayerLanguage();
	
	if User.pos == position(7,8,-15) then -- Warp exiting the Dungeon
	world:makeSound( 4, User.pos )
	world:gfx( 41, User.pos )
	User:forceWarp(position(1,1,0));
	world:gfx( 41, User.pos )
    InformNLS(User, "Du hörst ein fernes Lachen in deinen Ohren dröhnen. Dann bist du wieder auf der Oberwelt.", "You hear a faint laughter burrowing in your ears as you step into the portal. Then you are back on the surface.");
	end
	if User.pos == (position(1,1,0)) then -- Warp entering the Dungeon
	world:makeSound( 4, User.pos )
	world:gfx( 41, User.pos )
	User:forceWarp(position(7,8,-15));
	world:gfx( 41, User.pos )
    InformNLS(User, "Du wirst in einen seltsamen Raum teleportiert. Die Feuerkugel in dessen Mitte sieht seltsam aus.","You are warped into a strange room. The fireball in the middle looks strange to you.")
	end
	
	-- Warp through the Portals inside the dungeon
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