dofile( "base_lookat.lua" );
require("base.common")

function LookAtItem(User,Item)
    if ( Item.data == 666) then
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"In dem Stein ist ein Drachensymbol mit einer sternförmigen Aussparung in der Mitte eingelassen...es wirkt stark so, als würde dort etwas fehlen.")
        else
            world:itemInform(User,Item,"There is a dragon symbol with a star-shaped slot in the middle inside the stone. It looks like something is missing here.")
        end
	else
		 world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false ));
	end
end

