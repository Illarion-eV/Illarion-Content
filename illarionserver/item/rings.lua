-- UPDATE common SET com_script = 'item.rings' WHERE com_itemid IN (68, 277, 278, 279, 280, 281, 282);

require("item.general.jewel")

module("item.rings", package.seeall)

function LookAtItem(User,Item)
	item.general.jewel.LookAtItem(User,Item);
end
