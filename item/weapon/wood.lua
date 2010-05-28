require("base.lookat")

module("item.weapon.wood", package.seeall)

-- UPDATE common SET com_script='item.weapon.wood' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,2,true,false ));
end
