--Teleporter in the Salavesh Dungeon
--Estralis Seborian

require("base.common")

module("triggerfield.salavesh_1", package.seeall)

function MoveToField( User )
    
	base.common.TempInformNLS(User,"Du trittst durch das Portal. Eine wohlmöglich schlechte Idee!","You step through the portal. A bad idea!"); --sending a message
    world:gfx(41,position(731,441,-3));
	world:makeSound(13,position(731,441,-3));
    User:warp( position( 688, 393, -3 ) );
    world:gfx(41,position(688,393,-3));
    world:makeSound(13,position(688,393,-3));
end
