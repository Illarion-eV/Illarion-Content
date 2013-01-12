-- UPDATE common SET com_script='item.id_2715_plane' WHERE com_itemid IN (2715);

require("content.craft.carpentry")
require("base.lookat")

module("item.id_2715_plane", package.seeall)

function UseItem(User, SourceItem, TargetItem, ltstate)
    content.craft.carpentry.carpentry:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end

