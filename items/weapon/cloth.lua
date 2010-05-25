require("base.lookat")

module("items.weapon.cloth", package.seeall())

-- UPDATE common SET com_script='items.weapon.cloth' WHERE com_itemid IN (89);

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,true,false));
end