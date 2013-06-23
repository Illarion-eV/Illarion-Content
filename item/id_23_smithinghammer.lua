-- UPDATE common SET com_script='item.id_23_smithinghammer' WHERE com_itemid IN (23);

require("base.licence")
require("content.craft.smithing")
require("base.lookat")

module("item.id_23_smithinghammer", package.seeall)

function UseItem(User, SourceItem, ltstate)
	base.licence.licence(User); --checks if user is citizen or has a licence
	if base.licence.stopcraftingnolicence then -- avoids crafting if user is neither citizen nor has a licence
		return
		else
	end
    content.craft.smithing.smithing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
