-- UPDATE common SET com_script='item.id_121_peel' WHERE com_itemid IN (121);

require("content.craft.baking")
require("base.licence")
require("base.lookat")

module("item.id_121_peel", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.baking.baking:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end

