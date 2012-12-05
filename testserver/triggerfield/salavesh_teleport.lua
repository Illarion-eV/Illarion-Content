--Teleporters in the Salavesh Dungeon
--Estralis Seborian

require("base.common")

module("triggerfield.salavesh_teleport", package.seeall)

function MoveToField( User )

 if User:getType() == 0 then --monsters are unaffected
 
    if User.pos == position(731,441,-3) then --To the dragon chamber
        base.common.InformNLS(User,"Du trittst durch das Portal. Eine wohlmöglich schlechte Idee!","You step through the portal. A bad idea!"); --sending a message
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(688,393,-3));
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
	elseif User.pos == position(689,388,-3) then --to the big hall
		base.common.InformNLS(User,"Das Portal trägt dich fort an einen Ort, der nicht gerade deine erste Wahl ist...","The portal takes you to a place that wouldn't be your first choice..."); --sending a message
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(740,406,-3));
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
	elseif User.pos == position(728,436,-3) then --to the portal room
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(728,436,-3));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	else --back to the entrance of the riddle tunnel
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(728,418,-3));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	end
	
 end
 
end
