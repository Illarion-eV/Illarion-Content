require("base.lookat")

module("item.priest.cloth", package.seeall)

-- UPDATE common SET com_script='item.priest.cloth' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,false,true ));
end
