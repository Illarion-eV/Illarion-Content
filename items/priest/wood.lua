require("base.lookat")

module("items.priest.wood", package.seeall())

-- UPDATE common SET com_script='items.priest.wood' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,2,false,true ));
end