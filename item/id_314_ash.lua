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
            world:itemInform(User,Item,"Du siehst grünliche Asche");
        else
            world:itemInform(User,Item,"You see greenish ash");
        end
    elseif ( Item.quality == 111 ) then -- Skeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst rein weiße Asche");
        else
            world:itemInform(User,Item,"You see pure white ash");
        end
    elseif ( Item.quality == 171 ) then -- Demonskeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst rötliche Asche");
        else
            world:itemInform(User,Item,"You see reddish ash");
        end
    elseif ( Item.quality == 211 ) then --Skulls
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst silbrige Asche");
        else
            world:itemInform(User,Item,"You see silverish ash");
        end
    elseif ( Item.quality == 231 ) then --Ghostskeleton
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst bläuliche Asche");
        else
            world:itemInform(User,Item,"You see blueish ash");
        end
    else
	User:inform( teleportLookAt( User, Item ) );
    end

end

