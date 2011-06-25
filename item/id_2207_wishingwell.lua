require("base.common")

-- UPDATE common SET com_script='item.id_2207_wishingwell' WHERE com_itemid IN (2207);

module("item.id_2207_wishingwell", package.seeall)

function LookAtItem(User, Item)
    if ( Item.data == 666 ) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Wunschbrunnen");
        else
            world:itemInform(User,Item,"wishing well");
        end
    else
        if (User:getPlayerLanguage() == 0) then
	    world:itemInform(User,Item,"Brunnen");
        else
            world:itemInform(User,Item,"well");
        end
    end
end


