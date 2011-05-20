--Teleporter in the Salavesh Dungeon
--Estralis Seborian

require("base.common")

module("triggerfield.salavesh_2", package.seeall)

function MoveToField( User )    
	base.common.TempInformNLS(User,"Das Portal trägt dich fort an einen Ort, der nicht gerade deine erste Wahl ist...","The portal takes you to a place that wouldn't be your first choice..."); --sending a message
    world:gfx(41,position(689,388,-3));
	world:makeSound(13,position(689,388,-3));
    User:warp( position( 740, 406, -3 ) );
    world:gfx(41,position(740,406,-3));
    world:makeSound(13,position(740,406,-3));
end
