require("base.lookat")
require("base.common")

-- UPDATE common SET com_script='item.id_224_goldengoblet' WHERE com_itemid=224;

module("item.id_224_goldengoblet", package.seeall)

function LookAtItem(User,Item)
    local lookat = base.lookat.GetItemDescription(User,Item,4,false,false);
	world:itemInform(User,Item,lookat);
end
