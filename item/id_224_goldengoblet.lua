require("base.lookat")
require("base.common")

-- UPDATE common SET com_script='item.id_224_goldengoblet' WHERE com_itemid=224;

module("item.id_224_goldengoblet", package.seeall)

function LookAtItem(User,Item)
    local text = base.lookat.GetItemDescription(User,Item,4,false,false);
	local gText;
	local eText;
	if (Item.data == 1) then
		gText = "Alte Sprache Barde des Jahres 26";
		eText = "Old language bard of the year 26";
	elseif ( Item.data == 2 ) then
		gText = "Neue Sprache Barde des Jahres 26";
		eText = "New language bard of the year 26";
	elseif Item.data == 10000 then
		gText = "Auffälliger Kelch";
		eText = "peculiar goblet";
	elseif Item.data > 2^30 then
		world:itemInform(User,Item,text);
		return;
	else
		gText = gText..world:getItemName(Item.id,0);
		eText = eText..world:getItemName(Item.id,1);
	end
	world:itemInform(User,Item,base.common.GetNLS(User,gText,eText));
end
