require("base.lookat")

module("items.priest.cloth", package.seeall())

-- UPDATE common SET com_script='items.priest.cloth' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,false,true ));
end