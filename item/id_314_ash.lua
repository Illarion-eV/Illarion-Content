require("base.common")

module("item.id_314_ash", package.seeall)

-- UPDATE common SET com_script='item.id_314_ash' WHERE com_itemid = 314;

function LookAtItem(User,Item)

    -- Mummy            -> 101
    -- Skeleton		-> 111
    -- Demonskeleton 	-> 171
    -- Skulls		-> 211
    -- Ghostskeleton    -> 231

    if ( Item.quality == 101) then -- Mummie
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Grünliche Asche");
        else
            world:itemInform(User,Item,"greenish ash");
        end
    elseif ( Item.quality == 111 ) then -- Skeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Reine weiße Asche");
        else
            world:itemInform(User,Item,"pure white ash");
        end
    elseif ( Item.quality == 171 ) then -- Demonskeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Rötliche Asche");
        else
            world:itemInform(User,Item,"reddish ash");
        end
    elseif ( Item.quality == 211 ) then --Skulls
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Silbrige Asche");
        else
            world:itemInform(User,Item,"silverish ash");
        end
    elseif ( Item.quality == 231 ) then --Ghostskeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Bläuliche Asche");
        else
            world:itemInform(User,Item,"blueish ash");
        end
    else
	User:inform( teleportLookAt( User, Item ) );
    end

end

