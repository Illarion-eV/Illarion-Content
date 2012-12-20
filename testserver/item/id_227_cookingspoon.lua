-- UPDATE common SET com_script='item.id_227_cookingspoon' WHERE com_itemid IN (227);

require("content.craft.cooking")
require("base.lookat")

module("item.id_227_cookingspoon", package.seeall)

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    content.craft.cooking.cooking:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end

