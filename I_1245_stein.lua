dofile( "base_lookat.lua" );
require("base.common")

function LookAtItem(User,Item)

    if ( Item.data == 666) then 
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"In dem Stein ist eine Aussparung in Form eines Drachensymbols. Es wirkt stark so, als ob dort etwas fehlt.")
        else
            world:itemInform(User,Item,"There is a slot in form of a dragon symbol in the stone. I looks like something is missing here.")
        end
	else
		 world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false ));
	end
end

