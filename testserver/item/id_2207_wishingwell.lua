require("base.common")

-- UPDATE common SET com_script='item.id_2207_wishingwell' WHERE com_itemid IN (2207);

module("item.id_2207_wishingwell", package.seeall)

function LookAtItem(User, Item)
    if ( Item:getData("modifier") == "wishing well" ) then
		base.lookat.SetSpecialName(item, "Wunschbrunnen", "wishing well")
		world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    else
	    world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    end
end


