require("base.licence")
require("content.craft.baking")

module("item.id_119_bakingoven", package.seeall)

function UseItem(User, SourceItem, ltstate)
	base.licence.licence(User); --checks if user is citizen or has a licence
	if base.licence.stopcraftingnolicence then -- avoids crafting if user is neither citizen nor has a licence
		return
		else
	end
    content.craft.baking.baking:showDialog(User, SourceItem)
end
