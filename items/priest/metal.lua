require("base.lookat")

module("items.priest.metal", package.seeall())

-- UPDATE common SET com_script='items.priest.metal' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,1,false,true ));
end