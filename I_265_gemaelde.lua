dofile( "base_lookat.lua" );
require("base.common")
dofile("base_painting_lookat.lua");
function LookAtItem(User,Item)
    if ( Item.data == 101) then -- Werbeschild für Garons Goldschmiede
	if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Garons Goldschmiede - Perfekte Ausrüstung für perfekte Magier")
        else
            world:itemInform(User,Item,"Garons goldsmith's shop - Perfect equipment for perfect mages")
        end
    elseif ( Item.data == 102) then -- Werbeschild für Garons Goldschmiede
         if (User:getPlayerLanguage()==0) then
             world:itemInform(User,Item,"Garons Goldschmiede - Kurz hinter dem Osttor von Trolls Bane - Immer wieder einen Besuch wert")
        else
             world:itemInform(User,Item,"Garons goldsmith's shop - Not far from the eastgate of Trolls Bane - Always worth a visit")
        end
    else
        --world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false ));
        LookAtPaintingItem(User,Item);
    end
end
