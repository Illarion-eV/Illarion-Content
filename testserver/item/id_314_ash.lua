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
		base.lookat.SetSpecialName(Item, "Grünliche Asche", "Greenish ash")
    elseif ( Item.quality == 111 ) then -- Skeleton
        base.lookat.SetSpecialName(Item, "Reine weiße Asche", "Pure white ash");
    elseif ( Item.quality == 171 ) then -- Demonskeleton
        base.lookat.SetSpecialName(Item, "Rötliche Asche", "Reddish ash");
    elseif ( Item.quality == 211 ) then --Skulls
        base.lookat.SetSpecialName(Item, "Silbrige Asche", "Silverish ash");
    elseif ( Item.quality == 231 ) then --Ghostskeleton
		base.lookat.SetSpecialName(Item, ,"Bläuliche Asche", "Blueish ash");
    else
		return;
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end

