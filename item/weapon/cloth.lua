require("base.lookat")

module("item.weapon.cloth", package.seeall)

-- UPDATE common SET com_script='item.weapon.cloth' WHERE com_itemid IN (89);

function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,true,false));
end
