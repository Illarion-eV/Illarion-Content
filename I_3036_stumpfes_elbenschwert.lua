-- Script for the wooden Sword.
 dofile( "base_lookat_wood.lua" );
 require("base.common")


-- Ansicht
--
function LookAtItem(User,Item)
	if ( Item.data == 666 ) then
		if (User:getPlayerLanguage() == 0) then
			world:itemInform(User,Item,"Du siehst Holzschwert");
		else
	        	world:itemInform(User,Item,"You see a wodden sword");
		end
	else
		world:itemInform(User,Item,GetItemDescription(User,Item,1,false,false ));
	end
end

-- Item Benutzen
--
function UseItem (User, SourceItem)
   base.common.InformNLS(User,"moep3","moep4");
end

-- Benutzung mit anderem Charakter
--
function UseItemWithCharacter(User,SourceItem,Character,ltstate)
	-- Prüfung, ob Holzschwert in der Hand
	--
	if ( SourceItem:getType() ~= 4 ) then
 	    base.common.InformNLS(User,
            "Du solltest das Holzschwert schon in die Hand nehmen, wenn du damit trainieren willst.",
            "You should have the wodden sword in your hand, if you want to train with this.");
            return
        end
        if ( ltstate == Action.none ) then
 	    base.common.InformNLS(User,"moep1","moep2"); 
        end
end
