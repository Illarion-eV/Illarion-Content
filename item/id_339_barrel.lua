require("content.craft.brewing")
require("base.licence")

module("item.id_339_barrel", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence 
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    content.craft.brewing.brewing:showDialog(User, SourceItem)
end
