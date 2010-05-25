dofile( "base_lookat.lua" );
require("base.common")

-- UPDATE common SET com_script='I_1858_goblet.lua' WHERE com_itemid=1858;

function LookAtItem(User,Item)
    local text = base.lookat.GetItemDescription(User,Item,4,false,false);
	local gText = "Du siehst ";
	local eText = "You see ";
	if Item.data > 2^30 then
		world:itemInform(User,Item,text);
		return;
	else
		gText = gText..world:getItemName(Item.id,0);
		eText = eText..world:getItemName(Item.id,1);
	end
	world:itemInform(User,Item,base.common.GetNLS(User,gText,eText));
end