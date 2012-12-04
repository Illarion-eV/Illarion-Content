-- UPDATE common SET com_script='item.id_47_needle' WHERE com_itemid IN (47);

require("content.craft.tailoring")
require("base.lookat")

module("item.id_47_needle", package.seeall)

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    content.craft.tailoring.tailoring:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
