require("content.craft.brewing")
require("base.licence")

module("item.id_339_barrel", package.seeall)

function UseItem(User, SourceItem, ltstate)
	base.licence.licence(User); --checks if user is citizen or has a licence
	if base.licence.stopcraftingnolicence then -- avoids crafting if user is neither citizen nor has a licence
		return
		else
	end
    content.craft.brewing.brewing:showDialog(User, SourceItem)
end
