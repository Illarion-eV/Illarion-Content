-- UPDATE common SET com_script='item.id_122_finesmithhammer' WHERE com_itemid IN (122);

require("content.craft.goldsmithing")
require("base.lookat")

module("item.id_122_finesmithhammer", package.seeall)

function UseItem(User, SourceItem, ltstate)
    content.craft.goldsmithing.goldsmithing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
