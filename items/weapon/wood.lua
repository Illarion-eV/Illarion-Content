require("base.lookat")

module("items.weapon.wood", package.seeall())

-- UPDATE common SET com_script='items.weapon.wood' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,2,true,false ));
end
