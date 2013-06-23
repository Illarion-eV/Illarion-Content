require("base.licence")
require("content.craft.gemcutting")

module("item.id_270_grindstone", package.seeall)

function UseItem(User, SourceItem, ltstate)
	base.licence.licence(User); --checks if user is citizen or has a licence
	if base.licence.stopcraftingnolicence then -- avoids crafting if user is neither citizen nor has a licence
		return
		else
	end
    content.craft.gemcutting.gemcutting:showDialog(User, SourceItem)
end
