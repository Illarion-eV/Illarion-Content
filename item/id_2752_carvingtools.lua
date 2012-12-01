-- UPDATE common SET com_script='item.id_2752_carvingtools' WHERE com_itemid IN (2752);

require("content.craft.carving")
require("base.lookat")

module("item.id_2752_carvingtools", package.seeall)

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    content.craft.carving.carving:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end
