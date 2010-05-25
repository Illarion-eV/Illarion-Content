dofile( "base_lookat.lua" );
require("base.common")

function LookAtItem(User,Item)
    --------------------------------- Axte mit besonderer Bezeichnung  --------------------------------------------------------------------------------
    	if ( Item.data == 100) then -- Zwergenaxt von König Thorwald
	    if (User:getPlayerLanguage()==0) then
            	world:itemInform(User,Item,"Du siehst die Zwergenaxt des Königs von Silberbrand.");
	    else
	    	world:itemInform(User,Item,"You see the dwarven axe from the king of silverbrand.");
	    end
	end
end
