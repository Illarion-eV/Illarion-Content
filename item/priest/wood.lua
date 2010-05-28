require("base.lookat")

module("item.priest.wood", package.seeall)

-- UPDATE common SET com_script='item.priest.wood' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,2,false,true ));
end