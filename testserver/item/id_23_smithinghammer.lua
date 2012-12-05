-- UPDATE common SET com_script='item.id_23_smithinghammer' WHERE com_itemid IN (23);

require("content.craft.smithing")
require("base.lookat")

module("item.id_23_smithinghammer", package.seeall)

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    content.craft.smithing.smithing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
