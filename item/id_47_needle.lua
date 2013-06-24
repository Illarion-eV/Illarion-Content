-- UPDATE common SET com_script='item.id_47_needle' WHERE com_itemid IN (47);

require("content.craft.tailoring")
require("base.lookat")
require("base.licence")

module("item.id_47_needle", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.tailoring.tailoring:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
