-- UPDATE common SET com_script='item.id_311_glassblowpipe' WHERE com_itemid=311;

require("content.craft.glassblowing")
require("base.lookat")

module("item.id_311_glassblowpipe", package.seeall)

function UseItem(User, SourceItem, TargetItem, ltstate)
    content.craft.glassblowing.glassblowing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.JEWELLERY))
end

