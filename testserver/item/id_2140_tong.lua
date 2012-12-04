-- UPDATE common SET com_script='item.id_2140_tong' WHERE com_itemid=2140;

require("content.craft.gemcutting")
require("base.lookat")

module("item.id_2140_tong", package.seeall)

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    content.craft.gemcutting.gemgutting:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
