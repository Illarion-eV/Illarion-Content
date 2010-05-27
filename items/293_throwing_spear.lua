-- UPDATE common SET com_script='items.293_throwing_spear' WHERE com_itemid IN (293);

require("base.lookat")

module("items.293_throwing_spear", package.seeall)

function LookAtItem(User, Item)
	
	local customText = base.lookat.GetItemDescription(User,Item,2,false,false);
	if Item.data > 2^30 then
		world:itemInform( User, Item, customText );
	else
		world:itemInform( User, Item, User:getPlayerLanguage()==0 and
			"Du siehst "..world:getItemName(Item.id,0) or
			"You see "..world:getItemName(Item.id,1) );
	end
end