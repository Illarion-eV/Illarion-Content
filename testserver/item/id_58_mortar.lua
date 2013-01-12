-- UPDATE common SET com_script='item.id_58_mortar' WHERE com_itemid=58;

require("base.common")
require("content.craft.dyemaking")
require("base.lookat")

module("item.id_58_mortar", package.seeall)

function UseItem(User, SourceItem, ltstate)

    content.craft.dyemaking.dyemaking:showDialog(User, SourceItem)
	
end 

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.JEWELLERY))
end

