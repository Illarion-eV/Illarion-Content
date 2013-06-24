-- UPDATE common SET com_script='item.id_122_finesmithhammer' WHERE com_itemid IN (122);

require("content.craft.goldsmithing")
require("base.licence")
require("base.lookat")

module("item.id_122_finesmithhammer", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.goldsmithing.goldsmithing:showDialog(User, SourceItem)
end

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.METAL))
end
