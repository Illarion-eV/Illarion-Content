require("base.common")
require("base.lookat")
require("base.ranklist")

-- UPDATE common SET com_script='item.id_661_lectern' WHERE com_itemid IN (661, 660);

module("item.id_661_lectern", package.seeall)

function UseItem(User,SourceItem,ltstate)
	if Item.pos == position(138, 551, 0) or Item.pos == position(358, 217, 0) or Item.pos == position(896, 761, 1) then
		base.ranklist.getRanklist(User,"explorerRanklist", true);
	end
end

function LookAtItem(User, Item)
	if Item.pos == position(138, 551, 0) or Item.pos == position(358, 217, 0) or Item.pos == position(896, 761, 1) then
		base.lookat.setSpecialDescription(Item, "Rangliste der Entdeckergilde.", "Ranklist of the explorer guild");
	end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end