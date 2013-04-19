-- UPDATE common SET com_script='item.id_293_throwing_spear' WHERE com_itemid IN (293);

require("base.lookat")

module("item.id_293_throwing_spear", package.seeall)

function LookAtItem(User, Item)
	
	--local customText = base.lookat.GetItemDescription(User,Item,base.lookat.WOOD,false,false);
	--if tonumber(Item:getData("spearData")) > 2^30 then
	--	world:itemInform( User, Item, customText );
	--else
		world:itemInform( User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.WOOD));
	--end
end
