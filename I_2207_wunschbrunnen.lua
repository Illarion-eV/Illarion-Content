require("base.common")

function LookAtItem(User, Item)
    if ( Item.data == 666 ) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst Wunschbrunnen");
        else
            world:itemInform(User,Item,"You see wishing well");
        end
    else
        if (User:getPlayerLanguage() == 0) then
	    world:itemInform(User,Item,"Du siehst Brunnen");
        else
            world:itemInform(User,Item,"You see well");
        end
    end
end


