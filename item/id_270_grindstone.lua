require("content.craft.gemcutting")
require("base.licence")

module("item.id_270_grindstone", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.gemcutting.gemcutting:showDialog(User, SourceItem)
end
