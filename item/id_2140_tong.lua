-- UPDATE common SET com_script='item.id_2140_tong' WHERE com_itemid=2140;

require("content.craft.gemcutting")
require("base.licence")
require("base.lookat")

module("item.id_2140_tong", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.gemcutting.gemcutting:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
