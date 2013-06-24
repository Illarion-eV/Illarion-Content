-- UPDATE common SET com_script='item.id_311_glassblowpipe' WHERE com_itemid=311;

require("content.craft.glassblowing")
require("base.licence")
require("base.lookat")

module("item.id_311_glassblowpipe", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.glassblowing.glassblowing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.JEWELLERY))
end

