require("base.lookat")

module("items.weapon.jewel", package.seeall)

-- UPDATE common SET com_script='items.weapon.jewel' WHERE com_itemid IN ();

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,true,false ));
end